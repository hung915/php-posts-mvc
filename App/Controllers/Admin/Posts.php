<?php

namespace App\Controllers\Admin;

use App\Config;
use App\Models\Posts as PostModel;
use Core\Auth;
use Core\JWTCodec;
use Core\View;
use Exception;

class Posts extends Authenticated
{
    public function view(): void
    {
        View::renderTemplate('Posts/admin_index.html');
    }


    public function add(): void
    {
        View::renderTemplate('Posts/admin_add.html');
    }


    public function listAddAction(): void
    {
        header("Content-type: application/json; charset=UTF-8");

        if (! in_array($_SERVER["REQUEST_METHOD"], ["GET", "POST"])) {
            http_response_code(405);
            header("Access-Control-Allow-Methods: GET, POST");
            exit;
        }

        if ($_SERVER["REQUEST_METHOD"] === "GET") {
            try {
                $query_str = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_QUERY);
                $limit = 5;
                $page = 1;
                if ($query_str !== null) {
                    parse_str($query_str, $query_params);
                    $limit = $query_params['limit'] ?? 5;
                    $page = $query_params['page'] ?? 1;
                }
                echo json_encode(PostModel::getAll(true, $limit, $page));

            } catch (Exception $e) {
                echo $e->getMessage();
                http_response_code(500);
                echo json_encode(["message" => "Can't get data"]);
                exit;
            }
        }

        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $upload_dir = Config::IMG_DIR;
            $tmp = null;
            $img_name = null;
            if ($_FILES["thumbnail"]["error"] === 0) {
                $img_name = $_FILES['thumbnail']['name'];
                $tmp = $_FILES['thumbnail']['tmp_name'];

                // get uploaded file's extension
                $ext = strtolower(pathinfo($img_name, PATHINFO_EXTENSION));
                if (! in_array($ext, Config::SUPPORTED_EXTENSIONS))
                {
                    http_response_code(400);
                    echo json_encode(["message" => "File extension not supported"]);
                    exit;
                }
            }
            try {
                $thumbnail = null;
                if (isset($tmp)) {
                    $file_path = $upload_dir . $img_name;
                    $full_path = dirname(__DIR__, 3) . '/public' . $file_path;
                    if (file_exists($full_path)) {
                        $file_path = $upload_dir . rand(1000,1000000). $img_name;
                        $full_path = dirname(__DIR__, 3) . '/public' . $file_path;
                    }
                    move_uploaded_file($tmp, $full_path);
                    $thumbnail = 'http://' . $_SERVER['HTTP_HOST'] . $file_path;
                }
                echo json_encode(PostModel::addNew($_POST['title'], $_POST['description'], $thumbnail, $_POST['status']));
            } catch (Exception $e) {
                echo $e->getMessage();
                http_response_code(500);
                echo json_encode(["message" => "Can't save data"]);
                exit;
            }
        }
    }


    public function get(): void
    {
        $parts = explode('/', $_SERVER['QUERY_STRING']);
        $post_id = $parts[2];
        View::renderTemplate('Posts/admin_detail.html', [
            'post_id' => $post_id
        ]);
    }


    public function edit(): void
    {
        $parts = explode('/', $_SERVER['QUERY_STRING']);
        $post_id = $parts[2];
        View::renderTemplate('Posts/admin_edit.html', [
            'post_id' => $post_id
        ]);
    }


    public function delete(): void
    {
        $parts = explode('/', $_SERVER['QUERY_STRING']);
        $post_id = $parts[2];
        View::renderTemplate('Posts/admin_delete.html', [
            'post_id' => $post_id
        ]);
    }


    public function showUpdateDestroyAction(): void
    {
        header("Content-type: application/json; charset=UTF-8");

        if (! in_array($_SERVER["REQUEST_METHOD"], ["GET", "POST", "DELETE"])) {
            http_response_code(405);
            header("Access-Control-Allow-Methods: GET, POST, DELETE");
            exit;
        }

        $parts = explode('/', $_SERVER['QUERY_STRING']);
        $post_id = $parts[2];

        if ($_SERVER["REQUEST_METHOD"] === "GET") {
            try {
                echo json_encode(PostModel::getDetail($post_id));
            } catch (Exception) {
                http_response_code(500);
                echo json_encode(["message" => "Can't get data"]);
                exit;
            }
        }


        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $upload_dir = Config::IMG_DIR;
            $tmp = null;
            $img_name = null;
            if ( (! empty($_FILES)) && ($_FILES["thumbnail"]["error"] === 0)) {
                $img_name = $_FILES['thumbnail']['name'];
                $tmp = $_FILES['thumbnail']['tmp_name'];

                // get uploaded file's extension
                $ext = strtolower(pathinfo($img_name, PATHINFO_EXTENSION));
                if (! in_array($ext, Config::SUPPORTED_EXTENSIONS))
                {
                    http_response_code(400);
                    echo json_encode(["message" => "File extension not supported"]);
                    exit;
                }
            }
            try {
                $thumbnail = null;
                if (isset($tmp)) {
                    $file_path = $upload_dir . $img_name;
                    $full_path = dirname(__DIR__, 3) . '/public' . $file_path;
                    if (file_exists($full_path)) {
                        $file_path = $upload_dir . rand(1000,1000000). $img_name;
                        $full_path = dirname(__DIR__, 3) . '/public' . $file_path;
                    }
                    move_uploaded_file($tmp, $full_path);
                    $thumbnail = 'http://' . $_SERVER['HTTP_HOST'] . $file_path;
                }
                echo json_encode(PostModel::update($post_id, $_POST['title'], $_POST['description'], $thumbnail, $_POST['status']));
            } catch (Exception $e) {
                echo $e->getMessage();
                http_response_code(500);
                echo json_encode(["message" => "Can't save data"]);
                exit;
            }
        }

        if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
            try {
                echo json_encode(PostModel::delete($post_id));
            } catch (Exception $e) {
                echo $e->getMessage();
                http_response_code(500);
                echo json_encode(["message" => "Can't save data"]);
                exit;
            }
        }
    }


    public function allowAccess(): void
    {
        if ($_SERVER["REQUEST_METHOD"] !== "GET") {
            http_response_code(405);
            header("Allow: GET");
            exit;
        }
        $codec = new JWTCodec(Config::SECRET_KEY);
        $auth = new Auth($codec);
        if ($auth->authenticateAccessToken()) {
            http_response_code(200);
            echo json_encode(["message" => "allow to access data"]);
        }
        exit;
    }



    public function countAction(): void
    {
        if ($_SERVER["REQUEST_METHOD"] !== "GET") {
            http_response_code(405);
            header("Allow: GET");
            exit;
        }
        try {
            echo json_encode(['total' => PostModel::count(true)]);

        } catch (Exception) {
            http_response_code(500);
            echo json_encode(["message" => "Can't get data"]);
            exit;
        }
        exit;
    }
}