-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Хост: 10.0.0.156:3306
-- Время создания: Май 13 2020 г., 10:01
-- Версия сервера: 10.1.44-MariaDB
-- Версия PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `freestyle_amost`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'PUjmWZbOaoI', 'kiSRcFfhblKxAgL', 'DuUFezZl', 'fwGseVnBoMJ', 'xWwQMqeEAbusThmV', 'TwbWarNBYmQpo', 'UzcyZukGBr', 20, 1, ''),
(2, 2, 'monEkxjlSMQ', 'fWMySsKBhrQZJx', 'qcPwTuByMUEDLI', 'DJxKhOaUMBSdo', 'DlTEPJLdUwXQ', 'jRkNqxueD', 'gBEmnkIDf', 20, 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate`
--

CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_activity`
--

CREATE TABLE `oc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_login`
--

CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_affiliate_login`
--

INSERT INTO `oc_affiliate_login` (`affiliate_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'het@gmail.com', '94.23.57.8', 1, '2020-04-15 00:10:43', '2020-04-15 00:10:43');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_transaction`
--

CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'dToSDn7zZJ9fvfh3mitxl9mJPt5dDWhUq9uyvzCKN9I7wqWA7uv40RW1pPGfPqeWCJLT28QRbUB22RSqmYb8iFK9sDPC0Wjd3H3tSKNR3iqM1OjBCh0vzQWoyGX8lwCGiqoprDmDtWqrJJMTvN8rtHBc4Oyvci8qFz1Jc6UwhSozh9dACh9qfBtKl02m04kUkyYtNA899yEgOW0b1F3zzAiPKR1GbyZlbLoVrPgxVA2452NUQJG28ptpEJRz8hhF', 1, '2018-09-24 12:14:11', '2018-09-24 12:14:11');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(21, 8, 0),
(20, 8, 0),
(22, 8, 0),
(19, 7, 0),
(18, 7, 0),
(17, 7, 0),
(16, 7, 0),
(15, 7, 0),
(14, 7, 0),
(13, 7, 0),
(12, 7, 0),
(23, 8, 0),
(24, 8, 0),
(25, 8, 0),
(26, 8, 0),
(27, 8, 0),
(28, 7, 0),
(29, 7, 0),
(30, 7, 0),
(31, 7, 0),
(32, 7, 0),
(33, 7, 0),
(34, 7, 0),
(35, 7, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(15, 1, 'Мощность, Вт'),
(14, 1, 'Напряжение'),
(13, 1, 'Длина троса, м'),
(12, 1, 'Грузоподъемность, т'),
(16, 1, 'Высота подъема, м'),
(17, 1, 'Диаметр троса , мм'),
(18, 1, 'Скорость навивки, м/мин'),
(19, 1, 'Тип'),
(20, 1, 'Вес, кг'),
(21, 1, 'Min расстояние между крюками, мм'),
(22, 1, 'Длина цепи, м'),
(23, 1, 'Высота подъема, м'),
(24, 1, 'Рычажная'),
(25, 1, 'Диаметр цепи, мм'),
(26, 1, 'Усилие, кг'),
(27, 1, 'Грузоподъемность, т'),
(28, 1, 'Исполнение'),
(29, 1, 'Грузоподъемность'),
(30, 1, 'Полиспастная система'),
(31, 1, 'Высота подема'),
(32, 1, 'Скорость подъема'),
(33, 1, 'Высота подъема'),
(34, 1, 'Скорость передвижения'),
(35, 1, 'Пролет');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(7, 0),
(8, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(7, 1, 'электрические тали'),
(8, 1, 'ручные тали');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(9, 'Тельферы', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(99, 9, 1, '001', '', 'catalog/telferu/1017417546.jpg', 0),
(100, 9, 1, '002', '', 'catalog/telferu/4068777.jpg', 0),
(101, 9, 1, '003', '', 'catalog/telferu/4772029ef31f875352676c760eb9f5a8.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(59, '', 0, 1, 1, 0, 1, '2019-01-18 17:04:48', '2020-04-01 12:14:49'),
(60, '', 0, 1, 1, 0, 1, '2019-12-13 17:21:29', '2020-04-01 12:14:40'),
(61, '', 0, 1, 1, 1, 1, '2020-05-08 01:58:53', '2020-05-08 01:58:53'),
(62, '', 0, 1, 1, 1, 1, '2020-05-13 08:04:53', '2020-05-13 08:04:53'),
(63, '', 0, 1, 1, 1, 1, '2020-05-13 08:05:24', '2020-05-13 08:05:24'),
(64, '', 0, 1, 1, 1, 1, '2020-05-13 08:05:42', '2020-05-13 08:05:42');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(60, 1, 'Тельферы (тали) 0.5 тонн', '&lt;p&gt;Тельферы (тали) 0.5 тонн&lt;br&gt;&lt;/p&gt;', 'Тали 0.5 тонн', 'Тельферы (тали) 0.5 тонн', ''),
(59, 1, 'Тельферы (тали) 1 тонна', '', 'Таль 1 тонна', 'Тельферы (тали) 1 тонна', ''),
(61, 1, 'Тельферы серии Т', '', 'Купить Тельферы серии Т по доступной цене', 'Купить Тельферы серии Т по доступной цене от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.', ''),
(62, 1, 'Тельферы серии МТ', '', 'Тельферы серии МТ купить в интернет-магазине по низкой цене', 'Тельферы серии МТ купить в интернет-магазине по низкой цене от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.', ''),
(63, 1, 'Тельферы серии BТ', '', 'Купить Тельферы серии BТ - доступные цены в нашем магазине', 'Купить Тельферы серии BТ - доступные цены в нашем магазине от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.', ''),
(64, 1, 'Тельферы серии BМТ', '', 'Купить Тельферы серии BМТ - цены, подбор и расценки', 'Купить Тельферы серии BМТ - цены, подбор и расценки от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(59, 59, 0),
(60, 60, 0),
(61, 61, 0),
(62, 62, 0),
(63, 63, 0),
(64, 64, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Рубль', 'RUB', '', 'р.', '0', 1.00000000, 1, '2020-05-08 08:26:06');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `code`, `date_added`) VALUES
(1, 1, 0, 1, 'PUjmWZbOaoI', 'kiSRcFfhblKxAgL', 'lawsonsharyl436@gmail.com', '7180075260', 'CkvtUBlgGrzbdWRm', 'dc4088b918041fbee25907cff425f0c186c4475d', 'xR9Xayjtl', NULL, NULL, 0, 1, '', '166.155.34.172', 1, 1, 0, '', '', '2020-01-18 01:33:46'),
(2, 1, 0, 1, 'monEkxjlSMQ', 'fWMySsKBhrQZJx', 'pauledwards7291@gmail.com', '3244881361', 'RbGaYLtzBxCp', '6d1db03f883e4018c5336241e9d7aa75bde1e596', 'bltkPcqMl', NULL, NULL, 0, 2, '', '187.137.56.103', 1, 1, 0, '', '', '2020-03-14 01:21:09');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '166.155.34.172', '2020-01-18 01:33:47'),
(2, 2, '187.137.56.103', '2020-03-14 01:21:11');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'joill@jkdihanie.ru', '93.124.83.53', 1, '2019-12-17 09:22:06', '2019-12-17 09:22:06'),
(2, 'golovinaira2110@gmail.com', '5.188.84.205', 1, '2019-12-17 11:19:49', '2019-12-17 11:19:49'),
(3, 'joill@jkdihanie.ru', '95.152.62.116', 1, '2019-12-17 16:15:23', '2019-12-17 16:15:23'),
(4, 'francyakovlev92@mail.ru', '188.187.190.64', 1, '2019-12-17 22:17:45', '2019-12-17 22:17:45'),
(5, 'joill@jkdihanie.ru', '93.124.94.150', 1, '2019-12-21 03:16:42', '2019-12-21 03:16:42'),
(6, 'vawcubcuffcahll@josephay905s.changeip.com', '61.142.72.150', 1, '2019-12-24 02:13:23', '2019-12-24 02:13:23'),
(7, 'mila.kozhevnikova.10@mail.ru', '93.124.94.150', 1, '2019-12-25 11:02:10', '2019-12-25 11:02:10'),
(8, 'vawcubcuffcahll@josephay905s.changeip.com', '192.145.205.74', 1, '2019-12-25 11:49:40', '2019-12-25 11:49:40'),
(9, 'vawcubcuffcahll@josephay905s.changeip.com', '45.168.168.9', 1, '2019-12-31 18:05:19', '2019-12-31 18:05:19'),
(10, 'makarenakena@yandex.com', '37.212.252.77', 1, '2020-01-03 12:13:47', '2020-01-03 12:13:47'),
(11, 'khaksuper@yandex.com', '178.120.249.95', 1, '2020-01-04 00:02:48', '2020-01-04 00:02:48'),
(12, 'inbox413@glmux.com', '195.154.182.89', 2, '2020-01-04 20:42:32', '2020-01-13 07:24:06'),
(13, 'peteb]ll@josephay905s.changeip.com', '94.23.61.181', 1, '2020-01-05 01:44:36', '2020-01-05 01:44:36'),
(14, 'leshamushtenko1983@rambler.ru', '185.82.218.34', 1, '2020-01-10 10:16:21', '2020-01-10 10:16:21'),
(15, 'kristinakaoeb0@bigmir.net', '62.210.202.34', 1, '2020-01-11 08:38:38', '2020-01-11 08:38:38'),
(16, 'chegodaikinsasha1972@rambler.ru', '195.123.238.62', 1, '2020-01-11 11:41:42', '2020-01-11 11:41:42'),
(17, 'dianochka_morozova_1988@list.ru', '62.210.202.34', 5, '2020-01-11 22:28:58', '2020-01-13 14:56:32'),
(18, 'vlozhenia@yandex.com', '37.214.238.128', 1, '2020-01-12 18:14:38', '2020-01-12 18:14:38'),
(19, 'frreenow@yandex.com', '178.120.216.184', 1, '2020-01-17 11:10:19', '2020-01-17 11:10:19'),
(21, 'natalyasoborova1975@rambler.ru', '184.170.131.166', 1, '2020-01-19 16:52:02', '2020-01-19 16:52:02'),
(22, 'nataliyarezvaya@rambler.ru', '195.123.212.87', 1, '2020-01-19 23:29:20', '2020-01-19 23:29:20'),
(23, 'natalyasoborova1975@rambler.ru', '194.34.134.142', 1, '2020-01-20 22:41:51', '2020-01-20 22:41:51'),
(24, 'gulrt@mail.ru', '93.124.39.2', 1, '2020-01-21 21:04:49', '2020-01-21 21:04:49'),
(25, 'makova180@gmail.com', '5.188.84.231', 1, '2020-01-22 00:03:52', '2020-01-22 00:03:52'),
(26, 'moskovskijdmitrij74@gmail.com', '5.188.84.231', 1, '2020-01-22 00:03:53', '2020-01-22 00:03:53'),
(27, 'fshi85@mail.ru', '93.124.39.2', 1, '2020-01-22 11:40:08', '2020-01-22 11:40:08'),
(28, 'mori.64@mail.ru', '93.124.39.2', 1, '2020-01-25 06:58:39', '2020-01-25 06:58:39'),
(29, 'kou76sabado@onet.pl', '213.242.13.211', 1, '2020-01-29 05:58:03', '2020-01-29 05:58:03'),
(30, 'anibartikinr4qnrot@mail.ru', '188.187.190.64', 1, '2020-02-02 11:26:46', '2020-02-02 11:26:46'),
(31, 'team@salon-ecigarette.com', '77.37.226.109', 1, '2020-02-02 23:27:07', '2020-02-02 23:27:07'),
(32, 'dasha.fomi.fomina@mail.ru', '93.124.39.2', 1, '2020-02-03 05:10:35', '2020-02-03 05:10:35'),
(33, 'dima.marin.2021@mail.ru', '80.95.45.238', 1, '2020-02-08 22:45:23', '2020-02-08 22:45:23'),
(34, 'semen_petrov82@bk.ru', '5.188.210.52', 1, '2020-02-11 11:20:13', '2020-02-11 11:20:13'),
(35, 'nush2021@mail.ru', '80.95.45.238', 1, '2020-02-11 17:24:20', '2020-02-11 17:24:20'),
(36, 'anton11.93@bk.ru', '5.188.210.52', 1, '2020-02-11 20:09:34', '2020-02-11 20:09:34'),
(37, 'biz42nov@yandex.ru', '77.83.173.126', 1, '2020-02-18 22:17:40', '2020-02-18 22:17:40'),
(38, 'marusyaa1973@mail.ru', '80.95.45.238', 1, '2020-02-22 22:35:59', '2020-02-22 22:35:59'),
(39, 'diman.popov.58@mail.ru', '5.188.210.87', 2, '2020-02-23 04:47:05', '2020-02-23 13:44:12'),
(40, 'dafer.bopresv@bk.ru', '5.188.210.87', 2, '2020-02-24 08:11:27', '2020-02-24 09:06:18'),
(41, 'olga.petrov92@mail.ru', '5.188.210.87', 1, '2020-02-26 09:40:17', '2020-02-26 09:40:17'),
(42, 'ivanpavlov_2021@mail.ru', '5.188.210.87', 2, '2020-02-26 21:28:48', '2020-02-26 22:52:02'),
(43, 'kanrenov1985@ukr.net', '176.36.88.53', 7, '2020-02-27 20:27:40', '2020-03-03 03:49:54'),
(44, 'dash_1962@mail.ru', '80.95.45.238', 1, '2020-02-27 21:46:15', '2020-02-27 21:46:15'),
(45, 'ivan.strelnikov.52364@mail.ru', '188.187.190.64', 1, '2020-02-28 06:32:12', '2020-02-28 06:32:12'),
(46, 'shops-ss@yandex.ru', '46.50.193.65', 1, '2020-02-29 08:06:33', '2020-02-29 08:06:33'),
(47, 'manya.degtyar@mail.ru', '80.95.45.238', 1, '2020-02-29 16:55:04', '2020-02-29 16:55:04'),
(48, 'edvard_bill_00@bk.ru', '5.188.210.87', 4, '2020-03-01 01:37:36', '2020-03-01 14:01:59'),
(49, 'erik.sidorov.2020@bk.ru', '188.187.190.64', 1, '2020-03-01 11:28:10', '2020-03-01 11:28:10'),
(50, 'domofon75@mail.ru', '188.187.190.64', 1, '2020-03-03 11:38:41', '2020-03-03 11:38:41'),
(51, 'v-top-10.ru@yandex.ru', '95.72.238.217', 1, '2020-03-11 23:32:34', '2020-03-11 23:32:34'),
(53, 'na.dya_ok.ol.ev.a@mail.ru', '62.67.212.40', 1, '2020-03-28 18:01:37', '2020-03-28 18:01:37'),
(54, 'marozov.2021@list.ru', '80.95.45.70', 1, '2020-04-01 06:00:30', '2020-04-01 06:00:30'),
(55, 'wwjx3@tvdetkamekfksmotr.site', '37.120.203.7', 1, '2020-04-03 08:12:21', '2020-04-03 08:12:21'),
(56, 'marozova1954@mail.ru', '80.95.45.89', 1, '2020-04-06 10:40:41', '2020-04-06 10:40:41'),
(57, 'oleg_pavlov_64@bk.ru', '5.188.210.87', 2, '2020-04-08 20:09:01', '2020-04-10 03:02:50'),
(58, 'filma16@mail.ru', '95.152.50.219', 2, '2020-04-08 23:13:02', '2020-04-09 06:34:57'),
(59, 'mbvfqxa@4serial.com', '185.244.217.138', 1, '2020-04-09 08:41:15', '2020-04-09 08:41:15'),
(60, 'reg.iste.r.2@thefmail.com', '80.89.234.142', 1, '2020-04-09 18:34:20', '2020-04-09 18:34:20'),
(61, 'na.d.ya_.o.k.o.l.e.va@mail.ru', '217.138.221.66', 1, '2020-04-10 10:46:32', '2020-04-10 10:46:32'),
(62, 'garikgeneretik@yandex.com', '37.212.77.154', 3, '2020-04-11 12:00:14', '2020-04-13 05:49:11'),
(63, 'nadya._ok.o.l.ev.a@mail.ru', '217.138.221.66', 1, '2020-04-12 15:41:44', '2020-04-12 15:41:44'),
(64, 'nad.ya._.oko.le.v.a@mail.ru', '217.138.221.66', 1, '2020-04-13 01:27:20', '2020-04-13 01:27:20'),
(65, 'nad.y.a_.o.ko.l.e.va.@mail.ru', '217.138.221.66', 1, '2020-04-13 05:25:52', '2020-04-13 05:25:52'),
(66, 'na.dy.a._okoleva@mail.ru', '217.138.221.66', 1, '2020-04-13 20:11:19', '2020-04-13 20:11:19'),
(67, 'garikgeneretik@yandex.com', '37.212.84.237', 1, '2020-04-14 01:18:38', '2020-04-14 01:18:38'),
(68, 'nadya._o.kole.v.a@mail.ru', '217.138.221.66', 1, '2020-04-14 06:32:13', '2020-04-14 06:32:13'),
(69, 'senamelkii212@gmail.com', '79.142.197.246', 1, '2020-04-14 09:51:57', '2020-04-14 09:51:57'),
(70, 'het@gmail.com', '94.23.57.8', 3, '2020-04-15 00:10:43', '2020-04-15 00:11:05'),
(71, 'garikgeneretik@yandex.com', '37.212.80.90', 1, '2020-04-15 00:44:24', '2020-04-15 00:44:24'),
(72, 'drugok1982@rambler.ru', '93.73.199.52', 1, '2020-04-17 04:02:12', '2020-04-17 04:02:12'),
(73, 'drugok1982@rambler.ru', '176.36.88.53', 1, '2020-04-17 21:54:14', '2020-04-17 21:54:14'),
(74, 'wiflassy@josephay905s.changeip.com', '94.23.61.181', 1, '2020-04-18 01:39:05', '2020-04-18 01:39:05'),
(75, 'garikgeneretik@yandex.com', '37.212.78.249', 1, '2020-04-19 21:29:53', '2020-04-19 21:29:53'),
(76, 'webuslugi2020@gmail.com', '89.33.195.95', 1, '2020-04-20 07:25:21', '2020-04-20 07:25:21'),
(77, 'sashgorl@mail.ru', '93.124.40.43', 1, '2020-04-23 10:44:43', '2020-04-23 10:44:43'),
(78, 'melecioshanaa@mail.ru', '92.37.215.200', 1, '2020-04-24 02:29:24', '2020-04-24 02:29:24'),
(79, '15rre@bk.ru', '5.188.210.87', 1, '2020-04-24 11:15:40', '2020-04-24 11:15:40'),
(80, 'lilliannanit@writeessay.guru', '46.56.64.67', 1, '2020-04-24 21:36:19', '2020-04-24 21:36:19'),
(81, 'berzpaol-msk@mauler.ru', '5.188.84.230', 1, '2020-04-25 05:26:44', '2020-04-25 05:26:44'),
(82, 'gorlm17@mail.ru', '95.152.63.13', 1, '2020-04-29 16:04:29', '2020-04-29 16:04:29'),
(83, 'yury.dodov@bk.ru', '5.188.210.87', 2, '2020-04-30 08:22:17', '2020-05-12 13:26:22'),
(84, 'proshchkina96@mail.ru', '93.124.78.229', 1, '2020-05-10 05:11:22', '2020-05-10 05:11:22');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES
(1, 'voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'theme_default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'module', 'html'),
(32, 'module', 'filter'),
(33, 'feed', 'yandex_sitemap'),
(34, 'module', 'store'),
(35, 'feed', 'turbo_rss'),
(36, 'payment', 'yandex_money'),
(38, 'feed', 'yandex_yml'),
(39, 'module', 'microdatapro'),
(40, 'module', 'newsblog_articles');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'Зона НДС', 'Облагаемые НДС', '2014-09-09 11:48:13', '2014-05-21 22:30:20');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(5, 1, 'Условия соглашения', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;', 'Условия соглашения', 'Описание условия соглашения на нашем сайте', ''),
(3, 1, 'Политика Безопасности', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;', 'Политика Безопасности', 'Описание политики безопасности на нашем сайте', ''),
(6, 1, 'Доставка', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;', 'Доставка', 'Описание доставки на нашем сайте', ''),
(4, 1, 'О нас', '&lt;p&gt;&lt;b&gt;Адрес:&lt;/b&gt;&lt;/p&gt;&lt;p&gt;г. Москва,&amp;nbsp;Нагатинская улица, 16Ас28&lt;/p&gt;', 'О нас', 'Адрес компании', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(6, 0, 0),
(3, 0, 0),
(5, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru-ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru-ru.png', 'russian', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(115, 1, 'microdatapro', 'content_bottom', 0),
(114, 1, 'html.32', 'content_top', 3),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2),
(100, 6, 'microdatapro', 'content_bottom', 3274),
(101, 10, 'microdatapro', 'content_bottom', 3274),
(102, 3, 'microdatapro', 'content_bottom', 3274),
(103, 7, 'microdatapro', 'content_bottom', 3274),
(104, 12, 'microdatapro', 'content_bottom', 3274),
(105, 8, 'microdatapro', 'content_bottom', 3274),
(106, 4, 'microdatapro', 'content_bottom', 3274),
(113, 1, 'slideshow.27', 'content_top', 0),
(108, 11, 'microdatapro', 'content_bottom', 3274),
(109, 5, 'microdatapro', 'content_bottom', 3274),
(110, 2, 'microdatapro', 'content_bottom', 3274),
(111, 13, 'microdatapro', 'content_bottom', 3274),
(112, 9, 'microdatapro', 'content_bottom', 3274),
(116, 1, 'newsblog_articles.34', 'content_bottom', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(62, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `description`, `image`, `sort_order`) VALUES
(12, 'MAGNUS PROFI', 'MAGNUS PROFI - грузовые тельферы и тали', '', 0),
(13, 'ROCKFORCE', 'ROCKFORCE - грузовые тельферы и тали', '', 0),
(14, 'Sturm', 'Sturm - грузовые тельферы и тали', '', 0),
(15, 'Энергомаш', 'Энергомаш - грузовые тельферы и тали', '', 0),
(16, 'СОРОКИН', 'СОРОКИН - грузовые тельферы и тали', '', 0),
(17, 'EURO-LIFT', 'EURO-LIFT - грузовые тельферы и тали', '', 0),
(18, 'Балканско ехо', 'Балканско ехо - грузовые тельферы и тали', '', 0),
(19, 'Zitrek', 'Zitrek - грузовые тельферы и тали', '', 0),
(20, 'TOR', 'TOR - грузовые тельферы и тали', '', 0),
(21, 'DENZEL', 'DENZEL - грузовые тельферы и тали', '', 0),
(22, 'EINHELL', 'EINHELL - грузовые тельферы и тали', '', 0),
(23, 'PRORAB', 'PRORAB - грузовые тельферы и тали', '', 0),
(24, 'OLYMP', 'OLYMP - грузовые тельферы и тали', '', 0),
(25, 'ЗУБР', 'ЗУБР - грузовые тельферы и тали', '', 0),
(26, 'Калибр', 'Калибр - грузовые тельферы и тали', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu`
--

