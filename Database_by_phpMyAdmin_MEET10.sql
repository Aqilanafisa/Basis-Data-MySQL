-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2026 at 09:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pertemuan10`
--
CREATE DATABASE IF NOT EXISTS `pertemuan10` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pertemuan10`;

-- --------------------------------------------------------

--
-- Table structure for table `tabel_ambil_mk`
--
-- Creation: May 06, 2026 at 03:28 AM
--

DROP TABLE IF EXISTS `tabel_ambil_mk`;
CREATE TABLE IF NOT EXISTS `tabel_ambil_mk` (
  `nim` int(3) NOT NULL,
  `kd_mk` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `tabel_ambil_mk`:
--

--
-- Truncate table before insert `tabel_ambil_mk`
--

TRUNCATE TABLE `tabel_ambil_mk`;
--
-- Dumping data for table `tabel_ambil_mk`
--

INSERT DELAYED IGNORE INTO `tabel_ambil_mk` (`nim`, `kd_mk`) VALUES
(101, 'PTI447'),
(103, 'TIK333'),
(104, 'PTI333'),
(104, 'PTI777'),
(105, 'PTI123'),
(107, 'PTI777');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_dosen`
--
-- Creation: May 06, 2026 at 03:27 AM
--

DROP TABLE IF EXISTS `tabel_dosen`;
CREATE TABLE IF NOT EXISTS `tabel_dosen` (
  `kode_dos` int(2) NOT NULL,
  `nama_dos` varchar(25) NOT NULL,
  `alamat_dos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `tabel_dosen`:
--

--
-- Truncate table before insert `tabel_dosen`
--

TRUNCATE TABLE `tabel_dosen`;
--
-- Dumping data for table `tabel_dosen`
--

INSERT DELAYED IGNORE INTO `tabel_dosen` (`kode_dos`, `nama_dos`, `alamat_dos`) VALUES
(10, 'Suharto', 'Jl. Jombang'),
(11, 'Martono', 'Jl. Kalpataru'),
(12, 'Rahmawati', 'Jl. Jakarta'),
(13, 'Bambang', 'Jl. Bandung'),
(14, 'Nurul', 'Jl. Raya Tidar');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_jurusan`
--
-- Creation: May 06, 2026 at 03:25 AM
--

DROP TABLE IF EXISTS `tabel_jurusan`;
CREATE TABLE IF NOT EXISTS `tabel_jurusan` (
  `kode_jur` varchar(2) NOT NULL,
  `nama_jur` varchar(15) NOT NULL,
  `kode_dos` int(2) NOT NULL,
  PRIMARY KEY (`kode_jur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `tabel_jurusan`:
--

--
-- Truncate table before insert `tabel_jurusan`
--

TRUNCATE TABLE `tabel_jurusan`;
--
-- Dumping data for table `tabel_jurusan`
--

INSERT DELAYED IGNORE INTO `tabel_jurusan` (`kode_jur`, `nama_jur`, `kode_dos`) VALUES
('TE', 'Teknik Elektro', 10),
('TM', 'Teknik Mesin', 12),
('TS', 'Teknik Sipil ', 23);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_mahasiswa`
--
-- Creation: May 06, 2026 at 03:02 AM
--

DROP TABLE IF EXISTS `tabel_mahasiswa`;
CREATE TABLE IF NOT EXISTS `tabel_mahasiswa` (
  `nim` int(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `tabel_mahasiswa`:
--

--
-- Truncate table before insert `tabel_mahasiswa`
--

TRUNCATE TABLE `tabel_mahasiswa`;
--
-- Dumping data for table `tabel_mahasiswa`
--

INSERT DELAYED IGNORE INTO `tabel_mahasiswa` (`nim`, `nama`, `jenis_kelamin`, `alamat`) VALUES
(101, 'Arif', 'L', 'Jl. Kenangan'),
(102, 'Budi', 'L', 'Jl. Jombang'),
(103, 'Wati', 'P', 'Jl. Surabaya'),
(104, 'Ika', 'P', 'Jl. Jombang'),
(105, 'Tono', 'L', 'Jl. Jakarta'),
(106, 'Iwan', 'L', 'JL. Bandung'),
(107, 'Sari', 'P', 'Jl. Malang');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_matakuliah`
--
-- Creation: May 06, 2026 at 03:30 AM
--

DROP TABLE IF EXISTS `tabel_matakuliah`;
CREATE TABLE IF NOT EXISTS `tabel_matakuliah` (
  `kd_mk` varchar(6) NOT NULL,
  `nama_mk` varchar(25) NOT NULL,
  `sks` int(2) NOT NULL,
  `semester` int(2) NOT NULL,
  `kode_dos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `tabel_matakuliah`:
--

--
-- Truncate table before insert `tabel_matakuliah`
--

TRUNCATE TABLE `tabel_matakuliah`;
--
-- Dumping data for table `tabel_matakuliah`
--

INSERT DELAYED IGNORE INTO `tabel_matakuliah` (`kd_mk`, `nama_mk`, `sks`, `semester`, `kode_dos`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, 12),
('PTI333', 'Basis Data Terdistribusi', 3, 5, 10),
('PTI447', 'Praktikum Basis Data', 1, 3, 11),
('PTI777', 'Sistem Informasi', 2, 3, 99),
('TIK123', 'Jaringan Komputer', 2, 5, 33),
('TIK333', 'Sistem Operasi', 3, 5, 10),
('TIK342', 'Praktikum Basis Data', 1, 3, 13);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table tabel_ambil_mk
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
-- Metadata for table tabel_dosen
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
-- Metadata for table tabel_jurusan
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
-- Metadata for table tabel_mahasiswa
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
-- Metadata for table tabel_matakuliah
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
-- Metadata for database pertemuan10
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

TRUNCATE TABLE `pma__central_columns`;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
