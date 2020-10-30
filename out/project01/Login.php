<?php
require 'include/function.php';
require 'Database/database.php';
$email = $password = $erreur  = "";
$status = true;
if(!empty($_POST)){
  $email = checkInput($_POST["Email"]);
  $password = checkInput($_POST["pwd"]);
  $db = Database::connect();
  $stmt = $db->query("SELECT  emailUtilisateur,passUtilisateur FROM utilisateur");
  while ($row = $stmt->fetch()){
    if($row['emailUtilisateur'] == $email && $row['passUtilisateur'] == $password){
       session_start();
       $_SESSION["user"] = $row['emailUtilisateur'];
       $_SESSION["mtp"] = $row['passUtilisateur'];
       header("Location: dashboard.php");
    }else{
        $status = false;
        $erreur = "Erreur form n'est pas valide";
    }
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
    <title>Login</title>
</head>

<body>
    <div id="content">
        <a href="index.php">
        <!-- <img src="../app/img/Logo_vertical.svg" alt="logo"> -->
</a>
<?php if(!$status) :?> 
<div class="alert alert-danger" role="alert">
Mot de passe ou bien Email n'est pas valide 
</div>
<?php endif?>

        <form id="form" method="POST" action="" >
            <h1>Admin</h1>
            <div class="inputCont">
                <span>Email :</span>
                <input type="text" id="email" name="Email">
            </div>
            <div class="inputCont">
                <span>Mot de passe :</span>
                <input type="password" id="password" name="pwd">
            </div>
            <!-- <input id="btnLogin" type="submit">Login</button> -->
         <a><input type="submit" id="btnLogin" value="Login"></a>   
</form>
    </div>
    <script src="../app/js/validation.js"></script>
</body>

</html>