-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 06, 2025 at 02:47 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suratunma`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_disposisi`
--

CREATE TABLE `tbl_disposisi` (
  `id_disposisi` int NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `isi_disposisi` mediumtext NOT NULL,
  `sifat` varchar(100) NOT NULL,
  `batas_waktu` date NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `id_surat` int NOT NULL,
  `id_user` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_instansi`
--

CREATE TABLE `tbl_instansi` (
  `id_instansi` tinyint(1) NOT NULL,
  `institusi` varchar(150) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `kepsek` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `id_user` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_instansi`
--

INSERT INTO `tbl_instansi` (`id_instansi`, `institusi`, `nama`, `status`, `alamat`, `kepsek`, `nip`, `website`, `email`, `logo`, `id_user`) VALUES
(1, 'Fakultas Teknik', 'Universitas Majalengka', 'Terakreditasi B', 'Jl. Raya K H Abdul Halim No.103, Majalengka Kulon, Kec. Majalengka, Kabupaten Majalengka, Jawa Barat 45418', 'Doni Susandy', '-', 'https://unma.ac.id', 'universitasmajalengkat@gmail.com', 'unma.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_klasifikasi`
--

CREATE TABLE `tbl_klasifikasi` (
  `id_klasifikasi` int NOT NULL,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `id_user` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sett`
--

CREATE TABLE `tbl_sett` (
  `id_sett` tinyint(1) NOT NULL,
  `surat_masuk` tinyint NOT NULL,
  `surat_keluar` tinyint NOT NULL,
  `referensi` tinyint NOT NULL,
  `id_user` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sett`
--

INSERT INTO `tbl_sett` (`id_sett`, `surat_masuk`, `surat_keluar`, `referensi`, `id_user`) VALUES
(1, 10, 10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_keluar`
--

CREATE TABLE `tbl_surat_keluar` (
  `id_surat` int NOT NULL,
  `no_agenda` int NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `isi` mediumtext NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_catat` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `id_user` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surat_keluar`
--

INSERT INTO `tbl_surat_keluar` (`id_surat`, `no_agenda`, `tujuan`, `no_surat`, `isi`, `tgl_surat`, `tgl_catat`, `file`, `keterangan`, `id_user`) VALUES
(1, 1, 'haha', '2201', 'pengajuan', '2025-02-04', '2025-02-06', '9832-download (1).jpg', 'Permintaan Donasi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_masuk`
--

CREATE TABLE `tbl_surat_masuk` (
  `id_surat` int NOT NULL,
  `no_agenda` int NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `asal_surat` varchar(250) NOT NULL,
  `isi` mediumtext NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_diterima` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `id_user` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surat_masuk`
--

INSERT INTO `tbl_surat_masuk` (`id_surat`, `no_agenda`, `no_surat`, `asal_surat`, `isi`, `tgl_surat`, `tgl_diterima`, `file`, `keterangan`, `id_user`) VALUES
(6, 2, '34/FT/UNMA/2025', 'Majalengka', 'Pengajuan Dana untuk registrasi peserta PSHT', '2025-02-06', '2025-02-06', '8260-ANALISA APLIKASI BERBASIS WEB.pdf', 'Segera', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` tinyint NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `nama`, `nip`, `admin`) VALUES
(1, 'hamim', '827ccb0eea8a706c4c34a16891f84e7b', 'Hamim', '102222373', 1),
(3, 'User1', '827ccb0eea8a706c4c34a16891f84e7b', 'User', '1', 2),
(4, 'malik', '827ccb0eea8a706c4c34a16891f84e7b', 'malik', '10222333', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_disposisi`
--
ALTER TABLE `tbl_disposisi`
  ADD PRIMARY KEY (`id_disposisi`);

--
-- Indexes for table `tbl_instansi`
--
ALTER TABLE `tbl_instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indexes for table `tbl_klasifikasi`
--
ALTER TABLE `tbl_klasifikasi`
  ADD PRIMARY KEY (`id_klasifikasi`);

--
-- Indexes for table `tbl_sett`
--
ALTER TABLE `tbl_sett`
  ADD PRIMARY KEY (`id_sett`);

--
-- Indexes for table `tbl_surat_keluar`
--
ALTER TABLE `tbl_surat_keluar`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `tbl_surat_masuk`
--
ALTER TABLE `tbl_surat_masuk`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_disposisi`
--
ALTER TABLE `tbl_disposisi`
  MODIFY `id_disposisi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_klasifikasi`
--
ALTER TABLE `tbl_klasifikasi`
  MODIFY `id_klasifikasi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_surat_keluar`
--
ALTER TABLE `tbl_surat_keluar`
  MODIFY `id_surat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_surat_masuk`
--
ALTER TABLE `tbl_surat_masuk`
  MODIFY `id_surat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
