-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2022 at 09:54 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` varchar(10) CHARACTER SET latin1 NOT NULL,
  `USERNAME` varchar(38) CHARACTER SET latin1 NOT NULL,
  `PASSWORD` mediumtext CHARACTER SET latin1 NOT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `ROLE` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `FULLNAME` varchar(58) CHARACTER SET latin1 DEFAULT NULL,
  `JENKEL` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `NO_TELP` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `ALAMAT` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `PHOTO` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `DTE_CREATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_ADMIN`, `USERNAME`, `PASSWORD`, `LAST_LOGIN`, `ROLE`, `FULLNAME`, `JENKEL`, `NO_TELP`, `ALAMAT`, `PHOTO`, `DTE_CREATED`) VALUES
('AD001', 'admin', '21232f297a57a5a743894a0e4a801fc3', '0000-00-00 00:00:00', 'superadmin', 'Badhrul Salman', NULL, NULL, NULL, 'default.png', '2022-07-04'),
('AD002', 'gibran', 'e77d7674b9048d96055a1b72c7152f13', '0000-00-00 00:00:00', 'admin', 'Gibran', NULL, NULL, NULL, 'default.png', '2022-07-04'),
('AD003', 'ihza', 'fff90be3dfcf4f0cacbede34de895de9', '0000-00-00 00:00:00', 'admin', 'Ihza Muhammad', NULL, NULL, NULL, 'default.png', '2022-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_ANGGOTA` varchar(10) CHARACTER SET latin1 NOT NULL,
  `ID_ADMIN` varchar(10) CHARACTER SET latin1 NOT NULL,
  `FULL_NAME` varchar(58) CHARACTER SET latin1 DEFAULT NULL,
  `TMP_LAHIR` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `TGL_LAHIR` char(10) CHARACTER SET latin1 DEFAULT NULL,
  `ALAMAT` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `GENDER` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `TELP` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `FOTO` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `D_CREATED` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_ANGGOTA`, `ID_ADMIN`, `FULL_NAME`, `TMP_LAHIR`, `TGL_LAHIR`, `ALAMAT`, `GENDER`, `TELP`, `FOTO`, `D_CREATED`) VALUES
('AGT001', 'AD001', 'Haikal Ardikatama', 'Depok', '07/04/2000', 'Jl. Apel No. 12, Depok', 'L', '87654322', 'my_profile.jpg', '2022-07-04'),
('AGT002', 'AD001', 'Cindy Oktavia', 'Jakarta', '07/09/2000', 'Jl. Jeruk No. 212, Bogor', 'P', '12345678', 'foto_profil.jpg', '2022-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `ID_BUKU` varchar(10) CHARACTER SET latin1 NOT NULL,
  `ID_ADMIN` varchar(10) CHARACTER SET latin1 NOT NULL,
  `TITLE` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `AUTHOR` varchar(58) CHARACTER SET latin1 DEFAULT NULL,
  `PUBLISHER` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `YEAR` char(4) CHARACTER SET latin1 DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `KELUAR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`ID_BUKU`, `ID_ADMIN`, `TITLE`, `AUTHOR`, `PUBLISHER`, `YEAR`, `QTY`, `KELUAR`) VALUES
('BKO001', 'AD001', 'Mengenal Deep Learning', 'Haikal A', 'Pustaka Publisher', '2021', 2, 1),
('BKO002', 'AD001', 'Daun Terakhir', 'Adit', 'Jendela Dunia', '2018', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `ID_DIPINJAM` int(11) NOT NULL,
  `ID_PINJAM` varchar(10) CHARACTER SET latin1 NOT NULL,
  `ID_BUKU` varchar(10) CHARACTER SET latin1 NOT NULL,
  `TGL_KEMBALI` date DEFAULT NULL,
  `DENDA` int(11) DEFAULT NULL,
  `STATUS` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`ID_DIPINJAM`, `ID_PINJAM`, `ID_BUKU`, `TGL_KEMBALI`, `DENDA`, `STATUS`) VALUES
