<?php

namespace App\Controllers;

use App\Models\User;
use Core\Controller;
use Core\View;

class Register extends Controller
{
    /**
     * Show the index page
     *
     * @return void
     */
    public function newAction(): void
    {
        View::renderTemplate('Register/index.html');
    }


    public function saveAction(): void
    {
        $user = new User($_POST);

        if ($user->save()) {

            $this->redirect('/register/success');

        } else {

            View::renderTemplate('Register/index.html', [
                'user' => $user
            ]);

        }
    }


    public function successAction(): void
    {
        View::renderTemplate('Register/success.html');
    }
}