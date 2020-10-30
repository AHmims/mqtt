<?php
    require '../include/function.php';
    require '../Database/database.php';
     $email = $pass =$CINError = $PrenomError = $NomError= $confirmpass  =  "";
     $isSuccess  = $status =  true;
     $error = null;
     $p = "";
     session_start();
     if( $_SESSION["user"] == null){
        header("Location:../Login.php");
     }else{
        $db = Database::connect();
        $statement = $db->prepare("select * from 	utilisateur where idUtilisateur = ? ");
        $statement->execute(array($_SESSION["user"]));
        $item = $statement->fetch();
        Database::disconnect();
        if($item["roleUtilisateur"] == "admin"){
            header("Location:error.php");
        }
         if(!empty($_POST)){
            $num = 0;
           $email = checkInput($_POST['email']);
           $pass  = checkInput($_POST['pass']);
           $confirmpass = checkInput($_POST['confirmpassword']);
           
           if(empty($email)){
            $NomError = "ce champ ne peut pas etre vide";
            $isSuccess = false;
           }
           if(empty($pass)){
            $PrenomError = "ce champ ne peut pas etre vide";
            $isSuccess = false;
           }
           if(empty($confirmpass)){
            $CINError = "ce champ ne peut pas etre vide";
            $isSuccess = false;
           }
           
          
    if($isSuccess){
        $status = false;
        try{
            $db = Database::connect();
            $statement = $db->prepare("Insert into utilisateur ( idUtilisateur, emailUtilisateur, roleUtilisateur, passUtilisateur, idPersonnel) values (?, ?, ?, ?, ?);");
            $statement->execute(array(NULL,$email,"2",$pass,"1")); 
            $status = true;
        }catch(Exception $e){
            die('Erreur : ' . $e->getMessage());
        }
        Database::disconnect();  
        if($status){
            header("Location: ajoute.php");
        } 
    }
         }
     }
  
?>

<!DOCTYPE html>
<html>
<head>
<title>ADMIN</title>
    <meta charset="utf-8">
    <style><?php file_get_contents("css_file.css");?></style>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="css/style2.Css">
 <link href="../app/img/logoadmin.png" rel="icon" type="image/png">
    <link href='http://fonts.googleapis.com/css?family=Holtwood+One+SC' rel='stylesheet' type="text/css">
</head>
    <body>

        <div class="container admin" >
        <!-- <a href="../../index.php">
                <img src="../../app/img/Logo_vertical.svg" class="LOGO" alt="logo">
        </a> -->
        <div class="row" style="margin-top:131px;">
                <br>
            <form class="form" action="Ajoute.php" enctype="multipart/form-data" id="formulaire" method="post">
            <h1><strong>Ajouter  un  Personnel</strong></h1>
            <div class="form-group" enctype="multipart/form-data">
                <input type="text" name="email"  id="name" placeholder="email"   value="">
                <span class="help-inline"  style="color:red"> 
                <?php echo $NomError; ?>
                </span>                
                </div>  
                <div class="form-group" enctype="multipart/form-data">
                <input type="password" name="pass"  id="Prenom" placeholder="mot de passe"   value="">
                <span class="help-inline"  style="color:red"> 
                <?php echo $PrenomError; ?>
                </span>                
                </div> 
                <div class="form-group" enctype="multipart/form-data">
                <input type="password" name="confirmpassword"  id="CIN" placeholder="confirmer mot de passe"   value="">
                <span class="help-inline"  style="color:red"> 
                <?php echo $CINError; ?>
                </span>                
                </div> 
               
                   
            <br>
            
            <div class="form-actions">
            
            <button type="submit" class="btn btn-success" > <span class="glyphicon glyphicon-pencil"></span>Ajouter   </button>
   <a class="btn btn-primary" href="personne.php"> <span class="glyphicon glyphicon-arrow-left"></span> Retour</a>            
            </div>
                 </form>
               
            
            
            
       
            
           
            
        </div>
        
        
        </div>
    
        <!-- <div id="footer">
            <span>@Copyright 2020. All right reserved.</span>
        </div> -->
    
    </body>
</html>