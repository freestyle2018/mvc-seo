-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 24 2020 г., 07:48
-- Версия сервера: 5.7.28
-- Версия PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvc_project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `sape_project`
--

CREATE TABLE `sape_project` (
  `id_project` int(15) NOT NULL,
  `name_project` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sape_project`
--

INSERT INTO `sape_project` (`id_project`, `name_project`, `id_user`) VALUES
(2020050, 'Тельфер Про', 79);

-- --------------------------------------------------------

--
-- Структура таблицы `sape_razdel`
--

CREATE TABLE `sape_razdel` (
  `id_razdel` int(15) NOT NULL,
  `name_razdel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_next` datetime NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `shag_time` int(2) NOT NULL,
  `koef_time` int(5) DEFAULT NULL,
  `kolichestvo_urls` int(5) NOT NULL,
  `prirost` enum('static','dinamic') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `id_project` int(10) NOT NULL,
  `zapusk` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nomer` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sape_razdel`
--

INSERT INTO `sape_razdel` (`id_razdel`, `name_razdel`, `date_next`, `date_start`, `date_end`, `shag_time`, `koef_time`, `kolichestvo_urls`, `prirost`, `id_project`, `zapusk`, `nomer`) VALUES
(3399466, 'тельфер болгария2', '2020-04-25 17:54:45', NULL, NULL, 43, 120, 200, 'static', 2020546, 'on', 2),
(3399467, 'тельфер цена', '2020-04-21 09:52:51', NULL, NULL, 4, 120, 12, 'static', 2020546, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sape_url`
--

CREATE TABLE `sape_url` (
  `id_url` int(15) NOT NULL,
  `name_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_razdel` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sape_url`
--

INSERT INTO `sape_url` (`id_url`, `name_url`, `id_razdel`) VALUES
(120521954, 'http://dcsgvrg.ru', 3399345),
(120521956, 'http://aegesh.ru', 3399345),
(120521958, 'http://kjvaergeg.ru', 3399345),
(120545023, 'http://sdvafb.ru', 3399466),
(120547774, 'http://adcwrrwg.ru', 3399466),
(120547775, 'http://sdvar.ru', 3399466),
(120547776, 'http://sdvwvarearb.ru', 3399466),
(120547778, 'http://adcwrrwg.ucoz.ru', 3399467),
(120547779, 'http://sdvar.ucoz.ru', 3399467),
(120547780, 'http://sdvwvarearb.ucoz.ru', 3399467);

-- --------------------------------------------------------

--
-- Структура таблицы `zadacha`
--

CREATE TABLE `zadacha` (
  `zadacha_id` int(5) NOT NULL,
  `zadacha_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zadacha_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zadacha_text` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `zadacha`
--

INSERT INTO `zadacha` (`zadacha_id`, `zadacha_user`, `zadacha_email`, `zadacha_text`) VALUES
(2, 'Олег', 'oleg@yandex.ru', 'Биология'),
(3, 'Стас', 'stas@mail.ru', 'Танцы'),
(4, 'Никон', 'nikon@yandex.ru', 'Кораблестроение'),
(5, 'Никифор', 'nikifor@mail.ru', 'Стадион'),
(6, 'Лаврентий', 'lavrentii@yandex.ru', 'Иностранный язык'),
(7, 'Сергей', 'sergei@yandex.ru', 'Программирование'),
(9, 'Анна', 'anna@nn.ru', 'Психология'),
(11, 'Светлана', 'svetlana@rambler.ru', 'Вязание'),
(12, 'sewag', 'a2@ma.ru', 'argwreg'),
(13, 'desg', '123@bv.ru', 'drgeg'),
(14, 'desg', '123@bv.ru', 'drgeg'),
(15, 'sfva', '3454@nm.ru', 'Биология');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sape_project`
--
ALTER TABLE `sape_project`
  ADD PRIMARY KEY (`id_project`);

--
-- Индексы таблицы `sape_razdel`
--
ALTER TABLE `sape_razdel`
  ADD PRIMARY KEY (`id_razdel`);

--
-- Индексы таблицы `sape_url`
--
ALTER TABLE `sape_url`
  ADD PRIMARY KEY (`id_url`);

--
-- Индексы таблицы `zadacha`
--
ALTER TABLE `zadacha`
  ADD PRIMARY KEY (`zadacha_id`),
  ADD UNIQUE KEY `zadacha_id` (`zadacha_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sape_project`
--
ALTER TABLE `sape_project`
  MODIFY `id_project` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2020051;

--
-- AUTO_INCREMENT для таблицы `zadacha`
--
ALTER TABLE `zadacha`
  MODIFY `zadacha_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
