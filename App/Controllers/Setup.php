<?php

namespace App\Controllers;

use Core\Database;
use Core\View;
use PDOException;

class Setup
{
    public function new(): void
    {
        $envFile = dirname(__DIR__, 2) . '/.env.example';
        if (! file_exists($envFile)) {
            View::renderTemplate('Setup/new.html');
        } else {
            header('Location: http://' . $_SERVER['HTTP_HOST'], true, 303);
            exit();
        }
    }


    public function save(): void
    {
        try {
            $database = new Database($_POST['dbHost'], $_POST['dbName'], $_POST['dbUser'], $_POST['dbPassword']);
            $conn = $database->getConnection();

            $txt = "DB_HOST='" . $_POST['dbHost'] . "'\nDB_NAME='" . $_POST['dbName'] . "'\nDB_USER='" . $_POST['dbUser'] . "'\nDB_PASS='" . $_POST['dbPassword'] . "'";
            $this->createENV($txt);

            $this->initDB($conn, "initDB.sql");

            header('Location: http://' . $_SERVER['HTTP_HOST'] . '/', true, 303);
            exit();
        } catch(PDOException $e) {
            View::renderTemplate('Setup/new.html', [
                'message' => 'Connection failed: Please re-enter DB info try again'
            ]);
        }
    }


    public function initDB($conn, $fileName): void
    {
        $query = file_get_contents(dirname(__DIR__, 2) . "/Core/sql/" . $fileName);
        $conn->exec($query);
    }


    public function createENV(string $txt): void
    {
        $envFile = fopen(dirname(__DIR__, 2) . '/.env.example', "w") or die("Unable to open env file!");
        fwrite($envFile, $txt);
        fclose($envFile);
    }
}