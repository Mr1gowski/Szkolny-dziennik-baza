-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Lis 2018, 13:42
-- Wersja serwera: 10.1.16-MariaDB
-- Wersja PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `dziennik`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa`
--

CREATE TABLE `klasa` (
  `idklasa` int(11) NOT NULL,
  `klasa` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasa_przedmiot`
--

CREATE TABLE `klasa_przedmiot` (
  `idklasa` int(11) DEFAULT NULL,
  `idprzedmiot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciel`
--

CREATE TABLE `nauczyciel` (
  `idnauczyciel` int(11) NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciel_klasa`
--

CREATE TABLE `nauczyciel_klasa` (
  `idnauczyciel` int(11) DEFAULT NULL,
  `idklasa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `idoceny` int(11) NOT NULL,
  `oceny` varchar(20) DEFAULT NULL,
  `iduczeń` int(11) DEFAULT NULL,
  `idklasa` int(11) DEFAULT NULL,
  `idprzedmiot` int(11) DEFAULT NULL,
  `idnauczyciel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `idprzedmiot` int(11) NOT NULL,
  `przedmiot` varchar(20) DEFAULT NULL,
  `idnauczyciel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczeń`
--

CREATE TABLE `uczeń` (
  `iduczeń` int(11) NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(20) DEFAULT NULL,
  `idklasa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uwagi`
--

CREATE TABLE `uwagi` (
  `opis` varchar(200) DEFAULT NULL,
  `idnauczyciel` int(11) DEFAULT NULL,
  `iduczeń` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `haslo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `klasa`
--
ALTER TABLE `klasa`
  ADD PRIMARY KEY (`idklasa`);

--
-- Indexes for table `klasa_przedmiot`
--
ALTER TABLE `klasa_przedmiot`
  ADD KEY `idklasa` (`idklasa`),
  ADD KEY `idprzedmiot` (`idprzedmiot`);

--
-- Indexes for table `nauczyciel`
--
ALTER TABLE `nauczyciel`
  ADD PRIMARY KEY (`idnauczyciel`);

--
-- Indexes for table `nauczyciel_klasa`
--
ALTER TABLE `nauczyciel_klasa`
  ADD KEY `idnauczyciel` (`idnauczyciel`),
  ADD KEY `idklasa` (`idklasa`);

--
-- Indexes for table `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`idoceny`),
  ADD KEY `iduczeń` (`iduczeń`),
  ADD KEY `idklasa` (`idklasa`),
  ADD KEY `idprzedmiot` (`idprzedmiot`),
  ADD KEY `idnauczyciel` (`idnauczyciel`);

--
-- Indexes for table `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`idprzedmiot`),
  ADD KEY `idnauczyciel` (`idnauczyciel`);

--
-- Indexes for table `uczeń`
--
ALTER TABLE `uczeń`
  ADD PRIMARY KEY (`iduczeń`),
  ADD KEY `idklasa` (`idklasa`);

--
-- Indexes for table `uwagi`
--
ALTER TABLE `uwagi`
  ADD KEY `idnauczyciel` (`idnauczyciel`),
  ADD KEY `iduczeń` (`iduczeń`);

--
-- Indexes for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klasa`
--
ALTER TABLE `klasa`
  MODIFY `idklasa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `nauczyciel`
--
ALTER TABLE `nauczyciel`
  MODIFY `idnauczyciel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `idoceny` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  MODIFY `idprzedmiot` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `uczeń`
--
ALTER TABLE `uczeń`
  MODIFY `iduczeń` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `klasa_przedmiot`
--
ALTER TABLE `klasa_przedmiot`
  ADD CONSTRAINT `klasa_przedmiot_ibfk_1` FOREIGN KEY (`idklasa`) REFERENCES `klasa` (`idklasa`),
  ADD CONSTRAINT `klasa_przedmiot_ibfk_2` FOREIGN KEY (`idprzedmiot`) REFERENCES `przedmiot` (`idprzedmiot`);

--
-- Ograniczenia dla tabeli `nauczyciel_klasa`
--
ALTER TABLE `nauczyciel_klasa`
  ADD CONSTRAINT `nauczyciel_klasa_ibfk_1` FOREIGN KEY (`idnauczyciel`) REFERENCES `nauczyciel` (`idnauczyciel`),
  ADD CONSTRAINT `nauczyciel_klasa_ibfk_2` FOREIGN KEY (`idklasa`) REFERENCES `klasa` (`idklasa`);

--
-- Ograniczenia dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`iduczeń`) REFERENCES `uczeń` (`iduczeń`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`idklasa`) REFERENCES `klasa` (`idklasa`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`idprzedmiot`) REFERENCES `przedmiot` (`idprzedmiot`),
  ADD CONSTRAINT `oceny_ibfk_4` FOREIGN KEY (`idnauczyciel`) REFERENCES `nauczyciel` (`idnauczyciel`);

--
-- Ograniczenia dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD CONSTRAINT `przedmiot_ibfk_1` FOREIGN KEY (`idnauczyciel`) REFERENCES `nauczyciel` (`idnauczyciel`);

--
-- Ograniczenia dla tabeli `uczeń`
--
ALTER TABLE `uczeń`
  ADD CONSTRAINT `uczeń_ibfk_1` FOREIGN KEY (`idklasa`) REFERENCES `klasa` (`idklasa`);

--
-- Ograniczenia dla tabeli `uwagi`
--
ALTER TABLE `uwagi`
  ADD CONSTRAINT `uwagi_ibfk_1` FOREIGN KEY (`idnauczyciel`) REFERENCES `nauczyciel` (`idnauczyciel`),
  ADD CONSTRAINT `uwagi_ibfk_2` FOREIGN KEY (`iduczeń`) REFERENCES `uczeń` (`iduczeń`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- inserty danych






insert into nauczyciel (idnauczyciel,imie,nazwisko) VALUES
('1','Jan','Kowalski'),
('2','Ewa','Linda'),
('3','Mikolaj','Majewski'),
('4','Magda','Zwara'),
('5','Daniel','Szada'),
('6','Anita','Red');



INSERT into przedmiot (idprzedmiot,przedmiot,idnauczyciel) VALUES
('1','Matematyka','2'),
('2','Polski','3'),
('3','Angielski','4'),
('4','Niemiecki','1'),
('5','Historia','6'),
('6','Religia','5');




INSERT INTO klasa (idklasa,klasa) VALUES
('1','1Ti'),
('2','2Ti'),
('3','3Ti'),
('4','4Ti'),
('5','1Ts'),
('6','2Ts'),
('7','3Ti'),
('8','4Ti');

insert into uczeń (iduczeń,imie,nazwisko,idklasa) VALUES
('1','Kamil','Buszman','4'),
('2','Jan','Rekowski','4'),
('3','Irek','Kechup','4'),
('4','Kuba','Long','4'),
('5','Jakub','Short','1'),
('6','Karol','Blizniak','1'),
('7','Bartek','Bielaszewski','1'),
('8','Ewa','Kiniewicz','1'),
('9','Wiktoria','Wałęsa','2'),
('10','Weronika','Kuczkowska','2'),
('11','Martyna','Lipa','3'),
('12','Ewelina','Szklanka','3'),
('13','Mateusz','Piechowski','5'),
('14','Marcin','Tryba','5'),
('15','Marek','Paszylk','6'),
('16','Adam','Zdrojewski','6'),
('17','Jakub','Gostomczyk','7'),
('18','Grzegorz','Jaworski','7'),
('19','Damian','Pendrak','8');


insert into uzytkownicy(id,login,haslo) VALUES
('1','Kamil','Buszman'),
('2','Jan','Rekowski'),
('3','Irek','Kechup'),
('4','Kuba','Long'),
('5','Jakub','Short'),
('6','Karol','Blizniak'),
('7','Bartek','Bielaszewski'),
('8','Ewa','Kiniewicz'),
('9','Wiktoria','Wałęsa'),
('10','Weronika','Kuczkowska'),
('11','Martyna','Lipa'),
('12','Ewelina','Szklanka'),
('13','Mateusz','Piechowski'),
('14','Marcin','Tryba'),
('15','Marek','Paszylk'),
('16','Adam','Zdrojewski'),
('17','Jakub','Gostomczyk'),
('18','Grzegorz','Jaworski'),
('19','Damian','Pendrak');


insert into klasa_przedmiot (idklasa, idprzedmiot) VALUES
('1','1'),('1','2'),('1','3'),('1','4'),('1','5'),('1','6'),
('2','1'),('2','2'),('2','3'),('2','4'),('2','5'),('2','6'),
('3','1'),('3','2'),('3','3'),('3','4'),('3','5'),('3','6'),
('4','1'),('4','2'),('4','3'),('4','4'),('4','5'),('4','6'),
('5','1'),('5','2'),('5','3'),('5','4'),('5','5'),('5','6'),
('6','1'),('6','2'),('6','3'),('6','4'),('6','5'),('6','6'),
('7','1'),('7','2'),('7','3'),('7','4'),('7','5'),('7','6'),
('8','1'),('8','2'),('8','3'),('8','4'),('8','5'),('8','6');




insert into nauczyciel_klasa (idnauczyciel,idklasa) VALUES
('1','1'),('1','2'),('1','3'),('1','4'),('1','5'),('1','6'),
('2','1'),('2','2'),('2','3'),('2','4'),('2','5'),('2','6'),
('3','1'),('3','2'),('3','3'),('3','4'),('3','5'),('3','6'),
('4','1'),('4','2'),('4','3'),('4','4'),('4','5'),('4','6'),
('5','1'),('5','2'),('5','3'),('5','4'),('5','5'),('5','6'),
('6','1'),('6','2'),('6','3'),('6','4'),('6','5'),('6','6');






