<?php
 require 'include/function.php';
 require 'Database/database.php';
 session_start();
 $db = Database::connect();
$stmt = $db->prepare('SELECT  * FROM historique WHERE actionHistorique ="connecté" ');
    $stmt->execute();
    // les entrés
    $total_entrés = $stmt->rowCount();

    $stmt = $db->prepare('SELECT  * FROM historique WHERE actionHistorique ="déconnecté" ');
    $stmt->execute();
    // les sorties
    $total_sorties = $stmt->rowCount();

    //les temps d'entrées
    
$stmt = $db->prepare('SELECT *FROM historique WHERE dateHistorique BETWEEN "2020-10-29 10:21:17" AND "2020-10-29 10:21:20.000000" AND actionHistorique = "connecté"');
$stmt->execute();
$first_time_e= $stmt->rowCount();

$stmt = $db->prepare('SELECT *FROM historique WHERE dateHistorique BETWEEN  "2020-10-29 10:21:03.000000" AND  "2020-10-29 10:21:05" AND actionHistorique = "connecté"');
$stmt->execute();
$second_time_e= $stmt->rowCount();

$stmt = $db->prepare('SELECT *FROM historique WHERE dateHistorique BETWEEN "2020-10-29 08:31:01" AND  "2020-10-29 08:31:02" AND actionHistorique = "connecté"');
$stmt->execute();
$third_time_e= $stmt->rowCount();


    //les temps sorties
 $stmt = $db->prepare('SELECT *FROM historique WHERE dateHistorique BETWEEN "2020-10-23 18:42:03" AND  "2020-10-23 22:42:34" AND actionHistorique = "déconnecté"');
 $stmt->execute();
 $first_time_s= $stmt->rowCount();

 $stmt = $db->prepare('SELECT *FROM historique WHERE dateHistorique BETWEEN "2020-10-23 22:44:33" AND  "2020-10-23 22:52:03" AND actionHistorique = "déconnecté"');
 $stmt->execute();
 $second_time_s= $stmt->rowCount();

 $stmt = $db->prepare('SELECT *FROM historique WHERE dateHistorique BETWEEN "2020-10-23 22:55:05" AND  "2020-10-23 22:55:38" AND actionHistorique = "déconnecté"');
 $stmt->execute();
 $third_time_s= $stmt->rowCount();

    //health stats 
    //temperature
$stmt = $db->prepare('SELECT *FROM record WHERE temperature BETWEEN "35" AND  "38" ');
$stmt->execute();
$tempe_m= $stmt->rowCount();

$stmt = $db->prepare('SELECT *FROM record WHERE temperature BETWEEN "39" AND  "80" ');
$stmt->execute();
$tempe_h= $stmt->rowCount();

$stmt = $db->prepare('SELECT *FROM record WHERE temperature BETWEEN "0" AND  "35" ');
$stmt->execute();
$tempe_l= $stmt->rowCount();


    //oxygen
$stmt = $db->prepare('SELECT *FROM record WHERE oxygene BETWEEN "0" AND  "9" ');
$stmt->execute();
$ox_l= $stmt->rowCount();

$stmt = $db->prepare('SELECT *FROM record WHERE oxygene BETWEEN "10" AND  "19" ');
$stmt->execute();
$ox_m= $stmt->rowCount();

$stmt = $db->prepare('SELECT *FROM record WHERE oxygene BETWEEN "20" AND  "30" ');
$stmt->execute();
$ox_h= $stmt->rowCount();


 //cardio
 $stmt = $db->prepare('SELECT *FROM record WHERE battementCoeur BETWEEN "10" AND  "20" ');
 $stmt->execute();
 $hr_l= $stmt->rowCount();
 
 $stmt = $db->prepare('SELECT *FROM record WHERE battementCoeur BETWEEN "21" AND  "59" ');
 $stmt->execute();
 $hr_m= $stmt->rowCount();
 
 $stmt = $db->prepare('SELECT *FROM record WHERE battementCoeur BETWEEN "60" AND  "100" ');
 $stmt->execute();
 $hr_h= $stmt->rowCount();

 //infraction
 //  en generale
 $stmt = $db->prepare('SELECT *FROM recordpoints ');
 $stmt->execute();
 $infraction= $stmt->rowCount();

 //non respet de distance
 $stmt = $db->prepare('SELECT *FROM recordpoints WHERE raisonRecordPoints = "Ne pas maintenir la distance sociale" ');
 $stmt->execute();
 $infraction_d= $stmt->rowCount();

  //non respet de distance
  $stmt = $db->prepare('SELECT *FROM recordpoints WHERE raisonRecordPoints = "infraction de zone" ');
  $stmt->execute();
  $infraction_z= $stmt->rowCount();
  



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
    <script src="main.js"></script>
    <link rel="stylesheet" href="../css/styles.css">
  <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
  <script  src="https://kit.fontawesome.com/b99e675b6e.js"></script>
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
      <form class="form" role="form" name="search" action="personne.php" method="post">
      <ul>
        <li>
         
          <input type="text" placeholder="rechercher" name="name" id="search">
         
        </li>
       <li>
       <button type="submit" style="background-color:white;border:none;outline:none;"   >
       <a>
          <i class="fas fa-search"></i>
        
        </a> 
      </button>
          </li>
          <li><a href="personne.php"> 
          <i class="fas fa-user"></i>
          </a></li>
      </ul>
      </form>
    </div>
  </div>
  
  <div class="sidebar">
  <ul>
        <li><a href="dashboard.php" >
          <span class="icon"><i class="fas fa-home"></i></span>
          <span class="title">ACCEUIL</span></a></li>
        <li><a href="#" class="active">
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
              echo '<li><a href="../User/user.php">
              <span class="icon"><i class="fas fa-user"></i></span>
              <span class="title">User</span>
              </a></li>';
            }
          
          
          ?> 
       
        <li><a href="../Logout.php">
          <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
          <span class="title">DECONNECTER</span>
          </a></li>
          
    </ul>
  </div>
  <div class="main_container">
  <div class="first_section">
