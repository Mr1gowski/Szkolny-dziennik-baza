<?php
session_start();
require_once "connect.php";
$polaczenie =new mysqli($host,$user_name,$db_password,$db_name);

if ($polaczenie->connect_errno!=0) {echo "Error: ".$polaczenie->connect_errno;}
else
{
  $login=$_POST['login'];
  $haslo=$_POST['haslo'];
  $sql="select * FROM uzytkownicy where login=''$login' AND haslo= '$haslo'";
    if ($result=$polaczenie->query($sql))
        {
          $log=$result->fetch_assoc();
          $_SESSION['typ']=$log['typ'];
          $_SESSION['zalogowany']=true;
          if ($log['typ']==1)
           {

             header("Location:strona_glowna_nauczyciel");
             unset($_SESSION['blad']);
             $result->close();
          }


      else if ($log['typ']==0)
        {

          header("Location:strona_glowna_uczen");
          unset($_SESSION['blad']);
          $result->close();


        }
        else
          {
            $_SESSION['blad']='<span style"color:red">spell red</span>';
            header('Location:index.php');
           }
  $polaczenie->close();
    }
}


?>
