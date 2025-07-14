-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2025 at 11:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbpl_kingland`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `jenis_barang` varchar(50) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `gambar_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jenis_barang`, `harga`, `gambar_url`) VALUES
(1242001, 'King Anaconda', 'Adventure Motorcycle Tire', 225000.00, 'https://kingland.co.id/wp-content/uploads/2025/05/King-Hyrax-Right1.jpg'),
(1242002, 'King Wolf', 'Standard Motorcycle Tire', 145000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/LION.jpg'),
(1242003, 'King Alligator MTX', 'Motocross Tire', 190000.00, 'https://kingland.co.id/wp-content/uploads/2024/12/aligator-mtx.jpg'),
(1242004, 'King Jaguar', 'Urban-City Motorcycle Tire', 190000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/JAGUAR.jpg'),
(1242005, 'King Leopard', 'Touring Motorcycle Tire', 170000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/New-Leopard-s.jpg'),
(1242006, 'King Panda', 'Standard Motorcycle Tire', 155000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/PANDA.jpg'),
(1242007, 'King Puma', 'Standard Motorcycle Tire', 160000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/PUMA.jpg'),
(1242008, 'King Tiger', 'Urban-City Motorcycle Tire', 185000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/TIGER.jpg'),
(1242009, 'King Shark', 'Off-road Motocross Tire', 200000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/SHARK.jpg'),
(1242010, 'King Iguana', 'Urban Motorcycle Tire (Genuine Line)', 185000.00, 'https://kingland.co.id/wp-content/uploads/2022/02/DOLPHIN.jpg'),
(1242011, 'King Pitbull', 'Urban-City Motorcycle Tire', 180000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/King-Pitbull-List.jpg'),
(1242012, 'King Python', 'Standard Motorcycle Tire', 150000.00, 'https://kingland.co.id/wp-content/uploads/2022/01/PYTHON.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_permintaan_produksi`
--

