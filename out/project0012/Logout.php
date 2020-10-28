<?php 
session_start();
$_SESSION["user"] = null;
header("Location:http://localhost/project001/Login.php");
?>