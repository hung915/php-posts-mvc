<?php

namespace App\Controllers\Admin;

use App\Config;
use Core\Auth;
use Core\Controller;
use Core\JWTCodec;

class Authenticated extends Controller
{
    protected function before(): void
    {
        $codec = new JWTCodec(Config::SECRET_KEY);
        $auth = new Auth($codec);
        if (! $auth->authenticateAccessToken()) {
            if (isset($auth->message) && $auth->message === 'token has expired') {
                $this->redirect('/admin/refresh-token/index?location=' . $_SERVER['HTTP_REFERER']);
            } else {
                $this->redirect('/admin');
            }
        }
    }
}