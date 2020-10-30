<?php
 require 'include/function.php';
 require 'Database/database.php';

$db = Database::connect();
// Prepare statement and execute, prevents SQL injection
    $stmt = $db->prepare('SELECT * FROM notification ');
    $stmt->execute();
    // Fetch the data from the database and return the result as an Array
    $notifications = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if (!$notifications) {
        // Simple error to display if the id for the data doesn't exists (array is empty)
        die ('worker does not exist!');
    }
    session_start();
    if( $_SESSION["user"] == null){
     header("Location:Login.php");
    }else{
     if(!empty($_POST)){
      
       $status = true;
       $search = $_POST["name"];
     }
    }
    
?>







<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="main.js"></script>
    <script src="Chart.js"></script>
    <script src="jquery.js"></script>
    
    <link rel="stylesheet" href="css/styles.css">
  <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
 
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <link href="../../app/img/logoadmin.png" rel="icon" type="image/png">
	<script>
		$(document).ready(function(){
			$(".hamburger").click(function(){
			   $(".wrapper").toggleClass("collapse");
			});
		});
	</script>
</head>
<body>
<div class="wrapper">
  <div class="top_navbar">
    <div class="hamburger">
       <div class="one"></div>
       <div class="two"></div>
       <div class="three"></div>
    </div>
    <div class="top_menu">
      <div class="logo"> </div>
     
      <ul>
       
       <li>
       
       <a href= "search.php">
          <i class="fas fa-search"></i>
        
        </a> 
      
          </li>
        
      </ul>
    
    </div>
  </div>
  <div class="sidebar">
  <ul>
        <li><a href="dashboard.php" >
          <span class="icon"><i class="fas fa-home"></i></span>
          <span class="title">ACCEUIL</span></a></li>
        <li><a href="personne/personne.php" class="active">
          <span class="icon"><i class="fas fa-user"></i></span>
          <span class="title">Management</span>
          </a></li>
           <?php
          
          $db = Database::connect();
            $statement = $db->prepare("select * from utilisateur where emailUtilisateur   = ? ");
            $statement->execute(array($_SESSION["user"]));
            $item = $statement->fetch();
            Database::disconnect();
            if($item["roleUtilisateur"] == "Super admin"){
              echo '<li><a href="User/user.php">
              <span class="icon"><i class="fas fa-user"></i></span>
              <span class="title">User</span>
              </a></li>';
            }
            
          
          
          ?> 
             <li><a href="Alarmes.php">
          <span class="icon"><i class="fas fa-exclamation-triangle"></i></span>
          <span class="title">Alarmes</span>
          </a></li>
       
        <li><a href="Logout.php">
          <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
          <span class="title">DECONNECTER</span>
          </a></li>
          
    </ul>
  </div>
  <div class="main_container">
        <table class="table table-dark">
                            <thead class="table_head">
                              <tr>
                                <th >id</th>
                                <th >sujet</th>
                                <th > time</th>
                                <th >broker</th>
                                <th >id personnel</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <?php foreach ($notifications as $points): ?>
                              <tr>
                                
                                <th><?=$points['idNotification']?></th>
                                <th><?=$points['sujetNotification']?></th>
                                <th><?=$points['dateNotification']?></th>
                                <th><?=$points['idBroker']?></th>
                                <th><?=$points['idPersonnel']?></th>
                                
                               
                              </tr>
                            <?php endforeach; ?>
                             
                            </tbody>
                          </table>
    
    </div>
    


</body>
</html>