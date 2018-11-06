<!Doctype html>
<head> 
<center><h1>Oceny</center></h1>
</head>
<body>
<?php
$adres_ip = '127.0.0.1';
$bazy_danych = 'dziennik';
$login = 'root';
$haslo = '';
if ( !mysql_connect($adres_ip,$bazy_danych,
 
              $login,$haslo) ) {
    echo 'Nie moge polaczyc sie z baza danych';
 	 exit (0);
  if ( !mysql_select_db($nazwa_bazy_danych) ) {
    echo 'Blad otwarcia bazy danych';
 	 exit (0);
 }
 $zapytanie = "SELECT * FROM `Oceny`";
 $wynik = mysql_query($zapytanie);
 
 

echo "<p>";
 echo "<table boder=\"1\"><tr>";
 echo "<td bgcolor=\"ffff00\"><strong>Przedmiot</strong></td>";
 echo "<td bgcolor=\"ffff99\"><strong>Oceny</strong></td>";
 echo "</tr>";
  while ( $row = mysql_fetch_row($wynik) ) {
    echo "</tr>";
    echo "<td bgcolor=\"ffff00\">" . $row[4] . "</td>";
    echo "<td bgcolor=\"ffff99\">" . $row[3] . "</td>";
    echo "</tr>";
 }
 echo "</table>";
if ( !mysql_close() ) {
    echo 'Nie moge zakonczyc polaczenia z baza danych';
    exit (0);
 }
?>   
</body>
</html>