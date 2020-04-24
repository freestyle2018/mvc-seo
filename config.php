<?php

// Задаем константы:
define ('DS', DIRECTORY_SEPARATOR); // разделитель для путей к файлам
$sitePath = realpath(dirname(__FILE__) . DS);
define ('SITE_PATH', $sitePath); // путь к корневой папке сайта

// для подключения к бд
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_HOST', 'localhost');
define('DB_NAME', 'mvc_project');

define('SAPE_NAME', 'free_style22');
define('SAPE_TOKEN', 'e068b8f255f021175995b05a1aeeecec36bc52d9e16be77cf561c1a18202ba22');
define('SAPE_ID_URL', '115319434'); // id рабочей ссылки
define('SAPE_FOLDER_ID', '2020546'); // id раздела

