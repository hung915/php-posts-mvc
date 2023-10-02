<?php

const ACCESS_TOKEN_EXPIRY = 300;
const REFRESH_TOKEN_EXPIRY = 432000;

$payload = [
    "sub" => $user["id"],
    "email" => $user["email"],
    "exp" => time() + ACCESS_TOKEN_EXPIRY
];

$access_token = $codec->encode($payload);

$refresh_token_expiry = time() + REFRESH_TOKEN_EXPIRY;

$refresh_token = $codec->encode([
    "sub" => $user["id"],
    "exp" => $refresh_token_expiry
]);

$token_data = [
    "access_token" => $access_token,
    "refresh_token" => $refresh_token
];

echo json_encode($token_data);