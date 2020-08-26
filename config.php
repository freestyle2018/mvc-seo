<?php

// Задаем константы:
define ('DS', DIRECTORY_SEPARATOR); // разделитель для путей к файлам
$sitePath = realpath(dirname(__FILE__) . DS);
define ('SITE_PATH', $sitePath); // путь к корневой папке сайта

// для подключения к бд
define('DB_USER', 'admin_enivest');
define('DB_PASS', 'xxxxxxxxx');
define('DB_HOST', 'localhost');
define('DB_NAME', 'admin_mvc_project');
define('DB_NAME_2', 'admin_phpauthtest');
define('DB_NAME_OPENCART', 'admin_opencart');
define('TYPE_MAGAZIN', 'opencart');  // ocstore   opencart

define('SAPE_NAME', 'free_style22');
define('SAPE_TOKEN', 'e068b8f255f0xty21175995b05a1aeeecec36bc52d9e16be77cf561c1a18202ba22');
define('SAPE_ID_URL', '115319434'); // id рабочей ссылки
define('SAPE_FOLDER_ID', '2020546'); // id раздела
define('SAPE_SHAG_INDEX_TIME', 12); // в часах
define('SAPE_KOLVO_PROVERKI_INDEX_URL', 40); // количество последних ссылок, которых необходимо проверить

define('PR_CY_KEY', 'vRzJ4elVsK2ZUL1ZGZ0lUU1BrYmtpND0');
define('PR_CY_URL', 'https://a.pr-cy.ru/api/v1.1.0');

define('URL_SUBDOMAIN', '/home/admin/web/');  //   /var/www/domains/ivan-ocstore.tk          C:/OpenServer/domains/    ../../
define('DOMAIN', 'klevomut-shop.ru');
define('DOMAIN_HTML', 'public_html');
define('PREFIX_DATABASE', 'admin');  // эту база данных осн. домена и ее закачиваю на поддомены.
define('DOMAIN_DATABASE', 'opencart'); // база данных сайта vubor-santehniki.ru будет соотвественно magazin_vubor-san
define('VPS_SERVER', 'localhost');
define('VPS_USER', 'enivest'); // root
define('VPS_PASS', 'xxxxxxxx'); // pass
define('SSH_SERVER', '179.43.156.63');  // 2001:1bb0:e000:1e::200 - jino.ru
define('SSH_PORT', '22');
define('SSH_USER', 'root'); // root
define('SSH_PASS', 'xxxxxxxxx'); // pass

define('YANDEX_TOKEN', 'AgAAAAAFNAeqAAaAudFCDKnTak3Fu6iGl-r8MQ8'); // pass
define('YANDEX_API_URL_V4', 'https://api.webmaster.yandex.net/v4/');
define('YANDEX_VERIFICATION', 'HTML_FILE');

//define('URL_CATALOG', '/home/users/f/freestyle/domains/telfer-pro.ru/image/catalog/');
define('URL_CATALOG', 'C:/OpenServer/domains/localhost/image/');
define('URL_XPATH', 'C:/OpenServer/domains/localhost/image/');
define('SLEEP_TIME', '3');

define('SPEED_LOAD_PRODUCTS', 10); // в минутах



