-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 11, 2018 at 09:07 p.m.
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbfarms`
--

-- --------------------------------------------------------

--
-- Table structure for table `farm`
--

CREATE TABLE `farm` (
  `id_farm` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_farmer_rag` int(11) NOT NULL,
  `address` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `id_farmer` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(48) NOT NULL,
  `email` varchar(48) NOT NULL,
  `id_hash` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_rag`
--

CREATE TABLE `farmer_rag` (
  `id_farmer_rag` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_rag` int(10) NOT NULL,
  `id_farmer` int(10) NOT NULL,
  `date_acquisition` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `graficcard`
--

CREATE TABLE `graficcard` (
  `grafic_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `model` varchar(256) NOT NULL,
  `serial` varchar(256) NOT NULL,
  `id_model` int(10) NOT NULL,
  `date_add` date NOT NULL,
  `size` varchar(5) NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'stock',
  `type` varchar(14) NOT NULL DEFAULT 'targetagrafica'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id_inventory` varchar(32) NOT NULL,
  `cuantity` int(10) NOT NULL,
  `model` varchar(32) NOT NULL,
  `in_use` int(10) NOT NULL,
  `in_stock` int(10) NOT NULL,
  `damage` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `microprosesor`
--

CREATE TABLE `microprosesor` (
  `micro_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `model` varchar(256) NOT NULL,
  `serial` varchar(256) NOT NULL,
  `model_id` int(10) NOT NULL,
  `cores` int(3) NOT NULL,
  `speed` varchar(5) NOT NULL,
  `date_add` date NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'stock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `model_list`
--

CREATE TABLE `model_list` (
  `model_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `type` varchar(255) NOT NULL,
  `manofacturer` varchar(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `motherboard`
--

CREATE TABLE `motherboard` (
  `board_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `model` varchar(256) NOT NULL,
  `model_id` int(10) NOT NULL,
  `serial` varchar(256) NOT NULL,
  `date_add` date NOT NULL,
  `psi_ports` int(5) NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'stock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pciricer`
--

CREATE TABLE `pciricer` (
  `riser_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `model` varchar(256) NOT NULL,
  `serial` varchar(256) NOT NULL,
  `id_model` int(10) NOT NULL,
  `date_add` date NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'stock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `powersupply`
--

CREATE TABLE `powersupply` (
  `supply_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `model` varchar(256) NOT NULL,
  `serial` varchar(256) NOT NULL,
  `model_id` int(10) NOT NULL,
  `watts` varchar(10) NOT NULL,
  `date_add` date NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'stock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rag`
--

CREATE TABLE `rag` (
  `id_rag` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_motherb` int(10) NOT NULL,
  `id_ram` int(10) NOT NULL,
  `id_supply` int(10) NOT NULL,
  `id_riser` int(10) NOT NULL,
  `id_ssd` int(10) NOT NULL,
  `id_graficcard` int(10) NOT NULL,
  `date_add` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rag_amount_product`
--

CREATE TABLE `rag_amount_product` (
  `id_rag_amount_product` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_rag` int(10) NOT NULL,
  `id_part` int(10) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rag_mining`
--

CREATE TABLE `rag_mining` (
  `id_rag_mining` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_farmer_rag` int(10) NOT NULL,
  `coin_mining` int(10) NOT NULL,
  `date_start` date NOT NULL,
  `algorithm` varchar(200) NOT NULL,
  `date_finish` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `ram_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `model` varchar(256) NOT NULL,
  `size` varchar(5) NOT NULL,
  `serial` varchar(256) NOT NULL,
  `date_add` date NOT NULL,
  `model_id` int(10) NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'stock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `id_shipment` int(10) UNSIGNED ZEROFILL NOT NULL,
  `date_send` date NOT NULL,
  `date-request` date NOT NULL,
  `list_shipment` text NOT NULL,
  `id_farmer` int(10) NOT NULL,
  `id_farm` int(10) NOT NULL,
  `aproved_by` varchar(48) NOT NULL,
  `amount_parts` int(10) NOT NULL,
  `aprove` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ssd`
--

CREATE TABLE `ssd` (
  `ssd_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `model` varchar(256) NOT NULL,
  `size` varchar(5) NOT NULL,
  `serial` varchar(256) NOT NULL,
  `date_add` date NOT NULL,
  `model_id` int(10) NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'stock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `farm`
--
ALTER TABLE `farm`
  ADD PRIMARY KEY (`id_farm`),
  ADD KEY `id_farmer_rag` (`id_farmer_rag`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`id_farmer`);

--
-- Indexes for table `farmer_rag`
--
ALTER TABLE `farmer_rag`
  ADD PRIMARY KEY (`id_farmer_rag`),
  ADD KEY `id_rag` (`id_rag`),
  ADD KEY `id_farmer` (`id_farmer`);

--
-- Indexes for table `graficcard`
--
ALTER TABLE `graficcard`
  ADD PRIMARY KEY (`grafic_id`),
  ADD KEY `id_model` (`id_model`),
  ADD KEY `id_model_2` (`id_model`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id_inventory`);

--
-- Indexes for table `microprosesor`
--
ALTER TABLE `microprosesor`
  ADD PRIMARY KEY (`micro_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `model_list`
--
ALTER TABLE `model_list`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`board_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `pciricer`
--
ALTER TABLE `pciricer`
  ADD PRIMARY KEY (`riser_id`),
  ADD KEY `id_model` (`id_model`);

--
-- Indexes for table `powersupply`
--
ALTER TABLE `powersupply`
  ADD PRIMARY KEY (`supply_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `rag`
--
ALTER TABLE `rag`
  ADD PRIMARY KEY (`id_rag`),
  ADD KEY `id_motherb` (`id_motherb`),
  ADD KEY `id_ram` (`id_ram`),
  ADD KEY `id_supply` (`id_supply`),
  ADD KEY `id_riser` (`id_riser`),
  ADD KEY `id_ssd` (`id_ssd`),
  ADD KEY `id_graficcard` (`id_graficcard`);

--
-- Indexes for table `rag_amount_product`
--
ALTER TABLE `rag_amount_product`
  ADD PRIMARY KEY (`id_rag_amount_product`),
  ADD KEY `id_rag` (`id_rag`),
  ADD KEY `id_part` (`id_part`);

--
-- Indexes for table `rag_mining`
--
ALTER TABLE `rag_mining`
  ADD PRIMARY KEY (`id_rag_mining`),
  ADD KEY `id_farmer_rag` (`id_farmer_rag`),
  ADD KEY `coin_mining` (`coin_mining`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ram_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`id_shipment`),
  ADD KEY `id_farmer` (`id_farmer`),
  ADD KEY `id_farm` (`id_farm`);

--
-- Indexes for table `ssd`
--
ALTER TABLE `ssd`
  ADD PRIMARY KEY (`ssd_id`),
  ADD KEY `model_id` (`model_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `farm`
--
ALTER TABLE `farm`
  MODIFY `id_farm` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
  MODIFY `id_farmer` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `farmer_rag`
--
ALTER TABLE `farmer_rag`
  MODIFY `id_farmer_rag` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `graficcard`
--
ALTER TABLE `graficcard`
  MODIFY `grafic_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `microprosesor`
--
ALTER TABLE `microprosesor`
  MODIFY `micro_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `model_list`
--
ALTER TABLE `model_list`
  MODIFY `model_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `board_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `pciricer`
--
ALTER TABLE `pciricer`
  MODIFY `riser_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `powersupply`
--
ALTER TABLE `powersupply`
  MODIFY `supply_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rag`
--
ALTER TABLE `rag`
  MODIFY `id_rag` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rag_amount_product`
--
ALTER TABLE `rag_amount_product`
  MODIFY `id_rag_amount_product` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rag_mining`
--
ALTER TABLE `rag_mining`
  MODIFY `id_rag_mining` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ram`
--
ALTER TABLE `ram`
  MODIFY `ram_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shipment`
--
ALTER TABLE `shipment`
  MODIFY `id_shipment` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ssd`
--
ALTER TABLE `ssd`
  MODIFY `ssd_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
