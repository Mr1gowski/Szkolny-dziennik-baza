<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>

	<link rel="stylesheet" type="text/css" href="style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body background="tlo.jpg">

	<div id="container">


		<div id="logo">
		<img src="logo.png" width="750px" height="150px">
		</div>

		<div id="nav">
					<a id="strona_glowna" href="strona_glowna_nauczyciel.php">

				<br/>Strona Główna

			</a>

			<a id="dodaj_uwagi" href="dodaj_uwage.php">

				<br/>Dodaj uwage


			</a>


			<a id="dodaj_oceny" href="dodaj_ocene.php">

				<br/>Dodaj ocene

			</a>


			<a id="wyloguj" href="logout.php">

				<br/>Wyloguj

			</a>
			<div id="kontakt">
				<br><br><br><b>Reklama</b><br><br>
				Lekarze<br>
				go nienawidza<br><br>
				schudl dzieki <br>
				jednej prostej<br>
				rzeczy.<br>

				Wystarczy ...</b>



			</div>

		</div>




		<div id="content" >

			<?php
echo "<h1>Witaj".$_SESSION['user']."</h1>"
			 ?>

		</div>
		<div id="footer">
		 © 2018. All Rights Reserved by Bicki Sciany .
		</div>

		</div>




		<div id="content">

		</div>


	</div>
</body>
</head>
</html>