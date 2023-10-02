<?php

namespace App\Controllers;

use App\Models\Posts as PostModel;
use Core\View;
use Exception;

class Posts extends Authenticated
{
    public function view(): void
    {
        View::renderTemplate('Posts/index.html');
    }


    public function listAction(): void
    {
        header("Content-type: application/json; charset=UTF-8");

        if ($_SERVER["REQUEST_METHOD"] !== "GET") {
            http_response_code(405);
            header("Allow: GET");
            exit;
        }
        try {
            $query_str = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_QUERY);
            $limit = 5;
            $page = 1;
            if ($query_str !== null) {
                parse_str($query_str, $query_params);
                $limit = $query_params['limit'] ?? 5;
                $page = $query_params['page'] ?? 1;
            }
            echo json_encode(PostModel::getAll(false, $limit, $page));

        } catch (Exception) {
            http_response_code(500);
            echo json_encode(["message" => "Can't not get data"]);
            exit;
        }
    }


    public function get(): void
    {
        $parts = explode('/', $_SERVER['QUERY_STRING']);
        $post_id = $parts[1];
        View::renderTemplate('Posts/detail.html', [
            'post_id' => $post_id
        ]);
    }


    public function detailAction(): void
    {
        header("Content-type: application/json; charset=UTF-8");

        if ($_SERVER["REQUEST_METHOD"] !== "GET") {
            http_response_code(405);
            header("Allow: GET");
            exit;
        }
        try {
            $parts = explode('/', $_SERVER['QUERY_STRING']);
            $post_id = $parts[1];
            echo json_encode(PostModel::getDetail($post_id));
        } catch (Exception) {
            http_response_code(500);
            echo json_encode(["message" => "Can't not get data"]);
            exit;
        }
    }



    public function countAction(): void
    {
        if ($_SERVER["REQUEST_METHOD"] !== "GET") {
            http_response_code(405);
            header("Allow: GET");
            exit;
        }
        try {
            echo json_encode(['total' => PostModel::count(false)]);

        } catch (Exception) {
            http_response_code(500);
            echo json_encode(["message" => "Can't get data"]);
            exit;
        }
        exit;
    }
}