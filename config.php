<?php

// Задаем константы:
define ('DS', DIRECTORY_SEPARATOR); // разделитель для путей к файлам
$sitePath = realpath(dirname(__FILE__) . DS);
define ('SITE_PATH', $sitePath); // путь к корневой папке сайта

// для подключения к бд
define('DB_USER', 'mysql');
define('DB_PASS', 'mysql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'mvc_project');
define('DB_NAME_2', 'phpauthtest');
define('DB_NAME_OPENCART', 'opencart');

define('SAPE_NAME', 'free_style22');
define('SAPE_TOKEN', 'e068b8f255f021175995b05a1aeeecec36bc52d9e16be77cf561c1a18202ba22');
define('SAPE_ID_URL', '115319434'); // id рабочей ссылки
define('SAPE_FOLDER_ID', '2020546'); // id раздела

define('PR_CY_KEY', 'vRzJ4elVsK2ZUL1ZGZ0lUU1BrYmtpND0');
define('PR_CY_URL', 'https://a.pr-cy.ru/api/v1.1.0');

//define('URL_CATALOG', '/home/users/f/freestyle/domains/telfer-pro.ru/image/catalog/');
define('URL_CATALOG', 'C:/OpenServer/OpenServer/domains/localhost/image/');
define('SLEEP_TIME', '3');



