<?php

$polaczenie =new mysqli($host,$user_name,$db_password,$db_name);

if ($polaczenie->connect_errno!=0)
{
}
else
{
$login=$_POST['login'];
$haslo=$_POST['haslo'];
$sql_n="select * FROM uzytkownicy where login=''$login' AND haslo= '$haslo'AND typ='1'"
$sql_u="select * FROM uzytkownicy where login=''$login' AND haslo= '$haslo'AND typ='0'"
if ($result=$polaczenie->query($sql_n))
{

}
else if($result=$polaczenie->query($sql_u))
{


}
$polaczenie->close();
}


?>
