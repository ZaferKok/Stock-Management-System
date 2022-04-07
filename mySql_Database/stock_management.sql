-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Mrz 2022 um 01:57
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `stock_management`
--
CREATE DATABASE IF NOT EXISTS `stock_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `stock_management`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clients`
--

CREATE TABLE `clients` (
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `clients`
--

INSERT INTO `clients` (`username`, `password`) VALUES
('avatar', '12345');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `equipments`
--

CREATE TABLE `equipments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `type` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=geostd8;

--
-- Daten für Tabelle `equipments`
--

INSERT INTO `equipments` (`id`, `name`, `quantity`, `price`, `type`, `createdAt`, `updatedAt`, `details`) VALUES
(287625803, 'Nvidia GeForce RTX3050', 29, 988.99, 'Graphic Card', '2022-03-15 17:24:47', '2022-03-18 00:52:34', '8196MB sDDR3-RAM, PCI-Express, VGA, DVI, HDMI, Passive cooling / Power for all games and other graphics-intensive applications / Fastest graphics processor / Completely silent / Up to 3x more gaming performance.'),
(287625804, 'ASUS PRIME H510M', 175, 259.99, 'Motherboard', '2022-03-15 17:26:52', '2022-03-17 09:14:48', 'Intel H510Intel H510 Chipset, Socket 1200, M-ATX, 2x DDR4 (up to 64GB), 1x PCI Express x16, 2x PCI Express x1, High Definition Audio, Intel I219-V LAN, 4x SATA 6Gb/s , 1x M.2, 4x USB3.2, 8x USB2.0'),
(287625805, 'Intel CPU Core i7', 49, 299.99, 'Processor', '2022-03-15 17:27:25', '2022-03-17 09:14:56', '8x 4.8GHz8x 2.90GHz, 4.80GHz in turbo mode, 16 threads, Socket FCLGA1200, 16MB Smart Cache'),
(287625806, 'SSD 1TB Drive', 96, 99.99, 'SSD', '2022-03-15 17:28:40', '2022-03-17 09:15:00', '1000GB S-ATA3, 600MB/Sec.'),
(287625807, 'Philips 272E2FA Screen', 37, 149.99, 'Screen', '2022-03-15 17:29:15', '2022-03-18 00:34:48', '27 inch FHD Gaming Monitor, 75 Hz, 4ms, Adaptive Sync (1920x1080, VGA, HDMI, DisplayPort) black.'),
(287625808, 'RAM 16GB', 55, 49.99, 'RAM', '2022-03-15 17:30:07', '2022-03-17 09:15:10', 'DDR4 RAM PC-2666'),
(287625809, 'RAM 8GB', 44, 39.99, 'RAM', '2022-03-15 17:30:28', '2022-03-17 09:15:12', 'DDR4 RAM PC-2333'),
(287625810, 'RAM 4GB', 33, 29.99, 'RAM', '2022-03-15 17:30:50', '2022-03-17 09:13:23', 'DDR4 RAM PC-1966'),
(287625812, 'Logitech Headset', 79, 19.99, 'Headset', '2022-03-15 17:32:17', '2022-03-17 22:34:20', 'Logitech 960 Headphones with Microphone, Stereo Headset, Adjustable Noise-Cancelling Microphone, Integrated Volume Control and Mute, USB Port, 2.4m Cable, PC/Mac/Laptop, Black'),
(287625813, 'Logitech MK235 Keyboard', 68, 44.99, 'Keyboard', '2022-03-15 17:32:50', '2022-03-18 00:36:11', 'Wireless Keyboard and Mouse Set for Windows 2.4GHz Unifying USB Wireless Receiver 15 FN Keys Long Battery Life PC Laptop German QWERTZ Layout - Grey'),
(287625814, 'NexiGo N930AF WebCam', 51, 37.99, 'WebCam', '2022-03-15 17:33:24', '2022-03-18 00:36:36', 'Autofokus 1080P Webcam mit Software, Stereo Mikrofon and Abdeckung, USB Computer Web Kamera, f?r Streamen von Online-Kursen, Kompatibel mit Zoom/Skype/Teams, PC Mac Laptop Desktop'),
(287625817, 'Nvidia GeForce GTX', 80, 799.99, 'Graphic Card', '2022-03-16 18:28:44', '2022-03-17 09:16:08', '6144MB sDDR3-RAM, PCI-Express, VGA, DVI, HDMI, Passive cooling / Power for all games and other graphics-intensive applications / Fastest graphics processor / Completely silent / Up to 3x more gaming performance.'),
(287625818, 'ASUS PRIME Z310T', 56, 248.99, 'Motherboard', '2022-03-16 18:30:04', '2022-03-17 09:16:16', 'Intel Z310T Intel H510 Chipset, Socket 1200, M-ATX, 2x DDR4 (up to 64GB), 1x PCI Express x16, 2x PCI Express x1, High Definition Audio, Intel I219-V LAN, 4x SATA 6Gb/s , 1x M.2, 4x USB3.2, 8x USB2.0'),
(287625819, 'Intel CPU Core i5', 21, 274.99, 'Processor', '2022-03-16 18:30:50', '2022-03-17 09:16:23', '8x 4.8GHz8x 2.90GHz, 4.80GHz in turbo mode, 16 threads, Socket FCLGA1200, 8MB Smart Cache'),
(287625820, 'Intel CPU Core i3', 28, 209.99, 'Processor', '2022-03-16 18:31:41', '2022-03-17 09:16:29', '8x 4.8GHz8x 2.90GHz, 4.80GHz in turbo mode, 16 threads, Socket FCLGA1200, 4MB Smart Cache'),
(287625821, 'SSD 500 Drive', 71, 64.99, 'SSD', '2022-03-16 18:33:27', '2022-03-17 09:16:45', '480GB S-ATA3, 600MB/Sec.'),
(287625822, 'SSD 240 Drive', 54, 38.99, 'SSD', '2022-03-16 18:34:55', '2022-03-17 09:16:54', '240GB S-ATA3, 600MB/Sec.'),
(287625823, 'SSD 120 Drive', 15, 24.99, 'SSD', '2022-03-16 18:38:39', '2022-03-17 09:17:03', '120GB S-ATA3, 600MB/Sec.'),
(287625824, 'Logitech Headset Lux', 63, 52.99, 'Headset', '2022-03-16 18:41:32', '2022-03-17 09:17:13', 'Logitech 1060 Headphones with Microphone, Stereo Headset, Adjustable Noise-Cancelling Microphone, Integrated Volume Control and Mute, USB Port, 2.4m Cable, PC/Mac/Laptop, Black.'),
(287625835, 'RAM 2GB', 11, 14.99, 'RAM', '2022-03-17 09:10:50', '2022-03-17 14:13:28', 'DDR4 RAM PC-1966');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287625954;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