CREATE TABLE `oc_menu` (
  `menu_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu_description`
--

CREATE TABLE `oc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu_module`
--

CREATE TABLE `oc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 'FIX HTTPS', 'fix_https', 'admin@opencartadmin.com | http://forum.opencart.pro/profile/185-', '2.3.7', 'http://opencartadmin.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n    <name>FIX HTTPS</name>\r\n    <version>2.3.7</version>\r\n    <author>admin@opencartadmin.com | http://forum.opencart.pro/profile/185-yoda/</author>\r\n    <code>fix_https</code>\r\n    <link>http://opencartadmin.com</link>\r\n    <file path=\"system/library/response.php\" error=\"skip\">\r\n    <operation error=\"skip\">\r\n        <search><![CDATA[echo $output;]]></search>\r\n        <add position=\"before\"><![CDATA[\r\n			if ((isset($_SERVER[\'HTTPS\']) && ($_SERVER[\'HTTPS\'] == \'on\' || $_SERVER[\'HTTPS\'] == \'1\' || $_SERVER[\'HTTPS\'])) || (!empty($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) && (strtolower($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) == \'https\') || (!empty($_SERVER[\'HTTP_X_FORWARDED_SSL\']) && $_SERVER[\'HTTP_X_FORWARDED_SSL\'] == \'on\'))) {\r\n				$output = str_replace(HTTP_SERVER, HTTPS_SERVER, $output);\r\n			} else {\r				$output = str_replace(HTTPS_SERVER, HTTP_SERVER, $output);\r\n			}\r\n    ]]></add>\r\n    </operation>\r\n    </file>\r\n    <file path=\"system/library/cache.php\" error=\"skip\">\r\n    <operation error=\"skip\">\r\n        <search><![CDATA[class Cache {]]></search>\r\n        <add position=\"after\"><![CDATA[\r\nprivate $ssl = \'http_\';\r\n    ]]></add>\r\n    </operation>\r\n    <operation error=\"skip\">\r\n        <search regex=\"true\"><![CDATA[~public function __construct(.*?)\\{~]]></search>\r\n        <add position=\"replace\"><![CDATA[\r\n        public function __construct$1{\r\n		if ((isset($_SERVER[\'HTTPS\']) && ($_SERVER[\'HTTPS\'] == \'on\' || $_SERVER[\'HTTPS\'] == \'1\' || $_SERVER[\'HTTPS\'])) || (!empty($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) && (strtolower($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) == \'https\') || (!empty($_SERVER[\'HTTP_X_FORWARDED_SSL\']) && $_SERVER[\'HTTP_X_FORWARDED_SSL\'] == \'on\'))) {\r\n			$this->ssl = \'https_\';\r\n		}\r\n\r\n    ]]></add>\r\n    </operation>\r\n    <operation error=\"skip\">\r\n        <search><![CDATA[return]]></search>\r\n        <add position=\"before\"><![CDATA[\r\n		$key = $this->ssl.$key;\r\n    ]]></add>\r\n    </operation>\r\n    </file>\r\n</modification>', 1, '2020-03-31 11:05:13'),
(2, 'Y.CMS 2.0 for Opencart 2.0.x - 2.3.x', 'ycms.2.0', 'Yandex.Money', '1.3.3', '', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n    <name>Y.CMS 2.0 for Opencart 2.0.x - 2.3.x</name>\r\n    <code>ycms.2.0</code>\r\n    <version>1.3.3</version>\r\n    <author>Yandex.Money</author>\r\n    <!-- Вставка кнопки в историю заказов-->\r\n    <file path=\"catalog/controller/account/order.php\">\r\n        <operation>\r\n            <search><![CDATA[// History]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            $prefix = (version_compare(VERSION, \'2.3.0\', \'>=\')) ? \'extension/\' : \'\';\r\n            $this->language->load($prefix . \'payment/yandex_money\');\r\n            if ($order_info[\'payment_method\'] == $this->language->get(\'kassa_title\') || $order_info[\'payment_method\'] == $this->language->get(\'p2p_title\')) {\r\n               $this->session->data[\'order_id\'] = $this->request->get[\'order_id\'];\r\n               $data[\'yandex_money\'] = $this->load->controller($prefix . \"payment/yandex_money\");\r\n            }]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/view/theme/*/template/account/order_info.tpl\">\r\n        <operation>\r\n            <search><![CDATA[</tfoot>]]></search>\r\n            <add position=\"before\"><![CDATA[<?php if (isset($yandex_money)) {?><tr>\r\n            <td colspan=\"<?php if ($products) {echo \"6\";} else {echo \"5\";} ?>\">\r\n               <?php echo $yandex_money; ?>\r\n            </td></tr><?php } ?>]]></add>\r\n        </operation>\r\n    </file>\r\n    <!-- загружаем вместе с заказами код способа оплаты -->\r\n    <file path=\"admin/model/sale/order.php\">\r\n        <operation>\r\n            <search regex=\"true\"><![CDATA[/\\$query\\s=\\s\\$this->db->query\\(\\$sql\\);\\s+return\\s\\$query->rows;/]]></search>\r\n            <add><![CDATA[\r\n        $query = $this->db->query($sql);\r\n\r\n        $result = array();\r\n        $orderIds = array();\r\n        foreach ($query->rows as $record) {\r\n            if ($record[\'payment_code\'] === \'yandex_money\') {\r\n                $orderIds[] = $record[\'order_id\'];\r\n            }\r\n            $result[$record[\'order_id\']] = $record;\r\n        }\r\n        if (!empty($orderIds)) {\r\n            $sql = \'SELECT `order_id`, `payment_id`, `status` FROM `\' . DB_PREFIX . \'ya_money_payment` WHERE `order_id` IN (\' . implode(\',\', $orderIds) . \')\';\r\n            $recordSet = $this->db->query($sql);\r\n            foreach ($recordSet->rows as $record) {\r\n                $result[$record[\'order_id\']][\'yandex_money_payment_id\'] = $record[\'payment_id\'];\r\n                $result[$record[\'order_id\']][\'yandex_money_payment_status\'] = $record[\'status\'];\r\n            }\r\n            $sql = \'SELECT `order_id`, `refund_id`, `status`, `amount` FROM `\' . DB_PREFIX . \'ya_money_refunds` WHERE `order_id` IN (\' . implode(\',\', $orderIds) . \') AND `status` <> \\\'canceled\\\'\';\r\n            $recordSet = $this->db->query($sql);\r\n            foreach ($recordSet->rows as $record) {\r\n                if (!isset($result[$record[\'order_id\']][\'refund_amount\'])) {\r\n                    $result[$record[\'order_id\']][\'refund_amount\'] = 0;\r\n                }\r\n                $result[$record[\'order_id\']][\'refund_amount\'] += $record[\'amount\'];\r\n            }\r\n        }\r\n\r\n        return array_values($result);\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"true\"><![CDATA[~o.date_added, o.date_modified FROM~]]></search>\r\n            <add><![CDATA[o.date_added, o.date_modified, o.payment_code, o.email, o.order_status_id FROM]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"admin/language/{english,russian,en-gb,ru-ru}/sale/order.php\">\r\n        <operation>\r\n            <search regex=\"true\"><![CDATA[~(\\$_\\[\\\'text_add\\\'\\])~]]></search>\r\n            <add><![CDATA[\r\n                $_[\'button_invoice_kassa\'] = \'Выставление счета\';\r\n                $_[\'text_add\']\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"system/library/mail.php\">\r\n        <operation>\r\n            <search><![CDATA[basename(urlencode($attachment))]]></search>\r\n            <add><![CDATA[urlencode(basename($attachment))]]></add>\r\n        </operation>\r\n    </file>\r\n    <!-- -->\r\n    <file path=\"admin/controller/sale/order.php\">\r\n        <operation>\r\n            <search><![CDATA[$results = $this->model_sale_order->getOrders($filter_data);]]></search>\r\n            <add position=\"after\">\r\n                $prefix = (version_compare(VERSION, \'2.3.0\', \'>=\')) ? \'extension/\' : \'\';\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[\'shipping_code\' => $result[\'shipping_code\'],]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                \'payment_code\'   => $this->config->get(\'yandex_money_kassa_enabled\') && $this->config->get(\'yandex_money_kassa_invoice\') ? $result[\'payment_code\'] : \'\',\r\n                \'payment_status\' => (isset($result[\'yandex_money_payment_status\']) ? $result[\'yandex_money_payment_status\'] : \'\'),\r\n                \'email\'          => (isset($result[\'email\']) && $this->config->get(\'yandex_money_kassa_enabled\')) ? $result[\'email\'] : \'\',\r\n                \'refund_amount\'  => (isset($result[\'refund_amount\']) ? $result[\'refund_amount\'] : \'\'),\r\n                \'refund_url\'     => (isset($result[\'payment_code\']) && $result[\'payment_code\'] == \'yandex_money\') ? $this->url->link($prefix . \'payment/yandex_money/refund\', \'order_id=\'.$result[\'order_id\'].\'&token=\'.$this->session->data[\'token\'], true) : \'\',\r\n                \'capture_url\'    => (isset($result[\'payment_code\']) && $result[\'payment_code\'] == \'yandex_money\') ? $this->url->link($prefix . \'payment/yandex_money/capture\', \'order_id=\'.$result[\'order_id\'].\'&token=\'.$this->session->data[\'token\'], true) : \'\',\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[$data[\'button_add\'] = $this->language->get(\'button_add\');]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                $data[\'yandex_money_kassa_enabled\'] = $this->config->get(\'yandex_money_kassa_enabled\');\r\n                if ($this->config->get(\'yandex_money_kassa_enabled\')) {\r\n                    $data[\'button_invoice_kassa\'] = $this->language->get(\'button_invoice_kassa\');\r\n                    $data[\'store_url\'] = $this->request->server[\'HTTPS\'] ? HTTPS_CATALOG : HTTP_CATALOG;\r\n                    $data[\'prefix\'] = $prefix;\r\n                }\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"admin/view/template/sale/order_list.tpl\">\r\n        <operation>\r\n            <search regex=\"true\"><![CDATA[~(\\<\\/i\\>\\<\\/)(button|a)(\\>)(\\<\\/td\\>)~]]></search>\r\n            <add><![CDATA[$1$2$3\r\n                <?php if (isset($order[\'payment_code\']) && $order[\'payment_code\'] == \'yandex_money\') : ?>\r\n                <a href=\"javascript://\" data-toggle=\"tooltip\" title=\"Отправить счёт на e-mail\" class=\"btn btn-success invoice-button\"\r\n                    data-order_id=\"<?php echo $order[\'order_id\']; ?>\" data-customer=\"<?php echo $order[\'customer\']; ?>\" data-email=\"<?php echo $order[\'email\']; ?>\">\r\n                    <i class=\"fa fa-envelope\"></i>\r\n                </a>\r\n                <?php endif; ?>\r\n                <?php if (isset($order[\'payment_status\']) && $order[\'payment_status\'] === \'succeeded\') : ?>\r\n                <a href=\"<?php echo $order[\'refund_url\']; ?>\" data-toggle=\"tooltip\" title=\"Возвраты\" class=\"btn btn-success\">\r\n                    <i class=\"fa fa-repeat\"></i>\r\n                </a>\r\n                <?php endif; ?>\r\n                <?php if (isset($order[\'payment_status\']) && $order[\'payment_status\'] === \'waiting_for_capture\') : ?>\r\n                <a href=\"<?php echo $order[\'capture_url\']; ?>\" data-toggle=\"tooltip\" title=\"Подтверждение платежа\" class=\"btn btn-success\">\r\n                    <i class=\"fa fa-check\"></i>\r\n                </a>\r\n                <?php endif; ?>$4]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[$(\'input[name^=\\\'selected\\\']:first\').trigger(\'change\');]]></search>\r\n            <add position=\"after\"><![CDATA[//\r\n            <?php if($yandex_money_kassa_enabled):?>\r\n            jQuery(\'.invoice-button\').click(function(e) {\r\n                var node = this;\r\n                var text = \'Вы действительно хотите отправить счёт пользователю \' + node.dataset.customer + \' на адрес \' + node.dataset.email + \'?\';\r\n                if (confirm(text)) {\r\n                    jQuery.ajax({\r\n                        url: \'<?php echo $store_url; ?>admin/index.php?route=<?php echo $prefix;?>payment/yandex_money/sendmail&token=<?php echo $token; ?>&order_id=\' + node.dataset.order_id,\r\n                        dataType: \'json\',\r\n                        crossDomain: true,\r\n                        beforeSend: function() {\r\n                            jQuery(node).button(\'loading\');\r\n                        },\r\n                        complete: function() {\r\n                            jQuery(node).button(\'reset\');\r\n                        },\r\n                        success: function(json_main) {\r\n                            jQuery(\'.alert\').remove();\r\n                            if (json_main[\'error\']) {\r\n                                $(\'#content > .container-fluid\').prepend(\'<div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> \' + json_main[\'error\'] + \' <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button></div>\');\r\n                            }\r\n                            if (json_main[\'success\']) {\r\n                                $(\'#content > .container-fluid\').prepend(\'<div class=\"alert alert-success\"><i class=\"fa fa-check-circle\"></i> \' + json_main[\'success\'] + \' <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button></div>\');\r\n                                var token = \'\';\r\n                                $.ajax({\r\n                                    url: \'<?php echo $store_url; ?>index.php?route=api/login\',\r\n                                    type: \'post\',\r\n                                    data: \'key=<?php echo empty($api_key)?\'\':$api_key; ?>\',\r\n                                    dataType: \'json\',\r\n                                    crossDomain: true,\r\n                                    success: function(json) {\r\n                                        if (json[\'error\']) {\r\n                                            if (json[\'error\'][\'key\']) {\r\n                                                $(\'#content > .container-fluid\').prepend(\'<div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> \' + json[\'error\'][\'key\'] + \' <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button></div>\');\r\n                                            }\r\n                                            if (json[\'error\'][\'ip\']) {\r\n                                                $(\'#content > .container-fluid\').prepend(\'<div class=\"alert alert-danger\"><i class=\"fa fa-exclamation-circle\"></i> \' + json[\'error\'][\'ip\'] + \' <button type=\"button\" id=\"button-ip-add\" data-loading-text=\"<?php echo $text_loading; ?>\" class=\"btn btn-danger btn-xs pull-right\"><i class=\"fa fa-plus\"></i> <?php echo $button_ip_add; ?></button></div>\');\r\n                                            }\r\n                                        }\r\n                                        if (json[\'token\']) {\r\n                                            token = json[\'token\'];\r\n                                            $.ajax({\r\n                                                url: \'<?php echo $store_url; ?>index.php?route=api/order/history&token=\'+ token +\'&order_id=\' + $(node).val(),\r\n                                                type: \'post\',\r\n                                                data: \'order_status_id=1&notify=0&override=0&append=0&comment=\'+json_main[\'success\'],\r\n                                                dataType: \'json\',\r\n                                                error: function(xhr, ajaxOptions, thrownError) {\r\n                                                    alert(thrownError + \" \" + xhr.statusText + \" \" + xhr.responseText);\r\n                                                }\r\n                                            });\r\n                                        }\r\n                                    },\r\n                                    error: function(xhr, ajaxOptions, thrownError) {\r\n                                        alert(thrownError + \" \" + xhr.statusText + \" \" + xhr.responseText);\r\n                                    }\r\n                                });\r\n                            }\r\n                        },\r\n                        error: function(xhr, ajaxOptions, thrownError) {\r\n                            alert(thrownError + \" \" + xhr.statusText + \" \" + xhr.responseText);\r\n                        }\r\n                    });\r\n                }\r\n            });\r\n             <?php endif;?>\r\n            //\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/controller/common/footer.php\">\r\n        <operation error=\"skip\">\r\n            <search><![CDATA[$data[\'newsletter\'] = $this->url->link(\'account/newsletter\']]></search>\r\n            <add position=\"after\"><![CDATA[$data[\'yandex_metrika\'] = $this->config->get(\'yandex_money_metrika_code\') ? html_entity_decode($this->config->get(\'yandex_money_metrika_code\'), ENT_QUOTES, \'UTF-8\') : \'\';\r\n            $data[\'yandex_money_metrika_active\'] = $this->config->get(\'yandex_money_metrika_active\') ? true : false;\r\n            $data[\'yandex_money_kassa_show_in_footer\'] = $this->config->get(\'yandex_money_kassa_enabled\') && $this->config->get(\'yandex_money_kassa_show_in_footer\');\r\n            $data[\'yandex_money_product_info_url\'] = \'index.php?route=\'.(version_compare(VERSION, \"2.3.0\", \'>=\')?\"extension/\":\"\").\'payment/yandex_money/productInfo\';\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/controller/checkout/success.php\">\r\n        <operation>\r\n            <search><![CDATA[if (isset($this->session->data[\'order_id\'])) {]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                $prefix = (version_compare(VERSION, \"2.3.0\", \'>=\'))?\"extension/\":\"\";\r\n                $this->load->model($prefix.\'payment/yandex_money\');\r\n                $data[\'script_order\'] = $this->{\'model_\'.str_replace(\"/\", \"_\", $prefix).\'payment_yandex_money\'}->getMetricsJavaScript($this->session->data[\'order_id\']);\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/view/theme/*/template/common/success.tpl\">\r\n        <operation>\r\n            <search position=\"replace\"><![CDATA[<?php echo $footer; ?>]]></search>\r\n            <add><![CDATA[\r\n            <?php if (isset($script_order)) { echo $script_order; } ?>\r\n            <?php echo $footer; ?>\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/view/theme/*/template/common/footer.tpl\">\r\n        <operation>\r\n            <search><![CDATA[<footer]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            <?php if (isset($yandex_money_metrika_active) && $yandex_money_metrika_active){ ?>\r\n                <?php echo $yandex_metrika; ?>\r\n                <script type=\"text/javascript\">\r\n                    window.dataLayer = window.dataLayer || [];\r\n                    function sendEcommerceAdd(id, quantity) {\r\n                       $.ajax({\r\n                            url: \"<?= $yandex_money_product_info_url; ?>\",\r\n                            type: \'post\',\r\n                            data: \'id=\' + id,\r\n                            dataType: \'json\',\r\n                            success: function(json) {\r\n                                json.quantity = quantity;\r\n                                dataLayer.push({ecommerce: {add: {products: [json]}}});\r\n                            }\r\n                        });\r\n                    }\r\n                    $(window).on(\"load\", function () {\r\n                        var opencartCartAdd = cart.add;\r\n                        cart.add = function (product_id, quantity) {\r\n                            opencartCartAdd(product_id, quantity);\r\n                            sendEcommerceAdd(product_id, typeof(quantity) !== \'undefined\' ? parseInt(quantity) : 1);\r\n                        };\r\n                        $(\'#button-cart\').on(\'click\', function() {\r\n                            sendEcommerceAdd($(\'#product input[name=\"product_id\"]\').val(), parseInt($(\'#product input[name=\"quantity\"]\').val()));\r\n                        });\r\n                    });\r\n                </script>\r\n            <?php } ?>]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[<p><?php echo $powered; ?></p>]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            <?php if ($yandex_money_kassa_show_in_footer) : ?>\r\n            <p><a href=\"https://kassa.yandex.ru/?_openstat=promo;merchants;opencart2\">Работает Яндекс.Касса</a></p>\r\n            <?php endif; ?>\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"admin/view/template/sale/order_info.tpl\">\r\n        <operation>\r\n            <search><![CDATA[$(\'.alert\').remove();]]></search>\r\n            <add><![CDATA[ ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[$(\'#button-history\').on(\'click\', function() {]]></search>\r\n            <add position=\"after\">\r\n\r\n            </add>\r\n        </operation>\r\n    </file>\r\n    <!-- Вставка скрипта кнопки \"Заплатить по частям\" -->\r\n    <file path=\"catalog/view/theme/*/template/common/header.tpl\" error=\"skip\">\r\n        <operation>\r\n            <search><![CDATA[</head]]></search>\r\n            <add position=\"before\">\r\n                <![CDATA[<script src=\"https://static.yandex.net/kassa/pay-in-parts/ui/v1/\"></script>]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"catalog/controller/product/product.php\" error=\"skip\">\r\n        <operation>\r\n            <search trim=\"true\"><![CDATA[if ($product_info) {]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                $enableCreditInEpl = $this->config->get(\'yandex_money_kassa_payment_mode\') === \'kassa\'\r\n                    && $this->config->get(\'yandex_money_kassa_use_installments_button\');\r\n                $enableCreditInShopSide = $this->config->get(\'yandex_money_kassa_payment_mode\') === \'shop\'\r\n                    && $this->config->get(\'yandex_money_kassa_payment_method_installments\');\r\n                $showInstallmentsBlock = $this->config->get(\'yandex_money_kassa_enabled\') && ($enableCreditInEpl || $enableCreditInShopSide)\r\n                    && $this->config->get(\'yandex_money_kassa_add_installments_block\');\r\n\r\n                $data[\'yamoney_showInstallmentsBlock\'] = $showInstallmentsBlock;\r\n                $data[\'yamoney_shop_id\'] = $this->config->get(\'yandex_money_kassa_shop_id\');\r\n                $data[\'yamoney_language_code\'] = $this->language->get(\'code\');\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search trim=\"true\">\r\n                <![CDATA[$data[\'price\'] = $this->currency->format($this->tax->calculate($product_info[\'price\'], $product_info[\'tax_class_id\'], $this->config->get(\'config_tax\')), $this->session->data[\'currency\']);]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                $data[\'cost\'] = sprintf(\'%.2f\',$this->tax->calculate($product_info[\'price\'], $product_info[\'tax_class_id\'], $this->config->get(\'config_tax\')));\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"catalog/view/theme/*/template/product/product.tpl\" error=\"skip\">\r\n        <operation>\r\n            <search><![CDATA[<?php if ($options) { ?>]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                <?php if($yamoney_showInstallmentsBlock): ?>\r\n                    <ul class=\"list-unstyled\"><li class=\"installments-info\"></li></ul>\r\n                <?php endif; ?>\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[<?php echo $footer; ?>]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                <?php if($yamoney_showInstallmentsBlock): ?>\r\n                    <script>\r\n                        if (typeof YandexCheckoutCreditUI !== \"undefined\") {\r\n                            const yamoneyCheckoutCreditUI = YandexCheckoutCreditUI({\r\n                                shopId: \'<?= $yamoney_shop_id;?>\',\r\n                                sum: \'<?= $cost;?>\',\r\n                                language: \'<?= $yamoney_language_code;?>\'\r\n                            });\r\n                            const yamoneyCheckoutCreditButton = yamoneyCheckoutCreditUI({\r\n                                type: \'info\',\r\n                                domSelector: \'.installments-info\'\r\n                            });\r\n                        }\r\n                    </script>\r\n                <?php endif; ?>\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[<?php echo $footer; ?>]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                <script type=\"text/javascript\"><!--\r\n                    $(window).on(\"load\", function () {\r\n                        window.dataLayer = window.dataLayer || [];\r\n                        dataLayer.push({ecommerce: {detail: {products: [{\r\n                            id: \"<?= $product_id; ?>\",\r\n                            name: \"<?= $heading_title; ?>\",\r\n                            price: parseFloat(\"0\"+\"<?= $price ?: 0; ?>\".replace(/[^.\\d]+/g,\"\")),\r\n                            brand: \"<?= $manufacturer; ?>\",\r\n                            variant: \"<?= $model; ?>\"\r\n                        }]}}});\r\n                    });\r\n                //--></script>\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"catalog/model/checkout/order.php\">\r\n        <operation>\r\n            <search><![CDATA[// Update the DB with the new statuses]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                $prefix = (version_compare(VERSION, \'2.3.0\', \'>=\')) ? \'extension/\' : \'\';\r\n                $this->load->model($prefix.\'payment/yandex_money\');\r\n\r\n                if ($prefix === \'\') {\r\n                    $model = $this->model_payment_yandex_money;\r\n                } else {\r\n                    $model = $this->model_extension_payment_yandex_money;\r\n                }\r\n\r\n                if (method_exists($model, \'hookOrderStatusChange\')) {\r\n                    $model->hookOrderStatusChange($order_id, $order_status_id);\r\n                }\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n</modification>', 1, '2020-04-14 23:24:16'),
(3, 'MicrodataPro', 'MicrodataPro', 'opencart2x.ru', '4.0.2.3', 'https://opencart2x.ru', '<modification>\n	<name>MicrodataPro</name>\n	<code>MicrodataPro</code>\n	<version>4.0.2.3</version>\n	<link>https://opencart2x.ru</link>\n	<author>opencart2x.ru</author>\n	\n	<file path=\"system/library/document.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[public function setTitle($title) {]]></search>\n            <add position=\"before\"><![CDATA[\n				private $tc_og;\n				public function setTc_og($data){$this->tc_og = $data;}\n				public function getTc_og(){return $this->tc_og;}\n			]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"catalog/controller/common/header.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$data[\'title\'] = $this->document->getTitle();]]></search>\n            <add position=\"after\"><![CDATA[$data[\'tc_og\'] = $this->document->getTc_og();]]></add>\n        </operation>\n	</file>\n	<file path=\"catalog/view/theme/*/template/common/header.tpl\">\n        <operation error=\"skip\">\n            <search><![CDATA[</head>]]></search>\n            <add position=\"before\"><![CDATA[<?php echo $tc_og; ?>]]></add>\n        </operation>\n        <operation error=\"skip\">\n            <search><![CDATA[<html]]></search>\n            <add position=\"replace\"><![CDATA[<html prefix=\"og: http://ogp.me/ns#\"]]></add>\n        </operation>		\n	</file>		\n</modification>', 1, '2020-04-21 20:14:55'),
(4, 'NewsBlog - create unlimited categories with articles', 'newsblog', 'netruxa', '20171002 for opencart 2.3.x', 'http://nedorogoi-internet-magazin.ru/opencart/', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n    <name>NewsBlog - create unlimited categories with articles</name>\r\n    <code>newsblog</code>\r\n    <version>20171002 for opencart 2.3.x</version>\r\n    <author>netruxa</author>\r\n    <link>http://nedorogoi-internet-magazin.ru/opencart/</link>\r\n  <file path=\"admin/controller/common/column_left.php\">\r\n    <operation>\r\n      <search><![CDATA[// Catalog]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      		$newsblog = array();\r\n\r\n			if ($this->user->hasPermission(\'access\', \'newsblog/category\')) {\r\n				$newsblog[] = array(\r\n					\'name\'	   => $this->language->get(\'text_newsblog_category\'),\r\n					\'href\'     => $this->url->link(\'newsblog/category\', \'token=\' . $this->session->data[\'token\'], true),\r\n					\'children\' => array()\r\n				);\r\n			}\r\n\r\n			if ($this->user->hasPermission(\'access\', \'newsblog/article\')) {\r\n				$newsblog[] = array(\r\n					\'name\'	   => $this->language->get(\'text_newsblog_article\'),\r\n					\'href\'     => $this->url->link(\'newsblog/article\', \'token=\' . $this->session->data[\'token\'], true),\r\n					\'children\' => array()\r\n				);\r\n			}\r\n\r\n			if ($newsblog) {\r\n				$data[\'menus\'][] = array(\r\n					\'id\'       => \'menu-newsblog\',\r\n					\'icon\'	   => \'fa-newspaper-o\',\r\n					\'name\'	   => $this->language->get(\'text_newsblog\'),\r\n					\'href\'     => \'\',\r\n					\'children\' => $newsblog\r\n				);\r\n			}\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"admin/language/ru-ru/common/column_left.php\">\r\n    <operation>\r\n      <search><![CDATA[$_[\'text_catalog\']]]></search>\r\n      <add position=\"before\"><![CDATA[$_[\'text_newsblog\'] = \'NewsBlog материалы\';$_[\'text_newsblog_category\'] = \'Список категорий\';$_[\'text_newsblog_article\'] = \'Список материалов\';]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"admin/language/en-gb/common/column_left.php\">\r\n    <operation>\r\n      <search><![CDATA[$_[\'text_catalog\']]]></search>\r\n      <add position=\"before\"><![CDATA[$_[\'text_newsblog\'] = \'NewsBlog articles\';$_[\'text_newsblog_category\'] = \'Category list\';$_[\'text_newsblog_article\'] = \'Item list\';]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/controller/common/column_left.php\">\r\n    <operation>\r\n      <search><![CDATA[if ($route == \'information/information\' && isset($this->request->get[\'information_id\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      if ($route == \'newsblog/category\' && isset($this->request->get[\'newsblog_path\'])) {\r\n			$this->load->model(\'newsblog/category\');\r\n\r\n			$path = explode(\'_\', (string)$this->request->get[\'newsblog_path\']);\r\n\r\n			$layout_id = $this->model_newsblog_category->getCategoryLayoutId(end($path));\r\n		}\r\n\r\n		if ($route == \'newsblog/article\' && isset($this->request->get[\'newsblog_article_id\'])) {\r\n			$this->load->model(\'newsblog/article\');\r\n\r\n			$layout_id = $this->model_newsblog_article->getArticleLayoutId($this->request->get[\'newsblog_article_id\']);\r\n		}\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/controller/common/column_right.php\">\r\n    <operation>\r\n      <search><![CDATA[if ($route == \'information/information\' && isset($this->request->get[\'information_id\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      if ($route == \'newsblog/category\' && isset($this->request->get[\'newsblog_path\'])) {\r\n			$this->load->model(\'newsblog/category\');\r\n\r\n			$path = explode(\'_\', (string)$this->request->get[\'newsblog_path\']);\r\n\r\n			$layout_id = $this->model_newsblog_category->getCategoryLayoutId(end($path));\r\n		}\r\n\r\n		if ($route == \'newsblog/article\' && isset($this->request->get[\'newsblog_article_id\'])) {\r\n			$this->load->model(\'newsblog/article\');\r\n\r\n			$layout_id = $this->model_newsblog_article->getArticleLayoutId($this->request->get[\'newsblog_article_id\']);\r\n		}\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/controller/common/content_bottom.php\">\r\n    <operation>\r\n      <search><![CDATA[if ($route == \'information/information\' && isset($this->request->get[\'information_id\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      if ($route == \'newsblog/category\' && isset($this->request->get[\'newsblog_path\'])) {\r\n			$this->load->model(\'newsblog/category\');\r\n\r\n			$path = explode(\'_\', (string)$this->request->get[\'newsblog_path\']);\r\n\r\n			$layout_id = $this->model_newsblog_category->getCategoryLayoutId(end($path));\r\n		}\r\n\r\n		if ($route == \'newsblog/article\' && isset($this->request->get[\'newsblog_article_id\'])) {\r\n			$this->load->model(\'newsblog/article\');\r\n\r\n			$layout_id = $this->model_newsblog_article->getArticleLayoutId($this->request->get[\'newsblog_article_id\']);\r\n		}\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/controller/common/content_top.php\">\r\n    <operation>\r\n      <search><![CDATA[if ($route == \'information/information\' && isset($this->request->get[\'information_id\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      if ($route == \'newsblog/category\' && isset($this->request->get[\'newsblog_path\'])) {\r\n			$this->load->model(\'newsblog/category\');\r\n\r\n			$path = explode(\'_\', (string)$this->request->get[\'newsblog_path\']);\r\n\r\n			$layout_id = $this->model_newsblog_category->getCategoryLayoutId(end($path));\r\n		}\r\n\r\n		if ($route == \'newsblog/article\' && isset($this->request->get[\'newsblog_article_id\'])) {\r\n			$this->load->model(\'newsblog/article\');\r\n\r\n			$layout_id = $this->model_newsblog_article->getArticleLayoutId($this->request->get[\'newsblog_article_id\']);\r\n		}\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/controller/startup/seo_url.php\">\r\n    <operation>\r\n      <search><![CDATA[if ($url[0] == \'information_id\') {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      				if ($url[0] == \'newsblog_article_id\') {\r\n						$this->request->get[\'newsblog_article_id\'] = $url[1];\r\n					}\r\n\r\n					if ($url[0] == \'newsblog_category_id\') {\r\n						if (!isset($this->request->get[\'newsblog_path\'])) {\r\n							$this->request->get[\'newsblog_path\'] = $url[1];\r\n						} else {\r\n							$this->request->get[\'newsblog_path\'] .= \'_\' . $url[1];\r\n						}\r\n					}\r\n		]]></add>\r\n	</operation>\r\n	<operation>\r\n		<search><![CDATA[$url[0] != \'information_id\']]></search>\r\n	    <add position=\"replace \"><![CDATA[$url[0] != \'newsblog_category_id\' && $url[0] != \'newsblog_article_id\' && $url[0] != \'information_id\']]></add>\r\n	</operation>\r\n	<operation>\r\n	    <search><![CDATA[} elseif (isset($this->request->get[\'information_id\'])) {]]></search>\r\n        <add position=\"before\"><![CDATA[\r\n      			} elseif (isset($this->request->get[\'newsblog_article_id\'])) {\r\n					$this->request->get[\'route\'] = \'newsblog/article\';\r\n				} elseif (isset($this->request->get[\'newsblog_path\'])) {\r\n					$this->request->get[\'route\'] = \'newsblog/category\';\r\n		]]></add>\r\n	</operation>\r\n	<operation>\r\n		<search><![CDATA[($data[\'route\'] == \'information/information\' && $key == \'information_id\')]]></search>\r\n	    <add position=\"replace\"><![CDATA[($data[\'route\'] == \'newsblog/article\' && $key == \'newsblog_article_id\') || ($data[\'route\'] == \'information/information\' && $key == \'information_id\')]]></add>\r\n	</operation>\r\n	<operation>\r\n	    <search><![CDATA[} elseif ($key == \'path\') {]]></search>\r\n        <add position=\"before\"><![CDATA[\r\n      			} elseif ($key == \'newsblog_path\') {\r\n					$categories = explode(\'_\', $value);\r\n\r\n					foreach ($categories as $category) {\r\n						$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"url_alias WHERE `query` = \'newsblog_category_id=\" . (int)$category . \"\'\");\r\n\r\n						if ($query->num_rows && $query->row[\'keyword\']) {\r\n							$url .= \'/\' . $query->row[\'keyword\'];\r\n						} else {\r\n							$url = \'\';\r\n\r\n							break;\r\n						}\r\n					}\r\n\r\n					unset ($data[$key]);\r\n		]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/controller/startup/seo_pro.php\">\r\n    <operation>\r\n      <search><![CDATA[if ($url[0] == \'category_id\') {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      				if ($url[0] == \'newsblog_category_id\') {\r\n						if (!isset($this->request->get[\'newsblog_path\'])) {\r\n							$this->request->get[\'newsblog_path\'] = $url[1];\r\n						} else {\r\n							$this->request->get[\'newsblog_path\'] .= \'_\' . $url[1];\r\n						}\r\n					} else\r\n		]]></add>\r\n	</operation>\r\n	<operation>\r\n		<search><![CDATA[if (isset($this->request->get[\'product_id\'])) {]]></search>\r\n	    <add position=\"before\"><![CDATA[\r\n		    if (isset($this->request->get[\'newsblog_article_id\'])) {\r\n				$this->request->get[\'route\'] = \'newsblog/article\';\r\n				if (!isset($this->request->get[\'newsblog_path\'])) {\r\n					$path = $this->getPathByNewsBlogArticle($this->request->get[\'newsblog_article_id\']);\r\n					if ($path) $this->request->get[\'newsblog_path\'] = $path;\r\n				}\r\n			} elseif (isset($this->request->get[\'newsblog_path\'])) {\r\n				$this->request->get[\'route\'] = \'newsblog/category\';\r\n			} else\r\n	    ]]></add>\r\n	</operation>\r\n	<operation>\r\n	    <search><![CDATA[case \'product/product\':]]></search>\r\n        <add position=\"before\"><![CDATA[\r\n      			case \'newsblog/article\':\r\n				if (isset($data[\'newsblog_article_id\'])) {\r\n					$tmp = $data;\r\n					$data = array();\r\n					if ($this->config->get(\'config_seo_url_include_path\')) {\r\n						$data[\'newsblog_path\'] = $this->getPathByNewsBlogArticle($tmp[\'newsblog_article_id\']);\r\n						if (!$data[\'newsblog_path\']) return $link;\r\n					}\r\n					$data[\'newsblog_article_id\'] = $tmp[\'newsblog_article_id\'];\r\n				}\r\n				break;\r\n\r\n			case \'newsblog/category\':\r\n				if (isset($data[\'newsblog_path\'])) {\r\n					$category = explode(\'_\', $data[\'newsblog_path\']);\r\n					$category = end($category);\r\n					$data[\'newsblog_path\'] = $this->getPathByNewsBlogCategory($category);\r\n					if (!$data[\'newsblog_path\']) return $link;\r\n				}\r\n				break;\r\n		]]></add>\r\n	</operation>\r\n	<operation>\r\n		<search><![CDATA[case \'product_id\':]]></search>\r\n	    <add position=\"before\"><![CDATA[\r\n	       			case \'newsblog_path\':\r\n						$categories = explode(\'_\', $value);\r\n						foreach($categories as $category) {\r\n							$queries[] = \'newsblog_category_id=\' . $category;\r\n						}\r\n						unset($data[$key]);\r\n						break;\r\n\r\n					case \'newsblog_article_id\':\r\n					case \'newsblog_category_id\':\r\n	    ]]></add>\r\n	</operation>\r\n	<operation>\r\n	    <search><![CDATA[private function getPathByProduct($product_id) {]]></search>\r\n        <add position=\"before\"><![CDATA[\r\n	private function getPathByNewsBlogArticle($article_id) {\r\n		$article_id = (int)$article_id;\r\n		if ($article_id < 1) return false;\r\n\r\n		static $path = null;\r\n		if (!isset($path)) {\r\n			$path = $this->cache->get(\'newsblog.article.seopath\');\r\n			if (!isset($path)) $path = array();\r\n		}\r\n\r\n		if (!isset($path[$article_id])) {\r\n			$query = $this->db->query(\"SELECT category_id FROM \" . DB_PREFIX . \"newsblog_article_to_category WHERE article_id = \'\" . $article_id . \"\' ORDER BY main_category DESC LIMIT 1\");\r\n\r\n			$path[$article_id] = $this->getPathByNewsBlogCategory($query->num_rows ? (int)$query->row[\'category_id\'] : 0);\r\n\r\n			$this->cache->set(\'newsblog.article.seopath\', $path);\r\n		}\r\n\r\n		return $path[$article_id];\r\n	}\r\n\r\n	private function getPathByNewsBlogCategory($category_id) {\r\n		$category_id = (int)$category_id;\r\n		if ($category_id < 1) return false;\r\n\r\n		static $path = null;\r\n		if (!isset($path)) {\r\n			$path = $this->cache->get(\'newsblog.category.seopath\');\r\n			if (!isset($path)) $path = array();\r\n		}\r\n\r\n		if (!isset($path[$category_id])) {\r\n			$max_level = 10;\r\n\r\n			$sql = \"SELECT CONCAT_WS(\'_\'\";\r\n			for ($i = $max_level-1; $i >= 0; --$i) {\r\n				$sql .= \",t$i.category_id\";\r\n			}\r\n			$sql .= \") AS path FROM \" . DB_PREFIX . \"newsblog_category t0\";\r\n			for ($i = 1; $i < $max_level; ++$i) {\r\n				$sql .= \" LEFT JOIN \" . DB_PREFIX . \"newsblog_category t$i ON (t$i.category_id = t\" . ($i-1) . \".parent_id)\";\r\n			}\r\n			$sql .= \" WHERE t0.category_id = \'\" . $category_id . \"\'\";\r\n\r\n			$query = $this->db->query($sql);\r\n\r\n			$path[$category_id] = $query->num_rows ? $query->row[\'path\'] : false;\r\n\r\n			$this->cache->set(\'newsblog.category.seopath\', $path);\r\n		}\r\n\r\n		return $path[$category_id];\r\n	}\r\n		]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/controller/information/sitemap.php\">\r\n    <operation>\r\n      <search><![CDATA[$this->load->model(\'catalog/information\');]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      	$this->load->model(\'newsblog/category\');\r\n        $this->load->model(\'newsblog/article\');\r\n\r\n		$data[\'newsblog_categories\'] = array();\r\n\r\n		$categories = $this->model_newsblog_category->getCategories(0);\r\n\r\n		foreach ($categories as $category) {\r\n			if ($category[\'settings\']) {\r\n				$settings=unserialize($category[\'settings\']);\r\n				if ($settings[\'show_in_sitemap\']==0) continue;\r\n			}\r\n\r\n			$articles = array();\r\n\r\n			if ($category[\'settings\'] && $settings[\'show_in_sitemap_articles\']) {\r\n				$filter=array(\'filter_category_id\'=>$category[\'category_id\'],\'filter_sub_category\'=>true);\r\n				$results = $this->model_newsblog_article->getArticles($filter);\r\n\r\n				foreach ($results as $result) {\r\n					$articles[] = array(\r\n						\'name\'        => $result[\'name\'],\r\n						\'href\'        => $this->url->link(\'newsblog/article\', \'newsblog_path=\' . $category[\'category_id\'] . \'&newsblog_article_id=\' . $result[\'article_id\'])\r\n					);\r\n				}\r\n            }\r\n			$data[\'newsblog_categories\'][] = array(\r\n				\'name\'     => $category[\'name\'],\r\n				\'children\' => $articles,\r\n				\'href\'     => $this->url->link(\'newsblog/category\', \'newsblog_path=\' . $category[\'category_id\'])\r\n			);\r\n		}\r\n		]]></add>\r\n	</operation>\r\n  </file>\r\n  <file path=\"catalog/view/theme/*/template/information/sitemap.tpl\">\r\n    <operation>\r\n      <search><![CDATA[<li><?php echo $text_information; ?>]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      	<?php foreach ($newsblog_categories as $category) { ?>\r\n            <li><a href=\"<?php echo $category[\'href\']; ?>\"><?php echo $category[\'name\']; ?></a>\r\n              <?php if ($category[\'children\']) { ?>\r\n              <ul>\r\n                <?php foreach ($category[\'children\'] as $article) { ?>\r\n                <li><a href=\"<?php echo $article[\'href\']; ?>\"><?php echo $article[\'name\']; ?></a></li>\r\n                <?php } ?>\r\n              </ul>\r\n              <?php } ?>\r\n            </li>\r\n            <?php } ?>\r\n		]]></add>\r\n	</operation>\r\n  </file>\r\n  <file path=\"catalog/controller/common/header.php\">\r\n    <operation>\r\n      <search><![CDATA[$data[\'language\'] = $this->load->controller(\'common/language\');]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      	$this->load->model(\'newsblog/category\');\r\n        $this->load->model(\'newsblog/article\');\r\n\r\n		$data[\'newsblog_categories\'] = array();\r\n\r\n		$categories = $this->model_newsblog_category->getCategories(0);\r\n\r\n		foreach ($categories as $category) {\r\n			if ($category[\'settings\']) {\r\n				$settings=unserialize($category[\'settings\']);\r\n				if ($settings[\'show_in_top\']==0) continue;\r\n			}\r\n\r\n			$articles = array();\r\n\r\n			if ($category[\'settings\'] && $settings[\'show_in_top_articles\']) {\r\n				$filter=array(\'filter_category_id\'=>$category[\'category_id\'],\'filter_sub_category\'=>true);\r\n				$results = $this->model_newsblog_article->getArticles($filter);\r\n\r\n				foreach ($results as $result) {\r\n					$articles[] = array(\r\n						\'name\'        => $result[\'name\'],\r\n						\'href\'        => $this->url->link(\'newsblog/article\', \'newsblog_path=\' . $category[\'category_id\'] . \'&newsblog_article_id=\' . $result[\'article_id\'])\r\n					);\r\n				}\r\n            }\r\n			$data[\'categories\'][] = array(\r\n				\'name\'     => $category[\'name\'],\r\n				\'children\' => $articles,\r\n				\'column\'   => 1,\r\n				\'href\'     => $this->url->link(\'newsblog/category\', \'newsblog_path=\' . $category[\'category_id\'])\r\n			);\r\n		}\r\n		]]></add>\r\n	</operation>\r\n  </file>\r\n</modification>', 1, '2020-04-21 20:20:28');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"9\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(32, 'Главная страница', 'html', '{\"name\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"module_description\":{\"1\":{\"title\":\"\\u042d\\u043b\\u0435\\u043a\\u0442\\u0440\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\",\"description\":\"&lt;p&gt;\\u041f\\u043e\\u0434\\u044a\\u0435\\u043c \\u0433\\u0440\\u0443\\u0437\\u043e\\u0432 \\u0432 \\u043f\\u0440\\u043e\\u043c\\u044b\\u0448\\u043b\\u0435\\u043d\\u043d\\u044b\\u0445 \\u043c\\u0430\\u0441\\u0448\\u0442\\u0430\\u0431\\u0430\\u0445 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u043f\\u043e\\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u044d\\u043a\\u043e\\u043d\\u043e\\u043c\\u0438\\u0438 \\u0432\\u0440\\u0435\\u043c\\u0435\\u043d\\u0438. \\u0422\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440 \\u043f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442 \\u0441\\u043e\\u0431\\u043e\\u0439 \\u0433\\u0440\\u0443\\u0437\\u043e\\u043f\\u043e\\u0434\\u044a\\u0435\\u043c\\u043d\\u0438\\u043a, \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u044e\\u0449\\u0438\\u0439 \\u043f\\u043e\\u0441\\u0440\\u0435\\u0434\\u0441\\u0442\\u0432\\u043e\\u043c \\u043f\\u043e\\u0434\\u0430\\u0447\\u0438 \\u043d\\u0430 \\u043d\\u0435\\u0433\\u043e \\u044d\\u043b\\u0435\\u043a\\u0442\\u0440\\u0438\\u0447\\u0435\\u0441\\u043a\\u043e\\u0433\\u043e \\u0442\\u043e\\u043a\\u0430 \\u0438 \\u0434\\u0438\\u0441\\u0442\\u0430\\u043d\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u0443\\u043b\\u044c\\u0442\\u0430 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f. \\u0418\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\\u0430 \\u0437\\u043d\\u0430\\u0447\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u0443\\u0432\\u0435\\u043b\\u0438\\u0447\\u0438\\u0432\\u0430\\u0435\\u0442 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0442\\u0440\\u0443\\u0434\\u0430, \\u0434\\u0435\\u043b\\u0430\\u0435\\u0442 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u044b\\u0435 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u044b \\u043c\\u0430\\u043a\\u0441\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u043e \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c\\u0438 \\u0438 \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u044b\\u043c\\u0438.&lt;\\/p&gt;\\r\\n\\r\\n&lt;h3&gt;\\u0411\\u043e\\u043b\\u0433\\u0430\\u0440\\u0441\\u043a\\u0438\\u0435 \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\\u044b - \\u043b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u0441\\u043e\\u0447\\u0435\\u0442\\u0430\\u043d\\u0438\\u0435 \\u0446\\u0435\\u043d\\u044b \\u0438 \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430&lt;\\/h3&gt;\\r\\n&lt;p&gt;\\u2b50\\u2b50\\u2b50 \\u042d\\u043b\\u0435\\u043a\\u0442\\u0440\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440 \\u043f\\u043e\\u0434\\u043d\\u0438\\u043c\\u0430\\u0435\\u0442 \\u0433\\u0440\\u0443\\u0437\\u044b \\u043d\\u0430 \\u0432\\u044b\\u0441\\u043e\\u0442\\u0443 \\u0441 \\u044d\\u043a\\u043e\\u043d\\u043e\\u043c\\u0438\\u0435\\u0439 \\u0432\\u0440\\u0435\\u043c\\u0435\\u043d\\u0438 \\u0438 \\u0431\\u0435\\u0437 \\u043b\\u0438\\u0448\\u043d\\u0438\\u0445 \\u0444\\u0438\\u0437\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0445 \\u0443\\u0441\\u0438\\u043b\\u0438\\u0439. \\u041e\\u0431\\u0440\\u0430\\u0442\\u0438\\u0432\\u0448\\u0438\\u0441\\u044c \\u043a \\u043d\\u0430\\u043c, \\u0432\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u0435 \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c:&lt;\\/p&gt;\\r\\n\\r\\n&lt;p&gt;\\r\\n&lt;\\/p&gt;&lt;ul&gt;\\r\\n&lt;li&gt;\\u043a\\u0443\\u043f\\u0438\\u0442\\u044c \\u044d\\u043b\\u0435\\u043a\\u0442\\u0440\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\\u044b \\u0434\\u0435\\u0448\\u0435\\u0432\\u043e;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u0440\\u0435\\u0430\\u043b\\u0438\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c \\u0431\\u044b\\u0441\\u0442\\u0440\\u0443\\u044e \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0443 \\u043f\\u043e \\u0420\\u043e\\u0441\\u0441\\u0438\\u0438;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u043e\\u0441\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0438\\u0442\\u044c \\u0441\\u0430\\u043c\\u043e\\u0432\\u044b\\u0432\\u043e\\u0437 \\u0432\\u043e \\u0441\\u043a\\u043b\\u0430\\u0434\\u0430 \\u0432 \\u041c\\u043e\\u0441\\u043a\\u0432\\u0435.&lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\\r\\n&lt;p&gt;&lt;\\/p&gt;\\r\\n\\r\\n&lt;p&gt;\\u041d\\u0430 \\u0441\\u0430\\u0439\\u0442\\u0435 \\u043f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u043b\\u0435\\u043d \\u0431\\u043e\\u043b\\u044c\\u0448\\u043e\\u0439 \\u0432\\u044b\\u0431\\u043e\\u0440 \\u0431\\u043e\\u043b\\u0433\\u0430\\u0440\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\\u043e\\u0432 \\u0442\\u0435\\u0445\\u043d\\u0438\\u043a\\u0438 \\u0438 \\u0432\\u044b \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u0441\\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u043f\\u043e\\u0434\\u043e\\u0431\\u0440\\u0430\\u0442\\u044c \\u0432\\u0430\\u0440\\u0438\\u0430\\u043d\\u0442 \\u0441\\u043e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u043c\\u0438 \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0438\\u0441\\u0442\\u0438\\u043a\\u0430\\u043c\\u0438:&lt;\\/p&gt;\\r\\n\\r\\n&lt;p&gt;\\r\\n&lt;\\/p&gt;&lt;ul&gt;\\r\\n&lt;li&gt;\\u0433\\u0440\\u0443\\u0437\\u043e\\u043f\\u043e\\u0434\\u044a\\u0435\\u043c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442 \\u043e\\u0442 100 \\u043a\\u0433 \\u0434\\u043e 10 \\u0442\\u043e\\u043d\\u043d;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u043e\\u0441\\u043d\\u0430\\u0449\\u0435\\u043d\\u044b \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u043d\\u044b\\u043c \\u0431\\u043b\\u043e\\u043a\\u043e\\u043c, \\u0441\\u043b\\u0443\\u0436\\u0430\\u0449\\u0438\\u043c \\u0434\\u043b\\u044f \\u0443\\u0432\\u0435\\u043b\\u0438\\u0447\\u0435\\u043d\\u0438\\u044f \\u0433\\u0440\\u0443\\u0437\\u043e\\u043f\\u043e\\u0434\\u044a\\u0435\\u043c\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0432 2 \\u0440\\u0430\\u0437\\u0430;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u043f\\u043e\\u0434\\u044a\\u0435\\u043c\\u0430 \\u0434\\u043e 40 \\u043c\\u0435\\u0442\\u0440\\u043e\\u0432;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\\u044b \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0441\\u043e\\u0432\\u043c\\u0435\\u0449\\u0430\\u044e\\u0442 \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c \\u0433\\u043e\\u0440\\u0438\\u0437\\u043e\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0438 \\u0432\\u0435\\u0440\\u0442\\u0438\\u043a\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043f\\u0435\\u0440\\u0435\\u043d\\u043e\\u0441\\u043a\\u0438 \\u0433\\u0440\\u0443\\u0437\\u043e\\u0432;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u043e\\u0441\\u043d\\u0430\\u0449\\u0435\\u043d\\u044b \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u043c \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u043e\\u043d\\u0430\\u043b\\u043e\\u043c \\u0434\\u043b\\u044f \\u0431\\u0435\\u0437\\u0430\\u0432\\u0430\\u0440\\u0438\\u0439\\u043d\\u043e\\u0439 \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u043f\\u0440\\u0435\\u0434\\u043b\\u0430\\u0433\\u0430\\u0435\\u0442\\u0441\\u044f \\u0443\\u0434\\u043e\\u0431\\u043d\\u044b\\u0439 \\u0444\\u0438\\u043b\\u044c\\u0442\\u0440 \\u0434\\u043b\\u044f \\u0441\\u043e\\u0440\\u0442\\u0438\\u0440\\u043e\\u0432\\u043a\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0439 \\u043f\\u043e \\u0441\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438;&lt;\\/li&gt;\\r\\n&lt;li&gt;\\u0432\\u0441\\u0435 \\u043c\\u043e\\u0434\\u0435\\u043b\\u0438 \\u043e\\u0442\\u043b\\u0438\\u0447\\u0430\\u044e\\u0442\\u0441\\u044f \\u043c\\u0430\\u043a\\u0441\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u0438 \\u0443\\u0434\\u043e\\u0431\\u0441\\u0442\\u0432\\u043e\\u043c \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f, \\u043d\\u0430\\u0448\\u0438 \\u0446\\u0435\\u043d\\u044b \\u0437\\u043d\\u0430\\u0447\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u043d\\u0438\\u0436\\u0435, \\u0447\\u0435\\u043c \\u0443 \\u043a\\u043e\\u043d\\u043a\\u0443\\u0440\\u0435\\u043d\\u0442\\u043e\\u0432, \\u043d\\u0430\\u0447\\u0438\\u043d\\u0430\\u044e\\u0442\\u0441\\u044f \\u0441 \\u043f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u0435\\u043b\\u044f \\u0432 5000 \\u0440\\u0443\\u0431\\u043b\\u0435\\u0439.&lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\\r\\n&lt;p&gt;&lt;\\/p&gt;\\r\\n\\r\\n&lt;p&gt;\\u042d\\u043b\\u0435\\u043a\\u0442\\u0440\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0435 \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\\u044b \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u043e\\u0439 \\u0438 \\u043d\\u0430\\u0434\\u0435\\u0436\\u043d\\u043e\\u0439 \\u0442\\u0435\\u0445\\u043d\\u0438\\u043a\\u043e\\u0439, \\u043f\\u043e\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0443 \\u043e\\u0441\\u043d\\u0430\\u0449\\u0435\\u043d\\u044b \\u043c\\u0435\\u0445\\u0430\\u043d\\u0438\\u0437\\u043c\\u043e\\u043c \\u043e\\u0431\\u0440\\u044b\\u0432\\u0430 \\u0438 \\u0430\\u0432\\u0430\\u0440\\u0438\\u0439\\u043d\\u043e\\u0439 \\u043e\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043a\\u0438 \\u0438 \\u0442\\u0435\\u043f\\u043b\\u043e\\u0432\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0442\\u0435\\u043a\\u0446\\u0438\\u0435\\u0439. \\u0422\\u0430\\u043a\\u043e\\u0435 \\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0434\\u043e\\u043b\\u0433\\u043e \\u043f\\u0440\\u043e\\u0441\\u043b\\u0443\\u0436\\u0438\\u0442 \\u0438 \\u043d\\u0435 \\u043f\\u043e\\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0437\\u0430\\u0442\\u0440\\u0430\\u0442 \\u043d\\u0430 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442.&lt;\\/p&gt;\\r\\n\\r\\n&lt;h3&gt;\\u0422\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440\\u044b 3 \\u0438 5 \\u0442\\u043e\\u043d\\u043d \\u043e\\u0447\\u0435\\u043d\\u044c \\u043f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0435 \\u043c\\u043e\\u0434\\u0435\\u043b\\u0438&lt;\\/h3&gt;\\r\\n\\r\\n&lt;p&gt;\\u041c\\u044b \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u0440\\u0435\\u0430\\u043b\\u0438\\u0437\\u0443\\u0435\\u043c \\u043f\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0438 \\u0442\\u0435\\u0445\\u043d\\u0438\\u043a\\u0438 \\u0432 \\u043b\\u044e\\u0431\\u0443\\u044e \\u0442\\u043e\\u0447\\u043a\\u0443 \\u0441\\u0442\\u0440\\u0430\\u043d\\u044b \\u0442\\u0435\\u043b\\u044c\\u0444\\u0435\\u0440 3 \\u0438 5 \\u0442\\u043e\\u043d\\u043d, \\u043d\\u043e \\u043f\\u043e\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0443 \\u0438\\u043c\\u0435\\u0435\\u043c \\u0434\\u0435\\u043b\\u043e \\u0441 \\u0441\\u043f\\u0435\\u0446\\u043e\\u0431\\u043e\\u0440\\u0443\\u0434\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\\u043c, \\u0442\\u043e \\u0438 \\u0441\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u044c \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0438 \\u0431\\u0443\\u0434\\u0435\\u0442 \\u0432\\u043e \\u0432\\u0441\\u0435\\u0445 \\u0441\\u043b\\u0443\\u0447\\u0430\\u044f\\u0445 \\u0441\\u0443\\u0433\\u0443\\u0431\\u043e \\u0438\\u043d\\u0434\\u0438\\u0432\\u0438\\u0434\\u0443\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439. \\u0415\\u0441\\u043b\\u0438 \\u0443 \\u0432\\u0430\\u0441 \\u043e\\u0441\\u0442\\u0430\\u043b\\u0438\\u0441\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441\\u044b, \\u0442\\u043e \\u043d\\u0430\\u0448\\u0438 \\u043f\\u0440\\u043e\\u0444\\u0435\\u0441\\u0441\\u0438\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u043c\\u0435\\u043d\\u0435\\u0434\\u0436\\u0435\\u0440\\u044b \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u043f\\u0440\\u043e\\u043a\\u043e\\u043d\\u0441\\u0443\\u043b\\u044c\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u043f\\u043e \\u0432\\u0441\\u0435\\u043c\\u0443 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043d\\u043e\\u043c\\u0443 \\u0440\\u044f\\u0434\\u0443 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438, \\u043e\\u043a\\u0430\\u0437\\u044b\\u0432\\u0430\\u0435\\u043c\\u043e\\u043c\\u0443 \\u0441\\u0435\\u0440\\u0432\\u0438\\u0441\\u0443, \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u0438 \\u043e\\u0441\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0438.&lt;\\/p&gt;\\r\\n\\r\\n&lt;p&gt;\\u041c\\u044b \\u0436\\u0434\\u0435\\u043c \\u0432\\u0430\\u0448\\u0438\\u0445 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0439 \\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u043a \\u0441\\u043e\\u0442\\u0440\\u0443\\u0434\\u043d\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u0443 \\u043d\\u0430 \\u043e\\u0441\\u043d\\u043e\\u0432\\u0435 \\u0438\\u043d\\u0434\\u0438\\u0432\\u0438\\u0434\\u0443\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u0434\\u0445\\u043e\\u0434\\u0430, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0441\\u043c\\u043e\\u0436\\u0435\\u043c \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c \\u0434\\u043b\\u044f \\u0432\\u0430\\u0441 \\u043f\\u0440\\u043e\\u0435\\u043a\\u0442 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0430 \\u043f\\u043e \\u0432\\u0430\\u0448\\u0438\\u043c \\u043f\\u043e\\u0436\\u0435\\u043b\\u0430\\u043d\\u0438\\u044f\\u043c!&lt;\\/p&gt;\"}},\"status\":\"1\"}'),
(34, 'Новости', 'newsblog_articles', '{\"name\":\"\\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\"}},\"show_categories\":[\"1\"],\"width\":\"200\",\"height\":\"200\",\"limit\":\"3\",\"desc_limit\":\"300\",\"template\":\"\",\"date_format\":\"d.m.Y H:i\",\"sort_by\":\"a.date_available\",\"sort_direction\":\"desc\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article`
--

CREATE TABLE `oc_newsblog_article` (
  `article_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_available` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_article`
--

INSERT INTO `oc_newsblog_article` (`article_id`, `image`, `date_available`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(4, '', '2020-04-23 11:56:19', 500, 1, 18, '2020-04-23 11:57:51', '0000-00-00 00:00:00'),
(3, '', '2020-04-21 21:26:53', 500, 1, 16, '2020-04-21 21:27:54', '2020-04-21 21:28:28'),
(5, '', '2020-04-25 14:02:07', 500, 1, 12, '2020-04-25 14:03:19', '2020-04-25 14:03:31'),
(6, '', '2020-05-01 13:45:41', 500, 1, 7, '2020-05-01 13:46:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article_attribute`
--

CREATE TABLE `oc_newsblog_article_attribute` (
  `article_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article_description`
--

CREATE TABLE `oc_newsblog_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `preview` text NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_article_description`
--

INSERT INTO `oc_newsblog_article_description` (`article_id`, `language_id`, `name`, `preview`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(3, 1, 'Стационарный тельфер', '&lt;p style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium;&quot;&gt;Цепные тали востребованны за свою компактность – их зачастую используют в помещениях с небольшими потолками.&lt;/p&gt;', '&lt;p style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium;&quot;&gt;Цепные тали востребованны за свою компактность – их зачастую используют в помещениях с небольшими потолками. Канатные тельферы – это менее опасное устройство. Тали бывают цепными и канатными.&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Times New Roman&amp;quot;; font-size: medium;&quot;&gt;Тельферы, которые способны не только опускать и поднимать, но и транспортировать грузы в горизонтальной плоскости, прозвали передвижными. Тельферы, имеющие уменьшенный функционал, то есть те, которые могут только поднимать и опускать грузы, называются стационарными.&lt;/p&gt;', '', '', '', '', ''),
(4, 1, 'Электротельфер ', '&lt;p&gt;Способность поднимать большую тяжесть выполняет редуктор. Благодаря \r\nпростоте и надежности механизма тельфер, действительно, занял большое \r\nдоверие в России...&lt;/p&gt;', '&lt;p&gt;Способность поднимать большую тяжесть выполняет редуктор. Благодаря \r\nпростоте и надежности механизма тельфер, действительно, занял большое \r\nдоверие в России, как превосходная грузоподъемная техника. В ходе \r\nвыполнения подъемных работ, на специальный барабан тали наматывается \r\nстальной многожильный трос или высокопрочная цепь, которая удерживает \r\nподвешенный груз. Не беря во внимание сложные условия работы, существуют\r\n варианты тельферов которые позволяют гарантировать достаточно большую \r\nскорость подъема. В строении большей части тельферов есть 3 главных \r\nдетали: передвижная каретка, блок подъема груза и пульт дистанционного \r\nуправления тельфером. К важным узлам также относится канатный барабан, \r\nтормозная система, строительный крюк, электрический привод и планерный \r\nредуктор.&lt;/p&gt;&lt;p&gt;\r\n &lt;br&gt;&lt;/p&gt;&lt;p&gt;Как правило, подъемные показатели популярных вариантов тельферов \r\nизмеряется в диапазоне от 1 до 50 тонн. В мире подъемной промышленности \r\nтельфер популярное устройство для подъема груза. Имея компактные размеры\r\n тельфер стал сильно востребован на производстве где борьба за каждый \r\nметр. В зависимости от требований покупателя электрический тельфер \r\nустанавливают на специальную передвижную тележку.&lt;/p&gt;&lt;p&gt;\r\n \r\n &lt;br&gt;&lt;/p&gt;&lt;p&gt;Исходя от типа крепления тельфер делится на две группы: стационарный\r\n и передвижной. Для работы в любом ином месте стационарный тельфер \r\nнеобходимо своими силами снять и самому перевесить. Электрический \r\nпередвижной тельфер устанавливают на монорельсу, на протяжении которой \r\nон свободно передвигается, такой подход дает работать в вертикальной и \r\nгоризонтальной плоскости, поднимать, перемещать и опускать груз. В \r\nстационарном электрическом тельфере предусмотрен лишь конструкция \r\nподъема и опускания груза, другими словами, подобное устройство способно\r\n транспортировать груз в одной вертикальной плоскости. Передвижной \r\nтельфер отличается от стационарного удобным и комфортным средством \r\nтранспортировки груза, что естественно приводит к увеличению его \r\nстоимости. &lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;br&gt;&lt;/p&gt;', '', 'Электротельфер ', 'Электротельфер ', '', ''),
(5, 1, 'Преимущества цепного тельфера', '&lt;p&gt;&lt;span style=&quot;color: rgb(72, 77, 89); font-family: tahoma, arial, verdana, sans-serif; text-indent: 15px;&quot;&gt;Тельферы, которые кроме спуска-подъема в силах также перемещать грузы по горизонтальной направляющей, прозвали передвижными.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '&lt;p style=&quot;text-indent: 15px; line-height: 20px; margin-bottom: 0px; color: rgb(72, 77, 89); font-family: tahoma, arial, verdana, sans-serif;&quot;&gt;Тельферы, которые кроме спуска-подъема в силах также перемещать грузы по горизонтальной направляющей, прозвали передвижными. Тельферы, владеющие ограниченным количеством действий, то есть те, способных только лишь опускать и поднимать детали, прозвали стационарными.&lt;/p&gt;&lt;p style=&quot;text-indent: 15px; line-height: 20px; margin-bottom: 0px; color: rgb(72, 77, 89); font-family: tahoma, arial, verdana, sans-serif;&quot;&gt;Цепные тали ценятся за не большие габариты – их часто используют в помещениях с не высокими потолками, также достоинство цепных тельферов – приемлемая (по сравнению с канатными) стоимость. Тали встречаются цепные или канатные отсюда следует, что основным рабочим лицом является цепь или канат, соответственно. Канатные тельферы – это менее опасное устройство, ведь многожильный металлический трос не способен оборваться неожиданно (его стирание происходит постепенно и не быстро).&lt;/p&gt;', '', 'Преимущества цепного тельфера', 'Преимущества цепного тельфера', 'Преимущества цепного тельфера', ''),
(6, 1, 'Достоинства цепного тельфера', '&lt;p&gt;Тельферы, которые кроме спуска-подъема способны также транспортировать грузы в горизонтальной плоскости, прозвали передвижными. &lt;/p&gt;', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Тельферы, которые кроме спуска-подъема способны также \r\nтранспортировать грузы в горизонтальной плоскости, прозвали \r\nпередвижными. Тельферы, владеющие слабым объемом действий, то есть те, \r\nспособных только лишь опускать и поднимать тяжести, называются \r\nстационарными.&lt;/p&gt;&lt;p&gt;\r\n\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;Канатные тельферы – это менее опасное устройство. Тали бывают цепными\r\n и канатными это значит, что в основе их приводного механизма лежит цепь\r\n или канат, соответственно. Цепные тали востребованны за свои не большие\r\n габариты – их зачастую используют в зданиях с не высокими потолками, в \r\nдобавок ко всему плюс цепных тельферов – небольшая (по сравнению с \r\nканатными) цена.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Достоинства цепного тельфера', 'Достоинства цепного тельфера', 'Достоинства цепного тельфера', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article_image`
--

CREATE TABLE `oc_newsblog_article_image` (
  `product_image_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article_related`
--

CREATE TABLE `oc_newsblog_article_related` (
  `article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article_to_category`
--

CREATE TABLE `oc_newsblog_article_to_category` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_article_to_category`
--

INSERT INTO `oc_newsblog_article_to_category` (`article_id`, `category_id`, `main_category`) VALUES
(4, 1, 1),
(3, 1, 1),
(5, 1, 1),
(6, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article_to_layout`
--

CREATE TABLE `oc_newsblog_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_article_to_layout`
--

INSERT INTO `oc_newsblog_article_to_layout` (`article_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(3, 0, 0),
(5, 0, 0),
(6, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_article_to_store`
--

CREATE TABLE `oc_newsblog_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_article_to_store`
--

INSERT INTO `oc_newsblog_article_to_store` (`article_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_category`
--

CREATE TABLE `oc_newsblog_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `settings` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_category`
--

INSERT INTO `oc_newsblog_category` (`category_id`, `image`, `parent_id`, `sort_order`, `status`, `date_added`, `date_modified`, `settings`) VALUES
(1, '', 0, 0, 1, '2020-04-21 21:10:40', '2020-04-21 21:30:11', 'a:27:{s:11:\"date_format\";s:9:\"d.m.Y H:i\";s:16:\"image_size_width\";s:2:\"80\";s:17:\"image_size_height\";s:2:\"80\";s:30:\"images_size_articles_big_width\";s:3:\"500\";s:31:\"images_size_articles_big_height\";s:3:\"500\";s:32:\"images_size_articles_small_width\";s:3:\"228\";s:33:\"images_size_articles_small_height\";s:3:\"228\";s:17:\"images_size_width\";s:3:\"228\";s:18:\"images_size_height\";s:3:\"228\";s:5:\"limit\";s:2:\"10\";s:15:\"show_in_sitemap\";i:1;s:24:\"show_in_sitemap_articles\";i:1;s:11:\"show_in_top\";i:1;s:20:\"show_in_top_articles\";i:0;s:12:\"show_preview\";i:1;s:7:\"sort_by\";s:16:\"a.date_available\";s:14:\"sort_direction\";s:4:\"desc\";s:16:\"template_article\";s:0:\"\";s:17:\"template_category\";s:0:\"\";s:19:\"show_comments_vk_id\";s:0:\"\";s:25:\"show_comments_vk_category\";i:0;s:24:\"show_comments_vk_article\";i:0;s:25:\"show_comments_fb_category\";i:0;s:24:\"show_comments_fb_article\";i:0;s:19:\"show_comments_dq_id\";s:0:\"\";s:25:\"show_comments_dq_category\";i:0;s:24:\"show_comments_dq_article\";i:0;}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_category_description`
--

CREATE TABLE `oc_newsblog_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_category_description`
--

INSERT INTO `oc_newsblog_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(1, 1, 'Информация', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_category_path`
--

CREATE TABLE `oc_newsblog_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_category_path`
--

INSERT INTO `oc_newsblog_category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_category_to_layout`
--

CREATE TABLE `oc_newsblog_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_category_to_layout`
--

INSERT INTO `oc_newsblog_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsblog_category_to_store`
--

CREATE TABLE `oc_newsblog_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_newsblog_category_to_store`
--

INSERT INTO `oc_newsblog_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_custom_field`
--

CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Ожидание'),
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(75, 'CD1 00009797', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_gp_1_t_vp_6m_skorost_podyema_8.jpg', 17, 1, '61285.0000', 0, 0, '2019-12-13', '130.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 73, '2019-12-13 05:17:48', '2020-04-15 11:24:10'),
(76, 'ТЭК (CD) г/п 2,0 т 12 м 109212', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_TOR_TEK_CD_gp_20_t_12_m_109212.jpg', 20, 1, '94923.0000', 0, 0, '2019-12-13', '285.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 81, '2019-12-13 05:18:31', '2020-04-15 11:25:29'),
(77, 'Т-10 004-5272', '', '', '', '', '', '', '96600', 1, 7, '/catalog/tal_1t/Elektricheskaya_peredvijnaya_tal_Rossiyskiy_T-10_0.jpg', 18, 1, '42560.0000', 0, 0, '2019-12-13', '290.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 88, '2019-12-13 05:18:35', '2020-04-16 13:20:42'),
(78, 'CD1 г/п 2т, в/п 6м', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_statsionarnaya_tal_CD1_gp_2t_vp_6m.jpg', 17, 1, '35000.0000', 0, 0, '2019-12-13', '174.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 71, '2019-12-13 05:18:37', '2020-04-15 11:05:10'),
(79, 'ТЭК (CD) г/п 2,0 т 24 м 109224 ', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_TOR_TEK_CD_gp_20_t_24_m_109224.jpg', 20, 1, '119669.0000', 0, 0, '2019-12-13', '332.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 68, '2019-12-13 05:18:39', '2020-04-15 11:25:47'),
(80, 'Т-10 004-5454', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_peredvijnaya_tal_Rossiyskiy_T-10_0.jpg', 18, 1, '96000.0000', 0, 0, '2019-12-13', '484.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 85, '2019-12-13 05:18:42', '2020-04-15 11:04:11'),
(81, '00012335', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_statsionarnaya_tal_CD1_gp_2_t_vp_9.jpg', 17, 1, '36000.0000', 0, 0, '2019-12-13', '174.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 76, '2019-12-13 05:18:45', '2020-04-15 11:08:01'),
(82, 'ТЭК (CD) г/п 2,0 т 36 м 109236', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_TOR_TEK_CD_gp_20_t_36_m_109236.jpg', 20, 1, '139951.0000', 0, 0, '2019-12-13', '374.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 74, '2019-12-13 05:18:47', '2020-04-15 11:26:00'),
(83, 'ТЭ-200 004-5340', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_peredvijnaya_tal_Rossiyskiy_TE-200.jpg', 18, 1, '68000.0000', 0, 0, '2019-12-13', '625.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 100, '2019-12-13 05:18:49', '2020-04-15 11:04:29'),
(84, 'ТЭК (CD) г/п 1,0 т 18 м 109118', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_TOR_TEK_CD_gp_10_t_18_m_109118.jpg', 20, 1, '76872.0000', 0, 0, '2019-12-13', '188.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 81, '2019-12-13 05:18:51', '2020-04-15 11:25:07'),
(85, 'KX 1000 00016930', '', '', '', '', '', '', '24560', 1, 7, '/catalog/tal_1t/Elektricheskaya_peredvijnaya_lebedka_18m9m_500kg10.jpg', 17, 1, '40350.0000', 0, 0, '2019-12-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 79, '2019-12-13 05:19:30', '2020-04-16 13:18:19'),
(86, 'LT 1000 P', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskiy_telfer_PRORAB_LT_1000_P.jpg', 23, 1, '34000.0000', 0, 0, '2019-12-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 73, '2019-12-13 05:19:31', '2020-04-15 11:27:17'),
(87, 'KX 1000 00002841', '', '', '', '', '', '', '24400', 1, 7, '/catalog/tal_1t/Elektricheskaya_peredvijnaya_lebedka_500kg1000kg_2.jpg', 17, 1, '33250.0000', 0, 0, '2019-12-13', '54.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 108, '2019-12-13 05:19:33', '2020-04-16 13:19:45'),
(88, '4.601', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Professionalnyiy_tsepnoy_elektrotelfer_SOROKIN_460.jpg', 16, 1, '19999.0000', 0, 0, '2019-12-13', '46.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 114, '2019-12-13 05:19:35', '2020-04-15 11:03:03'),
(89, 'ТЭК (CD) г/п 2,0 т 6 м 10926', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_TOR_TEK_CD_gp_20_t_6_m_10926.jpg', 20, 1, '79809.0000', 0, 0, '2019-12-13', '221.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 68, '2019-12-13 05:19:37', '2020-04-15 11:26:14'),
(90, 'CD1 00019396', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_gp_2_t_vp_9m_skorost_podyema_8.jpg', 17, 1, '92185.0000', 0, 0, '2019-12-13', '174.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 88, '2019-12-13 05:19:39', '2020-04-15 11:24:30'),
(91, 'ТЭ-200 004-5452', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_peredvijnaya_tal_Rossiyskiy_TE-200.jpg', 18, 1, '67000.0000', 0, 0, '2019-12-13', '575.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 77, '2019-12-13 05:19:41', '2020-04-15 11:04:43'),
(92, 'CD-200 2т 12м 004-6027', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_peredvijnaya_tal_Zitrek_CD-200_2t_.jpg', 19, 1, '85990.0000', 0, 0, '2019-12-13', '280.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 116, '2019-12-13 05:19:43', '2020-04-15 11:06:27'),
(93, '4.622', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Professionalnyiy_trosovyiy_elektrotelfer_SOROKIN_4.jpg', 16, 1, '12758.0000', 0, 0, '2019-12-13', '336.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 158, '2019-12-13 05:19:45', '2020-04-15 11:02:48'),
(94, 'TOR ТЭК CD 109124', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_1t/Elektricheskaya_tal_gp_10_t_24_m_TOR_TEK_CD_109124.jpg', 20, 1, '91476.0000', 0, 0, '2019-12-13', '204.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 68, '2019-12-13 05:19:47', '2020-04-15 11:26:26'),
(95, 'ЭТФ-1000П 00000043383', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektrotelfer_s_prodolnyim_hodom_Kalibr_ETF-1000P_.jpg', 26, 1, '35400.0000', 0, 0, '2019-12-13', '51.30000000', 1, '610.00000000', '510.00000000', '530.00000000', 1, 1, 1, 1, 1, 73, '2019-12-13 05:24:01', '2020-04-15 11:28:00'),
(96, '4.805', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Podvijnyiy_elektrotelfer_SOROKIN_4805.jpg', 16, 1, '19999.0000', 0, 0, '2019-12-13', '34.00000000', 1, '495.00000000', '445.00000000', '365.00000000', 1, 1, 1, 1, 1, 77, '2019-12-13 05:24:53', '2020-04-15 11:02:10'),
(97, 'OL20500', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektrotal_OLYMP_OL20500.jpg', 24, 1, '15965.0000', 0, 0, '2019-12-13', '29.15000000', 1, '56.00000000', '25.00000000', '32.00000000', 1, 1, 1, 1, 1, 70, '2019-12-13 05:24:56', '2020-04-15 11:27:29'),
(98, '00012332', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskaya_statsionarnaya_tal_CD1_gp_1t_vp_9m.jpg', 17, 1, '76108.0000', 0, 0, '2019-12-13', '130.00000000', 1, '1200.00000000', '600.00000000', '600.00000000', 1, 1, 1, 1, 1, 41, '2019-12-13 05:24:59', '2020-04-15 11:07:44'),
(99, 'RF-TRH1005', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Podvesnaya_tal_ROCKFORCE_250_kg_RF-TRH1005.jpg', 13, 1, '17000.0000', 0, 0, '2019-12-13', '18.00000000', 1, '430.00000000', '150.00000000', '250.00000000', 1, 1, 1, 1, 1, 81, '2019-12-13 05:25:01', '2020-04-15 11:01:40'),
(100, 'EH72100', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskaya_lebedka_Sturm_EH72100.jpg', 14, 1, '21849.0000', 0, 0, '2019-12-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 77, '2019-12-13 05:25:03', '2020-04-15 11:05:27'),
(101, 'ЕЛ-72100', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Telfer_Energomash_EL-72100.jpg', 15, 1, '21429.0000', 0, 0, '2019-12-13', '32.50000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 88, '2019-12-13 05:25:06', '2020-04-15 11:03:19'),
(102, '250/500 SZ038645', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Mini_elektricheskaya_tal_12m_230V_statsionarnaya_m.jpg', 12, 1, '10685.0000', 0, 0, '2019-12-13', '16.30000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 79, '2019-12-13 05:25:08', '2020-04-15 11:01:22'),
(103, 'KX 500 00002842', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskaya_peredvijnaya_lebedka_250kg500kg_22.jpg', 17, 1, '21429.0000', 0, 0, '2019-12-13', '33.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 68, '2019-12-13 05:25:10', '2020-04-15 11:06:01'),
(104, 'TF-1000 52016', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskiy_telfer_DENZEL_TF-1000_52016.jpg', 21, 1, '16189.0000', 0, 0, '2019-12-13', '32.26000000', 1, '560.00000000', '260.00000000', '360.00000000', 1, 1, 1, 1, 1, 67, '2019-12-13 05:25:12', '2020-04-15 11:26:40'),
(105, '4.810', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Podvijnyiy_elektrotelfer_SOROKIN_4810.jpg', 16, 1, '34999.0000', 0, 0, '2019-12-13', '54.00000000', 1, '560.00000000', '525.00000000', '380.00000000', 1, 1, 1, 1, 1, 79, '2019-12-13 05:25:23', '2020-04-15 11:02:28'),
(106, 'ЗЭТ-1000', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektrotelfer_ZUBR_ZET-1000.jpg', 25, 1, '22790.0000', 0, 0, '2019-12-13', '0.00000000', 1, '310.00000000', '540.00000000', '230.00000000', 1, 1, 1, 1, 1, 72, '2019-12-13 05:25:24', '2020-04-15 11:27:46'),
(107, '4.700', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektrotelfer_SOROKIN_4700.jpg', 16, 1, '22999.0000', 0, 0, '2019-12-13', '34.00000000', 1, '600.00000000', '318.00000000', '370.00000000', 1, 1, 1, 1, 1, 79, '2019-12-13 05:25:27', '2020-04-15 11:28:13'),
(108, '500/1000 SZ038658 ', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Mini_elektricheskaya_tal_12m_230V_kombinirovannaya.jpg', 12, 1, '24995.0000', 0, 0, '2019-12-13', '33.00000000', 1, '545.00000000', '230.00000000', '305.00000000', 1, 1, 1, 1, 1, 76, '2019-12-13 05:25:29', '2020-04-15 11:00:48'),
(109, 'PA-500/1000  110100', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskaya_tal_TOR_PA-5001000__110100.jpg', 20, 1, '14679.0000', 0, 0, '2019-12-13', '34.00000000', 1, '560.00000000', '250.00000000', '360.00000000', 1, 1, 1, 1, 1, 78, '2019-12-13 05:25:31', '2020-04-15 11:24:49'),
(110, 'TC-EH 1000 2255160', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskiy_telfer_EINHELL_TC-EH_1000_2255160.jpg', 22, 1, '23900.0000', 0, 0, '2019-12-13', '31.95000000', 1, '544.00000000', '244.00000000', '343.00000000', 1, 1, 1, 1, 1, 65, '2019-12-13 05:25:33', '2020-04-15 11:26:59'),
(111, 'CD1 00012333', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskaya_statsionarnaya_tal_gp_1tn_vp_12m_s.jpg', 17, 1, '77660.0000', 0, 0, '2019-12-13', '157.00000000', 1, '1200.00000000', '600.00000000', '600.00000000', 1, 1, 1, 1, 1, 46, '2019-12-13 05:25:35', '2020-04-15 11:07:27'),
(112, 'РА-1000 Н=12/6м 004-5050', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Elektricheskaya_statsionarnaya_tal_Zitrek_RA-1000_.jpg', 19, 1, '12990.0000', 0, 0, '2019-12-13', '32.00000000', 1, '550.00000000', '250.00000000', '350.00000000', 1, 1, 1, 1, 1, 65, '2019-12-13 05:25:37', '2020-04-15 11:23:51'),
(113, 'РА-1000А 00006520 ', '', '', '', '', '', '', '0', 100, 7, '/catalog/tal_0_5t/Lebedka_elektricheskaya_statsionarnaya_gp_5001000_.jpg', 17, 1, '21429.0000', 0, 0, '2019-12-13', '0.00000000', 1, '560.00000000', '240.00000000', '330.00000000', 1, 1, 1, 1, 1, 101, '2019-12-13 05:25:40', '2020-04-24 19:31:46'),
(114, 'РА-1000А-18M 00012978 ', '', '', '', '', '', '', '0', 1, 7, '/catalog/tal_0_5t/Lebedka_elektricheskaya_statsionarnaya_gp_5001000_.jpg', 17, 1, '21849.0000', 0, 0, '2019-12-13', '0.00000000', 1, '560.00000000', '240.00000000', '330.00000000', 1, 1, 1, 1, 1, 90, '2019-12-13 05:25:42', '2020-04-15 11:00:15'),
(115, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-t/seriya-t01--t17---telfer-elektricheskiy-kanatnyiy-statsionranyiy-v-ispolnennii-na-lapah_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-08', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 8, '2020-05-08 01:58:54', '2020-05-08 01:58:54'),
(116, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-t/seriya-t02-t35---telfer-elektricheskiy-kanatnyiy-statsionranyiy-v-ispolnennii-na-paltsah_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-08', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-08 01:58:54', '2020-05-08 01:58:54'),
(117, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-t/seriya-t10--t39---telfer-elektricheskiy-kanatnyiy-peredvijnoy_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-08', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-08 01:58:55', '2020-05-08 01:58:55'),
(118, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-t/seriya-t45--t78---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-s-umenshennoy-s_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-08', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-08 01:58:56', '2020-05-08 01:58:56'),
(119, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-t/seriya-t81--t82---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-kranovoy-telejk_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-08', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 9, '2020-05-08 01:58:57', '2020-05-08 01:58:57'),
(120, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-mt/seriya-mt---telfer-elektricheskiy-kanatnyiy-statsionranyiy_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:04:53', '2020-05-13 08:04:53'),
(121, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-mt/seriya-mt--en---telfer-elektricheskiy-kanatnyiy-peredvijnoy_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:04:54', '2020-05-13 08:04:54'),
(122, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-mt/seriya-mt--ek---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-s-umenshennoy-str_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:04:54', '2020-05-13 08:04:54'),
(123, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-mt/seriya-mt--ed---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-kranovoy-telejki_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 7, '2020-05-13 08:04:55', '2020-05-13 08:04:55'),
(124, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-vt/seriya-vt01--vt17---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-statsionranyiy-_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:05:24', '2020-05-13 08:05:24'),
(125, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-vt/seriya-vt02--vt35--telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-statsionranyiy-v_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:05:24', '2020-05-13 08:05:24'),
(126, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-vt/seriya-vt10--vt39---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:05:25', '2020-05-13 08:05:25'),
(127, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-vt/seriya-vt45--vt78---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-i_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:05:25', '2020-05-13 08:05:25'),
(128, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-vt/seriya-vt81--vt82---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-i_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:05:26', '2020-05-13 08:05:26'),
(129, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-bmt/seriya-vmt---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-statsionranyiy_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:05:42', '2020-05-13 08:05:42'),
(130, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-bmt/seriya-mt--en---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-05-13 08:05:43', '2020-05-13 08:05:43'),
(131, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-bmt/seriya-mt--ek---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-ispol_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 7, '2020-05-13 08:05:43', '2020-05-13 08:05:43'),
(132, '', '', '', '', '', '', '', '0', 1, 7, '/catalog/telferu/telfery-serii-bmt/seriya-mt--ed---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-ispol_0.jpg', 0, 1, '0.0000', 0, 0, '2020-05-13', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 7, '2020-05-13 08:05:44', '2020-05-13 08:05:44');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(75, 12, 1, '1'),
(75, 13, 1, '6'),
(75, 14, 1, '380'),
(75, 15, 1, '1500'),
(76, 14, 1, '380'),
(76, 12, 1, '1'),
(76, 13, 1, '12'),
(77, 16, 1, '6'),
(78, 15, 1, '3000'),
(78, 17, 1, '11'),
(78, 16, 1, '6'),
(79, 14, 1, '380'),
(79, 12, 1, '1'),
(79, 13, 1, '24'),
(80, 16, 1, '24'),
(81, 15, 1, '3000'),
(81, 17, 1, '11'),
(81, 16, 1, '9'),
(82, 14, 1, '380'),
(82, 12, 1, '1'),
(82, 13, 1, '36'),
(83, 13, 1, '30'),
(83, 16, 1, '30'),
(84, 14, 1, '380'),
(84, 12, 1, '1'),
(84, 13, 1, '18'),
(85, 15, 1, '1600'),
(86, 15, 1, '1600'),
(86, 16, 1, '12'),
(87, 15, 1, '1600'),
(88, 14, 1, '380'),
(88, 15, 1, '1100'),
(89, 14, 1, '380'),
(89, 12, 1, '1'),
(89, 13, 1, '6'),
(90, 15, 1, '3000'),
(90, 12, 1, '1'),
(90, 13, 1, '9'),
(90, 14, 1, '380'),
(91, 16, 1, '24'),
(92, 15, 1, '2000'),
(92, 12, 1, '1'),
(92, 13, 1, '12'),
(92, 14, 1, '380'),
(93, 15, 1, '3000'),
(94, 17, 1, '7.4'),
(94, 16, 1, '24'),
(94, 12, 1, '1'),
(94, 14, 1, '380'),
(94, 15, 1, '1500'),
(95, 15, 1, '1600'),
(95, 12, 1, '0,5'),
(95, 13, 1, '12'),
(95, 14, 1, '220'),
(96, 15, 1, '930'),
(96, 12, 1, '0,5'),
(96, 13, 1, '12'),
(96, 14, 1, '220'),
(97, 15, 1, '1600'),
(97, 12, 1, '0,5'),
(97, 13, 1, '12'),
(97, 14, 1, '220'),
(98, 15, 1, '1500'),
(98, 12, 1, '0,5'),
(98, 13, 1, '9'),
(98, 14, 1, '380'),
(99, 15, 1, '1000'),
(99, 12, 1, '0,5'),
(99, 14, 1, '220'),
(100, 15, 1, '1600'),
(100, 12, 1, '0,5'),
(100, 13, 1, '18,5'),
(100, 14, 1, '220'),
(101, 15, 1, '1600'),
(101, 12, 1, '0,5'),
(101, 13, 1, '18,5'),
(101, 14, 1, '220'),
(102, 15, 1, '900'),
(102, 16, 1, '12'),
(102, 17, 1, '4.2'),
(102, 18, 1, '10'),
(103, 15, 1, '1020'),
(103, 12, 1, '0,5'),
(103, 13, 1, '12'),
(103, 14, 1, '220'),
(104, 15, 1, '1600'),
(104, 12, 1, '0,5'),
(104, 13, 1, '12'),
(104, 14, 1, '220'),
(105, 15, 1, '1650'),
(105, 12, 1, '0,5'),
(105, 13, 1, '12'),
(105, 14, 1, '220'),
(106, 15, 1, '1600'),
(106, 12, 1, '0,5'),
(106, 13, 1, '12'),
(106, 14, 1, '220'),
(107, 15, 1, '2000'),
(107, 12, 1, '0,5'),
(107, 13, 1, '12'),
(107, 14, 1, '220'),
(108, 15, 1, '1600'),
(108, 12, 1, '0,5'),
(108, 13, 1, '12,3'),
(108, 14, 1, '220'),
(109, 15, 1, '1600'),
(109, 12, 1, '0,5'),
(109, 13, 1, '12'),
(109, 14, 1, '220'),
(110, 15, 1, '1600'),
(110, 12, 1, '0,5'),
(110, 13, 1, '18'),
(110, 14, 1, '220'),
(111, 15, 1, '1500'),
(111, 12, 1, '0,5'),
(111, 13, 1, '12'),
(111, 14, 1, '380'),
(112, 16, 1, '12'),
(112, 12, 1, '0,5'),
(112, 13, 1, '12'),
(112, 14, 1, '220'),
(113, 15, 1, '1600'),
(113, 16, 1, '12'),
(113, 17, 1, '5.6'),
(113, 18, 1, '8'),
(113, 19, 1, 'канатный'),
(114, 15, 1, '1600'),
(114, 12, 1, '0,5'),
(114, 13, 1, '18'),
(114, 14, 1, '220'),
(93, 14, 1, '380'),
(93, 13, 1, '30'),
(93, 12, 1, '1'),
(88, 12, 1, '1'),
(85, 16, 1, '18'),
(85, 17, 1, '5.6'),
(87, 16, 1, '11'),
(87, 17, 1, '5.6'),
(77, 19, 1, 'канатный'),
(80, 12, 1, '1'),
(83, 12, 1, '1'),
(91, 15, 1, '3000'),
(91, 13, 1, '24'),
(91, 12, 1, '1'),
(78, 14, 1, '380'),
(78, 13, 1, '6'),
(78, 12, 1, '1'),
(81, 14, 1, '380'),
(81, 13, 1, '9'),
(81, 12, 1, '1'),
(86, 14, 1, '220'),
(86, 12, 1, '1'),
(113, 14, 1, '220'),
(113, 13, 1, '12'),
(113, 12, 1, '0,5'),
(114, 16, 1, '18'),
(114, 17, 1, '5.6'),
(114, 18, 1, '8'),
(114, 19, 1, 'канатный'),
(108, 16, 1, '12'),
(108, 17, 1, '5.6'),
(108, 18, 1, '10'),
(108, 19, 1, 'канатный'),
(102, 14, 1, '220'),
(102, 13, 1, '12,3'),
(102, 12, 1, '0,5'),
(102, 19, 1, 'канатный'),
(99, 19, 1, 'канатный'),
(96, 16, 1, '6'),
(96, 17, 1, '3'),
(96, 18, 1, '10'),
(96, 19, 1, 'канатный'),
(105, 16, 1, '12'),
(105, 17, 1, '6'),
(105, 18, 1, '10'),
(105, 19, 1, 'канатный'),
(93, 16, 1, '9'),
(93, 18, 1, '7,3'),
(93, 19, 1, 'канатный'),
(88, 18, 1, '4,3'),
(88, 19, 1, 'цепной'),
(101, 16, 1, '18'),
(101, 17, 1, '5.6'),
(101, 18, 1, '10'),
(101, 19, 1, 'канатный'),
(77, 12, 1, '1'),
(80, 19, 1, 'канатный'),
(83, 18, 1, '8'),
(83, 19, 1, 'канатный'),
(91, 18, 1, '8'),
(91, 19, 1, 'канатный'),
(78, 18, 1, '8'),
(78, 19, 1, 'канатный'),
(100, 16, 1, '18'),
(100, 17, 1, '5.6'),
(100, 18, 1, '10'),
(100, 19, 1, 'канатный'),
(85, 14, 1, '220'),
(85, 13, 1, '18'),
(85, 12, 1, '1'),
(103, 16, 1, '11'),
(103, 17, 1, '4.2'),
(103, 18, 1, '10'),
(103, 19, 1, 'канатный'),
(87, 14, 1, '220'),
(87, 13, 1, '12'),
(87, 12, 1, '1'),
(92, 16, 1, '12'),
(92, 17, 1, '11'),
(92, 18, 1, '8'),
(92, 19, 1, 'канатный'),
(111, 16, 1, '12'),
(111, 17, 1, '7.4'),
(111, 18, 1, '8'),
(111, 19, 1, 'канатный'),
(98, 16, 1, '9'),
(98, 17, 1, '7.4'),
(98, 18, 1, '8'),
(98, 19, 1, 'канатный'),
(81, 18, 1, '8'),
(81, 19, 1, 'канатный'),
(112, 19, 1, 'канатный'),
(75, 16, 1, '6'),
(75, 17, 1, '7.4'),
(75, 18, 1, '8'),
(75, 19, 1, 'канатный'),
(90, 16, 1, '9'),
(90, 17, 1, '11'),
(90, 18, 1, '8'),
(90, 19, 1, 'канатный'),
(109, 16, 1, '12'),
(109, 17, 1, '6.2'),
(109, 19, 1, 'канатный'),
(84, 15, 1, '1500'),
(84, 16, 1, '18'),
(84, 19, 1, 'канатный'),
(76, 15, 1, '3000'),
(76, 16, 1, '12'),
(76, 19, 1, 'канатный'),
(79, 15, 1, '3000'),
(79, 16, 1, '24'),
(79, 19, 1, 'канатный'),
(82, 15, 1, '3000'),
(82, 16, 1, '36'),
(82, 19, 1, 'канатный'),
(89, 15, 1, '3000'),
(89, 16, 1, '6'),
(89, 19, 1, 'канатный'),
(94, 18, 1, '8'),
(94, 19, 1, 'канатный'),
(104, 16, 1, '12'),
(104, 17, 1, '5.6'),
(104, 18, 1, '4'),
(104, 19, 1, 'канатный'),
(110, 16, 1, '18'),
(110, 17, 1, '6'),
(110, 18, 1, '8'),
(110, 19, 1, 'канатный'),
(86, 18, 1, '8'),
(86, 19, 1, 'канатный'),
(97, 16, 1, '12'),
(97, 19, 1, 'канатный'),
(106, 16, 1, '12'),
(106, 17, 1, '5.6'),
(106, 18, 1, '8'),
(106, 19, 1, 'канатный'),
(95, 16, 1, '12'),
(95, 17, 1, '5.6'),
(95, 18, 1, '8'),
(95, 19, 1, 'канатный'),
(107, 16, 1, '12'),
(107, 17, 1, '5'),
(107, 18, 1, '10'),
(107, 19, 1, 'канатный'),
(85, 18, 1, '8'),
(85, 19, 1, 'канатный'),
(87, 18, 1, '8'),
(87, 19, 1, 'канатный'),
(115, 28, 1, 'Тельфер стационарный на лапах'),
(115, 29, 1, '500 – 16 000 кг'),
(115, 30, 1, '1/1; 2/1; 4/1; 2/2'),
(115, 31, 1, '6– 72 m'),
(115, 32, 1, '4 – 32 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(116, 29, 1, 'Тельфер стационарный на пальцах'),
(116, 30, 1, '500 – 16 000 кг'),
(116, 31, 1, '1/1; 2/1; 4/1; 2/2'),
(116, 32, 1, '6– 72 m'),
(117, 29, 1, 'Тельфер с монорельсовой тележкой (нормальная строительная высота)'),
(117, 30, 1, '500 – 12 500 кг'),
(117, 33, 1, '2/1; 4/1;'),
(117, 32, 1, 'специальные исполнения – 1/1; 2/2'),
(117, 34, 1, '6 – 36 m'),
(118, 29, 1, 'Тельфер с монорельсовой тележкой (уменьшенная строительная высота)'),
(118, 30, 1, '500 – 12 500 кг'),
(118, 33, 1, '2/1; 4/1;'),
(118, 32, 1, 'специальные исполнения – 1/1; 2/2'),
(118, 34, 1, '6 – 36 m'),
(119, 29, 1, 'Тельфер с двухрельсовой тележкой'),
(119, 30, 1, '1 000 – 16 000 кг'),
(119, 33, 1, '1/1; 2/1; 4/1; 2/2;'),
(119, 32, 1, '6 – 36 m'),
(119, 34, 1, 'специальные исполнения – до 72 m'),
(119, 35, 1, '4 – 16 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(120, 29, 1, 'Стационарный'),
(120, 30, 1, '160 – 32 000 кг специальные исполнения – до 63 000 кг'),
(120, 31, 1, '1/1; 2/1; 4/1; 2х1; 2?2; 4х2;'),
(120, 32, 1, '5.5 – 104 m'),
(121, 29, 1, 'С монорельсовой тележкой (нормальная строительная высота)'),
(121, 30, 1, '160 – 20 000 кг'),
(121, 31, 1, '2/1; 4/1; 2х1; 4х2; специальные исполнения – 1/1; 2/2; 2х2/1-1;'),
(121, 32, 1, '5.5 – 60 m специальные исполнения – до 120 m'),
(121, 34, 1, '1 – 32 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(122, 29, 1, 'С монорельсовой тележкой (уменьшенная строительная высота)'),
(122, 30, 1, '320 – 16 000 кг специальные исполнения – до 20 000 кг'),
(122, 31, 1, '2/1; 4/1; 2х1; 4х2;'),
(122, 32, 1, '5.5 – 60 m специальные исполнения – до 120 m'),
(122, 34, 1, '1 – 32 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(123, 29, 1, 'с двухрельсовой тележкой'),
(123, 30, 1, '320 – 16 000 кг специальные исполнения – до 20 000 кг'),
(123, 31, 1, '2/1; 4/1; 2х1; 4х2 специальные исполнения – 4/2'),
(123, 32, 1, '5.5 – 60 m специальные исполнения– до 120 m'),
(123, 34, 1, '1 – 32 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(124, 29, 1, 'стационарный'),
(124, 30, 1, '320 – 16 000 кг'),
(124, 31, 1, '1/1; 2/1; 4/1; 2/2'),
(124, 32, 1, '6– 72 m'),
(125, 29, 1, 'стационарный'),
(125, 30, 1, '320 – 16 000 кг'),
(125, 31, 1, '1/1; 2/1; 4/1; 2/2'),
(125, 32, 1, '6– 72 m'),
(126, 29, 1, 'с монорельсовой тележкой (нормальная строительная высота)'),
(126, 30, 1, '320 – 12 500 кг'),
(126, 33, 1, '2/1; 4/1;'),
(126, 32, 1, '6 – 36 m специальные исполнения – до 72 m'),
(126, 34, 1, '2 – 8 m/min (с микроскоростью при соотношениях 1:4 и 1:6) специальные исполнения – 16 m/min'),
(127, 29, 1, 'с монорельсовой тележкой (уменьшенная строительная высота)'),
(127, 30, 1, '320 – 16 000 кг специальные исполнения – до 20 000 кг'),
(127, 31, 1, '2/1; 4/1; 2х1; 4х2специальные исполнения – 4/2'),
(127, 32, 1, '5.5 – 60 m специальные исполнения – до 120 m'),
(127, 34, 1, '1 – 32 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(128, 29, 1, 'с двухрельсовой тележкой'),
(128, 30, 1, '1 000 – 16 000 кг'),
(128, 31, 1, '1/1; 2/1; 4/1; 2/2;'),
(128, 34, 1, '6 – 36 m специальные исполнения– до 72 m'),
(128, 32, 1, '2 – 8 m/min (с микроскоростью при соотношении 1:4) специальные исполнения– 32 m/min'),
(128, 35, 1, '8; 10; 12; 15; 20 m/min (с микроскоростью при соотношении 1:3)'),
(129, 29, 1, 'стационарный'),
(129, 30, 1, '320 – 32 000 кг специальные исполнения – до 63 000 кг'),
(129, 31, 1, '1/1; 2/1; 4/1; 2х1; 2?2; 4х2; специальные исполнения – 6/1; 8/1; 2х3/1-1; 2х4/1-1'),
(129, 32, 1, '5.5 – 104 m'),
(130, 29, 1, 'с монорельсовой тележкой (нормальная строительная высота)'),
(130, 30, 1, '160 – 20 000 кг специальные исполнения – до 63 000 кг'),
(130, 31, 1, '2/1; 4/1; 2х1; 4х2; специальные исполнения – 1/1; 2/2; 2х2/1-1;'),
(130, 32, 1, '5.5 – 60 mспециальные исполнения – до 120 m'),
(130, 34, 1, '1 – 32 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(131, 29, 1, 'с монорельсовой тележкой (уменьшенная строительная высота)'),
(131, 30, 1, '320 – 32 000 кг специальные исполнения – до 63 000 кг'),
(131, 31, 1, '1/1; 2/1; 4/1; 2х1; 2х2; 4х2 специальные исполнения – 6/1; 8/1; 2х3/1-1; 2х4/1-1'),
(131, 32, 1, '5.5 – 104 m специальные исполнения – до 120 m'),
(132, 29, 1, 'с двухрельсовой тележкой'),
(132, 30, 1, '1000 – 32 000 кг специальные исполнения – до 63 000 кг'),
(132, 31, 1, '1/1; 2/1; 4/1; 2х1; 2?2; 4х2 специальные исполнения – 6/1; 8/1; 2х3/1-1; 2х4/1-1'),
(132, 32, 1, '5.5 – 60 m специальные исполнения– до 120 m'),
(132, 34, 1, '1 – 32 m/min (с микроскоростью при соотношениях 1:4 и 1:6)'),
(132, 35, 1, '8; 10; 12; 15; 20; 32; 40 m/min (с микроскоростью при соотношении 1:3)');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(75, 1, ' Электрическая таль (г/п 1 т, в/п 6м, скорость подъема 8м/мин, скорость передвижения 20м/мин + тормоз, тепловая защита двигателя подъема и передвижения, крановое исполнение) EURO-LIFT CD1 00009797  ', '', '', ' Электрическая таль (г/п 1 т, в/п 6м, скорость подъема 8м/мин, скорость передвижения 20м/мин + тормоз, тепловая защита двигателя подъема и передвижения, крановое исполнение) EURO-LIFT CD1 00009797  ', ' Электрическая таль (г/п 1 т, в/п 6м, скорость подъема 8м/мин, скорость передвижения 20м/мин + тормоз, тепловая защита двигателя подъема и передвижения, крановое исполнение) EURO-LIFT CD1 00009797  ', ''),
(76, 1, ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 12 м 109212  ', '', '', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 12 м 109212  ', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 12 м 109212  ', ''),
(77, 1, ' Электрическая передвижная таль Российский Т-10 004-5272  ', '', '', ' Электрическая передвижная таль Российский Т-10 004-5272  ', ' Электрическая передвижная таль Российский Т-10 004-5272  ', ''),
(78, 1, ' Электрическая стационарная таль (CD1 г/п 2т, в/п 6м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012334  ', '', '', ' Электрическая стационарная таль (CD1 г/п 2т, в/п 6м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012334  ', ' Электрическая стационарная таль (CD1 г/п 2т, в/п 6м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012334  ', ''),
(79, 1, ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 24 м 109224  ', '', '', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 24 м 109224  ', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 24 м 109224  ', ''),
(80, 1, ' Электрическая передвижная таль Российский Т-10 004-5454  ', '', '', ' Электрическая передвижная таль Российский Т-10 004-5454  ', ' Электрическая передвижная таль Российский Т-10 004-5454  ', ''),
(81, 1, ' Электрическая стационарная таль CD1 (г/п 2 т, в/п 9м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012335  ', '', '', ' Электрическая стационарная таль CD1 (г/п 2 т, в/п 9м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012335  ', ' Электрическая стационарная таль CD1 (г/п 2 т, в/п 9м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012335  ', ''),
(82, 1, ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 36 м 109236  ', '', '', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 36 м 109236  ', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 36 м 109236  ', ''),
(83, 1, ' Электрическая передвижная таль Российский ТЭ-200 004-5340  ', '', '', ' Электрическая передвижная таль Российский ТЭ-200 004-5340  ', ' Электрическая передвижная таль Российский ТЭ-200 004-5340  ', ''),
(84, 1, ' Электрическая таль TOR ТЭК (CD) г/п 1,0 т 18 м 109118  ', '', '', ' Электрическая таль TOR ТЭК (CD) г/п 1,0 т 18 м 109118  ', ' Электрическая таль TOR ТЭК (CD) г/п 1,0 т 18 м 109118  ', ''),
(85, 1, ' Электрическая передвижная лебедка (18м/9м, 500кг/1000кг, 220В) EURO-LIFT KX 1000 00016930  ', '', '', ' Электрическая передвижная лебедка (18м/9м, 500кг/1000кг, 220В) EURO-LIFT KX 1000 00016930  ', ' Электрическая передвижная лебедка (18м/9м, 500кг/1000кг, 220В) EURO-LIFT KX 1000 00016930  ', ''),
(86, 1, ' Электрический тельфер PRORAB LT 1000 P  ', '', '', ' Электрический тельфер PRORAB LT 1000 P  ', ' Электрический тельфер PRORAB LT 1000 P  ', ''),
(87, 1, ' Электрическая передвижная лебедка (500кг/1000кг, 220В) EURO-LIFT KX 1000 00002841  ', '', '', ' Электрическая передвижная лебедка (500кг/1000кг, 220В) EURO-LIFT KX 1000 00002841  ', ' Электрическая передвижная лебедка (500кг/1000кг, 220В) EURO-LIFT KX 1000 00002841  ', ''),
(88, 1, ' Профессиональный цепной электротельфер СОРОКИН 4.601  ', '', '', ' Профессиональный цепной электротельфер СОРОКИН 4.601  ', ' Профессиональный цепной электротельфер СОРОКИН 4.601  ', ''),
(89, 1, ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 6 м 10926  ', '', '', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 6 м 10926  ', ' Электрическая таль TOR ТЭК (CD) г/п 2,0 т 6 м 10926  ', ''),
(90, 1, ' Электрическая таль (г/п 2 т, в/п 9м, скорость подъема 8м/мин, скорость передвижения 20м/мин + тормоз, тепловая защита двигателя подъема и передвижения, крановое исполнение) EURO-LIFT CD1 00019396  ', '', '', ' Электрическая таль (г/п 2 т, в/п 9м, скорость подъема 8м/мин, скорость передвижения 20м/мин + тормоз, тепловая защита двигателя подъема и передвижения, крановое исполнение) EURO-LIFT CD1 00019396  ', ' Электрическая таль (г/п 2 т, в/п 9м, скорость подъема 8м/мин, скорость передвижения 20м/мин + тормоз, тепловая защита двигателя подъема и передвижения, крановое исполнение) EURO-LIFT CD1 00019396  ', ''),
(91, 1, ' Электрическая передвижная таль Российский ТЭ-200 004-5452  ', '', '', ' Электрическая передвижная таль Российский ТЭ-200 004-5452  ', ' Электрическая передвижная таль Российский ТЭ-200 004-5452  ', ''),
(92, 1, ' Электрическая передвижная таль Zitrek CD-200 2т 12м 004-6027  ', '', '', ' Электрическая передвижная таль Zitrek CD-200 2т 12м 004-6027  ', ' Электрическая передвижная таль Zitrek CD-200 2т 12м 004-6027  ', ''),
(93, 1, ' Профессиональный тросовый электротельфер СОРОКИН 4.622  ', '', '', ' Профессиональный тросовый электротельфер СОРОКИН 4.622  ', ' Профессиональный тросовый электротельфер СОРОКИН 4.622  ', ''),
(94, 1, ' Электрическая таль, г/п 1,0 т, 24 м TOR ТЭК CD 109124  ', '', '', ' Электрическая таль, г/п 1,0 т, 24 м TOR ТЭК CD 109124  ', ' Электрическая таль, г/п 1,0 т, 24 м TOR ТЭК CD 109124  ', ''),
(95, 1, ' Электротельфер с продольным ходом Калибр ЭТФ-1000П 00000043383  ', '', '', ' Электротельфер с продольным ходом Калибр ЭТФ-1000П 00000043383  ', ' Электротельфер с продольным ходом Калибр ЭТФ-1000П 00000043383  ', ''),
(96, 1, ' Подвижный электротельфер СОРОКИН 4.805  ', '', '', ' Подвижный электротельфер СОРОКИН 4.805  ', ' Подвижный электротельфер СОРОКИН 4.805  ', ''),
(97, 1, ' Электроталь OLYMP OL20500  ', '', '', ' Электроталь OLYMP OL20500  ', ' Электроталь OLYMP OL20500  ', ''),
(98, 1, ' Электрическая стационарная таль CD1 (г/п 1т, в/п 9м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012332  ', '', '', ' Электрическая стационарная таль CD1 (г/п 1т, в/п 9м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012332  ', ' Электрическая стационарная таль CD1 (г/п 1т, в/п 9м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT 00012332  ', ''),
(99, 1, ' Подвесная таль ROCKFORCE 250 кг RF-TRH1005  ', '', '', ' Подвесная таль ROCKFORCE 250 кг RF-TRH1005  ', ' Подвесная таль ROCKFORCE 250 кг RF-TRH1005  ', ''),
(100, 1, ' Электрическая лебедка Sturm EH72100  ', '', '', ' Электрическая лебедка Sturm EH72100  ', ' Электрическая лебедка Sturm EH72100  ', ''),
(101, 1, ' Тельфер Энергомаш ЕЛ-72100  ', '', '', ' Тельфер Энергомаш ЕЛ-72100  ', ' Тельфер Энергомаш ЕЛ-72100  ', ''),
(102, 1, ' Мини электрическая таль 12м, 230В, стационарная модель Magnus Profi MEH 250/500 SZ038645  ', '', '', ' Мини электрическая таль 12м, 230В, стационарная модель Magnus Profi MEH 250/500 SZ038645  ', ' Мини электрическая таль 12м, 230В, стационарная модель Magnus Profi MEH 250/500 SZ038645  ', ''),
(103, 1, ' Электрическая передвижная лебедка (250кг/500кг, 220В) EURO-LIFT KX 500 00002842  ', '', '', ' Электрическая передвижная лебедка (250кг/500кг, 220В) EURO-LIFT KX 500 00002842  ', ' Электрическая передвижная лебедка (250кг/500кг, 220В) EURO-LIFT KX 500 00002842  ', ''),
(104, 1, ' Электрический тельфер DENZEL TF-1000 52016  ', '', '', ' Электрический тельфер DENZEL TF-1000 52016  ', ' Электрический тельфер DENZEL TF-1000 52016  ', ''),
(105, 1, ' Подвижный электротельфер СОРОКИН 4.810  ', '', '', ' Подвижный электротельфер СОРОКИН 4.810  ', ' Подвижный электротельфер СОРОКИН 4.810  ', ''),
(106, 1, ' Электротельфер ЗУБР ЗЭТ-1000  ', '', '', ' Электротельфер ЗУБР ЗЭТ-1000  ', ' Электротельфер ЗУБР ЗЭТ-1000  ', ''),
(107, 1, ' Электротельфер СОРОКИН 4.700  ', '', '', ' Электротельфер СОРОКИН 4.700  ', ' Электротельфер СОРОКИН 4.700  ', ''),
(108, 1, ' Мини электрическая таль 12м, 230В, комбинированная модель Magnus Profi MEH 500/1000 SZ038658  ', '', '', ' Мини электрическая таль 12м, 230В, комбинированная модель Magnus Profi MEH 500/1000 SZ038658  ', ' Мини электрическая таль 12м, 230В, комбинированная модель Magnus Profi MEH 500/1000 SZ038658  ', ''),
(109, 1, ' Электрическая таль TOR PA-500/1000  110100  ', '', '', ' Электрическая таль TOR PA-500/1000  110100  ', ' Электрическая таль TOR PA-500/1000  110100  ', ''),
(110, 1, ' Электрический тельфер EINHELL TC-EH 1000 2255160  ', '', '', ' Электрический тельфер EINHELL TC-EH 1000 2255160  ', ' Электрический тельфер EINHELL TC-EH 1000 2255160  ', ''),
(111, 1, ' Электрическая стационарная таль (г/п 1тн, в/п 12м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT CD1 00012333  ', '', '', ' Электрическая стационарная таль (г/п 1тн, в/п 12м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT CD1 00012333  ', ' Электрическая стационарная таль (г/п 1тн, в/п 12м, скорость подъема 8м/мин, тепловая защита двигателя подъема, крановое исполнение) EURO-LIFT CD1 00012333  ', ''),
(112, 1, ' Электрическая стационарная таль Zitrek РА-1000 Н=12/6м 004-5050  ', '', '', ' Электрическая стационарная таль Zitrek РА-1000 Н=12/6м 004-5050  ', ' Электрическая стационарная таль Zitrek РА-1000 Н=12/6м 004-5050  ', ''),
(113, 1, ' Лебедка электрическая стационарная (г/п 500/1000 кг, высота подъема 12/6 м, IP54) EURO-LIFT РА-1000А 00006520  ', '&lt;p&gt;&amp;nbsp;Лебедка электрическая стационарная (г/п 500/1000 кг, высота подъема 12/6 м, IP54) EURO-LIFT РА-1000А 00006520&amp;nbsp; &lt;br&gt;&lt;/p&gt;', '', ' Лебедка электрическая стационарная (г/п 500/1000 кг, высота подъема 12/6 м, IP54) EURO-LIFT РА-1000А 00006520  ', ' Лебедка электрическая стационарная (г/п 500/1000 кг, высота подъема 12/6 м, IP54) EURO-LIFT РА-1000А 00006520  ', ''),
(114, 1, ' Лебедка электрическая стационарная (г/п 500/1000 кг, высота подъема 18/9 м, IP54) EURO-LIFT РА-1000А-18M 00012978  ', '', '', ' Лебедка электрическая стационарная (г/п 500/1000 кг, высота подъема 18/9 м, IP54) EURO-LIFT РА-1000А-18M 00012978  ', ' Лебедка электрическая стационарная (г/п 500/1000 кг, высота подъема 18/9 м, IP54) EURO-LIFT РА-1000А-18M 00012978  ', ''),
(115, 1, 'Серия Т01, T17 - тельфер электрический канатный стационраный в исполненнии на лапах', '', '', 'Серия Т01, T17 - тельфер электрический канатный стационраный в исполненнии на лапах', 'Серия Т01, T17 - тельфер электрический канатный стационраный в исполненнии на лапах', ''),
(116, 1, 'Серия Т02,T35-  тельфер электрический канатный стационраный в исполненнии на пальцах', '', '', 'Серия Т02,T35-  тельфер электрический канатный стационраный в исполненнии на пальцах', 'Серия Т02,T35-  тельфер электрический канатный стационраный в исполненнии на пальцах', ''),
(117, 1, 'Серия Т10, T39 - тельфер электрический канатный передвижной', '', '', 'Серия Т10, T39 - тельфер электрический канатный передвижной', 'Серия Т10, T39 - тельфер электрический канатный передвижной', ''),
(118, 1, 'Серия Т45, T78 - тельфер электрический канатный передвижной в исполнении с уменьшенной строительной высотой', '', '', 'Серия Т45, T78 - тельфер электрический канатный передвижной в исполнении с уменьшенной строительной высотой', 'Серия Т45, T78 - тельфер электрический канатный передвижной в исполнении с уменьшенной строительной высотой', ''),
(119, 1, 'Серия Т81, T82 - тельфер электрический канатный передвижной в исполнении крановой тележки', '', '', 'Серия Т81, T82 - тельфер электрический канатный передвижной в исполнении крановой тележки', 'Серия Т81, T82 - тельфер электрический канатный передвижной в исполнении крановой тележки', ''),
(120, 1, 'Серия МТ - тельфер электрический канатный стационраный', '', '', 'Серия МТ - тельфер электрический канатный стационраный', 'Серия МТ - тельфер электрический канатный стационраный', ''),
(121, 1, 'Серия MT, EN - тельфер электрический канатный передвижной', '', '', 'Серия MT, EN - тельфер электрический канатный передвижной', 'Серия MT, EN - тельфер электрический канатный передвижной', ''),
(122, 1, 'Серия MT, EK - тельфер электрический канатный передвижной в исполнении с уменьшенной строительной высотой', '', '', 'Серия MT, EK - тельфер электрический канатный передвижной в исполнении с уменьшенной строительной высотой', 'Серия MT, EK - тельфер электрический канатный передвижной в исполнении с уменьшенной строительной высотой', ''),
(123, 1, 'Серия MT, ED - тельфер электрический канатный передвижной в исполнении крановой тележки', '', '', 'Серия MT, ED - тельфер электрический канатный передвижной в исполнении крановой тележки', 'Серия MT, ED - тельфер электрический канатный передвижной в исполнении крановой тележки', ''),
(124, 1, 'Серия ВТ01, ВT17 - тельфер электрический взрывозащищенный канатный стационраный в исполненнии на пальцах', '', '', 'Серия ВТ01, ВT17 - тельфер электрический взрывозащищенный канатный стационраный в исполненнии на пальцах', 'Серия ВТ01, ВT17 - тельфер электрический взрывозащищенный канатный стационраный в исполненнии на пальцах', ''),
(125, 1, 'Серия ВТ02, ВT35- тельфер электрический взрывозащищенный канатный стационраный в исполненнии на лапах', '', '', 'Серия ВТ02, ВT35- тельфер электрический взрывозащищенный канатный стационраный в исполненнии на лапах', 'Серия ВТ02, ВT35- тельфер электрический взрывозащищенный канатный стационраный в исполненнии на лапах', ''),
(126, 1, 'Серия ВТ10, ВT39 - тельфер электрический взрывозащищенный канатный передвижной', '', '', 'Серия ВТ10, ВT39 - тельфер электрический взрывозащищенный канатный передвижной', 'Серия ВТ10, ВT39 - тельфер электрический взрывозащищенный канатный передвижной', ''),
(127, 1, 'Серия ВТ45, ВT78 - тельфер электрический взрывозащищенный канатный передвижной в исполнении с уменьшенной строительной высотой', '', '', 'Серия ВТ45, ВT78 - тельфер электрический взрывозащищенный канатный передвижной в исполнении с уменьшенной строительной высотой', 'Серия ВТ45, ВT78 - тельфер электрический взрывозащищенный канатный передвижной в исполнении с уменьшенной строительной высотой', ''),
(128, 1, 'Серия ВТ81, ВT82 - тельфер электрический взрывозащищенный канатный передвижной в исполнении крановой тележки', '', '', 'Серия ВТ81, ВT82 - тельфер электрический взрывозащищенный канатный передвижной в исполнении крановой тележки', 'Серия ВТ81, ВT82 - тельфер электрический взрывозащищенный канатный передвижной в исполнении крановой тележки', ''),
(129, 1, 'Серия ВМТ - тельфер электрический взрывозащищенный канатный стационраный', '', '', 'Серия ВМТ - тельфер электрический взрывозащищенный канатный стационраный', 'Серия ВМТ - тельфер электрический взрывозащищенный канатный стационраный', ''),
(130, 1, 'Серия MT, EN - тельфер электрический взрывозащищенный канатный передвижной', '', '', 'Серия MT, EN - тельфер электрический взрывозащищенный канатный передвижной', 'Серия MT, EN - тельфер электрический взрывозащищенный канатный передвижной', ''),
(131, 1, 'Серия MT, EK - тельфер электрический взрывозащищенный канатный передвижной в исполнении с уменьшенной строительной высотой', '', '', 'Серия MT, EK - тельфер электрический взрывозащищенный канатный передвижной в исполнении с уменьшенной строительной высотой', 'Серия MT, EK - тельфер электрический взрывозащищенный канатный передвижной в исполнении с уменьшенной строительной высотой', ''),
(132, 1, 'Серия MT, ED - тельфер электрический взрывозащищенный канатный передвижной в исполнении крановой тележки', '', '', 'Серия MT, ED - тельфер электрический взрывозащищенный канатный передвижной в исполнении крановой тележки', 'Серия MT, ED - тельфер электрический взрывозащищенный канатный передвижной в исполнении крановой тележки', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(75, 59),
(76, 59),
(77, 59),
(78, 59),
(79, 59),
(80, 59),
(81, 59),
(82, 59),
(83, 59),
(84, 59),
(85, 59),
(86, 59),
(87, 59),
(88, 59),
(89, 59),
(90, 59),
(91, 59),
(92, 59),
(93, 59),
(94, 59),
(95, 60),
(96, 60),
(97, 60),
(98, 60),
(99, 60),
(100, 60),
(101, 60),
(102, 60),
(103, 60),
(104, 60),
(105, 60),
(106, 60),
(107, 60),
(108, 60),
(109, 60),
(110, 60),
(111, 60),
(112, 60),
(113, 60),
(114, 60),
(115, 61),
(116, 61),
(117, 61),
(118, 61),
(119, 61),
(120, 62),
(121, 62),
(122, 62),
(123, 62),
(124, 63),
(125, 63),
(126, 63),
(127, 63),
(128, 63),
(129, 64),
(130, 64),
(131, 64),
(132, 64);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(75, 0, 2),
(76, 0, 2),
(77, 0, 2),
(78, 0, 2),
(79, 0, 2),
(80, 0, 2),
(81, 0, 2),
(82, 0, 2),
(83, 0, 2),
(84, 0, 2),
(85, 0, 2),
(86, 0, 2),
(87, 0, 2),
(88, 0, 2),
(89, 0, 2),
(90, 0, 2),
(91, 0, 2),
(92, 0, 2),
(93, 0, 2),
(94, 0, 2),
(95, 0, 2),
(96, 0, 2),
(97, 0, 2),
(98, 0, 2),
(99, 0, 2),
(100, 0, 2),
(101, 0, 2),
(102, 0, 2),
(103, 0, 2),
(104, 0, 2),
(105, 0, 2),
(106, 0, 2),
(107, 0, 2),
(108, 0, 2),
(109, 0, 2),
(110, 0, 2),
(111, 0, 2),
(112, 0, 2),
(113, 0, 2),
(114, 0, 2),
(115, 0, 0),
(116, 0, 0),
(117, 0, 0),
(118, 0, 0),
(119, 0, 0),
(120, 0, 0),
(121, 0, 0),
(122, 0, 0),
(123, 0, 0),
(124, 0, 0),
(125, 0, 0),
(126, 0, 0),
(127, 0, 0),
(128, 0, 0),
(129, 0, 0),
(130, 0, 0),
(131, 0, 0),
(132, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возвращены средства'),
(2, 1, 'Выдан в кредит'),
(3, 1, 'Отправлен другой товар для замены');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен/доставлен неисправным (сломан)'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(4, 1, 'Ошибка, пожалуйста укажите/приложите подробности'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Рассматриваемый'),
(3, 1, 'Готов (к отправке)'),
(2, 1, 'Заказ в ожидании');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1736, 0, 'turbo_rss', 'turbo_rss_image_height', '500', 0),
(1735, 0, 'turbo_rss', 'turbo_rss_image_width', '500', 0),
(1734, 0, 'turbo_rss', 'turbo_rss_show_image', '1', 0),
(1733, 0, 'turbo_rss', 'turbo_rss_show_price', '1', 0),
(4691, 0, 'config', 'config_error_display', '0', 0),
(4692, 0, 'config', 'config_error_log', '1', 0),
(4693, 0, 'config', 'config_error_filename', 'error.log', 0),
(4468, 0, 'microdatapro', 'microdatapro_module', 'a:13:{i:0;a:4:{s:9:\"layout_id\";s:1:\"6\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:1;a:4:{s:9:\"layout_id\";s:2:\"10\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:2;a:4:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:3;a:4:{s:9:\"layout_id\";s:1:\"7\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:4;a:4:{s:9:\"layout_id\";s:2:\"12\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:5;a:4:{s:9:\"layout_id\";s:1:\"8\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:6;a:4:{s:9:\"layout_id\";s:1:\"4\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:7;a:4:{s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:8;a:4:{s:9:\"layout_id\";s:2:\"11\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:9;a:4:{s:9:\"layout_id\";s:1:\"5\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:10;a:4:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:11;a:4:{s:9:\"layout_id\";s:2:\"13\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}i:12;a:4:{s:9:\"layout_id\";s:1:\"9\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:4:\"3274\";}}', 1),
(4, 0, 'voucher', 'voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'voucher_status', '1', 0),
(4683, 0, 'config', 'config_compression', '0', 0),
(4684, 0, 'config', 'config_secure', '0', 0),
(4685, 0, 'config', 'config_password', '1', 0),
(4686, 0, 'config', 'config_shared', '0', 0),
(4687, 0, 'config', 'config_encryption', 'qha1ZoiW8FhBxOkO5Wr8N9ODH3yPGmesAKW7E2qNzhNScGLkqEeKwaVJCChYl0e06mUX9KAv142PsqK63uptgp2KJ83sFFxOnpSqkQnHQfwK87uheM4XKWZLzX25xDBOv6BR4XXYP59si4OafInAfQUEEp5VHSQUsODR3oMMIiHCNzNKgSyD4g5FgF4I6qeEQoWNgpBiF2cxzpQwNvddANYdRN6mecXvbp1Om1u1CdhcsmurtmFIgtEFwBqzHMay1CxUWWn964NOqsdo1fMJfDimcDZPeff1tffybpEPWxyaJPVFW6vrqQqLsZT8PGhB6h6YcBLPGxLcSGSf2dCYND0vxUX3NF4mAr58GDNl6R6ZYZkpBSDMIzzjaioIS2M8M67HJg5HuYzwvmfgB7Tums8dl1qjscqbWCPyECFNIHuw9Hh55e6Ox3lzwgVRo5ftZiSxBibZSs5gDxk3T2k0FUu1hTa1ly8befo0CFPgvb81YHvBxBNJCykQY8lads0jzpo1VEIljoiHvEUU7Ar0ECGnAegkxIQxB67f81uXugHI7lmQU6dD4Pflc1JCqFh648qK745glPsrEBQfbyvwIJJjEcJIW2qkutfLevnF3LR4NA3reEQ8D5HmF213leexG90aCoQkUxEl12ZsOThsmDidqKRZHj593V3hNFj7Uj025VxLrOA0tB3nVTEW2i44vJGQJ7A1jr9bcvYuHZ1xvLqnq8n0K7XpMra6NU0j5MsouUDNWTscvn7RDS5z77d7wD1yGDemFZ7hTQt1KPAtEwdHuvoIzQh7m9r0Y6wtCYZXNG1a2ebOrx40qvJZqAY2vA1RdLbYkpAiupdfGP9HPuvAOu6NcuPHURsMxwkDq8MMGhDp0koyCogPUmRt5KkuTDx3BVc6RMZWtiqrp1Y3YCaCdEUyq6e4vWXaEYMv8lMIsTt5GJThqw0ds99dOiC6cxAV1AaFO7aEK0A0n8HP3ji2qrV8izjrNyNlS1VdpXrxM6Oy6d0idalfLoVepIvL', 0),
(4688, 0, 'config', 'config_file_max_size', '300000', 0),
(4689, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(4690, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(4682, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(4681, 0, 'config', 'config_seo_url', '1', 0),
(4680, 0, 'config', 'config_maintenance', '0', 0),
(4678, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(4679, 0, 'config', 'config_mail_alert_email', '', 0),
(4677, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(4676, 0, 'config', 'config_mail_smtp_port', '25', 0),
(4675, 0, 'config', 'config_mail_smtp_password', '', 0),
(4674, 0, 'config', 'config_mail_smtp_username', '', 0),
(4673, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(4672, 0, 'config', 'config_mail_parameter', '', 0),
(4671, 0, 'config', 'config_mail_protocol', 'mail', 0),
(95, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(96, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'shipping', 'shipping_sort_order', '3', 0),
(98, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(99, 0, 'sub_total', 'sub_total_status', '1', 0),
(100, 0, 'tax', 'tax_status', '0', 0),
(101, 0, 'total', 'total_sort_order', '9', 0),
(102, 0, 'total', 'total_status', '1', 0),
(103, 0, 'tax', 'tax_sort_order', '5', 0),
(104, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(105, 0, 'cod', 'cod_sort_order', '5', 0),
(106, 0, 'cod', 'cod_total', '0.01', 0),
(107, 0, 'cod', 'cod_order_status_id', '1', 0),
(108, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(109, 0, 'cod', 'cod_status', '1', 0),
(110, 0, 'shipping', 'shipping_status', '1', 0),
(111, 0, 'shipping', 'shipping_estimator', '1', 0),
(112, 0, 'coupon', 'coupon_sort_order', '4', 0),
(113, 0, 'coupon', 'coupon_status', '1', 0),
(114, 0, 'flat', 'flat_sort_order', '1', 0),
(115, 0, 'flat', 'flat_status', '1', 0),
(116, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(117, 0, 'flat', 'flat_tax_class_id', '9', 0),
(118, 0, 'flat', 'flat_cost', '5.00', 0),
(119, 0, 'credit', 'credit_sort_order', '7', 0),
(120, 0, 'credit', 'credit_status', '1', 0),
(121, 0, 'reward', 'reward_sort_order', '2', 0),
(122, 0, 'reward', 'reward_status', '1', 0),
(123, 0, 'category', 'category_status', '1', 0),
(124, 0, 'account', 'account_status', '1', 0),
(125, 0, 'affiliate', 'affiliate_status', '1', 0),
(126, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(127, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(128, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(129, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(130, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(131, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(132, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(133, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(134, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(135, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(136, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(137, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(138, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(139, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(140, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(141, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(142, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(143, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(144, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(145, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(146, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(147, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(148, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(149, 0, 'theme_default', 'theme_default_status', '1', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(151, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(153, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(155, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(157, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(158, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(159, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(160, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(161, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(162, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(164, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(165, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(166, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(167, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(168, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(169, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(171, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(172, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(173, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(4670, 0, 'config', 'config_ftp_status', '1', 0),
(4669, 0, 'config', 'config_ftp_root', '/', 0),
(4668, 0, 'config', 'config_ftp_password', 'kimel', 0),
(4667, 0, 'config', 'config_ftp_username', 'freestyle_telfer', 0),
(4665, 0, 'config', 'config_ftp_hostname', 'freestyle.myjino.ru', 0),
(4666, 0, 'config', 'config_ftp_port', '21', 0),
(4664, 0, 'config', 'config_icon', 'catalog/telferu/iconss.png', 0),
(4663, 0, 'config', 'config_logo', 'catalog/telferu/logotip_new.png', 0),
(4662, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(4661, 0, 'config', 'config_captcha', '', 0),
(4660, 0, 'config', 'config_return_status_id', '2', 0),
(4659, 0, 'config', 'config_return_id', '0', 0),
(4658, 0, 'config', 'config_affiliate_id', '4', 0),
(4657, 0, 'config', 'config_affiliate_commission', '5', 0),
(4656, 0, 'config', 'config_affiliate_auto', '0', 0),
(4655, 0, 'config', 'config_affiliate_approval', '0', 0),
(4654, 0, 'config', 'config_stock_checkout', '0', 0),
(4653, 0, 'config', 'config_stock_warning', '0', 0),
(4652, 0, 'config', 'config_stock_display', '0', 0),
(4650, 0, 'config', 'config_fraud_status_id', '2', 0),
(4651, 0, 'config', 'config_api_id', '1', 0),
(4648, 0, 'config', 'config_processing_status', '[\"2\",\"3\",\"1\",\"12\",\"5\"]', 1),
(4649, 0, 'config', 'config_complete_status', '[\"3\",\"5\"]', 1),
(4647, 0, 'config', 'config_order_status_id', '1', 0),
(4646, 0, 'config', 'config_checkout_id', '5', 0),
(4645, 0, 'config', 'config_checkout_guest', '1', 0),
(4644, 0, 'config', 'config_cart_weight', '1', 0),
(4643, 0, 'config', 'config_invoice_prefix', 'INV-2016-00', 0),
(4642, 0, 'config', 'config_account_id', '3', 0),
(4641, 0, 'config', 'config_login_attempts', '5', 0),
(4640, 0, 'config', 'config_customer_price', '0', 0),
(4639, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(4638, 0, 'config', 'config_customer_group_id', '1', 0),
(4637, 0, 'config', 'config_customer_search', '0', 0),
(4636, 0, 'config', 'config_customer_activity', '0', 0),
(4635, 0, 'config', 'config_customer_online', '0', 0),
(4634, 0, 'config', 'config_tax_customer', 'shipping', 0),
(4633, 0, 'config', 'config_tax_default', 'shipping', 0),
(4632, 0, 'config', 'config_tax', '0', 0),
(4631, 0, 'config', 'config_voucher_max', '1000', 0),
(4630, 0, 'config', 'config_voucher_min', '1', 0),
(4629, 0, 'config', 'config_review_guest', '1', 0),
(4628, 0, 'config', 'config_review_status', '1', 0),
(4627, 0, 'config', 'config_limit_admin', '20', 0),
(4626, 0, 'config', 'config_product_count', '1', 0),
(4625, 0, 'config', 'config_weight_class_id', '1', 0),
(4624, 0, 'config', 'config_length_class_id', '1', 0),
(4623, 0, 'config', 'config_currency_auto', '1', 0),
(4622, 0, 'config', 'config_currency', 'RUB', 0),
(4621, 0, 'config', 'config_admin_language', 'ru-ru', 0),
(4620, 0, 'config', 'config_language', 'ru-ru', 0),
(4619, 0, 'config', 'config_zone_id', '', 0),
(4618, 0, 'config', 'config_country_id', '176', 0),
(4616, 0, 'config', 'config_open', 'Пн-Пт, 6:00 - 22:00', 0),
(4617, 0, 'config', 'config_comment', '', 0),
(4615, 0, 'config', 'config_image', '', 0),
(4614, 0, 'config', 'config_fax', '', 0),
(4613, 0, 'config', 'config_telephone', '929 646-20-60', 0),
(4612, 0, 'config', 'config_email', 'troinfo@yandex.ru', 0),
(4611, 0, 'config', 'config_geocode', '', 0),
(4610, 0, 'config', 'config_address', 'Москва, Высокая улица, 19, корп. 2, стр. 5', 0),
(4609, 0, 'config', 'config_owner', 'Пономаренко Иван', 0),
(4608, 0, 'config', 'config_name', 'Тельфер Про', 0),
(4607, 0, 'config', 'config_layout_id', '4', 0),
(4606, 0, 'config', 'config_theme', 'theme_default', 0),
(4605, 0, 'config', 'config_meta_keyword', '', 0),
(905, 0, 'yandex_sitemap', 'yandex_sitemap_status', '1', 0),
(1732, 0, 'turbo_rss', 'turbo_rss_limit', '500', 0),
(1731, 0, 'turbo_rss', 'turbo_rss_status', '1', 0),
(4604, 0, 'config', 'config_meta_description', 'Тельфер купить электрический - цена товара 3 и 5 тонн. Большой выбор моделей и производителей.', 0),
(4603, 0, 'config', 'config_meta_title', 'Тельфер купить электрический - цена товара 3 и 5 тонн', 0),
(3830, 0, 'yandex_yml', 'yandex_yml_optioned_name', 'no', 0),
(3827, 0, 'yandex_yml', 'yandex_yml_adult', '0', 0),
(3828, 0, 'yandex_yml', 'yandex_yml_manufacturer_warranty', '0', 0),
(3829, 0, 'yandex_yml', 'yandex_yml_country_of_origin', '0', 0),
(3643, 0, 'yandex_money', 'yandex_money_metrika_o2auth', '', 0),
(3642, 0, 'yandex_money', 'yandex_money_metrika_code', '', 0),
(3641, 0, 'yandex_money', 'yandex_money_nps_prev_vote_time', '', 0),
(3640, 0, 'yandex_money', 'yandex_money_kassa_shop_id', '', 0),
(3638, 0, 'yandex_money', 'yandex_money_kassa_payment_mode', 'kassa', 0),
(3639, 0, 'yandex_money', 'yandex_money_kassa_password', '', 0),
(3636, 0, 'yandex_money', 'yandex_money_kassa_b2b_tax_rate_default', 'untaxed', 0),
(3637, 0, 'yandex_money', 'yandex_money_kassa_b2b_sberbank_payment_purpose', '', 0),
(3635, 0, 'yandex_money', 'yandex_money_kassa_payment_description', '', 0),
(3633, 0, 'yandex_money', 'yandex_money_kassa_display_name', 'Яндекс.Касса (банковские карты, электронные деньги и другое)', 0),
(3634, 0, 'yandex_money', 'yandex_money_kassa_b2b_tax_rates', '{\"9\":\"untaxed\"}', 1),
(3631, 0, 'yandex_money', 'yandex_money_kassa_hold_order_status', '2', 0),
(3632, 0, 'yandex_money', 'yandex_money_kassa_cancel_order_status', '2', 0),
(3630, 0, 'yandex_money', 'yandex_money_kassa_tax_rates', '{\"9\":\"1\"}', 1),
(3629, 0, 'yandex_money', 'yandex_money_kassa_tax_rate_default', '1', 0),
(3628, 0, 'yandex_money', 'yandex_money_kassa_default_payment_subject', 'commodity', 0),
(3627, 0, 'yandex_money', 'yandex_money_kassa_default_payment_mode', 'full_prepayment', 0),
(3626, 0, 'yandex_money', 'yandex_money_kassa_default_delivery_payment_mode', 'full_prepayment', 0),
(3625, 0, 'yandex_money', 'yandex_money_kassa_default_delivery_payment_subject', 'commodity', 0),
(3624, 0, 'yandex_money', 'yandex_money_kassa_second_receipt_enable', '0', 0),
(3623, 0, 'yandex_money', 'yandex_money_kassa_second_receipt_status', '2', 0),
(3622, 0, 'yandex_money', 'yandex_money_kassa_show_in_footer', 'on', 0),
(3619, 0, 'yandex_money', 'yandex_money_kassa_success_order_status', '2', 0),
(3620, 0, 'yandex_money', 'yandex_money_kassa_invoice_subject', '', 0),
(3621, 0, 'yandex_money', 'yandex_money_kassa_invoice_message', '', 0),
(3618, 0, 'yandex_money', 'yandex_money_kassa_minimum_payment_amount', '0', 0),
(3617, 0, 'yandex_money', 'yandex_money_kassa_geo_zone', '0', 0),
(3616, 0, 'yandex_money', 'yandex_money_kassa_debug_log', 'on', 0),
(3613, 0, 'yandex_money', 'yandex_money_wallet_display_name', 'Яндекс.Деньги (банковские карты, кошелек)', 0),
(3615, 0, 'yandex_money', 'yandex_money_sort_order', '0', 0),
(3614, 0, 'yandex_money', 'yandex_money_wallet_account_id', '', 0),
(3612, 0, 'yandex_money', 'yandex_money_wallet_password', '', 0),
(3611, 0, 'yandex_money', 'yandex_money_wallet_success_order_status', '2', 0),
(3610, 0, 'yandex_money', 'yandex_money_wallet_minimum_payment_amount', '0', 0),
(3607, 0, 'yandex_money', 'yandex_money_wallet_sort_order', '0', 0),
(3608, 0, 'yandex_money', 'yandex_money_billing_form_id', '', 0),
(3609, 0, 'yandex_money', 'yandex_money_wallet_geo_zone', '0', 0),
(3606, 0, 'yandex_money', 'yandex_money_billing_purpose', '', 0),
(3605, 0, 'yandex_money', 'yandex_money_billing_display_name', 'Яндекс.Платежка (банковские карты, кошелек)', 0),
(3603, 0, 'yandex_money', 'yandex_money_billing_minimum_payment_amount', '0', 0),
(3604, 0, 'yandex_money', 'yandex_money_billing_success_order_status', '2', 0),
(3602, 0, 'yandex_money', 'yandex_money_billing_geo_zone', '0', 0),
(3599, 0, 'yandex_money', 'yandex_money_metrika_active', '', 0),
(3600, 0, 'yandex_money', 'yandex_money_metrika_number', '', 0),
(3601, 0, 'yandex_money', 'yandex_money_metrika_idapp', '', 0),
(3598, 0, 'yandex_money', 'yandex_money_billing_sort_order', '0', 0),
(3597, 0, 'yandex_money', 'yandex_money_metrika_pw', '', 0),
(3596, 0, 'yandex_money', 'yandex_money_market_shopname', 'Тельфер Про', 0),
(3595, 0, 'yandex_money', 'yandex_money_market_full_shopname', 'Тельфер Про', 0),
(3594, 0, 'yandex_money', 'yandex_money_market_currency_enabled', '{\"RUB\":\"on\"}', 1),
(3593, 0, 'yandex_money', 'yandex_money_market_currency_rate', '{\"RUB\":\"CBRF\"}', 1),
(3591, 0, 'yandex_money', 'yandex_money_market_category_all', '', 0),
(3592, 0, 'yandex_money', 'yandex_money_market_currency_plus', '{\"RUB\":\"\"}', 1),
(3589, 0, 'yandex_money', 'yandex_money_market_delivery_cost', '{\"1\":\"\",\"2\":\"\",\"3\":\"\",\"4\":\"\",\"5\":\"\"}', 1),
(3590, 0, 'yandex_money', 'yandex_money_market_category_list', '[\"60\",\"59\"]', 1),
(3570, 0, 'yandex_money_b2b_sberbank', 'yandex_money_b2b_sberbank_status', '', 0),
(3588, 0, 'yandex_money', 'yandex_money_market_delivery_days_from', '{\"1\":\"\",\"2\":\"\",\"3\":\"\",\"4\":\"\",\"5\":\"\"}', 1),
(3587, 0, 'yandex_money', 'yandex_money_market_delivery_days_to', '{\"1\":\"\",\"2\":\"\",\"3\":\"\",\"4\":\"\",\"5\":\"\"}', 1),
(3584, 0, 'yandex_money', 'yandex_money_market_name_template', '%name%', 0),
(3585, 0, 'yandex_money', 'yandex_money_market_simple', '1', 0),
(3586, 0, 'yandex_money', 'yandex_money_market_delivery_order_before', '{\"1\":\"\",\"2\":\"\",\"3\":\"\",\"4\":\"\",\"5\":\"\"}', 1),
(3583, 0, 'yandex_money', 'yandex_money_market_available_enabled', '{\"non-zero-quantity\":\"on\"}', 1),
(3580, 0, 'yandex_money', 'yandex_money_market_available_pickup', '{\"non-zero-quantity\":\"on\",\"7\":\"on\",\"5\":\"\",\"6\":\"\",\"8\":\"\"}', 1),
(3581, 0, 'yandex_money', 'yandex_money_market_available_delivery', '{\"non-zero-quantity\":\"on\",\"7\":\"on\",\"5\":\"\",\"6\":\"\",\"8\":\"\"}', 1),
(3582, 0, 'yandex_money', 'yandex_money_market_available_available', '{\"non-zero-quantity\":\"true\",\"7\":\"false\",\"5\":\"none\",\"6\":\"none\",\"8\":\"none\"}', 1),
(3579, 0, 'yandex_money', 'yandex_money_market_available_store', '{\"non-zero-quantity\":\"on\",\"7\":\"on\",\"5\":\"\",\"6\":\"\",\"8\":\"\"}', 1),
(3578, 0, 'yandex_money', 'yandex_money_market_vat', '{\"9\":\"VAT_18\"}', 1),
(3577, 0, 'yandex_money', 'yandex_money_market_features', 'on', 0),
(3576, 0, 'yandex_money', 'yandex_money_status', '', 0),
(3575, 0, 'yandex_money', 'yandex_money_market_dimensions', '', 0),
(3574, 0, 'yandex_money', 'yandex_money_market_vat_enabled', '', 0),
(3573, 0, 'yandex_money', 'yandex_money_metrika_webvizor', '', 0),
(3572, 0, 'yandex_money', 'yandex_money_metrika_clickmap', '', 0),
(3571, 0, 'yandex_money', 'yandex_money_metrika_hash', '', 0),
(3826, 0, 'yandex_yml', 'yandex_yml_attributes', '24,26,21,23,25,20,27,22,17,15,19,13,16,18,14,12', 0),
(3825, 0, 'yandex_yml', 'yandex_yml_priceto', '', 0),
(3824, 0, 'yandex_yml', 'yandex_yml_pricefrom', '0', 0),
(3823, 0, 'yandex_yml', 'yandex_yml_product_blacklist', '', 0),
(3819, 0, 'yandex_yml', 'yandex_yml_store', '0', 0),
(3820, 0, 'yandex_yml', 'yandex_yml_numpictures', '1', 0),
(3822, 0, 'yandex_yml', 'yandex_yml_blacklist_type', 'black', 0),
(3821, 0, 'yandex_yml', 'yandex_yml_categories', '59,60', 0),
(3818, 0, 'yandex_yml', 'yandex_yml_sales_notes', '', 0),
(3817, 0, 'yandex_yml', 'yandex_yml_delivery_before', '', 0),
(3816, 0, 'yandex_yml', 'yandex_yml_delivery_days', '', 0),
(3814, 0, 'yandex_yml', 'yandex_yml_pickup', '0', 0),
(3815, 0, 'yandex_yml', 'yandex_yml_delivery_cost', '', 0),
(3813, 0, 'yandex_yml', 'yandex_yml_out_of_stock', '5', 0),
(3812, 0, 'yandex_yml', 'yandex_yml_in_stock', '7', 0),
(3811, 0, 'yandex_yml', 'yandex_yml_changeprice', '', 0),
(3810, 0, 'yandex_yml', 'yandex_yml_groupprice', '1', 0),
(3809, 0, 'yandex_yml', 'yandex_yml_currency', 'RUB', 0),
(3808, 0, 'yandex_yml', 'yandex_yml_utm_label', '', 0),
(3807, 0, 'yandex_yml', 'yandex_yml_description_field', '', 0),
(3806, 0, 'yandex_yml', 'yandex_yml_keywords_field', '', 0),
(3805, 0, 'yandex_yml', 'yandex_yml_barcode_field', '', 0),
(3804, 0, 'yandex_yml', 'yandex_yml_typeprefix_field', '', 0),
(3803, 0, 'yandex_yml', 'yandex_yml_vendorcode_field', '', 0),
(3802, 0, 'yandex_yml', 'yandex_yml_model_field', 'name', 0),
(3801, 0, 'yandex_yml', 'yandex_yml_name_field', 'name', 0),
(3800, 0, 'yandex_yml', 'yandex_yml_datamodel', 'vendor.model', 0),
(3799, 0, 'yandex_yml', 'yandex_yml_status', '1', 0),
(4469, 0, 'microdatapro', 'config_microdata_registration_email', '', 0),
(4470, 0, 'microdatapro', 'config_microdata_registration_nikname', '', 0),
(4471, 0, 'microdatapro', 'microdatapro_status', '1', 0),
(4472, 0, 'microdatapro', 'config_microdata_status', '1', 0),
(4473, 0, 'microdatapro', 'config_microdata_twitter_account', '', 0),
(4474, 0, 'microdatapro', 'config_microdata_opengraph', '1', 0),
(4475, 0, 'microdatapro', 'config_company', '1', 0),
(4476, 0, 'microdatapro', 'config_company_syntax', 'all', 0),
(4477, 0, 'microdatapro', 'config_microdata_phones', '+79296462060', 0),
(4478, 0, 'microdatapro', 'config_microdata_groups', ' ', 0),
(4479, 0, 'microdatapro', 'config_microdata_address_1', '', 0),
(4480, 0, 'microdatapro', 'config_microdata_address_2', '115533', 0),
(4481, 0, 'microdatapro', 'config_microdata_address_3', 'Высокая улица, 19, корп. 2, стр. 2', 0),
(4482, 0, 'microdatapro', 'config_microdata_email', '', 0),
(4483, 0, 'microdatapro', 'config_product_page', '1', 0),
(4484, 0, 'microdatapro', 'config_product_breadcrumb', '1', 0),
(4485, 0, 'microdatapro', 'config_product_reviews', '1', 0),
(4486, 0, 'microdatapro', 'config_product_related', '0', 0),
(4487, 0, 'microdatapro', 'config_product_attribute', '1', 0),
(4488, 0, 'microdatapro', 'config_product_in_stock', '1', 0),
(4489, 0, 'microdatapro', 'config_in_stock_status_id', '0', 0),
(4490, 0, 'microdatapro', 'config_microdata_sku', '0', 0),
(4491, 0, 'microdatapro', 'config_microdata_upc', '0', 0),
(4492, 0, 'microdatapro', 'config_microdata_ean', '0', 0),
(4493, 0, 'microdatapro', 'config_microdata_isbn', '0', 0),
(4494, 0, 'microdatapro', 'config_microdata_mpn', '0', 0),
(4495, 0, 'microdatapro', 'config_product_syntax', 'all', 0),
(4496, 0, 'microdatapro', 'config_microdata_product_description', '', 0),
(4497, 0, 'microdatapro', 'config_category_page', '1', 0),
(4498, 0, 'microdatapro', 'config_category_breadcrumb', '1', 0),
(4499, 0, 'microdatapro', 'config_category_syntax', 'all', 0),
(4500, 0, 'microdatapro', 'config_microdata_category_description', '', 0),
(4501, 0, 'microdatapro', 'config_manufacturer_page', '1', 0),
(4502, 0, 'microdatapro', 'config_manufacturer_breadcrumb', '1', 0),
(4503, 0, 'microdatapro', 'config_manufacturer_syntax', 'all', 0),
(4504, 0, 'microdatapro', 'config_microdata_manufacturer_description', '', 0),
(4505, 0, 'microdatapro', 'config_special_page', '0', 0),
(4506, 0, 'microdatapro', 'config_special_breadcrumb', '0', 0),
(4507, 0, 'microdatapro', 'config_special_syntax', 'all', 0),
(4508, 0, 'microdatapro', 'config_microdata_special_description', '', 0),
(4509, 0, 'microdatapro', 'config_information_page', '1', 0),
(4510, 0, 'microdatapro', 'config_information_breadcrumb', '1', 0),
(4511, 0, 'microdatapro', 'config_information_syntax', 'all', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Налоги', 'Облагаемые налогом', '2014-06-06 23:00:00', '2014-09-09 11:50:31');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(87, 3, 'НДС', '18.0000', 'F', '2011-09-21 21:49:23', '2014-09-09 11:49:32');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_url_alias`
--

CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(956, 'information_id=4', 'about_us'),
(954, 'category_id=59', 'telferu-i-tal-1-tonna'),
(1002, 'product_id=75', 'elektricheskaya_tal_gp_1_t_vp_6m_skorost_podyema_8mmin_skorost_peredvijeniya_20mmin__tormoz_teplovaya_zaschita_dvigatelya_podyema_i_peredvijeniya_kranovoe_ispolnenie_euro-lift_cd1_00009797'),
(955, 'information_id=6', 'delivery'),
(957, 'information_id=3', 'privacy'),
(958, 'information_id=5', 'terms'),
(845, 'common/home', ''),
(846, 'information/contact', 'contact'),
(847, 'information/sitemap', 'sitemap'),
(848, 'product/special', 'specials'),
(849, 'product/manufacturer', 'brands'),
(850, 'product/compare', 'compare-products'),
(851, 'product/search', 'search'),
(852, 'checkout/cart', 'cart'),
(853, 'checkout/checkout', 'checkout'),
(854, 'account/login', 'login'),
(855, 'account/logout', 'logout'),
(856, 'account/voucher', 'vouchers'),
(857, 'account/wishlist', 'wishlist'),
(858, 'account/account', 'my-account'),
(859, 'account/order', 'order-history'),
(860, 'account/newsletter', 'newsletter'),
(861, 'account/return/add', 'return-add'),
(862, 'account/forgotten', 'forgot-password'),
(863, 'account/download', 'downloads'),
(864, 'account/return', 'returns'),
(865, 'account/transaction', 'transactions'),
(866, 'account/register', 'create-account'),
(867, 'account/recurring', 'recurring'),
(868, 'account/address', 'address-book'),
(869, 'account/reward', 'reward-points'),
(870, 'account/edit', 'edit-account'),
(871, 'account/password', 'change-password'),
(880, 'affiliate/forgotten', 'affiliate-forgot-password'),
(881, 'affiliate/register', 'create-affiliate-account'),
(882, 'affiliate/login', 'affiliate-login'),
(883, 'affiliate/payment', 'affiliate-payment'),
(884, 'affiliate/tracking', 'affiliate-tracking'),
(885, 'affiliate/transaction', 'affiliate-transaction'),
(886, 'affiliate/account', 'affiliates'),
(1006, 'product_id=76', 'elektricheskaya_tal_tor_tek_cd_gp_20_t_12_m_109212'),
(1020, 'product_id=77', 'elektricheskaya_peredvijnaya_tal_rossiyskiy_t-10_004-5272'),
(992, 'product_id=78', 'elektricheskaya_statsionarnaya_tal_cd1_gp_2t_vp_6m_skorost_podyema_8mmin_teplovaya_zaschita_dvigatelya_podyema_kranovoe_ispolnenie_euro-lift_00012334'),
(1007, 'product_id=79', 'elektricheskaya_tal_tor_tek_cd_gp_20_t_24_m_109224'),
(989, 'product_id=80', 'elektricheskaya_peredvijnaya_tal_rossiyskiy_t-10_004-5454'),
(1000, 'product_id=81', 'elektricheskaya_statsionarnaya_tal_cd1_gp_2_t_vp_9m_skorost_podyema_8mmin_teplovaya_zaschita_dvigatelya_podyema_kranovoe_ispolnenie_euro-lift_00012335'),
(1008, 'product_id=82', 'elektricheskaya_tal_tor_tek_cd_gp_20_t_36_m_109236'),
(990, 'product_id=83', 'elektricheskaya_peredvijnaya_tal_rossiyskiy_te-200_004-5340'),
(1005, 'product_id=84', 'elektricheskaya_tal_tor_tek_cd_gp_10_t_18_m_109118'),
(1018, 'product_id=85', 'elektricheskaya_peredvijnaya_lebedka_18m9m_500kg1000kg_220v_euro-lift_kx_1000_00016930'),
(1013, 'product_id=86', 'elektricheskiy_telfer_prorab_lt_1000_p'),
(1019, 'product_id=87', 'elektricheskaya_peredvijnaya_lebedka_500kg1000kg_220v_euro-lift_kx_1000_00002841'),
(986, 'product_id=88', 'professionalnyiy_tsepnoy_elektrotelfer_sorokin_4601'),
(1009, 'product_id=89', 'elektricheskaya_tal_tor_tek_cd_gp_20_t_6_m_10926'),
(1003, 'product_id=90', 'elektricheskaya_tal_gp_2_t_vp_9m_skorost_podyema_8mmin_skorost_peredvijeniya_20mmin__tormoz_teplovaya_zaschita_dvigatelya_podyema_i_peredvijeniya_kranovoe_ispolnenie_euro-lift_cd1_00019396'),
(991, 'product_id=91', 'elektricheskaya_peredvijnaya_tal_rossiyskiy_te-200_004-5452'),
(997, 'product_id=92', 'elektricheskaya_peredvijnaya_tal_zitrek_cd-200_2t_12m_004-6027'),
(985, 'product_id=93', 'professionalnyiy_trosovyiy_elektrotelfer_sorokin_4622'),
(1010, 'product_id=94', 'elektricheskaya_tal_gp_10_t_24_m_tor_tek_cd_109124'),
(953, 'category_id=60', 'telferu-i-tali-0-5-tonn'),
(1016, 'product_id=95', 'elektrotelfer_s_prodolnyim_hodom_kalibr_etf-1000p_00000043383'),
(983, 'product_id=96', 'podvijnyiy_elektrotelfer_sorokin_4805'),
(1014, 'product_id=97', 'elektrotal_olymp_ol20500'),
(999, 'product_id=98', 'elektricheskaya_statsionarnaya_tal_cd1_gp_1t_vp_9m_skorost_podyema_8mmin_teplovaya_zaschita_dvigatelya_podyema_kranovoe_ispolnenie_euro-lift_00012332'),
(982, 'product_id=99', 'podvesnaya_tal_rockforce_250_kg_rf-trh1005'),
(993, 'product_id=100', 'elektricheskaya_lebedka_sturm_eh72100'),
(987, 'product_id=101', 'telfer_energomash_el-72100'),
(981, 'product_id=102', 'mini_elektricheskaya_tal_12m_230v_statsionarnaya_model_magnus_profi_meh_250500_sz038645'),
(995, 'product_id=103', 'elektricheskaya_peredvijnaya_lebedka_250kg500kg_220v_euro-lift_kx_500_00002842'),
(1011, 'product_id=104', 'elektricheskiy_telfer_denzel_tf-1000_52016'),
(984, 'product_id=105', 'podvijnyiy_elektrotelfer_sorokin_4810'),
(1015, 'product_id=106', 'elektrotelfer_zubr_zet-1000'),
(1017, 'product_id=107', 'elektrotelfer_sorokin_4700'),
(979, 'product_id=108', 'mini_elektricheskaya_tal_12m_230v_kombinirovannaya_model_magnus_profi_meh_5001000_sz038658'),
(1004, 'product_id=109', 'elektricheskaya_tal_tor_pa-5001000__110100'),
(1012, 'product_id=110', 'elektricheskiy_telfer_einhell_tc-eh_1000_2255160'),
(998, 'product_id=111', 'elektricheskaya_statsionarnaya_tal_gp_1tn_vp_12m_skorost_podyema_8mmin_teplovaya_zaschita_dvigatelya_podyema_kranovoe_ispolnenie_euro-lift_cd1_00012333'),
(1001, 'product_id=112', 'elektricheskaya_statsionarnaya_tal_zitrek_ra-1000_n=126m_004-5050'),
(1050, 'product_id=113', 'lebedka_elektricheskaya_statsionarnaya_gp_5001000_kg_vyisota_podyema_126_m_ip54_euro-lift_ra-1000a_00006520'),
(978, 'product_id=114', 'lebedka_elektricheskaya_statsionarnaya_gp_5001000_kg_vyisota_podyema_189_m_ip54_euro-lift_ra-1000a-18m_00012978'),
(1039, 'manufacturer_id=12', 'magnus-profi'),
(1042, 'manufacturer_id=13', 'rockforce'),
(1051, 'manufacturer_id=14', 'sturm'),
(1049, 'manufacturer_id=15', 'energomash'),
(1035, 'manufacturer_id=16', 'sorokin'),
(1038, 'manufacturer_id=17', 'euro-lift'),
(1046, 'manufacturer_id=18', 'balkansko-eho'),
(1045, 'manufacturer_id=19', 'zitrek'),
(1044, 'manufacturer_id=20', 'tor'),
(1053, 'manufacturer_id=21', 'denzel'),
(1037, 'manufacturer_id=22', 'einhell'),
(1041, 'manufacturer_id=23', 'prorab'),
(1040, 'manufacturer_id=24', 'olymp'),
(1047, 'manufacturer_id=25', 'zubr'),
(1048, 'manufacturer_id=26', 'kalibr'),
(1030, 'newsblog_category_id=1', 'tehnika'),
(1029, 'newsblog_article_id=3', 'stacionarnyj-telfer'),
(1031, 'newsblog_article_id=4', 'elektrotelfer'),
(1055, 'newsblog_article_id=5', 'preimucshestva-cepnogo-telfera'),
(1056, 'newsblog_article_id=6', 'dostoinstva-cepnogo-telfera'),
(1057, 'category_id=61', 'telferyi-serii-t'),
(1058, 'product_id=115', 'seriya-t01--t17---telfer-elektricheskiy-kanatnyiy-statsionranyiy-v-ispolnennii-na-lapah'),
(1059, 'product_id=116', 'seriya-t02-t35---telfer-elektricheskiy-kanatnyiy-statsionranyiy-v-ispolnennii-na-paltsah'),
(1060, 'product_id=117', 'seriya-t10--t39---telfer-elektricheskiy-kanatnyiy-peredvijnoy'),
(1061, 'product_id=118', 'seriya-t45--t78---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-s-umenshennoy-s'),
(1062, 'product_id=119', 'seriya-t81--t82---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-kranovoy-telejk'),
(1063, 'category_id=62', 'telferyi-serii-mt'),
(1064, 'product_id=120', 'seriya-mt---telfer-elektricheskiy-kanatnyiy-statsionranyiy'),
(1065, 'product_id=121', 'seriya-mt--en---telfer-elektricheskiy-kanatnyiy-peredvijnoy'),
(1066, 'product_id=122', 'seriya-mt--ek---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-s-umenshennoy-str'),
(1067, 'product_id=123', 'seriya-mt--ed---telfer-elektricheskiy-kanatnyiy-peredvijnoy-v-ispolnenii-kranovoy-telejki'),
(1068, 'category_id=63', 'telferyi-serii-bt'),
(1069, 'product_id=124', 'seriya-vt01--vt17---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-statsionranyiy-'),
(1070, 'product_id=125', 'seriya-vt02--vt35--telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-statsionranyiy-v'),
(1071, 'product_id=126', 'seriya-vt10--vt39---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy'),
(1072, 'product_id=127', 'seriya-vt45--vt78---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-i'),
(1073, 'product_id=128', 'seriya-vt81--vt82---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-i'),
(1074, 'category_id=64', 'telferyi-serii-bmt'),
(1075, 'product_id=129', 'seriya-vmt---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-statsionranyiy'),
(1076, 'product_id=130', 'seriya-mt--en---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy'),
(1077, 'product_id=131', 'seriya-mt--ek---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-ispol'),
(1078, 'product_id=132', 'seriya-mt--ed---telfer-elektricheskiy-vzryivozaschischennyiy-kanatnyiy-peredvijnoy-v-ispol');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'd15092d217ee73ad8a3b2c07ecf88bd3da20d078', 'GLsJCWBZp', 'John', 'Doe', 'troinfo@yandex.ru', '', '', '31.173.29.87', 1, '2018-09-24 12:14:11');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/turbo_rss\",\"extension\\/fraud\\/ip\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/ts_ab_banners\",\"extension\\/openbay\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/yandex_money\",\"extension\\/payment\\/yandex_money_b2b_sberbank\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"feed\\/yandex_sitemap\",\"feed\\/yandex_yml\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/feed\\/yandex_yml\",\"extension\\/module\\/microdatapro\",\"newsblog\\/category\",\"newsblog\\/article\",\"extension\\/module\\/newsblog_articles\",\"extension\\/module\\/newsblog_articles\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/turbo_rss\",\"extension\\/fraud\\/ip\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/module\\/ts_ab_banners\",\"extension\\/openbay\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/yandex_money\",\"extension\\/payment\\/yandex_money_b2b_sberbank\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"feed\\/yandex_sitemap\",\"feed\\/yandex_yml\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/feed\\/yandex_yml\",\"extension\\/module\\/microdatapro\",\"newsblog\\/category\",\"newsblog\\/article\",\"extension\\/module\\/newsblog_articles\",\"extension\\/module\\/newsblog_articles\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Новый год'),
(7, 1, 'День рождения'),
(8, 1, 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограмм', 'кг'),
(2, 1, 'Грамм', 'г');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_ya_money_payment`
--

CREATE TABLE `oc_ya_money_payment` (
  `order_id` int(11) NOT NULL,
  `payment_id` char(36) NOT NULL,
  `status` enum('pending','waiting_for_capture','succeeded','canceled') NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `currency` char(3) NOT NULL,
  `payment_method_id` char(36) NOT NULL,
  `paid` enum('Y','N') NOT NULL,
  `created_at` datetime NOT NULL,
  `captured_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `receipt` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_ya_money_refunds`
--

CREATE TABLE `oc_ya_money_refunds` (
  `refund_id` char(36) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_id` char(36) NOT NULL,
  `status` enum('pending','succeeded','canceled') NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `currency` char(3) NOT NULL,
  `created_at` datetime NOT NULL,
  `authorized_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 20, 'Брест', 'BR', 1),
(2, 20, 'Гомель', 'HO', 1),
(3, 20, 'Минск', 'HM', 1),
(4, 20, 'Гродно', 'HR', 1),
(5, 20, 'Могилев', 'MA', 1),
(6, 20, 'Минская область', 'MI', 1),
(7, 20, 'Витебск', 'VI', 1),
(8, 80, 'Abkhazia', 'AB', 1),
(9, 80, 'Ajaria', 'AJ', 1),
(10, 80, 'Tbilisi', 'TB', 1),
(11, 80, 'Guria', 'GU', 1),
(12, 80, 'Imereti', 'IM', 1),
(13, 80, 'Kakheti', 'KA', 1),
(14, 80, 'Kvemo Kartli', 'KK', 1),
(15, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(16, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(17, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(18, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(19, 80, 'Shida Kartli', 'SK', 1),
(20, 109, 'Алматинская область', 'AL', 1),
(21, 109, 'Алматы - город республ-го значения', 'AC', 1),
(22, 109, 'Акмолинская область', 'AM', 1),
(23, 109, 'Актюбинская область', 'AQ', 1),
(24, 109, 'Астана - город республ-го значения', 'AS', 1),
(25, 109, 'Атырауская область', 'AT', 1),
(26, 109, 'Западно-Казахстанская область', 'BA', 1),
(27, 109, 'Байконур - город республ-го значения', 'BY', 1),
(28, 109, 'Мангистауская область', 'MA', 1),
(29, 109, 'Южно-Казахстанская область', 'ON', 1),
(30, 109, 'Павлодарская область', 'PA', 1),
(31, 109, 'Карагандинская область', 'QA', 1),
(32, 109, 'Костанайская область', 'QO', 1),
(33, 109, 'Кызылординская область', 'QY', 1),
(34, 109, 'Восточно-Казахстанская область', 'SH', 1),
(35, 109, 'Северо-Казахстанская область', 'SO', 1),
(36, 109, 'Жамбылская область', 'ZH', 1),
(37, 115, 'Bishkek', 'GB', 1),
(38, 115, 'Batken', 'B', 1),
(39, 115, 'Chu', 'C', 1),
(40, 115, 'Jalal-Abad', 'J', 1),
(41, 115, 'Naryn', 'N', 1),
(42, 115, 'Osh', 'O', 1),
(43, 115, 'Talas', 'T', 1),
(44, 115, 'Ysyk-Kol', 'Y', 1),
(45, 176, 'Республика Хакасия', 'KK', 1),
(46, 176, 'Московская область', 'MOS', 1),
(47, 176, 'Чукотский АО', 'CHU', 1),
(48, 176, 'Архангельская область', 'ARK', 1),
(49, 176, 'Астраханская область', 'AST', 1),
(50, 176, 'Алтайский край', 'ALT', 1),
(51, 176, 'Белгородская область', 'BEL', 1),
(52, 176, 'Еврейская АО', 'YEV', 1),
(53, 176, 'Амурская область', 'AMU', 1),
(54, 176, 'Брянская область', 'BRY', 1),
(55, 176, 'Чувашская Республика', 'CU', 1),
(56, 176, 'Челябинская область', 'CHE', 1),
(57, 176, 'Карачаево-Черкесия', 'KC', 1),
(58, 176, 'Забайкальский край', 'ZAB', 1),
(59, 176, 'Ленинградская область', 'LEN', 1),
(60, 176, 'Республика Калмыкия', 'KL', 1),
(61, 176, 'Сахалинская область', 'SAK', 1),
(62, 176, 'Республика Алтай', 'AL', 1),
(63, 176, 'Чеченская Республика', 'CE', 1),
(64, 176, 'Иркутская область', 'IRK', 1),
(65, 176, 'Ивановская область', 'IVA', 1),
(66, 176, 'Удмуртская Республика', 'UD', 1),
(67, 176, 'Калининградская область', 'KGD', 1),
(68, 176, 'Калужская область', 'KLU', 1),
(69, 176, 'Республика Татарстан', 'TA', 1),
(70, 176, 'Кемеровская область', 'KEM', 1),
(71, 176, 'Хабаровский край', 'KHA', 1),
(72, 176, 'Ханты-Мансийский АО - Югра', 'KHM', 1),
(73, 176, 'Костромская область', 'KOS', 1),
(74, 176, 'Краснодарский край', 'KDA', 1),
(75, 176, 'Красноярский край', 'KYA', 1),
(76, 176, 'Курганская область', 'KGN', 1),
(77, 176, 'Курская область', 'KRS', 1),
(78, 176, 'Республика Тыва', 'TY', 1),
(79, 176, 'Липецкая область', 'LIP', 1),
(80, 176, 'Магаданская область', 'MAG', 1),
(81, 176, 'Республика Дагестан', 'DA', 1),
(82, 176, 'Республика Адыгея', 'AD', 1),
(83, 176, 'Москва', 'MOW', 1),
(84, 176, 'Мурманская область', 'MUR', 1),
(85, 176, 'Республика Кабардино-Балкария', 'KB', 1),
(86, 176, 'Ненецкий АО', 'NEN', 1),
(87, 176, 'Республика Ингушетия', 'IN', 1),
(88, 176, 'Нижегородская область', 'NIZ', 1),
(89, 176, 'Новгородская область', 'NGR', 1),
(90, 176, 'Новосибирская область', 'NVS', 1),
(91, 176, 'Омская область', 'OMS', 1),
(92, 176, 'Орловская область', 'ORL', 1),
(93, 176, 'Оренбургская область', 'ORE', 1),
(94, 176, 'Пензенская область', 'PNZ', 1),
(95, 176, 'Пермский край', 'PER', 1),
(96, 176, 'Камчатский край', 'KAM', 1),
(97, 176, 'Республика Карелия', 'KR', 1),
(98, 176, 'Псковская область', 'PSK', 1),
(99, 176, 'Ростовская область', 'ROS', 1),
(100, 176, 'Рязанская область', 'RYA', 1),
(101, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(102, 176, 'Самарская область', 'SAM', 1),
(103, 176, 'Республика Мордовия', 'MO', 1),
(104, 176, 'Саратовская область', 'SAR', 1),
(105, 176, 'Смоленская область', 'SMO', 1),
(106, 176, 'Санкт-Петербург', 'SPE', 1),
(107, 176, 'Ставропольский край', 'STA', 1),
(108, 176, 'Республика Коми', 'KO', 1),
(109, 176, 'Тамбовская область', 'TAM', 1),
(110, 176, 'Томская область', 'TOM', 1),
(111, 176, 'Тульская область', 'TUL', 1),
(112, 176, 'Тверская область', 'TVE', 1),
(113, 176, 'Тюменская область', 'TYU', 1),
(114, 176, 'Республика Башкортостан', 'BA', 1),
(115, 176, 'Ульяновская область', 'ULY', 1),
(116, 176, 'Республика Бурятия', 'BU', 1),
(117, 176, 'Республика Северная Осетия', 'SE', 1),
(118, 176, 'Владимирская область', 'VLA', 1),
(119, 176, 'Приморский край', 'PRI', 1),
(120, 176, 'Волгоградская область', 'VGG', 1),
(121, 176, 'Вологодская область', 'VLG', 1),
(122, 176, 'Воронежская область', 'VOR', 1),
(123, 176, 'Кировская область', 'KIR', 1),
(124, 176, 'Республика Саха', 'SA', 1),
(125, 176, 'Ярославская область', 'YAR', 1),
(126, 176, 'Свердловская область', 'SVE', 1),
(127, 176, 'Республика Марий Эл', 'ME', 1),
(128, 176, 'Республика Крым', 'CR', 1),
(129, 220, 'Черкассы', 'CK', 1),
(130, 220, 'Чернигов', 'CH', 1),
(131, 220, 'Черновцы', 'CV', 1),
(132, 220, 'Днепропетровск', 'DN', 1),
(133, 220, 'Донецк', 'DO', 1),
(134, 220, 'Ивано-Франковск', 'IV', 1),
(135, 220, 'Харьков', 'KH', 1),
(136, 220, 'Хмельницкий', 'KM', 1),
(137, 220, 'Кировоград', 'KR', 1),
(138, 220, 'Киевская область', 'KV', 1),
(139, 220, 'Киев', 'KY', 1),
(140, 220, 'Луганск', 'LU', 1),
(141, 220, 'Львов', 'LV', 1),
(142, 220, 'Николаев', 'MY', 1),
(143, 220, 'Одесса', 'OD', 1),
(144, 220, 'Полтава', 'PO', 1),
(145, 220, 'Ровно', 'RI', 1),
(146, 176, 'Севастополь', 'SEV', 1),
(147, 220, 'Сумы', 'SU', 1),
(148, 220, 'Тернополь', 'TE', 1),
(149, 220, 'Винница', 'VI', 1),
(150, 220, 'Луцк', 'VO', 1),
(151, 220, 'Ужгород', 'ZK', 1),
(152, 220, 'Запорожье', 'ZA', 1),
(153, 220, 'Житомир', 'ZH', 1),
(154, 220, 'Херсон', 'KE', 1),
(155, 226, 'Andijon', 'AN', 1),
(156, 226, 'Buxoro', 'BU', 1),
(157, 226, 'Farg\'ona', 'FA', 1),
(158, 226, 'Jizzax', 'JI', 1),
(159, 226, 'Namangan', 'NG', 1),
(160, 226, 'Navoiy', 'NW', 1),
(161, 226, 'Qashqadaryo', 'QA', 1),
(162, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(163, 226, 'Samarqand', 'SA', 1),
(164, 226, 'Sirdaryo', 'SI', 1),
(165, 226, 'Surxondaryo', 'SU', 1),
(166, 226, 'Toshkent City', 'TK', 1),
(167, 226, 'Toshkent Region', 'TO', 1),
(168, 226, 'Xorazm', 'XO', 1),
(169, 176, 'Байконур - город республ-го значения', 'BY', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 176, 0, 3, '2014-09-09 11:48:13', '0000-00-00 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Индексы таблицы `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`affiliate_activity_id`);

--
-- Индексы таблицы `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Индексы таблицы `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Индексы таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Индексы таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Индексы таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Индексы таблицы `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Индексы таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Индексы таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Индексы таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Индексы таблицы `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Индексы таблицы `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Индексы таблицы `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Индексы таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Индексы таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Индексы таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Индексы таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Индексы таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Индексы таблицы `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Индексы таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Индексы таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Индексы таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Индексы таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Индексы таблицы `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Индексы таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Индексы таблицы `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Индексы таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Индексы таблицы `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Индексы таблицы `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Индексы таблицы `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Индексы таблицы `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Индексы таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Индексы таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Индексы таблицы `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Индексы таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Индексы таблицы `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Индексы таблицы `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Индексы таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Индексы таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Индексы таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Индексы таблицы `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Индексы таблицы `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Индексы таблицы `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Индексы таблицы `oc_menu`
--
ALTER TABLE `oc_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Индексы таблицы `oc_menu_description`
--
ALTER TABLE `oc_menu_description`
  ADD PRIMARY KEY (`menu_id`,`language_id`);

--
-- Индексы таблицы `oc_menu_module`
--
ALTER TABLE `oc_menu_module`
  ADD PRIMARY KEY (`menu_module_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Индексы таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Индексы таблицы `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `oc_newsblog_article`
--
ALTER TABLE `oc_newsblog_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Индексы таблицы `oc_newsblog_article_attribute`
--
ALTER TABLE `oc_newsblog_article_attribute`
  ADD PRIMARY KEY (`article_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_newsblog_article_description`
--
ALTER TABLE `oc_newsblog_article_description`
  ADD PRIMARY KEY (`article_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_newsblog_article_image`
--
ALTER TABLE `oc_newsblog_article_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Индексы таблицы `oc_newsblog_article_related`
--
ALTER TABLE `oc_newsblog_article_related`
  ADD PRIMARY KEY (`article_id`,`related_id`);

--
-- Индексы таблицы `oc_newsblog_article_to_category`
--
ALTER TABLE `oc_newsblog_article_to_category`
  ADD PRIMARY KEY (`article_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_newsblog_article_to_layout`
--
ALTER TABLE `oc_newsblog_article_to_layout`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_newsblog_article_to_store`
--
ALTER TABLE `oc_newsblog_article_to_store`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_newsblog_category`
--
ALTER TABLE `oc_newsblog_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_newsblog_category_description`
--
ALTER TABLE `oc_newsblog_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_newsblog_category_path`
--
ALTER TABLE `oc_newsblog_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_newsblog_category_to_layout`
--
ALTER TABLE `oc_newsblog_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_newsblog_category_to_store`
--
ALTER TABLE `oc_newsblog_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Индексы таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Индексы таблицы `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Индексы таблицы `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Индексы таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Индексы таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Индексы таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Индексы таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Индексы таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Индексы таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Индексы таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Индексы таблицы `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Индексы таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Индексы таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Индексы таблицы `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Индексы таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Индексы таблицы `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Индексы таблицы `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Индексы таблицы `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Индексы таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Индексы таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Индексы таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Индексы таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Индексы таблицы `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Индексы таблицы `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Индексы таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Индексы таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Индексы таблицы `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Индексы таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Индексы таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Индексы таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Индексы таблицы `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Индексы таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Индексы таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Индексы таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Индексы таблицы `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Индексы таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Индексы таблицы `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Индексы таблицы `oc_ya_money_payment`
--
ALTER TABLE `oc_ya_money_payment`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `oc_ya_money_payment_unq_payment_id` (`payment_id`);

--
-- Индексы таблицы `oc_ya_money_refunds`
--
ALTER TABLE `oc_ya_money_refunds`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `oc_ya_money_refunds_idx_order_id` (`order_id`),
  ADD KEY `oc_ya_money_refunds_idx_payment_id` (`payment_id`);

--
-- Индексы таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Индексы таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT для таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT для таблицы `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT для таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT для таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_menu`
--
ALTER TABLE `oc_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `oc_newsblog_article`
--
ALTER TABLE `oc_newsblog_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_newsblog_article_image`
--
ALTER TABLE `oc_newsblog_article_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_newsblog_category`
--
ALTER TABLE `oc_newsblog_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT для таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT для таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2352;

--
-- AUTO_INCREMENT для таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;

--
-- AUTO_INCREMENT для таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT для таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4694;

--
-- AUTO_INCREMENT для таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1079;

--
-- AUTO_INCREMENT для таблицы `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT для таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
