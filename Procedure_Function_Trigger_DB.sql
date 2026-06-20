-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2026 at 08:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universitas_tidar`
--
CREATE DATABASE IF NOT EXISTS `universitas_tidar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `universitas_tidar`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `view_mhs_simple`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_mhs_simple` ()   BEGIN
	SELECT NPM, nama, no_hp
    FROM mahasiswa;
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `tambah`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `tambah` (`angka1` INT, `angka2` INT) RETURNS INT(11)  BEGIN
	RETURN angka1 + angka2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--
-- Creation: Jun 18, 2026 at 10:04 PM
-- Last update: Jun 20, 2026 at 01:42 PM
--

DROP TABLE IF EXISTS `barang`;
CREATE TABLE IF NOT EXISTS `barang` (
  `id_brg` char(5) NOT NULL,
  `nama_brg` varchar(30) NOT NULL,
  `stok` int(11) NOT NULL,
  PRIMARY KEY (`id_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `barang`:
--

--
-- Truncate table before insert `barang`
--

TRUNCATE TABLE `barang`;
--
-- Dumping data for table `barang`
--

INSERT DELAYED IGNORE INTO `barang` (`id_brg`, `nama_brg`, `stok`) VALUES
('A11', 'Keyboard', 25),
('A12', 'DVD R-W', 10),
('A13', 'Modem', 6);

--
-- Triggers `barang`
--
DROP TRIGGER IF EXISTS `auditBarang`;
DELIMITER $$
CREATE TRIGGER `auditBarang` BEFORE INSERT ON `barang` FOR EACH ROW BEGIN

    IF NOT EXISTS (
        SELECT id_brg
        FROM barang
        WHERE id_brg = NEW.id_brg
    ) THEN

        SET NEW.nama_brg = NEW.nama_brg;
        SET NEW.stok = NEW.stok;

    ELSE

        SET @status = CONCAT('Id ', NEW.id_brg, ' sudah ada');

    END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteChild`;
DELIMITER $$
CREATE TRIGGER `deleteChild` BEFORE DELETE ON `barang` FOR EACH ROW BEGIN
    DELETE FROM pembelian
    WHERE id_brg = OLD.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--
-- Creation: Jun 18, 2026 at 05:44 PM
-- Last update: Jun 18, 2026 at 05:55 PM
--

DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `NPM` char(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `id_kelurahan` int(5) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `no_hp` char(15) NOT NULL,
  `kode_prodi` int(11) DEFAULT NULL,
  PRIMARY KEY (`NPM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `mahasiswa`:
--

--
-- Truncate table before insert `mahasiswa`
--

TRUNCATE TABLE `mahasiswa`;
--
-- Dumping data for table `mahasiswa`
--

INSERT DELAYED IGNORE INTO `mahasiswa` (`NPM`, `nama`, `alamat`, `id_kelurahan`, `jenis_kelamin`, `no_hp`, `kode_prodi`) VALUES
('12345', 'Imam Adi Nata', 'Kajen', 1, 'L', '081215529989', 1),
('12346', 'Budi Sugandhi', 'Bekasi', 109, 'L', ' 085643433321', 2),
('12347', 'Toha Sitohang', 'Medan', 103, 'L', '08989787876', 2),
('12348', 'Megawati', 'Condong Catur', 107, 'P', '0839303058', 1),
('12349', 'PRABOWO SUBIYANTO', 'JKT', 107, 'L', '08132809811', NULL),
('12780', 'Anis Baswedan', 'Jakarta', 234, 'L', '09898877663', NULL),
('12786', 'GANJAR PRANOWO', 'JAWA TENGAH', 123, 'L', '087656356622', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--
-- Creation: Jun 18, 2026 at 10:24 PM
-- Last update: Jun 20, 2026 at 01:42 PM
--

DROP TABLE IF EXISTS `pembelian`;
CREATE TABLE IF NOT EXISTS `pembelian` (
  `id_pem` int(10) NOT NULL,
  `id_brg` char(5) NOT NULL,
  `jml_beli` int(11) NOT NULL,
  PRIMARY KEY (`id_pem`),
  KEY `id_brg` (`id_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `pembelian`:
--   `id_brg`
--       `barang` -> `id_brg`
--

--
-- Truncate table before insert `pembelian`
--

TRUNCATE TABLE `pembelian`;
--
-- Dumping data for table `pembelian`
--

INSERT DELAYED IGNORE INTO `pembelian` (`id_pem`, `id_brg`, `jml_beli`) VALUES
(2, 'A11', 10);

--
-- Triggers `pembelian`
--
DROP TRIGGER IF EXISTS `updateStokEdit`;
DELIMITER $$
CREATE TRIGGER `updateStokEdit` AFTER UPDATE ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + (NEW.jml_beli - OLD.jml_beli)
WHERE id_brg = NEW.id_brg
$$
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_brg`) REFERENCES `barang` (`id_brg`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table barang
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for table mahasiswa
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for table pembelian
--

--
-- Truncate table before insert `pma__column_info`
--

TRUNCATE TABLE `pma__column_info`;
--
-- Truncate table before insert `pma__table_uiprefs`
--

TRUNCATE TABLE `pma__table_uiprefs`;
--
-- Truncate table before insert `pma__tracking`
--

TRUNCATE TABLE `pma__tracking`;
--
-- Metadata for database universitas_tidar
--

--
-- Truncate table before insert `pma__bookmark`
--

TRUNCATE TABLE `pma__bookmark`;
--
-- Truncate table before insert `pma__relation`
--

TRUNCATE TABLE `pma__relation`;
--
-- Truncate table before insert `pma__savedsearches`
--

TRUNCATE TABLE `pma__savedsearches`;
--
-- Truncate table before insert `pma__central_columns`
--

TRUNCATE TABLE `pma__central_columns`;SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
