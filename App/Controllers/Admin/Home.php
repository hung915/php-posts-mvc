<?php

namespace App\Controllers\Admin;

use App\Config;
use Core\Auth;
use Core\Controller;
use Core\JWTCodec;
use Core\View;

class Home extends Controller
{
    public function indexAction(): void
    {
        View::renderTemplate('Home/admin_index.html');
    }


    public function viewAction(): void
    {
        header("Content-type: application/json; charset=UTF-8");

        if ($_SERVER["REQUEST_METHOD"] !== "GET") {
            http_response_code(405);
            header("Allow: GET");
            exit;
        }
        $codec = new JWTCodec(Config::SECRET_KEY);
        $auth = new Auth($codec);
        if (! $auth->authenticateAccessToken()) {
            if (isset($auth->message) && $auth->message === 'token has expired') {
                $this->redirect('/admin/refresh-token/index?location=' . $_SERVER['HTTP_REFERER']);
            }
        } else {
            echo json_encode(["message" => "Logged in"]);
        }
    }
}