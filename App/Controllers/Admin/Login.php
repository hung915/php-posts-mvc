<?php

namespace App\Controllers\Admin;

use App\Config;
use App\Models\RefreshToken;
use App\Models\User;
use Core\Controller;
use Core\JWTCodec;

class Login extends Controller
{
    public function newAction(): void
    {
        header("Content-type: application/json; charset=UTF-8");

        if ($_SERVER["REQUEST_METHOD"] !== "POST") {
            http_response_code(405);
            header("Allow: POST");
            exit;
        }

        $data = (array)json_decode(file_get_contents("php://input"), true);

        if (!array_key_exists("email", $data) ||
            !array_key_exists("password", $data)) {

            http_response_code(400);
            echo json_encode(["message" => "missing login credentials"]);
            exit;
        }


        $user = User::getByEmail($data["email"]);

        if ($user === false) {
            http_response_code(401);
            echo json_encode(["message" => "invalid authentication"]);
            exit;
        }

        if (!password_verify($data["password"], $user["password_hash"])) {
            http_response_code(401);
            echo json_encode(["message" => "invalid authentication"]);
            exit;
        }

        if (!($user["is_admin"] === 1)) {
            http_response_code(401);
            echo json_encode(["message" => "invalid authentication"]);
            exit;
        }

        $codec = new JWTCodec(Config::SECRET_KEY);
        require dirname(__DIR__, 3) . "/Core/tokens.php";

        $refresh_token_obj = new RefreshToken(Config::SECRET_KEY);

        $refresh_token_obj->create($refresh_token, $refresh_token_expiry);
    }
}