CREATE TABLE `detail_permintaan_produksi` (
  `id_detail` int(11) NOT NULL,
  `id_permintaan` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_permintaan` int(11) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `no_bstb` varchar(20) NOT NULL,
  `status_bstb` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_permintaan_produksi`
--

INSERT INTO `detail_permintaan_produksi` (`id_detail`, `id_permintaan`, `id_barang`, `jumlah_permintaan`, `catatan`, `no_bstb`, `status_bstb`, `alamat`) VALUES
(6, 15, 1242007, 30, '0', 'BSTB016', 'Selesai', ''),
(7, 16, 1242006, 20, '0', 'BSTB015', 'Selesai', ''),
(8, 17, 1242003, 20, '0', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_gudang`
--

CREATE TABLE `laporan_gudang` (
  `no_laporan` int(11) NOT NULL,
  `periode` varchar(50) NOT NULL,
  `tanggal_laporan` date NOT NULL,
  `catatan_tambahan` text DEFAULT NULL,
  `status_laporan` enum('Diterima','Disetujui') DEFAULT 'Diterima',
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `stok_awal` int(11) DEFAULT 0,
  `stok_masuk` int(11) DEFAULT 0,
  `stok_keluar` int(11) DEFAULT 0,
  `stok_akhir` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_gudang`
--

INSERT INTO `laporan_gudang` (`no_laporan`, `periode`, `tanggal_laporan`, `catatan_tambahan`, `status_laporan`, `id_barang`, `kode_barang`, `nama_barang`, `stok_awal`, `stok_masuk`, `stok_keluar`, `stok_akhir`) VALUES
(4, 'harian', '2025-07-11', '', 'Disetujui', 1242003, NULL, '0', 40, 80, 20, 100),
(7, 'harian', '2025-07-11', '', 'Disetujui', 1242006, NULL, '0', 40, 80, 20, 100);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('gudang', 'gudang25'),
('manajer', 'manajer25'),
('produksi', 'produksi25');

-- --------------------------------------------------------

--
-- Table structure for table `manajemen_puncak`
--

CREATE TABLE `manajemen_puncak` (
  `id_tm` int(11) NOT NULL,
  `id_laporan` int(11) DEFAULT NULL,
  `nama_manajer` varchar(100) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_telp_pelanggan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman_barang`
--

CREATE TABLE `pengiriman_barang` (
  `id_pengiriman` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `id_gudang` int(11) DEFAULT NULL,
  `tujuan_kirim` varchar(100) DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_produksi`
--

CREATE TABLE `permintaan_produksi` (
  `id_permintaan` int(11) NOT NULL,
  `nomor_permintaan` varchar(20) DEFAULT NULL,
  `tanggal_permintaan` date DEFAULT NULL,
  `divisi_pemohon` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `catatan_tambahan` text NOT NULL,
  `kode_barang_permintaan` int(11) NOT NULL,
  `nama_barang_permintaan` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permintaan_produksi`
--

INSERT INTO `permintaan_produksi` (`id_permintaan`, `nomor_permintaan`, `tanggal_permintaan`, `divisi_pemohon`, `username`, `catatan_tambahan`, `kode_barang_permintaan`, `nama_barang_permintaan`, `status`) VALUES
(15, '#REQ001', '2025-07-09', 'Divisi Gudang', NULL, '', 1242007, 'King Puma', 'Sedang Diproduksi'),
(16, '#REQ002', '2025-07-09', 'Divisi Gudang', NULL, '', 1242006, 'King Panda', 'Sedang Diproduksi'),
(17, '#REQ003', '2025-07-11', 'Divisi Gudang', NULL, '', 1242003, 'King Alligator MTX', 'Proses');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_pelanggan`
--

CREATE TABLE `pesanan_pelanggan` (
  `id_pesanan` int(11) NOT NULL,
  `no_pesanan` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `status_pesanan` enum('Menunggu Konfirmasi','Sedang Diproses','Dikirim') NOT NULL DEFAULT 'Menunggu Konfirmasi',
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_barang` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `barang_pesanan` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan_pelanggan`
--

INSERT INTO `pesanan_pelanggan` (`id_pesanan`, `no_pesanan`, `tanggal`, `nama_pelanggan`, `status_pesanan`, `email`, `telepon`, `alamat`, `id_barang`, `subtotal`, `harga`, `barang_pesanan`, `jumlah`) VALUES
(15, '#ORD-007', '2025-02-05', 'Nishimura Riki', 'Sedang Diproses', 'riki@mail.com', '081234567001', 'Jalan Sakura No.12, Tokyo, Japan', 1242001, 2250000, 225000, 'King Anaconda', 10),
(16, '#ORD-006', '2025-02-04', 'Yang Jungwon', 'Menunggu Konfirmasi', 'jungwon@mail.com', '081234567002', 'Jalan Hangang No.21, Seoul, Korea Selatan', 1242002, 870000, 145000, 'King Wolf', 6),
(17, '#ORD-005', '2025-02-04', 'Lee Heeseung', 'Sedang Diproses', 'heeseung@mail.com', '081234567003', 'Jalan Busan Street No.9, Busan, Korea Selatan', 1242006, 1550000, 155000, 'King Panda', 10),
(18, '#ORD-004', '2025-02-03', 'Byeon Wooseok', 'Sedang Diproses', 'wooseok@mail.com', '081234567004', 'Jalan Apgujeong No.33, Daegu, Korea Selatan', 1242003, 950000, 190000, 'King Alligator MTX', 5),
(19, '#ORD-003', '2025-02-03', 'Kim Sunoo', 'Dikirim', 'sunoo@mail.com', '081234567005', 'Jalan Incheon Airport No.5, Incheon, Korea Selatan', 1242009, 1800000, 200000, 'King Shark', 9),
(20, '#ORD-002', '2025-02-03', 'Choi Hyunwook', 'Dikirim', 'hyunwook@mail.com', '081234567006', 'Jalan Hyehwa No.17, Suwon, Korea Selatan', 1242010, 1110000, 185000, 'King Iguana', 6),
(21, '#ORD-001', '2025-02-02', 'Kim Min-Kyu', 'Dikirim', 'minkyu@mail.com', '081234567007', 'Jalan Hanok Village No.3, Jeju Island, Korea Selatan', 1242011, 2340000, 180000, 'King Pitbull', 13);

-- --------------------------------------------------------

--
-- Table structure for table `produksi`
--

CREATE TABLE `produksi` (
  `id_produksi` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `tanggal_produksi` date DEFAULT NULL,
  `jumlah_produksi` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id_barang_stok` int(11) NOT NULL,
  `status_stok` varchar(50) DEFAULT NULL,
  `jumlah_stok` int(11) DEFAULT NULL,
  `stok_minimum` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `gambar_url` text NOT NULL,
  `tgl_update` date NOT NULL,
  `nama_barang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id_barang_stok`, `status_stok`, `jumlah_stok`, `stok_minimum`, `id_barang`, `gambar_url`, `tgl_update`, `nama_barang`) VALUES
(124001, 'Tersedia', 33, 10, 1242001, 'https://kingland.co.id/wp-content/uploads/2025/05/King-Hyrax-Right1.jpg', '2025-05-08', 'KING ANACONDA'),
(124002, 'Tersedia', 42, 10, 1242002, 'https://kingland.co.id/wp-content/uploads/2022/01/WOLF.jpg', '2025-02-02', 'KING WOLF'),
(124003, 'Tersedia', 100, 10, 1242003, 'https://kingland.co.id/wp-content/uploads/2024/12/aligator-mtx.jpg', '2025-01-30', 'KING ALLIGATOR MTX'),
(124004, 'Tersedia', 25, 10, 1242004, 'https://kingland.co.id/wp-content/uploads/2022/01/JAGUAR.jpg', '2025-02-02', 'KING JAGUAR'),
(124005, 'Stok Menipis', 10, 10, 1242005, 'https://kingland.co.id/wp-content/uploads/2022/01/New-Leopard-s.jpg', '2025-02-23', 'KING LEOPARD'),
(124006, 'Tersedia', 55, 10, 1242006, 'https://kingland.co.id/wp-content/uploads/2022/01/PANDA.jpg', '2025-02-19', 'KING PANDA'),
(124007, 'Tersedia', 67, 10, 1242007, 'https://kingland.co.id/wp-content/uploads/2022/01/PUMA.jpg', '2025-02-22', 'KING PUMA'),
(124008, 'Tersedia', 43, 10, 1242008, 'https://kingland.co.id/wp-content/uploads/2022/01/TIGER.jpg', '2025-02-22', 'KING TIGER'),
(124009, 'Stok Menipis', 10, 10, 1242009, 'https://kingland.co.id/wp-content/uploads/2022/01/SHARK.jpg', '2025-03-02', 'KING SHARK'),
(124010, 'Tersedia', 68, 10, 1242010, 'https://kingland.co.id/wp-content/uploads/2022/01/IGUANA.jpg', '2025-03-05', 'KING IGUANA'),
(124011, 'Tersedia', 68, 10, 1242011, 'https://kingland.co.id/wp-content/uploads/2022/01/King-Pitbull-List.jpg', '2025-03-07', 'KING PITBULL'),
(124012, 'Tersedia', 127, 10, 1242012, 'https://kingland.co.id/wp-content/uploads/2022/01/PYTHON.jpg', '2025-03-10', 'KING PYTHON');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `detail_permintaan_produksi`
--
ALTER TABLE `detail_permintaan_produksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_permintaan` (`id_permintaan`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `laporan_gudang`
--
ALTER TABLE `laporan_gudang`
  ADD PRIMARY KEY (`no_laporan`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `manajemen_puncak`
--
ALTER TABLE `manajemen_puncak`
  ADD PRIMARY KEY (`id_tm`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pengiriman_barang`
--
ALTER TABLE `pengiriman_barang`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_gudang` (`id_gudang`);

--
-- Indexes for table `permintaan_produksi`
--
ALTER TABLE `permintaan_produksi`
  ADD PRIMARY KEY (`id_permintaan`);

--
-- Indexes for table `pesanan_pelanggan`
--
ALTER TABLE `pesanan_pelanggan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `fk_id_barang` (`id_barang`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id_produksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_barang_stok`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_permintaan_produksi`
--
ALTER TABLE `detail_permintaan_produksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `laporan_gudang`
--
ALTER TABLE `laporan_gudang`
  MODIFY `no_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permintaan_produksi`
--
ALTER TABLE `permintaan_produksi`
  MODIFY `id_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pesanan_pelanggan`
--
ALTER TABLE `pesanan_pelanggan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `manajemen_puncak`
--
ALTER TABLE `manajemen_puncak`
  ADD CONSTRAINT `manajemen_puncak_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`),
  ADD CONSTRAINT `manajemen_puncak_ibfk_2` FOREIGN KEY (`username`) REFERENCES `login` (`username`);

--
-- Constraints for table `pengiriman_barang`
--
ALTER TABLE `pengiriman_barang`
  ADD CONSTRAINT `pengiriman_barang_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `pengiriman_barang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `pengiriman_barang_ibfk_3` FOREIGN KEY (`id_gudang`) REFERENCES `gudang` (`id_gudang`);

--
-- Constraints for table `pesanan_pelanggan`
--
ALTER TABLE `pesanan_pelanggan`
  ADD CONSTRAINT `fk_id_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON UPDATE CASCADE;

--
-- Constraints for table `produksi`
--
ALTER TABLE `produksi`
  ADD CONSTRAINT `produksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `produksi_ibfk_2` FOREIGN KEY (`username`) REFERENCES `login` (`username`);

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
