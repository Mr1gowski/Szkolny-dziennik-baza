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



		</div>
		<div id="footer">
		 © 2018. All Rights Reserved by Bicki Sciany .
		</div>

		</div>




		<div id="content">


<form method="POST">
      Ocena
    <input type="text" name="add_ocena">
      <br/><br/>
      Przedmiot
      <input type="text" name="jaki_przedmiot">
      <br/><br>
      Nr ucznia w dzienniku <br/>
      <input type="text" name="jaki_uczen_i">
      <br/><br/>

      <input type="submit" name="dodaj">
      <br/><br/>
    </form>
      <?php
      $add_ocena=?_POST['add_ocena'];
      $jaki_przedmiot= ?_POST['jaki_przedmiot'];
      $jaki_uczen_i= ?_POST['jaki_uczen_i'];




			$ins = @mysql_query("INSERT INTO oceny SET iduczen='$jaki_uczen_i',przedmiot='$jaki_przedmiot',ocena='$add_ocena'");

 if($ins) echo "Dodano ocene";
 else echo "Ups cos poszlo nie tak";

      ?>




		</div>


	</div>
</body>
</head>
</html>
