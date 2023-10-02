<?php

namespace App\Controllers;

use App\Config;
use App\Models\RefreshToken;
use Core\Controller;
use Core\JWTCodec;
use Core\View;
use Exception;

class Logout extends Controller
{

    public function indexAction(): void
    {
        View::renderTemplate('Logout/index.html');
    }


    public function newAction(): void
    {
        header("Content-type: application/json; charset=UTF-8");

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

        $refresh_token_obj = new RefreshToken(Config::SECRET_KEY);

        $refresh_token_obj->delete($data["token"]);
    }
}