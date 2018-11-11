<?php
session_start();
require_once "connect.php";
$polaczenie =new mysqli($host,$user_name,$db_password,$db_name);

if ($polaczenie->connect_errno!=0) {echo "Error: ".$polaczenie->connect_errno;}
else
{
  $login=$_POST['login'];
  $haslo=$_POST['haslo'];
  $sql_n="select * FROM uzytkownicy where login=''$login' AND haslo= '$haslo'AND typ='1'"
  $sql_u="select * FROM uzytkownicy where login=''$login' AND haslo= '$haslo'AND typ='0'"
    if ($result=$polaczenie->query($sql_n))
        {

          include_once 'strona_glowna_nauczyciel';
          $result->close();
        }
      else if($result=$polaczenie->query($sql_u))
        {
          include_once 'strona_glowna_uczen';
          $result->close();
        }
  $polaczenie->close();
}


?>
