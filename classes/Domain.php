<?php





Class Domain {

    static $connect;



    function __construct() {
        self::$connect = ssh2_connect(VpsConf::getSshServer(), VpsConf::getSshPort());
        if (!self::$connect) die('Не удалось установить соединение');

        ssh2_auth_password(self::$connect, VpsConf::getSshUser(), VpsConf::getSshPass());
    }


    function index($name, $name_url, $name_rus, $https = null) {
        $this->create_domain($name);
        $this->create_ssl_certificate($https);
        $this->installation_ssl_certificate($name, $https);

        $this->create_database($name);
        $this->copy_database($name);
        $this->edit_database($name, $name_url, $name_rus);

        sleep(20);

        $this->create_arhive( URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML, URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/archive.zip");
        $this->copy_arhive($name);
        $this->extract_arhive($name);

        $this->replace_config($name, $https);
        $this->link_dir_image($name);

        $this->open_basedir($name, $https);
        $this->delete_cache_and_archive($name, $https);
    }













    function create_domain($name) {
        ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-add-domain admin ".$name.".".DOMAIN."; sleep 30;");
    }

    function create_ssl_certificate($https = null) {
        $https = $https ? $https : CREATE_HTTPS_DOMAIN;

        if($https == "yes"){
            ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-generate-ssl-cert ".DOMAIN." *.".DOMAIN." troinfo@yandex.ru RU Moscow Orel HOME admin");
        }
    }

    function installation_ssl_certificate($name, $https = null) {
        $https = $https ? $https : CREATE_HTTPS_DOMAIN;

        if($https == "yes"){
            ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-add-letsencrypt-domain admin ".$name.".".DOMAIN);
        }
    }










    function create_database($name) {
        ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-add-database admin $name ".VpsConf::getVpsUser()." ".VpsConf::getVpsPass());
    }





    function copy_database($name) {

        //$cmd = 'mkdir dump';
        //ssh2_exec($connect, $cmd);

        //$name_database = "dump_".date("Y-m-d").".sql";
        $name_database = "dump.sql";
        
        if (!$this->fresh_file($name_database)) {
            // создаю новую базу данных
            //mysqldump -h localhost -uroot magazin_osn -pqwuiFr5e2A > ./dump/dump2.sql

            $cmd = "mysqldump -h ".VpsConf::getVpsServer()." -u'admin_".VpsConf::getVpsUser()."' ".PREFIX_DATABASE."_".DOMAIN_DATABASE." -p'".VpsConf::getVpsPass()."' > ./dump/".$name_database;
            ssh2_exec(self::$connect, $cmd);
        }

        $cmd = "mysql -h ".VpsConf::getVpsServer()." -u'admin_".VpsConf::getVpsUser()."' ".PREFIX_DATABASE."_".$name." -p'".VpsConf::getVpsPass()."' < ./dump/".$name_database;
        ssh2_exec(self::$connect, $cmd);

    }






    function connect_database($name) {
        // Устанавливаем соединение
        $dsn = "mysql:host=".VpsConf::getVpsServer().";dbname=".PREFIX_DATABASE."_".$name;

        try {
            $db = new PDO($dsn, "admin_".VpsConf::getVpsUser(), VpsConf::getVpsPass());
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage();
            die();
        }
        // Задаем кодировку
        $db->exec("set names utf8");
        $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $db->setAttribute(PDO::ATTR_PERSISTENT, false);
        return $db;
    }




    function edit_database($name, $name_url, $name_rus) {

        if(DbConf::getDbCms() == "opencart"){
            $this->connect_database($name)->prepare("UPDATE `oc_url_alias` SET `keyword`=CONCAT(keyword, '".$name_url."') WHERE url_alias_id > ".URL_ALIAS_ID.";")->execute();

            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_title`=CONCAT(meta_title, '".$name_rus."') WHERE meta_title != '';")->execute();
            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_title`=CONCAT(name, '".$name_rus."') WHERE meta_title = '';")->execute();

            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_description`=CONCAT(meta_description, '".$name_rus."') WHERE meta_description != '';")->execute();
            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_description`=CONCAT(name, '".$name_rus."') WHERE meta_description = '';")->execute();


            $info = urldecode("Купить тельфер");

            // редактируем главную страницу
            $this->connect_database($name)->prepare("UPDATE `oc_setting` SET `value` = REPLACE(value, 'Купить тельфер', 'Купить тельфер".$name_rus."') WHERE `key` LIKE 'config_meta_description';")->execute();
            $this->connect_database($name)->prepare("UPDATE `oc_setting` SET `value` = REPLACE(value, 'Купить тельфер', 'Купить тельфер".$name_rus."') WHERE `key` LIKE 'config_meta_title';")->execute();



            if(CHANGE_PRODUCT == "yes"){
                $this->connect_database($name)->prepare("UPDATE `oc_product_description` SET `meta_title`=CONCAT(meta_title, '".$name_rus."') WHERE meta_title != '';")->execute();
                $this->connect_database($name)->prepare("UPDATE `oc_product_description` SET `meta_title`=CONCAT(name, '".$name_rus."') WHERE meta_title = '';")->execute();

                $this->connect_database($name)->prepare("UPDATE `oc_product_description` SET `meta_description`=CONCAT(meta_description, '".$name_rus."') WHERE meta_description != '';")->execute();
                $this->connect_database($name)->prepare("UPDATE `oc_product_description` SET `meta_description`=CONCAT(name, '".$name_rus."') WHERE meta_description = '';")->execute();
            }

        }
    }





    function fresh_file($file){
        if(file_exists($file)){
            $time_create = filemtime($file);

            $year_create = date("Y", $time_create);
            $month_create = date("n", $time_create);
            $day_create = date("j", $time_create);

            if($year_create == date("Y") && $month_create == date("n") && $day_create == date("j")) {
                return true;
            }
            else{
                unlink($file);
                return false;
            }
        }
    }




    function create_arhive($source, $destination){

        // проверяю свежий ли архив
        if ($this->fresh_file($destination) === true) {
            return true;
        }


        $zip = new ZipArchive();
        $zip->open($destination, ZIPARCHIVE::CREATE);

        $source = str_replace('\\', '/', realpath($source));

        if (is_dir($source) === true){
            $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($source), RecursiveIteratorIterator::SELF_FIRST);

            foreach ($files as $file){
                $file = str_replace('\\', '/', $file);

                // Ignore "." and ".." folders
                if( in_array(substr($file, strrpos($file, '/')+1), array('.', '..')) )
                    continue;

                $file = realpath($file);
                $file = str_replace('\\', '/', $file);
				
				//echo $file." - ";
				//echo var_dump(strpos($file, URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/image"))."<br>\r\n";
				
				
                if (is_dir($file) === true && strpos($file, URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/image") === false){
                    $zip->addEmptyDir(str_replace($source . '/', '', $file . '/'));
                }else if (is_file($file) === true && strpos($file, URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/image") === false){
                    $zip->addFromString(str_replace($source . '/', '', $file), file_get_contents($file));
                }
            }
        }else if (is_file($source) === true){
            $zip->addFromString(basename($source), file_get_contents($source));
        }
        return $zip->close();
    }



    function copy_arhive($name) {
        copy(URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/archive.zip", URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/archive.zip");
    }


    function extract_arhive($name) {

        $zip1 = new ZipArchive;

        //Открываем Zip-архив
        $extract1 = $zip1->open(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/archive.zip");

        if ($extract1 === TRUE) {
            //Извлекаем содержимое архива
            $zip1->extractTo(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML);

            //Закрываем Zip-архив
            $zip1->close();
            //unlink(URL_SUBDOMAIN.$name.".".DOMAIN."/archive.zip");
        }
    }




    function replace_config($name, $https = null) {

        $https = $https ? $https : CREATE_HTTPS_DOMAIN;









        // правим файл .htaccess
        $data = file_get_contents(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/.htaccess");

        if($https == "no"){
            $data = str_replace("RewriteCond %{HTTPS} =off ","#RewriteCond %{HTTPS} =off ", $data);
            $data = str_replace("RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [QSA,L]","#RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [QSA,L]", $data);
        }
        else{
            $data = str_replace("#RewriteCond %{HTTPS} =off ","RewriteCond %{HTTPS} =off ", $data);
            $data = str_replace("#RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [QSA,L]","RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [QSA,L]", $data);
        }

        $handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/.htaccess","w+");
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл









        // правим файлы конфигураций
        $data = file_get_contents(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/config.php");
        $data = str_replace(DOMAIN,$name.".".DOMAIN, $data);
        $data = str_replace($name.".".DOMAIN."/".DOMAIN_HTML."/image",DOMAIN."/".DOMAIN_HTML."/image", $data);
        $data = str_replace("define('DB_DRIVER', 'mysqli_memcached');","define('DB_DRIVER', 'mysqli');", $data);
        $data = str_replace("define('DB_DATABASE', '".PREFIX_DATABASE."_".DOMAIN_DATABASE."');","define('DB_DATABASE', '".PREFIX_DATABASE."_".$name."');", $data);

        if($https == "no"){
            $data = str_replace("define('HTTPS_SERVER', 'https://".$name.".".DOMAIN."/');","define('HTTPS_SERVER', 'http://".$name.".".DOMAIN."/');", $data);
        }
        else {
            $data = str_replace("define('HTTPS_SERVER', 'http://".$name.".".DOMAIN."/');","define('HTTPS_SERVER', 'https://".$name.".".DOMAIN."/');", $data);
        }

        $handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/config.php","w+");
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл





        $data = file_get_contents(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/admin/config.php");
        $data = str_replace(DOMAIN,$name.".".DOMAIN, $data);
        $data = str_replace($name.".".DOMAIN."/".DOMAIN_HTML."/image",DOMAIN."/".DOMAIN_HTML."/image", $data);
        $data = str_replace("define('DB_DRIVER', 'mysqli_memcached');","define('DB_DRIVER', 'mysqli');", $data);
        $data = str_replace("define('DB_DATABASE', '".PREFIX_DATABASE."_".DOMAIN_DATABASE."');","define('DB_DATABASE', '".PREFIX_DATABASE."_".$name."');", $data);

        if($https == "no"){
            $data = str_replace("define('HTTPS_SERVER', 'https://".$name.".".DOMAIN."/admin/');","define('HTTPS_SERVER', 'http://".$name.".".DOMAIN."/admin/');", $data);
            $data = str_replace("define('HTTPS_CATALOG', 'https://".$name.".".DOMAIN."/');","define('HTTPS_CATALOG', 'http://".$name.".".DOMAIN."/');", $data);
        }
        else {
            $data = str_replace("define('HTTPS_SERVER', 'http://".$name.".".DOMAIN."/admin/');","define('HTTPS_SERVER', 'https://".$name.".".DOMAIN."/admin/');", $data);
            $data = str_replace("define('HTTPS_CATALOG', 'http://".$name.".".DOMAIN."/');","define('HTTPS_CATALOG', 'https://".$name.".".DOMAIN."/');", $data);
        }

        $handle_2 = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/admin/config.php","w+");
        fwrite($handle_2,$data); // Записать переменную в файл
        fclose($handle_2); // Закрыть файл
    }







    function link_dir_image($name) {
        
		ssh2_exec(self::$connect, "ln -s ".URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/image ".URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML);
		
		//symlink(URL_SUBDOMAIN.$name.".".DOMAIN."/image", URL_SUBDOMAIN.DOMAIN."/image");
    }








    function open_basedir($name, $https = null) {

        $https = $https ? $https : CREATE_HTTPS_DOMAIN;

        if($https == "yes"){
            ssh2_exec(self::$connect, "sleep 200 ; grep -v 'php_admin_value open_basedir' /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf > /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf2");
            ssh2_exec(self::$connect, "sleep 210 ; rm /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf -f ; mv /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf2 /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf");
            $sleep = 200;
        }
        else{
            $sleep = 0;
        }


        ssh2_exec(self::$connect, "sleep ".$sleep." ; grep -v 'php_admin_value open_basedir' /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf > /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf2");
        ssh2_exec(self::$connect, "sleep ".$sleep." ; rm /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf -f ; mv /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf2 /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf");


        ssh2_exec(self::$connect, "sleep ".$sleep." ; service httpd restart");

        
        
        /*
        $data = file_get_contents("/home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf");
        $data = str_replace("php_admin_value open_basedir /home/admin/web/".$name.".".DOMAIN."/public_html:home/admin/tmp","", $data);
        $handle = fopen("/home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf","w+");
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл


        $data = file_get_contents("/home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf");
        $data = str_replace("php_admin_value open_basedir /home/admin/web/".$name.".".DOMAIN."/public_html:home/admin/tmp","", $data);
        $handle = fopen("/home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf","w+");
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл
        */
    }






    function delete_cache_and_archive($name, $https = null) {

        $https = $https ? $https : CREATE_HTTPS_DOMAIN;

        if($https == "yes"){
            $sleep = 200;
        }
        else{
            $sleep = 0;
        }

        ssh2_exec(self::$connect, "sleep ".$sleep." ; rm -f ".URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/system/storage/cache/*");
        ssh2_exec(self::$connect, "sleep ".$sleep." ; rm -f ".URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/archive.zip");
    }











    function posted_adress($name, $address, $paspisanie) {
        $this->connect_database($name)->prepare("UPDATE `oc_setting` SET `value` = '".$address."' WHERE `key` LIKE 'config_microdata_address_3';")->execute();
        $this->connect_database($name)->prepare("UPDATE `oc_setting` SET `value` = '".$address."' WHERE `key` LIKE 'config_address';")->execute();
        $this->connect_database($name)->prepare("UPDATE `oc_setting` SET `value` = '".$paspisanie."' WHERE `key` LIKE 'config_open';")->execute();
    }















}
