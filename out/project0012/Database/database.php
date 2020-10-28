<?php 
class Database{


private static $dbHost = "localhost";
private static $dbname = "projet001";
private static $dbUser = "admin";
private static $dbUserPassword = "7/J~xk)k;*bsp;f@";
private static $connection = null;



public static function connect(){
try{
    self::$connection = new PDO("mysql:host=". self::$dbHost . ";dbname=" . self::$dbname, self::$dbUser, self::$dbUserPassword);
}catch(PDOException $e){
    die($e->getMessage);
}
              return self::$connection;
}
public static function disconnect(){
    self::$connection = null;
}
}
?>