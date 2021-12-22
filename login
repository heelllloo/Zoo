<?php require_once("includes/constants.php"); ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Київський зоопарк</title>
	<link href="css/style.css" media="screen" rel="stylesheet">
	<link href= 'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	
</head> 
<body>
	<div class="container mlogin">
		<div id="login">
			<h1>Вход</h1>
			<form action="" id="loginform" method="post"name="loginform">
				<p><label for="user_login">Имя пользователя<br>
					<input class="input" id="username" name="username"size="20"
					type="text" value=""></label></p>
					<p><label for="user_pass">Пароль<br>
						<input class="input" id="password" name="password"size="20"
						type="password" value=""></label></p> 
						<p class="submit"><input class="button" name="login"type= "submit" value="Log In"></p>
						<p class="regtext">Еще не зарегистрированы?<a href= "register.php">Регистрация</a>!</p>
					</form>
				</div>
			</div>
			<?php
			session_start();
			?>

			
				 
			<?php


			if(isset($_POST["login"])){

				if(!empty($_POST['username']) && !empty($_POST['password'])) {
					$username=htmlspecialchars($_POST['username']);
					$password=htmlspecialchars($_POST['password']);
					$query =mysqli_query($con, "SELECT * FROM user WHERE username='".$username."' AND password='".$password."'");
					$numrows=mysqli_num_rows($query);
					if($numrows!=0)
					{
						while($row=mysqli_fetch_assoc($query))
						{
							$dbusername=$row['username'];
							$dbpassword=$row['password'];
						}
						if($username == $dbusername && $password == $dbpassword)
						{
	// старое место расположения
	//  session_start();
							$_SESSION['session_username']=$username;	 
							/* Перенаправление браузера */
							header("Location: 1.php");
						}
					} else {
	//  $message = "Invalid username or password!";

						echo  "Invalid username or password!";
					}
				} else {
					$message = "All fields are required!";
				}
			}
			?>

<?php include("includes/footer.php"); ?>
