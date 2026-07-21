<?php

$host = "mysql";
$db   = "appdb";
$user = "appuser";
$pass = "apppassword";

try {

    $pdo = new PDO(
        "mysql:host=$host;dbname=$db",
        $user,
        $pass
    );

    echo "Database connection successful";

} catch (Exception $e) {

    echo $e->getMessage();
}

