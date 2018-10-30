-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 30 Paź 2018, 08:20
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
-- Struktura tabeli dla tabeli `tematy`
--

CREATE TABLE `tematy` (
  `idtematy` int(11) NOT NULL,
  `temat` varchar(120) DEFAULT NULL,
  `idklasa` int(11) DEFAULT NULL,
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
-- Indexes for table `tematy`
--
ALTER TABLE `tematy`
  ADD PRIMARY KEY (`idtematy`),
  ADD KEY `idklasa` (`idklasa`),
  ADD KEY `idnauczyciel` (`idnauczyciel`);

--
-- Indexes for table `uczeń`
--
ALTER TABLE `uczeń`
  ADD PRIMARY KEY (`iduczeń`),
  ADD KEY `idklasa` (`idklasa`);

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
-- AUTO_INCREMENT dla tabeli `tematy`
--
ALTER TABLE `tematy`
  MODIFY `idtematy` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `uczeń`
--
ALTER TABLE `uczeń`
  MODIFY `iduczeń` int(11) NOT NULL AUTO_INCREMENT;
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
-- Ograniczenia dla tabeli `tematy`
--
ALTER TABLE `tematy`
  ADD CONSTRAINT `tematy_ibfk_1` FOREIGN KEY (`idklasa`) REFERENCES `klasa` (`idklasa`),
  ADD CONSTRAINT `tematy_ibfk_2` FOREIGN KEY (`idnauczyciel`) REFERENCES `nauczyciel` (`idnauczyciel`);

--
-- Ograniczenia dla tabeli `uczeń`
--
ALTER TABLE `uczeń`
  ADD CONSTRAINT `uczeń_ibfk_1` FOREIGN KEY (`idklasa`) REFERENCES `klasa` (`idklasa`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
