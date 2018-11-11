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
          $_SESSION['zalogowany']=true;
          include_once 'strona_glowna_nauczyciel';
            unset($_SESSION['blad']);
          $result->close();
        }
      else if($result=$polaczenie->query($sql_u))
        {
            $_SESSION['zalogowany1']=true;
          include_once 'strona_glowna_uczen';
            unset($_SESSION['blad']);
          $result->close();
        }
        else {
          $_SESSION['blad']='<span style"color:red">spell red</span>';
          header('Location:index.php');
        }
  $polaczenie->close();
}


?>
