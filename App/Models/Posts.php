<?php

namespace App\Models;

use Core\Model;
use PDO;

class Posts extends Model
{
    public static function getAll(bool $is_admin, $limit, $page)
    {
        $sql = "SELECT * FROM posts";

        if (! $is_admin) {
            $sql .= " WHERE status = 1";
        }

        $sql .= " ORDER BY id DESC";

        if ($limit !== 'all') {
            $start = ($page - 1) * $limit;

            $sql .= " LIMIT $start, $limit";
        }

        $conn = static::getDB();
        $stmt = $conn->prepare($sql);


        $stmt->execute();

        $data = [];

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $row['status'] = ($row['status'] == 1) ? 'Enabled' : 'Disabled';
            $data[] = $row;
        }

        return $data;
    }

    public static function getDetail($id)
    {
        $sql = "SELECT * FROM posts WHERE id = :id";

        $conn = static::getDB();
        $stmt = $conn->prepare($sql);

        $stmt->bindValue(":id", $id, PDO::PARAM_INT);

        $stmt->execute();

        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $data['status'] = ($data['status'] == 1) ? 'Enabled' : 'Disabled';
        return $data;
    }


    public static function addNew($title, $description, $thumbnail, $status)
    {
        $sql = "INSERT INTO posts (title, description, thumbnail, status) VALUES (?, ?, ?, ?)";

        $conn = static::getDB();
        $stmt = $conn->prepare($sql);

        $stmt->bindValue(1, $title, PDO::PARAM_STR);
        $stmt->bindValue(2, $description, PDO::PARAM_STR);
        $stmt->bindValue(3, $thumbnail, PDO::PARAM_STR);
        $stmt->bindValue(4, $status, PDO::PARAM_INT);

        return $stmt->execute();
    }


    public static function update($id, $title, $description, $thumbnail, $status)
    {
        $where = " WHERE id = :id";
        $sql = "UPDATE posts SET title = :title, description = :description, status = :status";
        if (isset($thumbnail)) {
            $sql.= ", thumbnail = :thumbnail";
        }
        $sql.= $where;

        $conn = static::getDB();
        $stmt = $conn->prepare($sql);

        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        $stmt->bindValue(":title", $title, PDO::PARAM_STR);
        $stmt->bindValue(":description", $description, PDO::PARAM_STR);
        $stmt->bindValue(":status", $status, PDO::PARAM_INT);
        if (isset($thumbnail)) {
            $stmt->bindValue(":thumbnail", $thumbnail, PDO::PARAM_STR);
        }

        return $stmt->execute();
    }


    public static function delete($id)
    {
        $sql = "DELETE FROM posts  WHERE id = :id";

        $conn = static::getDB();
        $stmt = $conn->prepare($sql);

        $stmt->bindValue(":id", $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->execute();
    }


    public static function count(bool $is_admin)
    {
        $sql = "SELECT COUNT(*) as count FROM posts";

        if (! $is_admin) {
            $sql .= " WHERE status = 1";
        }

        $conn = static::getDB();
        $stmt = $conn->prepare($sql);

        $stmt->execute();

        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        return $data['count'];
    }
}