-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 14 2020 г., 15:39
-- Версия сервера: 5.7.29
-- Версия PHP: 7.2.29

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
-- Структура таблицы `opencart_category`
--

CREATE TABLE `opencart_category` (
  `id_category` int(15) NOT NULL,
  `glav_category` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `name_category` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_group_category` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `url_category` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `catalog_category` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nazvanie_papki_category` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `schet_category` int(15) NOT NULL,
  `schet_max_category` int(15) NOT NULL,
  `id_magazin` int(10) NOT NULL,
  `zapusk` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zapusk_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `opencart_category`
--

INSERT INTO `opencart_category` (`id_category`, `glav_category`, `name_category`, `attribute_group_category`, `url_category`, `catalog_category`, `nazvanie_papki_category`, `schet_category`, `schet_max_category`, `id_magazin`, `zapusk`, `zapusk_time`) VALUES
(4, '', 'Тельферы серии Т', 'электрические тали', '/catalog/telfery/type-t?page=', 'telferu', 'telfery-serii-t', 4, 3, 1, '', '2020-05-14 00:05:54'),
(8, '', 'Тельферы серии NV', 'электрические тали', '/catalog/telfery/type-t?page=', 'telferu', 'telfery-serii-t', 2, 3, 1, '', '2020-05-14 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `opencart_magazin`
--

CREATE TABLE `opencart_magazin` (
  `id_magazin` int(15) NOT NULL,
  `domain_magazin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url_skachivania_1_magazin` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `url_skachivania_2_magazin` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_product_magazin` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `url_image_product_magazin` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `cena_product_magazin` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `article_product_magazin` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `atribute_key_product_magazin` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `atribute_value_product_magazin` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `opencart_magazin`
--

INSERT INTO `opencart_magazin` (`id_magazin`, `domain_magazin`, `url_skachivania_1_magazin`, `url_skachivania_2_magazin`, `name_product_magazin`, `url_image_product_magazin`, `cena_product_magazin`, `article_product_magazin`, `atribute_key_product_magazin`, `atribute_value_product_magazin`) VALUES
(1, 'https://kranimport.ru', '//div[@class=&quot;wrap-page-goods&quot;]//div[@class=&quot;col-lg-6 col-md-6 col-sm-12 col-xs-12&quot;]//div[@class=&quot;col-lg-8 col-md-8 col-sm-9 col-xs-9&quot;]//a/@href', '', '//div[@class=&quot;page-slider&quot;]/h1[@class=&quot;page-title2&quot;]/text()', '//div[@class=&quot;page-slider&quot;]//li[@class=&quot;active-slide&quot;]/img/@src', '', '', '//div[@class=&quot;page-descr&quot;]//h3[position()&gt;1]/text()', '//div[@class=&quot;page-descr&quot;]//p/text()'),
(2, 'https://gortorgsnab.ru', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `poddomain`
--

CREATE TABLE `poddomain` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name_url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name_rus` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `indikator` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `poddomain`
--

INSERT INTO `poddomain` (`id`, `name`, `name_url`, `name_rus`, `indikator`) VALUES
(1, 'msk', '-v-moskve', ' в Москве', 0),
(53, 'spb', '-v-spb', ' в Питере, Санкт-Петербурге', 0);

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
  `nomer` int(5) NOT NULL DEFAULT '0',
  `date_index` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sape_url`
--

CREATE TABLE `sape_url` (
  `id_url` int(15) NOT NULL,
  `name_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_razdel` int(5) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sape_url`
--

INSERT INTO `sape_url` (`id_url`, `name_url`, `id_razdel`, `status`) VALUES
(120521954, 'http://dcsgvrg.ru', 3399345, 0),
(120521956, 'http://aegesh.ru', 3399345, 0),
(120521958, 'http://kjvaergeg.ru', 3399345, 0),
(120545023, 'http://sdvafb.ru', 3399466, 0),
(120547774, 'http://adcwrrwg.ru', 3399466, 0),
(120547775, 'http://sdvar.ru', 3399466, 0),
(120547776, 'http://sdvwvarearb.ru', 3399466, 0),
(120547778, 'http://adcwrrwg.ucoz.ru', 3399467, 0),
(120547779, 'http://sdvar.ucoz.ru', 3399467, 0),
(120547780, 'http://sdvwvarearb.ucoz.ru', 3399467, 0);

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
-- Индексы таблицы `opencart_category`
--
ALTER TABLE `opencart_category`
  ADD UNIQUE KEY `id_category` (`id_category`);

--
-- Индексы таблицы `opencart_magazin`
--
ALTER TABLE `opencart_magazin`
  ADD UNIQUE KEY `id_magazin` (`id_magazin`);

--
-- Индексы таблицы `poddomain`
--
ALTER TABLE `poddomain`
  ADD UNIQUE KEY `id` (`id`);

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
-- AUTO_INCREMENT для таблицы `opencart_category`
--
ALTER TABLE `opencart_category`
  MODIFY `id_category` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `opencart_magazin`
--
ALTER TABLE `opencart_magazin`
  MODIFY `id_magazin` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `poddomain`
--
ALTER TABLE `poddomain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

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
