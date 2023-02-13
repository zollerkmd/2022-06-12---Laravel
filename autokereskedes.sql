-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2023. Jan 11. 17:48
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `autokereskedes`
--
CREATE DATABASE IF NOT EXISTS `autokereskedes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `autokereskedes`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `autok`
--

CREATE TABLE `autok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tulajdonos` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) NOT NULL,
  `marka` varchar(255) NOT NULL,
  `evjarat` int(11) DEFAULT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `autok`
--

INSERT INTO `autok` (`id`, `tulajdonos`, `model`, `marka`, `evjarat`, `ar`) VALUES
(1, 4, 'Prius 2', 'Toyota', 2007, 2200000),
(2, 2, 'Punto', 'Fiat', 2003, 650000),
(3, 2, 'Fiesta', 'Ford', 2008, 1700000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tulajdonosok`
--

CREATE TABLE `tulajdonosok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vezeteknev` varchar(255) DEFAULT NULL,
  `keresztnev` varchar(255) DEFAULT NULL,
  `szuletesDatuma` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `tulajdonosok`
--

INSERT INTO `tulajdonosok` (`id`, `vezeteknev`, `keresztnev`, `szuletesDatuma`) VALUES
(1, 'Kiss', 'János', '2023-01-11'),
(2, 'Nagy', 'Lajos', '2023-01-11'),
(3, 'Takács', 'Roland', '2023-01-11'),
(4, 'Horváth', 'Gábor', '2023-01-11'),
(5, 'Keresztes', 'Dávid', '2023-01-11'),
(6, 'Kiss', 'Márk', '2023-01-11');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `autok`
--
ALTER TABLE `autok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autok_tulajdonos_foreign` (`tulajdonos`);

--
-- A tábla indexei `tulajdonosok`
--
ALTER TABLE `tulajdonosok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `autok`
--
ALTER TABLE `autok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `tulajdonosok`
--
ALTER TABLE `tulajdonosok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `autok`
--
ALTER TABLE `autok`
  ADD CONSTRAINT `autok_tulajdonos_foreign` FOREIGN KEY (`tulajdonos`) REFERENCES `tulajdonosok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
