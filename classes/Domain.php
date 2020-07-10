<?php





Class Domain {



    function index($name) {
        $this->create_domain($name);

        $this->create_database($name);
        $this->copy_database($name);
        $this->edit_database($name);


        $this->create_arhive( URL_SUBDOMAIN.DOMAIN, URL_SUBDOMAIN.DOMAIN."/archive.zip");
        $this->copy_arhive($name);
        $this->extract_arhive($name);

        $this->replace_config($name);
        $this->link_dir_image($name);

    }





    function create_domain($name) {
        chmod(URL_SUBDOMAIN, 0755);

        $dir_domain = URL_SUBDOMAIN.$name.".".DOMAIN;
        echo $dir_domain;

        if (!file_exists($dir_domain)) {
            mkdir($dir_domain);
        }
    }




    function create_database($name) {
        $mysqli = new mysqli(VPS_SERVER, VPS_USER, VPS_PASS);
        if($mysqli->connect_errno) {
            //die('Нет соединения с базой: ' . $mysqli->connect_error);
        }
        //echo 'Подключено успешно';

        $retval = $mysqli->query("CREATE Database ".PREFIX_DATABASE."_".$name);

        if(! $retval ) {
            //die('Невозможно создать базу данных: ' . $mysqli->connect_error);
        }
        //echo "База данных test_db создана успешно\n";
        $mysqli->close();
    }





    function copy_database($name) {

        $connect = ssh2_connect(SSH_SERVER, SSH_PORT);
        ssh2_auth_password($connect, SSH_USER, SSH_PASS);

        if($connect) {echo "XXXXX";}

        //$cmd = 'mkdir dump';
        //ssh2_exec($connect, $cmd);

        //$name_database = "dump_".date("Y-m-d").".sql";
        $name_database = "dump2.sql";
        echo $name_database;
        if (!file_exists("./dump/".$name_database)) {
            // создаю новую базу данных
            //mysqldump -h localhost -uroot magazin_osn -pqwuiFr5e2A > ./dump/dump2.sql
            $cmd = "mysqldump -h ".VPS_SERVER." -u'".VPS_USER."' ".PREFIX_DATABASE."_".DOMAIN_DATABASE." -p'".VPS_PASS."' > ./dump/".$name_database;
            ssh2_exec($connect, $cmd);
        }

        $cmd = "mysql -h ".VPS_SERVER." -u'".VPS_USER."' ".PREFIX_DATABASE."_".$name." -p'".VPS_PASS."' < ./dump/".$name_database;
        ssh2_exec($connect, $cmd);

    }






    function connect_database($name) {
        // Устанавливаем соединение
        $dsn = "mysql:host=".VPS_SERVER.";dbname=".PREFIX_DATABASE."_".$name;
        $db = new PDO($dsn, VPS_USER, VPS_PASS);
        // Задаем кодировку
        $db->exec("set names utf8");
        $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $db->setAttribute(PDO::ATTR_PERSISTENT, false);
        return $db;
    }




    function edit_database($name) {
        $this->connect_database($name)->prepare("UPDATE `oc_url_alias` SET `keyword`=CONCAT(keyword,'-v-novosibirske') WHERE query NOT LIKE 'common/home'")->execute();
        //$this->connect_database($name)->prepare("UPDATE `oc_oct_megamenu_description` SET `link`=CONCAT(link,'-v-novosibirske')")->execute();
        $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_title`=CONCAT(meta_title,' в Новосибирске')")->execute();
        $this->connect_database($name)->prepare("UPDATE `oc_category_description` SET `meta_description`=CONCAT(meta_description,' в Новосибирске')")->execute();
    }





    function create_arhive($source, $destination){

        // проверяю свежий ли архив
        if(file_exists($destination)){
            $time_create = filemtime($destination);

            $year_create = date("Y", $time_create);
            $month_create = date("n", $time_create);
            $day_create = date("j", $time_create);

            if($year_create == date("Y") && $month_create == date("n") && $day_create == date("j")) {
                return true;
            }
            else{
                unlink(URL_SUBDOMAIN.DOMAIN."/archive.zip");
            }
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

                if (is_dir($file) === true && $file != "image"){
                    $zip->addEmptyDir(str_replace($source . '/', '', $file . '/'));
                }else if (is_file($file) === true){
                    $zip->addFromString(str_replace($source . '/', '', $file), file_get_contents($file));
                }
            }
        }else if (is_file($source) === true){
            $zip->addFromString(basename($source), file_get_contents($source));
        }
        return $zip->close();
    }



    function copy_arhive($name) {
        copy(URL_SUBDOMAIN.DOMAIN."/archive.zip", URL_SUBDOMAIN.$name.".".DOMAIN."/archive.zip");
    }


    function extract_arhive($name) {
        $zip1 = new ZipArchive;

        //Открываем Zip-архив
        $extract1 = $zip1->open(URL_SUBDOMAIN.$name.".".DOMAIN."/archive.zip");

        if ($extract1 === TRUE) {
            //Извлекаем содержимое архива
            $zip1->extractTo(URL_SUBDOMAIN.$name.".".DOMAIN);

            //Закрываем Zip-архив
            $zip1->close();
            //unlink(URL_SUBDOMAIN.$name.".".DOMAIN."/archive.zip");
        }
    }




    function replace_config($name) {
        $data = file_get_contents(URL_SUBDOMAIN.$name.".".DOMAIN."/config.php");
        $data = str_replace(DOMAIN,$name.".".DOMAIN, $data);
        //$data = str_replace(DOMAIN.".".$name."/image",DOMAIN."/image", $data);
        $data = str_replace("define('DB_DRIVER', 'mysqli_memcached');","define('DB_DRIVER', 'mysqli');", $data);
        $data = str_replace("define('DB_DATABASE', '".PREFIX_DATABASE."_".DOMAIN_DATABASE."');","define('DB_DATABASE', '".PREFIX_DATABASE."_".$name."');", $data);
        $handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/config.php","w+"); // Открыть файл, сделать его пустым
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл



        $data = file_get_contents(URL_SUBDOMAIN.$name.".".DOMAIN."/admin/config.php");
        $data = str_replace(DOMAIN,$name.".".DOMAIN, $data);
        //$data = str_replace(DOMAIN.".".$name."/image",DOMAIN."/image", $data);
        $data = str_replace("define('DB_DRIVER', 'mysqli_memcached');","define('DB_DRIVER', 'mysqli');", $data);
        $data = str_replace("define('DB_DATABASE', '".PREFIX_DATABASE."_".DOMAIN_DATABASE."');","define('DB_DATABASE', '".PREFIX_DATABASE."_".$name."');", $data);
        $handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/admin/config.php","w+"); // Открыть файл, сделать его пустым
        fwrite($handle,$data); // Записать переменную в файл
        fclose($handle); // Закрыть файл
    }







    function link_dir_image($name) {
        symlink(URL_SUBDOMAIN.$name.".".DOMAIN."/image", URL_SUBDOMAIN.DOMAIN."/image");
    }








}
