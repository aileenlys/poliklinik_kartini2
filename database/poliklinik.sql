-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 03:44 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `status_periksa` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(1, 1, 3, 'Muntaber', 1, '1'),
(2, 2, 1, 'Ngilu gigi', 2, '0'),
(11, 20, 4, 'Cemas', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(5, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(21, 'Venny', 'venny123', 'Jakarta Timur', '082837619275', 2),
(22, 'Bella', 'bella456', 'Surabaya', '0818936254176', 3),
(24, 'Himeno', 'himeno123', 'Jakarta', '081276398625', 1),
(25, 'Nurikan', '$2y$10$8yxKSloZZ/CKZBOWPvUvd.sL185CB2UU6KjT8r0UtUx2767BDlFwu', 'Semarang', '0892547162537', 2),
(26, 'Levi', '$2y$10$UZ2htkY4tPV6UwE7vk5QuOYpVjkPpIWp3dvVyThZhGGvo6/jUUUdu', 'Wall Maria No.12', '089654234876', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(1, 21, 'Selasa', '07:00:00', '12:00:00'),
(2, 24, 'Jumat', '08:00:00', '15:30:00'),
(3, 22, 'Rabu', '13:00:00', '20:00:00'),
(4, 26, 'Sabtu', '09:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(3, 'Vitamin C', '100ml', 75000),
(4, 'Paramex', '12 tablet', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `password`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(1, 'Cici', 'cici123', 'Jambi', '1000345789', '089765345672', '202312-001'),
(2, 'Fafa', 'fafa123', 'Cikini', '1000765246', '0875247256876', '202312-002'),
(3, 'Trace', '$2y$10$UoBDHg0yaLBzYiPRApkTu.dbxynYGnw/Sk7ocvY1StXbTHuON3tEW', 'Bringin', '1000972567', '0856536258253', '202312-003'),
(5, 'Aqila', '$2y$10$0VfyKU8QCmFJxuoOmkIULuq.VpbC6n5jUc84uQoCRHE5gjob9ws7a', 'Bali', '1000245367', '081324763901', '202312-005'),
(6, 'Cio', '$2y$10$d7Yiel5sW5E9t9piNHPzAOrFBMNrVJfPdGoRzTB3dM1yJJ4IvR35K', 'Jepara', '1000635724', '087624317597', '202312-006'),
(7, 'Riyan', '$2y$10$LvxhokCuDFbNLDzGDvGU6.acIw16pRWcUtrvU5UoK8SqHWWt2FH8G', 'Ciwidey', '1000256341', '082536790123', '202312-007'),
(8, 'Dina', '$2y$10$lk7spc5e0rR3DeTPPF2W5uxd726AoOOJnily0q03wKx5LCIvG/wV6', 'Surakarta', '1000672456', '085895124276', '202312-008'),
(9, 'Caca', '$2y$10$fHW8BEA0VV9DUi33qO5OE.i0nwlYIEhZioB/b/yM.dR7LlcZpWqO2', 'Semarang', '3328495', '0834623487', '202312-009'),
(10, 'Jaka', '$2y$10$oImZPRY9DdiQH4SJETMcU.lAcLV.fDOdl7C1nMXLfZKzUB.x7OOWO', 'Bekasi', '332487593', '0857382623', '202401-010'),
(12, 'Aca', '$2y$10$yli76q0IZ.tn4tsQuCDoLO3kc5l95ML9ToivbsVtE0mLnwFbGl8/S', 'Surabaya', '1000543267', '089764376897', '202401-012'),
(13, 'Dinda', '$2y$10$Ue3H05D8SyzbFCSbYqfpae1EVTRolymc350t3bzOtjEnk9RtqhdBq', 'Tegal', '1000432567', '081453276589', '202401-013'),
(14, 'Cika', '$2y$10$J5xeC72.6kF8GMy87wx6X.o8E62NcZwP4vhOTarn8oVAT92Ee.V6G', 'Brebes', '1000256371', '089152773572', '202401-014'),
(15, 'Nabila', '$2y$10$UgH3uJm9uXHK9lcf.JC8gOP6Fc2MbyM1ySXIvcVOeUk5Fn66LeXKa', 'Bogor', '1000743574', '08162548175682', '202401-015'),
(16, 'Jingga', '$2y$10$lk7spc5e0rR3DeTPPF2W5uxd726AoOOJnily0q03wKx5LCIvG/wV6', 'Bandung', '1000562478', '085524890175', '202312-008'),
(17, 'Briyan', '$2y$10$lk7spc5e0rR3DeTPPF2W5uxd726AoOOJnily0q03wKx5LCIvG/wV6', 'Jakarta', '1000245814', '087526891568', '202312-008'),
(18, 'Didi', '$2y$10$oImZPRY9DdiQH4SJETMcU.lAcLV.fDOdl7C1nMXLfZKzUB.x7OOWO', 'Pekalongan', '1000982654', '0863782667185', '202401-010'),
(19, 'Fira', '$2y$10$yli76q0IZ.tn4tsQuCDoLO3kc5l95ML9ToivbsVtE0mLnwFbGl8/S', 'Kudus', '1000267765', '0894567289109', '202401-012'),
(20, 'Cila', '$2y$10$nQX9u0miHlQpc6yl5vUZgeeUwBhvsA0Qnwns4wiQ5ZAlkZNviFknC', 'Pedurungan', '1000537653', '085234123567', '202401-016'),
(21, 'Dinda', '$2y$10$bbaCa/CTizfHmSO0f7gQ5eo3Ok6I20fBQ9AJwY1QhibEcvwPO5EXK', 'Cileduk', '1000245614326', '089453672456', '202401-017');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(1, 2, '2023-12-13 09:00:00', 'Tidak memakan makanan yang dingin dan panas, lebih baik makan ketika sudah hangat atau suhu ruangan.', 250000),
(2, 1, '2023-09-05 14:00:00', 'Memakan yang sehat, tidak memakan diluar, dan sementara memakan yang berserat dan meminum vitamin.', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'Anak', 'Untuk dokter anak anak'),
(2, 'Gigi', 'Untuk sakit gigi'),
(3, 'Mata', 'Untuk rujukan ke dokter mata'),
(4, 'Jiwa', 'Poli jiwa anak');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftarpoli_pasien` (`id_pasien`),
  ADD KEY `fk_daftarpoli_jadwalperiksa` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detailperiksa_periksa` (`id_periksa`),
  ADD KEY `fk_detailperiksa_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwalperiksa_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftarpoli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_daftarpoli_jadwalperiksa` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_daftarpoli_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detailperiksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detailperiksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwalperiksa_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftarpoli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
