-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10 Dec 2015 la 13:45
-- Versiune server: 5.6.10
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DACX`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `adeverinte`
--

CREATE TABLE `adeverinte` (
  `id_adeverinta` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL,
  `tip_adeverinta` varchar(50) DEFAULT NULL,
  `detalii_adeverinta` varchar(1000) DEFAULT NULL,
  `data_cerere` date DEFAULT NULL,
  `observatii` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `document` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `cheltuieli`
--

CREATE TABLE `cheltuieli` (
  `id_cheltuiala` int(11) NOT NULL,
  `deconturi_id_decont` int(11) NOT NULL,
  `cheltuiala` varchar(50) DEFAULT NULL,
  `valoare_unitara` double DEFAULT NULL,
  `moneda` varchar(4) DEFAULT NULL,
  `cantitate` double DEFAULT NULL,
  `total` varchar(20) DEFAULT NULL,
  `total_ron` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `concedii`
--

CREATE TABLE `concedii` (
  `id_concediu` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL,
  `tip_concediu` varchar(50) DEFAULT NULL,
  `data_inceput` date DEFAULT NULL,
  `data_sfarsit` date DEFAULT NULL,
  `nr_zile` int(11) DEFAULT NULL,
  `data_cerere` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `deconturi`
--

CREATE TABLE `deconturi` (
  `id_decont` int(11) NOT NULL,
  `users_id_user` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `destinatie` varchar(200) DEFAULT NULL,
  `data_inceput` date DEFAULT NULL,
  `data_sfarsit` date DEFAULT NULL,
  `data_necesar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `Mesaje`
--

CREATE TABLE `Mesaje` (
  `id_mesaj` int(11) NOT NULL,
  `mesaj` varchar(1000) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `Sarbatori_legale`
--

CREATE TABLE `Sarbatori_legale` (
  `id_sarbatoare` int(11) NOT NULL,
  `denumire` varchar(1000) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nume` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adeverinte`
--
ALTER TABLE `adeverinte`
  ADD PRIMARY KEY (`id_adeverinta`),
  ADD KEY `fk_adeverinte_users1_idx` (`users_id_user`);

--
-- Indexes for table `cheltuieli`
--
ALTER TABLE `cheltuieli`
  ADD PRIMARY KEY (`id_cheltuiala`),
  ADD KEY `fk_cheltuieli_deconturi1_idx` (`deconturi_id_decont`);

--
-- Indexes for table `concedii`
--
ALTER TABLE `concedii`
  ADD PRIMARY KEY (`id_concediu`),
  ADD KEY `fk_concedii_users_idx` (`users_id_user`);

--
-- Indexes for table `deconturi`
--
ALTER TABLE `deconturi`
  ADD PRIMARY KEY (`id_decont`),
  ADD KEY `fk_deconturi_users1_idx` (`users_id_user`);

--
-- Indexes for table `Mesaje`
--
ALTER TABLE `Mesaje`
  ADD PRIMARY KEY (`id_mesaj`);

--
-- Indexes for table `Sarbatori_legale`
--
ALTER TABLE `Sarbatori_legale`
  ADD PRIMARY KEY (`id_sarbatoare`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adeverinte`
--
ALTER TABLE `adeverinte`
  MODIFY `id_adeverinta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cheltuieli`
--
ALTER TABLE `cheltuieli`
  MODIFY `id_cheltuiala` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `concedii`
--
ALTER TABLE `concedii`
  MODIFY `id_concediu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deconturi`
--
ALTER TABLE `deconturi`
  MODIFY `id_decont` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Mesaje`
--
ALTER TABLE `Mesaje`
  MODIFY `id_mesaj` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Sarbatori_legale`
--
ALTER TABLE `Sarbatori_legale`
  MODIFY `id_sarbatoare` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restrictii pentru tabele sterse
--

--
-- Restrictii pentru tabele `adeverinte`
--
ALTER TABLE `adeverinte`
  ADD CONSTRAINT `fk_adeverinte_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrictii pentru tabele `cheltuieli`
--
ALTER TABLE `cheltuieli`
  ADD CONSTRAINT `fk_cheltuieli_deconturi1` FOREIGN KEY (`deconturi_id_decont`) REFERENCES `deconturi` (`id_decont`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrictii pentru tabele `concedii`
--
ALTER TABLE `concedii`
  ADD CONSTRAINT `fk_concedii_users` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrictii pentru tabele `deconturi`
--
ALTER TABLE `deconturi`
  ADD CONSTRAINT `fk_deconturi_users1` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
