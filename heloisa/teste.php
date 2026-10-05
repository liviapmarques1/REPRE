<?php

require_once __DIR__ . '/auth.php';

echo '<pre>';

echo 'ID: ';
var_dump($_SESSION['user_id'] ?? null);

echo 'Nome: ';
var_dump($_SESSION['user_name'] ?? null);

echo 'Tipo: ';
var_dump($_SESSION['user_tipo'] ?? null);

echo 'Status: ';
var_dump($_SESSION['user_status'] ?? null);

echo '</pre>';