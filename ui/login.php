<?php
session_start();

if (isset($_SESSION['user_id'])) {
	header("Location: Dashboard.php");
}

?>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-120946860-6"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-120946860-6');
    </script>
    
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form </title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
  <body>

  <h1 class="h2"> NOTARY MANAGEMENT SYSTEM</h1>
    <br>
    
    <div class="container">
    
    <p class="lead">
     Benadir Public Notary
    </p>
    <br>
      <div class="wrapper">
        <div class="title"><span>Login Form</span></div>
        <form action="" method="POST" id="frm_login">
          <div class="row">
            <i class="fas fa-user"></i>
            <input type="text"  id="user_name" name="user_name" placeholder="Enter your User Name" required="true">
          </div>
          <div class="row">
            <i class="fas fa-lock"></i>
            <input type="password"  id="password" name="password" placeholder="Enter your password" required="true">
          </div>
          <div class="pass"><a href="#">Forgot password?</a></div>
          <div class="row button">
            <input type="submit" value="Login">
          </div>
          <div class="signup-link">Not a member? <a href="#">Signup now</a></div>
        </form>
      </div>
    </div>

    <script src="../js/app.js"></script>
    <script src="../scripts/users_login.js"></script>
    <script src="../js/sweetalert.min.js"></script>

  </body>
</html>