(1, 'P220704001', 'BKO001', '2022-07-04', 0, 'Sudah Kembali'),
(2, 'P220704002', 'BKO002', NULL, 0, 'Belum Kembali'),
(3, 'P220704002', 'BKO001', NULL, 0, 'Belum Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE `notif` (
  `ID_NOTIF` int(11) NOT NULL,
  `ID_ADMIN` varchar(10) CHARACTER SET latin1 NOT NULL,
  `JUDUL` varchar(100) CHARACTER SET latin1 NOT NULL,
  `ISI` varchar(128) CHARACTER SET latin1 NOT NULL,
  `DT` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notif`
--

INSERT INTO `notif` (`ID_NOTIF`, `ID_ADMIN`, `JUDUL`, `ISI`, `DT`) VALUES
(3, 'AD001', 'Peringatan', 'deadline pensortiran 7 Juli', '2022-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_PINJAM` varchar(10) CHARACTER SET latin1 NOT NULL,
  `ID_ANGGOTA` varchar(10) CHARACTER SET latin1 NOT NULL,
  `ID_ADMIN` varchar(10) CHARACTER SET latin1 NOT NULL,
  `TGL_PINJAM` date NOT NULL,
  `JML_BUKU` int(11) NOT NULL,
  `STATS` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`ID_PINJAM`, `ID_ANGGOTA`, `ID_ADMIN`, `TGL_PINJAM`, `JML_BUKU`, `STATS`) VALUES
('P220704001', 'AGT001', 'AD002', '2022-07-04', 1, 'Sudah Kembali'),
('P220704002', 'AGT002', 'AD002', '2022-07-04', 2, 'Belum Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `perpus`
--

CREATE TABLE `perpus` (
  `ID_PERPUS` int(11) NOT NULL,
  `NAMA_P` varchar(58) CHARACTER SET latin1 DEFAULT NULL,
  `ALAMAT_P` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `ABOUT` mediumtext CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perpus`
--

INSERT INTO `perpus` (`ID_PERPUS`, `NAMA_P`, `ALAMAT_P`, `ABOUT`) VALUES
(1, 'Perpustakaan LSP', 'Jl. Kelapa Dua No. 12', 'perpustakaan di universitas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD UNIQUE KEY `ID_ADMIN` (`ID_ADMIN`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_ANGGOTA`),
  ADD UNIQUE KEY `ID_ANGGOTA` (`ID_ANGGOTA`),
  ADD KEY `FK_ANGGOTA_MAKE_ADMIN` (`ID_ADMIN`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_BUKU`),
  ADD UNIQUE KEY `ID_BUKU` (`ID_BUKU`),
  ADD KEY `FK_BUKU_CREATE_ADMIN` (`ID_ADMIN`);

--
-- Indexes for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD PRIMARY KEY (`ID_DIPINJAM`),
  ADD UNIQUE KEY `ID_DIPINJAM` (`ID_DIPINJAM`),
  ADD KEY `FK_DETAIL_P_MEMILIKI_PEMINJAM` (`ID_PINJAM`),
  ADD KEY `FK_DETAIL_P_MENGAMBIL_BUKU` (`ID_BUKU`);

--
-- Indexes for table `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`ID_NOTIF`),
  ADD KEY `FK_NOTIF_MEMBUAT_ADMIN` (`ID_ADMIN`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_PINJAM`),
  ADD UNIQUE KEY `ID_PINJAM` (`ID_PINJAM`),
  ADD KEY `FK_PEMINJAM_MELAKUKAN_ANGGOTA` (`ID_ANGGOTA`),
  ADD KEY `FK_PEMINJAM_MELAYANI_ADMIN` (`ID_ADMIN`);

--
-- Indexes for table `perpus`
--
ALTER TABLE `perpus`
  ADD PRIMARY KEY (`ID_PERPUS`),
  ADD UNIQUE KEY `ID_PERPUS` (`ID_PERPUS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  MODIFY `ID_DIPINJAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
  MODIFY `ID_NOTIF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `perpus`
--
ALTER TABLE `perpus`
  MODIFY `ID_PERPUS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `FK_ANGGOTA_MAKE_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `FK_BUKU_CREATE_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Constraints for table `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD CONSTRAINT `FK_DETAIL_P_MEMILIKI_PEMINJAM` FOREIGN KEY (`ID_PINJAM`) REFERENCES `peminjaman` (`ID_PINJAM`),
  ADD CONSTRAINT `FK_DETAIL_P_MENGAMBIL_BUKU` FOREIGN KEY (`ID_BUKU`) REFERENCES `buku` (`ID_BUKU`);

--
-- Constraints for table `notif`
--
ALTER TABLE `notif`
  ADD CONSTRAINT `FK_NOTIF_MEMBUAT_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `FK_PEMINJAM_MELAKUKAN_ANGGOTA` FOREIGN KEY (`ID_ANGGOTA`) REFERENCES `anggota` (`ID_ANGGOTA`),
  ADD CONSTRAINT `FK_PEMINJAM_MELAYANI_ADMIN` FOREIGN KEY (`ID_ADMIN`) REFERENCES `admin` (`ID_ADMIN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
