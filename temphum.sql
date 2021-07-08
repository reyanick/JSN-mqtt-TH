-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jul 2021 pada 01.25
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `temphum`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `humi`
--

CREATE TABLE `humi` (
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `humidity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `humi`
--

INSERT INTO `humi` (`created_at`, `humidity`) VALUES
('2021-07-03 22:54:18', 55),
('2021-07-03 22:54:20', 55),
('2021-07-03 22:54:22', 56),
('2021-07-03 22:54:24', 56),
('2021-07-03 22:54:26', 56),
('2021-07-03 22:54:28', 56),
('2021-07-03 22:54:30', 56),
('2021-07-03 22:54:32', 56),
('2021-07-03 22:54:34', 56),
('2021-07-03 22:54:36', 56),
('2021-07-03 22:54:38', 56),
('2021-07-03 22:54:40', 56),
('2021-07-03 22:54:42', 56),
('2021-07-03 22:54:44', 56),
('2021-07-03 22:54:46', 56),
('2021-07-03 22:54:48', 57),
('2021-07-03 22:54:50', 57),
('2021-07-03 22:54:52', 57),
('2021-07-03 22:54:54', 57),
('2021-07-03 22:54:56', 57),
('2021-07-03 22:54:58', 57),
('2021-07-03 22:55:00', 57),
('2021-07-03 22:55:03', 57);

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp`
--

CREATE TABLE `temp` (
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `temperature` float(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `temp`
--

INSERT INTO `temp` (`created_at`, `temperature`) VALUES
('2021-07-03 22:54:18', 26.20),
('2021-07-03 22:54:20', 26.20),
('2021-07-03 22:54:22', 26.20),
('2021-07-03 22:54:24', 26.20),
('2021-07-03 22:54:26', 26.20),
('2021-07-03 22:54:28', 26.20),
('2021-07-03 22:54:30', 26.20),
('2021-07-03 22:54:32', 26.20),
('2021-07-03 22:54:34', 26.20),
('2021-07-03 22:54:36', 26.20),
('2021-07-03 22:54:38', 26.20),
('2021-07-03 22:54:40', 26.20),
('2021-07-03 22:54:42', 26.20),
('2021-07-03 22:54:44', 26.20),
('2021-07-03 22:54:46', 26.20),
('2021-07-03 22:54:48', 26.20),
('2021-07-03 22:54:50', 26.20),
('2021-07-03 22:54:52', 26.20),
('2021-07-03 22:54:54', 26.20),
('2021-07-03 22:54:56', 26.20),
('2021-07-03 22:54:58', 26.20),
('2021-07-03 22:55:00', 26.20),
('2021-07-03 22:55:02', 26.20);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `humi`
--
ALTER TABLE `humi`
  ADD PRIMARY KEY (`created_at`);

--
-- Indeks untuk tabel `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`created_at`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
