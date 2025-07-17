<?php
$db = mysqli_connect(
    'db',    // Nombre del servicio en docker-compose.yml
    'devuser', // Usuario MySQL
    '2020',    // Contraseña
    'devwebcamp' // Base de datos
);

if (!$db) {
    echo "Error: No se pudo conectar a MySQL.";
    echo "errno de depuración: " . mysqli_connect_errno();
    echo "error de depuración: " . mysqli_connect_error();
    exit;
}
