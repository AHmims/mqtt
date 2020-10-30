<?php
define('project001', true);

// Include the configuration file, this contains settings you can change.

// Include functions and connect to the database using PDO MySQL
include 'functions.php';
// Connect to MySQL database

// Page is set to home (home.php) by default, so when the visitor visits that will be the page they see.
$page = isset($_GET['page']) && file_exists($_GET['page'] . '.php') ? $_GET['page'] : 'login';
// Output error variable
$error = '';
// Include the requested page
include $page . '.php';
?>
