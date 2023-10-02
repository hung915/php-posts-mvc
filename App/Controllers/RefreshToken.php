<?php

namespace App\Controllers;

use App\Config;
use App\Models\User;
use Core\Controller;
use Core\JWTCodec;
use Core\View;
use Exception;
use App\Models\RefreshToken as RefreshTokenModel;

class RefreshToken extends Controller
{
    public function indexAction(): void
    {
        $location = $_GET['location'] ?? '';
        View::renderTemplate('RefreshToken/index.html', ['location' => $location]);
    }

    public function newAction(): void
    {
        if ($_SERVER["REQUEST_METHOD"] !== "POST") {
            http_response_code(405);
            header("Allow: POST");
            exit;
        }

        $data = (array) json_decode(file_get_contents("php://input"), true);

        if ( ! array_key_exists("token", $data)) {
            http_response_code(400);
            echo json_encode(["message" => "missing token"]);
            exit;
        }

        $codec = new JWTCodec(Config::SECRET_KEY);
        try {
            $payload = $codec->decode($data["token"]);
        } catch (Exception) {
            http_response_code(400);
            echo json_encode(["message" => "invalid token"]);
            exit;
        }

        $refresh_token_obj = new RefreshTokenModel(Config::SECRET_KEY);

        $refresh_token = $refresh_token_obj->getByToken($data["token"]);

        if ($refresh_token === false) {
            http_response_code(400);
            echo json_encode(["message" => "invalid token (not on whitelist)"]);
            exit;
        }

        $user_id = $payload["sub"];
        $user = User::getByID($user_id);

        if ($user === false) {
            http_response_code(401);
            echo json_encode(["message" => "invalid authentication"]);
            exit;
        }

        require dirname(__DIR__, 2) . "/Core/tokens.php";

        $refresh_token_obj->delete($data["token"]);

        $refresh_token_obj->create($refresh_token, $refresh_token_expiry);
    }
}