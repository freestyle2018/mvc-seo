<?php

require 'vendor/autoload.php';
require 'vendor/phpauth/phpauth/Auth.php';
require 'vendor/phpauth/phpauth/Config.php';


// Задаем константы:
define ('DS', DIRECTORY_SEPARATOR); // разделитель для путей к файлам
$sitePath = realpath(dirname(__FILE__) . DS);
define ('SITE_PATH', $sitePath); // путь к корневой папке сайта


// включим отображение всех ошибок
error_reporting (E_ALL);
// подключаем конфиг
include_once ('../config.php');

// Соединяемся с БД
$dbObject = new PDO('mysql:host=' . DbConf::getDbHost() . ';dbname=' . DbConf::getDbName(), DbConf::getDbUser(), DbConf::getDbPass());

// подключаем ядро сайта
include (SITE_PATH . DS . 'core' . DS . 'core.php');

// Загружаем router
$router = new Router($registry);
// записываем данные в реестр
$registry->set ('router', $router);
// задаем путь до папки контроллеров.
$router->setPath (SITE_PATH . '/controllers');
// запускаем маршрутизатор
$router->start();