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
define('TYPE_MAGAZIN', 'opencart');  // ocstore   opencart

define('SAPE_NAME', 'free_style22');
define('SAPE_TOKEN', 'e068b8f255f021175995b05a1aeeecec36bc52d9e16be77cf561c1a18202ba22');
define('SAPE_ID_URL', '115319434'); // id рабочей ссылки
define('SAPE_FOLDER_ID', '2020546'); // id раздела
define('SAPE_SHAG_INDEX_TIME', 12); // в часах
define('SAPE_KOLVO_PROVERKI_INDEX_URL', 40); // количество последних ссылок, которых необходимо проверить

define('PR_CY_KEY', 'vRzJ4elVsK2ZUL1ZGZ0lUU1BrYmtpND0');
define('PR_CY_URL', 'https://a.pr-cy.ru/api/v1.1.0');

define('URL_SUBDOMAIN', 'C:/OpenServer/domains/');  //   /var/www/domains/ivan-ocstore.tk
define('DOMAIN', 'vubor-santehniki.ru');
define('PREFIX_DATABASE', 'freestyle');  // эту база данных осн. домена и ее закачиваю на поддомены.
define('DOMAIN_DATABASE', 'vubor-san'); // база данных сайта vubor-santehniki.ru будет соотвественно magazin_vubor-san
define('VPS_SERVER', 'localhost');
define('VPS_USER', 'mysql'); // root
define('VPS_PASS', 'mysql'); // pass
define('SSH_SERVER', '2001:1bb0:e000:1e::200');
define('SSH_PORT', '22');
define('SSH_USER', 'root'); // root
define('SSH_PASS', 'liliput45M%#'); // pass


//define('URL_CATALOG', '/home/users/f/freestyle/domains/telfer-pro.ru/image/catalog/');
define('URL_CATALOG', 'C:/OpenServer/domains/localhost/image/');
define('URL_XPATH', 'C:/OpenServer/domains/localhost/image/');
define('SLEEP_TIME', '3');

define('SPEED_LOAD_PRODUCTS', 10); // в минутах



