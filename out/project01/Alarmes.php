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

    
?>







<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div class="wrapper">
  <div class="top_navbar">
    <div class="hamburger">
       <div class="one"></div>
       <div class="two"></div>
       <div class="three"></div>
    </div>
  </div>
  
  <div class="sidebar">
      <ul>
        <li><a href="dashboard.php" class="active">
          <span class="icon"><i class="fas fa-home"></i></span>
          <span class="title">ACCEUIL</span></a></li>
        <li><a href="Personne/personne.php">
          <span class="icon"><i class="fas fa-user"></i></span>
          <span class="title">Management</span>
          </a></li>
        <li><a href="search.php">
          <span class="icon"><i class="fas fa-search"></i></span>
          <span class="title">search</span>
          </a></li>
       
        <li><a href="Logout.php">
          <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
          <span class="title">DECONNECTER</span>
          </a></li>  
    </ul>
  </div>
    
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
    
    
    


</body>
</html>