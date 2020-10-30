<?php 
 require 'include/function.php';
 require 'Database/database.php';
 session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PHP Live MySQL Database Search</title>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<link rel="stylesheet" href="css/styles.css">
  <script  src="https://kit.fontawesome.com/b99e675b6e.js"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="main.js"></script>
    <script src="Chart.js"></script>
    <script src="jquery.js"></script>
  <link href="../app/img/logoadmin.png" rel="icon" type="image/png">
	<script>
		$(document).ready(function(){
			$(".hamburger").click(function(){
			   $(".wrapper").toggleClass("collapse");
			});
		});
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.search-box input[type="text"]').on("keyup input", function(){
        /* Get input value on change */
        var inputVal = $(this).val();
        var resultDropdown = $(this).siblings(".result");
        if(inputVal.length){
            $.get("live.php", {term: inputVal}).done(function(data){
                // Display the returned data in browser
                resultDropdown.html(data);
            });
        } else{
            resultDropdown.empty();
        }
    });
    
    // Set search input value on click of result item
    // $(document).on("click", ".result p", function(){
    //     $(this).parents(".search-box").find('input[type="text"]').val($(this).text());
    //     $(this).parent(".result").empty();
    // });
});
function deposer(nignig){
    document.getElementById('depos').innerHTML += nignig.innerHTML;
}
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
<div class="main_container" >
<div class="search-box" >
        <input type="text" autocomplete="off" placeholder="Search " />
        <div class="result">
        <p>search here </p>
        </div>
    </div>
    <div id="depos"></div>
</div>
    
</body>
</html>