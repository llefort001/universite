<?php
/**
 * Created by PhpStorm.
 * User: Lucas Lefort
 * Date: 03/10/2018
 * Time: 17:47
 */

echo nl2br("Connexion à la base de données :\n");

$mysqli = new mysqli('localhost', 'root', '', 'universite');

if ($mysqli->connect_error) {
    die('Erreur de connexion (' . $mysqli->connect_errno . ') '
        . $mysqli->connect_error);
}
echo nl2br('Succès... ' . $mysqli->host_info. "\n");


/* Requête "Select" retourne un jeu de résultats */
if ($result = $mysqli->query("SELECT * FROM video")) {
    printf("Select a retourné %d lignes.\n", $result->num_rows);
    /* Libération du jeu de résultats */
    while ($data = $result->fetch_assoc())
    {
        $results[] = $data;
    }

    var_dump($results);
}
$result->close();

$mysqli->close();
