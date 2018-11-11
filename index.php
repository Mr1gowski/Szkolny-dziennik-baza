
<?php
session_start();
if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
	{
		header('Location:strona_glowna_nauczyciel.php');
		exit();
	}
else if ((isset($_SESSION['zalogowany1'])) && ($_SESSION['zalogowany1']==true))
	{
		header('Location:strona_glowna_uczen.php');
		exit();
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






		<div id="content" >



			<div id="panel">
			<form method="POST" action="config.php">
			<label for="username">Nazwa użytkownika:</label>    <input type="text" id="username" name="login">
			<label for="password">Hasło:</label>                <input type="password" id="password" name="haslo">
			<label for="typ1">Typ konta 0-Uczeń/1-Admin</label>    <input type="number" id="typ1" name="typ">
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