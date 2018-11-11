
<?php
session_start();
if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
{
header('Location:config.php')

}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>

	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="arkusz.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body background="tlo.jpg">

	<div id="container">


		<div id="logo">
		<img src="logo.png" width="750px" height="150px">
		</div>





	<!--	<form method="POST" action="logowanie.php">
<b>Login:</b> <input type="text" name="login"><br>
<b>Hasło:</b> <input type="password" name="haslo"><br>
<input type="submit" value="Zaloguj" name="loguj">
</form>
-->
		<div id="content" >



			<div id="panel">
			<form method="POST" action="config.php">
			<label for="username">Nazwa użytkownika:</label>    <input type="text" id="username" name="login">
			<label for="password">Hasło:</label>                <input type="password" id="password" name="haslo">
			<div id="lower">
			<input type="submit" value="Login">
			</div>
			</form>

		<?php
			if(isset($_SESSION['blad']))	echo $_SESSION['blad'];
		?>

			</div>


		</div>
		<div id="footer">
		 © 2018. All Rights Reserved by Bicki Sciany .
		</div>

		</div>






	</div>
</body>
</head>
</html>
