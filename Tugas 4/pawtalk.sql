-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2025 at 02:39 AM
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
-- Database: `pawtalk`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detailtr` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `jumlah_produk` int(255) NOT NULL,
  `harga_satuan` decimal(11,0) NOT NULL,
  `sub_total` decimal(11,0) NOT NULL,
  `total` decimal(11,0) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Makanan Kucing'),
(2, 'Makanan Anjing'),
(3, 'Aksesoris'),
(4, 'Vitamin'),
(5, 'Perlengkapan');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `username`, `password`, `email`) VALUES
(1, 'klara', 'klara@gmail.com', '$2y$10$hBVFuIHS', 'klara@gmail.com'),
(2, 'Lara', 'laravel', '$2y$10$d68LTryQ', 'laravel@gmail.com'),
(3, 'Rahma', 'ramania', '$2y$10$UKMVhwCnUsg4PbdSlLRHsO3dzvQn.PwO0EMJCVDT3Jga6rPV4gAei', 'ramania@gmail.com'),
(4, 'Bobby', 'bobby123', '$2y$10$7x6h71U96kt2dvbIBDKbluMP1f1RzQLTOaJlxCIpGLC2klcG49f62', 'bobby@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga_produk` decimal(10,0) NOT NULL,
  `stok` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal_update` date NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `stok`, `deskripsi`, `tanggal_update`, `gambar`) VALUES
(1, 2, 'dfb', 5000, 23, 'wegfdv', '2025-06-01', 'img_683c053feffbb.jpg'),
(2, 1, 'Wishkas Unlimitide', 29090, 10, 'Maknan Kucing nih boss', '2025-06-01', 'img_683c05e23e62e.jpg'),
(3, 5, 'Royal Canin prahara', 5000, 12, 'sdasafdgvdf', '2025-06-01', 'img_683c0654832b9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `total_transaksi` decimal(10,0) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('menunggu','diproses','dibatalkan','selesai') NOT NULL,
  `id_detailtr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `role` enum('admin','kasir','manager','') NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `role`, `email`, `password`) VALUES
(1, 'Surya', '', 'surya@gmail.com', '$2y$10$cGeOSNfq7MEDSYkSVfMu6OgLdY3v.Tceda8Xoz4L2PRxVrgYKSCv6'),
(2, 'ima', '', 'ima@gmail.com', '$2y$10$y8OLIUkOLLbc1lG69rUDm..QGMMCfFYWuApoHVlwmrmGFmskDFt2q');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detailtr`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_detailtr` (`id_detailtr`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detailtr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_detailtr`) REFERENCES `detail_transaksi` (`id_detailtr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
