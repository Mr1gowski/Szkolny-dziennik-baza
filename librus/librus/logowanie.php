<?php
if (isset($_POST['loguj']))
{
   $login = $_POST['login'];
   $haslo = $_POST['haslo'];


   // sprawdzamy czy login i hasło są dobre
   if (mysql_num_rows(mysql_query("SELECT login, haslo FROM uzytkownicy WHERE login = '".$login."' AND haslo = '".md5($haslo)."';")) > 0)
   {
      $_SESSION['zalogowany'] = true;
      $_SESSION['login'] = $login;
    // zalogowany
   }
   else echo "Wpisano złe dane.";
}
?>
