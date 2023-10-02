<?php

namespace Core;
use Dotenv\Dotenv;
use PDO;

class Model
{
    protected static function getDB(): PDO
    {
        $dotenv = Dotenv::createImmutable(dirname(__DIR__));
        $dotenv->load();

        $database = new Database($_ENV["DB_HOST"], $_ENV["DB_NAME"], $_ENV["DB_USER"], $_ENV["DB_PASS"]);
        return $database->getConnection();
    }
}