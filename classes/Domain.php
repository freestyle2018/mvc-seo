<?php





Class Domain {

    static $connect;







    function __construct() {
        self::$connect = ssh2_connect(VpsConf::getSshServer(), VpsConf::getSshPort());
        if (!self::$connect) die('Не удалось установить соединение');

        ssh2_auth_password(self::$connect, VpsConf::getSshUser(), VpsConf::getSshPass());
    }


    function index($name, $name_url, $name_rus) {
        $this->create_domain($name);

        $this->create_database($name);
        $this->copy_database($name);
        $this->edit_database($name, $name_url, $name_rus);

        $this->create_arhive( URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML, URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/archive.zip");
        $this->copy_arhive($name);
        $this->extract_arhive($name);

        $this->replace_config($name);
        $this->link_dir_image($name);

        $this->open_basedir($name);
        $this->delete_cache($name);
    }







    function create_domain($name) {
        /*chmod(URL_SUBDOMAIN, 0755);

        $dir_domain = URL_SUBDOMAIN.$name.".".DOMAIN;
        echo $dir_domain;

        if (!file_exists($dir_domain)) {
            mkdir($dir_domain);
        }*/


		
        ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-add-domain admin ".$name.".".DOMAIN);
        ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-generate-ssl-cert ".DOMAIN." *.".DOMAIN." troinfo@yandex.ru RU Moscow Orel HOME admin");
        ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-add-letsencrypt-domain admin ".$name.".".DOMAIN);
		
		/*
		$stream = ssh2_exec($connect, 'php -v'); 
		stream_set_blocking($stream, true); 
		$stream_out = ssh2_fetch_stream($stream, SSH2_STREAM_STDIO); 
		echo stream_get_contents($stream_out); 
		*/
    }
	
	


    function create_database($name) {

        ssh2_exec(self::$connect, "/usr/local/vesta/bin/v-add-database admin $name ".VpsConf::getVpsUser()." ".VpsConf::getVpsPass());

        /*$mysqli = new mysqli(VPS_SERVER, VPS_USER, VPS_PASS);
        if($mysqli->connect_errno) {
            //die('Нет соединения с базой: ' . $mysqli->connect_error);
        }
        //echo 'Подключено успешно';

        $retval = $mysqli->query("CREATE Database ".PREFIX_DATABASE."_".$name);

        if(! $retval ) {
            //die('Невозможно создать базу данных: ' . $mysqli->connect_error);
        }
        //echo "База данных test_db создана успешно\n";
        $mysqli->close();*/


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
        if(DbConf::getDbCms == "opencart"){
            $this->connect_database($name)->prepare("UPDATE `oc_url_alias` SET `keyword`=CONCAT(keyword, '".$name_url."') WHERE url_alias_id > 638;")->execute();

            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_title`=CONCAT(meta_title, '".$name_rus."') WHERE meta_title != '';")->execute();
            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_title`=CONCAT(name, '".$name_rus."') WHERE meta_title = '';")->execute();

            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_description`=CONCAT(meta_description, '".$name_rus."') WHERE meta_description != '';")->execute();
            $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_description`=CONCAT(name, '".$name_rus."') WHERE meta_description = '';")->execute();

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



        if (!extension_loaded('zip') || !file_exists($source)) {
            return false;
        }

        $zip = new ZipArchive();
        if (!$zip->open($destination, ZIPARCHIVE::CREATE)) {
            return false;
        }

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




    function replace_config($name) {
        $data = file_get_contents(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/config.php");
        $data = str_replace(DOMAIN,$name.".".DOMAIN, $data);
        //$data = str_replace(DOMAIN."/".DOMAIN_HTML.".".$name."/image",DOMAIN."/".DOMAIN_HTML."/image", $data);
        $data = str_replace("define('DB_DRIVER', 'mysqli_memcached');","define('DB_DRIVER', 'mysqli');", $data);
        $data = str_replace("define('DB_DATABASE', '".PREFIX_DATABASE."_".DOMAIN_DATABASE."');","define('DB_DATABASE', '".PREFIX_DATABASE."_".$name."');", $data);
        $handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/config.php","w+");
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл



        $data = file_get_contents(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/admin/config.php");
        $data = str_replace(DOMAIN,$name.".".DOMAIN, $data);
        //$data = str_replace(DOMAIN."/".DOMAIN_HTML.".".$name."/image",DOMAIN."/".DOMAIN_HTML."/image", $data);
        $data = str_replace("define('DB_DRIVER', 'mysqli_memcached');","define('DB_DRIVER', 'mysqli');", $data);
        $data = str_replace("define('DB_DATABASE', '".PREFIX_DATABASE."_".DOMAIN_DATABASE."');","define('DB_DATABASE', '".PREFIX_DATABASE."_".$name."');", $data);
        $handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/admin/config.php","w+");
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл
    }







    function link_dir_image($name) {
        
		ssh2_exec(self::$connect, "ln -s ".URL_SUBDOMAIN.DOMAIN."/".DOMAIN_HTML."/image ".URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML);
		
		//symlink(URL_SUBDOMAIN.$name.".".DOMAIN."/image", URL_SUBDOMAIN.DOMAIN."/image");
    }








    function open_basedir($name) {

        ssh2_exec(self::$connect, "sleep 200 ; grep -v 'php_admin_value open_basedir' /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf > /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf2");
        ssh2_exec(self::$connect, "sleep 210 ; rm /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf -f");
        ssh2_exec(self::$connect, "sleep 220 ; mv /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf2 /home/admin/conf/web/".$name.".".DOMAIN.".httpd.ssl.conf");





        ssh2_exec(self::$connect, "sleep 230 ; grep -v 'php_admin_value open_basedir' /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf > /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf2");
        ssh2_exec(self::$connect, "sleep 240 ; rm /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf -f");
        ssh2_exec(self::$connect, "sleep 250 ; mv /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf2 /home/admin/conf/web/".$name.".".DOMAIN.".httpd.conf");



        ssh2_exec(self::$connect, "sleep 270 ; service httpd restart");

        
        
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






    function delete_cache($name) {
        ssh2_exec(self::$connect, "sleep 290 ; rm ".URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/system/storage/cache/*");
    }



























}
