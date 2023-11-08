-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 07, 2023 alle 17:08
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `piscine_comunali`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `accessi_singoli`
--

CREATE TABLE `accessi_singoli` (
  `id_accesso_singolo` int(11) NOT NULL,
  `id_piscina` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi`
--

CREATE TABLE `corsi` (
  `id_corso` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_istruttore`
--

CREATE TABLE `corsi_istruttore` (
  `id_corso_istruttore` int(11) NOT NULL,
  `id_corso` int(11) DEFAULT NULL,
  `id_istruttore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `giorni`
--

CREATE TABLE `giorni` (
  `id_giorno` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `giorni_piscine_corsi_mesi`
--

CREATE TABLE `giorni_piscine_corsi_mesi` (
  `id_giorno_piscina_corso_mese` int(11) NOT NULL,
  `id_mese` int(11) DEFAULT NULL,
  `id_giorno` int(11) DEFAULT NULL,
  `id_piscina_corso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `iscritti`
--

CREATE TABLE `iscritti` (
  `id_iscritto` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `medico` varchar(255) DEFAULT NULL,
  `data_certificato` date DEFAULT NULL,
  `data_nascita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `iscritti_corsi`
--

CREATE TABLE `iscritti_corsi` (
  `id_iscritto_corso` int(11) NOT NULL,
  `id_iscritto` int(11) DEFAULT NULL,
  `id_piscina_corso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `istruttori`
--

CREATE TABLE `istruttori` (
  `id_istruttore` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cell` varchar(255) DEFAULT NULL,
  `cf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `istruttori_qualifiche`
--

CREATE TABLE `istruttori_qualifiche` (
  `id_istruttore_qualifica` int(11) NOT NULL,
  `id_istruttore` int(11) DEFAULT NULL,
  `id_qualifica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `mesi`
--

CREATE TABLE `mesi` (
  `id_mese` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `persone`
--

CREATE TABLE `persone` (
  `id_persona` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cf` varchar(255) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `piscine`
--

CREATE TABLE `piscine` (
  `id_piscina` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `responsabile` varchar(255) DEFAULT NULL,
  `vasca_aperto` tinyint(1) DEFAULT NULL,
  `data_apertura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `piscine_corsi`
--

CREATE TABLE `piscine_corsi` (
  `id_piscina_corso` int(11) NOT NULL,
  `id_corso_istruttore` int(11) DEFAULT NULL,
  `id_piscina` int(11) DEFAULT NULL,
  `prezzo` float DEFAULT NULL,
  `num_max` int(11) DEFAULT NULL,
  `num_min` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `qualifiche`
--

CREATE TABLE `qualifiche` (
  `id_qualifica` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `accessi_singoli`
--
ALTER TABLE `accessi_singoli`
  ADD PRIMARY KEY (`id_accesso_singolo`),
  ADD KEY `id_piscina` (`id_piscina`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`id_corso`);

--
-- Indici per le tabelle `corsi_istruttore`
--
ALTER TABLE `corsi_istruttore`
  ADD PRIMARY KEY (`id_corso_istruttore`),
  ADD KEY `id_corso` (`id_corso`),
  ADD KEY `id_istruttore` (`id_istruttore`);

--
-- Indici per le tabelle `giorni`
--
ALTER TABLE `giorni`
  ADD PRIMARY KEY (`id_giorno`);

--
-- Indici per le tabelle `giorni_piscine_corsi_mesi`
--
ALTER TABLE `giorni_piscine_corsi_mesi`
  ADD PRIMARY KEY (`id_giorno_piscina_corso_mese`),
  ADD KEY `id_mese` (`id_mese`),
  ADD KEY `id_giorno` (`id_giorno`),
  ADD KEY `id_piscina_corso` (`id_piscina_corso`);

--
-- Indici per le tabelle `iscritti`
--
ALTER TABLE `iscritti`
  ADD PRIMARY KEY (`id_iscritto`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indici per le tabelle `iscritti_corsi`
--
ALTER TABLE `iscritti_corsi`
  ADD PRIMARY KEY (`id_iscritto_corso`),
  ADD KEY `id_iscritto` (`id_iscritto`),
  ADD KEY `id_piscina_corso` (`id_piscina_corso`);

--
-- Indici per le tabelle `istruttori`
--
ALTER TABLE `istruttori`
  ADD PRIMARY KEY (`id_istruttore`);

--
-- Indici per le tabelle `istruttori_qualifiche`
--
ALTER TABLE `istruttori_qualifiche`
  ADD PRIMARY KEY (`id_istruttore_qualifica`),
  ADD KEY `id_istruttore` (`id_istruttore`),
  ADD KEY `id_qualifica` (`id_qualifica`);

--
-- Indici per le tabelle `mesi`
--
ALTER TABLE `mesi`
  ADD PRIMARY KEY (`id_mese`);

--
-- Indici per le tabelle `persone`
--
ALTER TABLE `persone`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indici per le tabelle `piscine`
--
ALTER TABLE `piscine`
  ADD PRIMARY KEY (`id_piscina`);

--
-- Indici per le tabelle `piscine_corsi`
--
ALTER TABLE `piscine_corsi`
  ADD PRIMARY KEY (`id_piscina_corso`),
  ADD KEY `id_piscina` (`id_piscina`),
  ADD KEY `id_corso_istruttore` (`id_corso_istruttore`);

--
-- Indici per le tabelle `qualifiche`
--
ALTER TABLE `qualifiche`
  ADD PRIMARY KEY (`id_qualifica`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `accessi_singoli`
--
ALTER TABLE `accessi_singoli`
  MODIFY `id_accesso_singolo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `corsi`
--
ALTER TABLE `corsi`
  MODIFY `id_corso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `corsi_istruttore`
--
ALTER TABLE `corsi_istruttore`
  MODIFY `id_corso_istruttore` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `giorni`
--
ALTER TABLE `giorni`
  MODIFY `id_giorno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `giorni_piscine_corsi_mesi`
--
ALTER TABLE `giorni_piscine_corsi_mesi`
  MODIFY `id_giorno_piscina_corso_mese` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `iscritti`
--
ALTER TABLE `iscritti`
  MODIFY `id_iscritto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `iscritti_corsi`
--
ALTER TABLE `iscritti_corsi`
  MODIFY `id_iscritto_corso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `istruttori`
--
ALTER TABLE `istruttori`
  MODIFY `id_istruttore` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `istruttori_qualifiche`
--
ALTER TABLE `istruttori_qualifiche`
  MODIFY `id_istruttore_qualifica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `mesi`
--
ALTER TABLE `mesi`
  MODIFY `id_mese` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `persone`
--
ALTER TABLE `persone`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `piscine`
--
ALTER TABLE `piscine`
  MODIFY `id_piscina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `piscine_corsi`
--
ALTER TABLE `piscine_corsi`
  MODIFY `id_piscina_corso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `qualifiche`
--
ALTER TABLE `qualifiche`
  MODIFY `id_qualifica` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `accessi_singoli`
--
ALTER TABLE `accessi_singoli`
  ADD CONSTRAINT `accessi_singoli_ibfk_1` FOREIGN KEY (`id_piscina`) REFERENCES `piscine` (`id_piscina`),
  ADD CONSTRAINT `accessi_singoli_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persone` (`id_persona`);

--
-- Limiti per la tabella `corsi_istruttore`
--
ALTER TABLE `corsi_istruttore`
  ADD CONSTRAINT `corsi_istruttore_ibfk_1` FOREIGN KEY (`id_corso`) REFERENCES `corsi` (`id_corso`),
  ADD CONSTRAINT `corsi_istruttore_ibfk_2` FOREIGN KEY (`id_istruttore`) REFERENCES `istruttori` (`id_istruttore`);

--
-- Limiti per la tabella `giorni_piscine_corsi_mesi`
--
ALTER TABLE `giorni_piscine_corsi_mesi`
  ADD CONSTRAINT `giorni_piscine_corsi_mesi_ibfk_1` FOREIGN KEY (`id_mese`) REFERENCES `mesi` (`id_mese`),
  ADD CONSTRAINT `giorni_piscine_corsi_mesi_ibfk_2` FOREIGN KEY (`id_giorno`) REFERENCES `giorni` (`id_giorno`),
  ADD CONSTRAINT `giorni_piscine_corsi_mesi_ibfk_3` FOREIGN KEY (`id_piscina_corso`) REFERENCES `piscine_corsi` (`id_piscina_corso`);

--
-- Limiti per la tabella `iscritti`
--
ALTER TABLE `iscritti`
  ADD CONSTRAINT `iscritti_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persone` (`id_persona`);

--
-- Limiti per la tabella `iscritti_corsi`
--
ALTER TABLE `iscritti_corsi`
  ADD CONSTRAINT `iscritti_corsi_ibfk_1` FOREIGN KEY (`id_iscritto`) REFERENCES `iscritti` (`id_iscritto`),
  ADD CONSTRAINT `iscritti_corsi_ibfk_2` FOREIGN KEY (`id_piscina_corso`) REFERENCES `piscine_corsi` (`id_piscina_corso`);

--
-- Limiti per la tabella `istruttori_qualifiche`
--
ALTER TABLE `istruttori_qualifiche`
  ADD CONSTRAINT `istruttori_qualifiche_ibfk_1` FOREIGN KEY (`id_istruttore`) REFERENCES `istruttori` (`id_istruttore`),
  ADD CONSTRAINT `istruttori_qualifiche_ibfk_2` FOREIGN KEY (`id_qualifica`) REFERENCES `qualifiche` (`id_qualifica`);

--
-- Limiti per la tabella `piscine_corsi`
--
ALTER TABLE `piscine_corsi`
  ADD CONSTRAINT `piscine_corsi_ibfk_1` FOREIGN KEY (`id_piscina`) REFERENCES `piscine` (`id_piscina`),
  ADD CONSTRAINT `piscine_corsi_ibfk_2` FOREIGN KEY (`id_corso_istruttore`) REFERENCES `corsi_istruttore` (`id_corso_istruttore`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
