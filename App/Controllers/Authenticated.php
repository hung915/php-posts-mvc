<?php

namespace App\Controllers;

use App\Config;
use Core\Auth;
use Core\Controller;
use Core\JWTCodec;

abstract class Authenticated extends Controller
{
    protected function before(): void
    {
        $codec = new JWTCodec(Config::SECRET_KEY);
        $auth = new Auth($codec);
        if (! $auth->authenticateAccessToken()) {
            if (isset($auth->message) and $auth->message === 'token has expired') {
                $this->redirect('/refresh-token/index?location=' . $_SERVER['HTTP_REFERER']);
            } else {
                $this->redirect('/login');
            }

        }
    }
}