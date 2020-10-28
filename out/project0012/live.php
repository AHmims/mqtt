<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
try{
    $pdo = new PDO("mysql:host=localhost;dbname=projet001", "root", "");
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e){
    die("ERROR: Could not connect. " . $e->getMessage());
}
 
// Attempt search query execution
try{
    if(isset($_REQUEST["term"])){
        // create prepared statement
        $sql = "SELECT * FROM personnel WHERE nomPersonnel LIKE :term";
        $stmt = $pdo->prepare($sql);
        $term = '%'.$_REQUEST["term"] . '%';
        // bind parameters to statement
        $stmt->bindParam(":term", $term);
        // execute the prepared statement
        $stmt->execute();
        $nigga2 = "<p>No matches found</p>";
        if($stmt->rowCount() > 0){
            $nigga2="";
            while($row = $stmt->fetch()){
                
                $nigga2 .= "<h1 onclick ='deposer(this)'>" . $row["nomPersonnel"] . "</h1>";
              
             
            }
        } 
    } 
    echo $nigga2; 
} catch(PDOException $e){
    die("ERROR: Could not able to execute $sql. " . $e->getMessage());
}
 
// Close statement
unset($stmt);
 
// Close connection
unset($pdo);
?>
<a href=""></a>