<div class="first_s">
<div class="first_section_e">
        <h1>entrés:</h1>
        <p><?=$total_entrés?></p>
    </div>
    <div class="first_section_e">
        <h1>sorties</h1>
        <p><?=$total_sorties?></p>
    </div>
</div>
   
    <div class="second_section">
        
        <div class="one-graph">
        <h1>temps d'entrées</h1>
        <p><?=$first_time_e?></p>
        <p><?=$second_time_e?></p>
        <p><?=$third_time_e?></p>
            <canvas id="myChart2" width="1000" height="400"></canvas>
        </div>
        <div class="one-graph">
        <h1>temps de sortie</h1>
        <p><?=$first_time_s?></p>
        <p><?=$second_time_s?></p>
        <p><?=$third_time_s?></p>
            <canvas id="myChart3" width="1000" height="400"></canvas>
        </div>
    </div>
    <div class="health_status">
        <canvas id="myChart4" width="1000" height="400"></canvas>
    </div>
    <div class="forth_section">
        <h1>nombre d'infraction en générale</h1>
        <p><?=$infraction?></p>
        <h1>nombre d'infraction de non respet de la distance</h1>
        <p><?=$infraction_d?></p>
        <h1>nombre d'infraction de zones</h1>
        <p><?=$infraction_z?></p>
        
    </div>

</div>
  </div>
<div class="first_section">
<div class="first_s">
<div class="first_section_e">
        <h1>entrés:</h1>
        <p><?=$total_entrés?></p>
    </div>
    <div class="first_section_e">
        <h1>sorties</h1>
        <p><?=$total_sorties?></p>
    </div>
</div>
   
    <div class="second_section">
        
        <div class="one-graph">
        <h1>temps d'entrées</h1>
        <p><?=$first_time_e?></p>
        <p><?=$second_time_e?></p>
        <p><?=$third_time_e?></p>
            <canvas id="myChart2" width="1000" height="400"></canvas>
        </div>
        <div class="one-graph">
        <h1>temps de sortie</h1>
        <p><?=$first_time_s?></p>
        <p><?=$second_time_s?></p>
        <p><?=$third_time_s?></p>
            <canvas id="myChart3" width="1000" height="400"></canvas>
        </div>
    </div>
    <div class="health_status">
        <canvas id="myChart4" width="1000" height="400"></canvas>
    </div>
    <div class="forth_section">
        <h1>nombre d'infraction en générale</h1>
        <p><?=$infraction?></p>
        <h1>nombre d'infraction de non respet de la distance</h1>
        <p><?=$infraction_d?></p>
        <h1>nombre d'infraction de zones</h1>
        <p><?=$infraction_z?></p>
        
    </div>

</div>
</div>



<script>
        document.addEventListener("DOMContentLoaded", function(event) { 
    var ctx = document.getElementById('myChart2').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['aprés 2020-10-29 10:21:17', '2020-10-29 10:21:03.000000', '2020-10-23 22:55:05'],
            datasets: [{
                label: '# of Votes',
                data: [<?=$first_time_e?>, <?=$second_time_e?>, <?=$third_time_e?>],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            },
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            legend: {
                position:'right'
            }
        }
    });
  });

  document.addEventListener("DOMContentLoaded", function(event) { 
    var ctx = document.getElementById('myChart3').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['aprés 2020-10-29 10:21:17', '2020-10-29 10:21:03.000000', '2020-10-23 22:55:05'],
            datasets: [{
                label: '# of Votes',
                data: [<?=$first_time_s?>, <?=$second_time_s?>, <?=$third_time_s?>],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            },
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            legend: {
                position:'right'
            }
        }
    });
  });
  document.addEventListener("DOMContentLoaded", function(event) { 
    var ctx = document.getElementById('myChart4').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['<la norme', '=la norme', '>la norme'],
            datasets: [{
                label: 'temperature',
                data: [<?=$tempe_l?>, <?=$tempe_m?>, <?=$tempe_h?>],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            },
            {
                label: 'oxygene',
                data: [<?=$ox_l?>, <?=$ox_m?>, <?=$ox_h?>],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }, {
                label: 'battement de coeur',
                data: [<?=$hr_l?>, <?=$hr_m?>, <?=$hr_h?>],
                backgroundColor: [
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            },
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            legend: {
                position:'right'
            }
        }
    });
  });

    </script>
</body>
</html>