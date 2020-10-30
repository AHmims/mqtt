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
                
                $nigga2 .= '
                <table class="table table-striped table-bordered">
                <thead>
                <tr>
                <th>CIN</th>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Telephone</th>
                <th>Date Naissence</th>
                <th>Departement</th>
                <th>MacPersonnel</th>
                <th>PointPersonnel</th>
                <th>Online</th>
                <th>Action</th>
                </tr>
            </thead>
            <tbody>
                
                
                <tr>
                <td><a href="profile.php">'. $row['cinPersonnel'] .  '</a> </td>
                <td>' . $row['nomPersonnel'] .  '</td>
                <td>' . $row['prenomPersonnel'] .  '</td>
                <td>' . $row['telPersonnel'] .  '</td>
                <td>' . $row['dateNaisPersonnel'] .  '</td>
                <td>' . $row['departementPersonnel'] .  '</td>
                <td>' . $row['macBracelet'] .  '</td>
                <td>' . $row['pointsPersonnel'] .  '</td>
                <td>' . $row['onlinePersonnel'] .  '</td>
               <td width="300">
               
               </td>
            
            </tr>
            </tbody>
            </table>
            ';

              
             
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

session_start();
if( $_SESSION["user"] == null){
 header("Location:../Login.php");
}else{
 if(!empty($_POST)){
  
   $status = true;
   $search = $_POST["name"];
 }
}
?>
<a href=""></a>