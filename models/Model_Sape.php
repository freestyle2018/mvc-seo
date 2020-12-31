<?php

// модель
Class Model_Sape{

    public static function getConnection()
    {
        // Устанавливаем соединение
        $dsn = "mysql:host=".DbConf::getDbHost().";dbname=".DbConf::getDbName();
        $db = new PDO($dsn, DbConf::getDbUser(), DbConf::getDbPass());
        // Задаем кодировку
        $db->exec("set names utf8");
        $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $db->setAttribute(PDO::ATTR_PERSISTENT, false);
        return $db;
    }


    public function add_Razdel($id_razdel, $name_razdel, $date_next, $kolichestvo_urls, $date_start = null, $date_end = null, $shag_time = 4, $koef_time = 120, $prirost = 'static', $id_folder = SAPE_FOLDER_ID, $zapusk = '', $nomer = 0){

        $stmt = $this->getConnection()->prepare("INSERT INTO `sape_razdel` (`id_razdel`, `name_razdel`, `date_next`, `date_start`, `date_end`, `shag_time`, `koef_time`, `kolichestvo_urls`, `prirost`, `id_project`, `zapusk`, `nomer`, `date_index`) VALUES (:id_razdel, :name_razdel, :date_next, NULL, NULL, :shag_time, :koef_time, :kolichestvo_urls, :prirost, :id_folder, :zapusk, :nomer, NULL)");

        $stmt->bindParam(':id_razdel', $id_razdel);
        $stmt->bindParam(':name_razdel', $name_razdel);
        $stmt->bindParam(':date_next', $date_next);
        $stmt->bindParam(':kolichestvo_urls', $kolichestvo_urls);
        //$stmt->bindParam(':date_start', PDO::PARAM_NULL);
        //$stmt->bindParam(':date_end', PDO::PARAM_NULL);
        $stmt->bindParam(':shag_time', $shag_time);
        $stmt->bindParam(':koef_time', $koef_time);
        $stmt->bindParam(':prirost', $prirost);
        $stmt->bindParam(':id_folder', $id_folder);
        $stmt->bindParam(':zapusk', $zapusk);
        $stmt->bindParam(':nomer', $nomer);

        return $stmt->execute();
    }



    public function delete_Razdel($id_razdel){
        $stmt = $this->getConnection()->prepare("DELETE FROM sape_razdel WHERE id_razdel = :id_razdel");
        $stmt->bindParam(':id_razdel', $id_razdel);
        $stmt->execute();
    }


    public function delete_all_urls_in_Razdel($id_razdel){
        $stmt = $this->getConnection()->prepare("DELETE FROM sape_url WHERE id_razdel = :id_razdel");
        $stmt->bindParam(':id_razdel', $id_razdel);
        $stmt->execute();
    }


    public function update_Razdel($razdel){

        $stmt = $this->getConnection()->prepare("UPDATE sape_razdel set 
                                    name_razdel = :name_razdel,
                                    date_next = :date_next,
                                    kolichestvo_urls = :kolichestvo_urls,
                                    date_start = :date_start,
                                    date_end = :date_end,
                                    shag_time = :shag_time,
                                    koef_time = :koef_time,
                                    prirost = :prirost,
                                    id_project = :id_project,
                                    zapusk = :zapusk,
                                    nomer = :nomer, 
                                    date_index = :date_index
                                    
                                    where id_razdel = :id_razdel");

        $stmt->bindParam(':name_razdel', $razdel["name_razdel"]);
        $stmt->bindParam(':date_next', $razdel["date_next"]);
        $stmt->bindParam(':kolichestvo_urls', $razdel["kolichestvo_urls"]);
        $stmt->bindParam(':date_start', $razdel["date_start"]);
        $stmt->bindParam(':date_end', $razdel["date_end"]);
        $stmt->bindParam(':shag_time', $razdel["shag_time"]);
        $stmt->bindParam(':koef_time', $razdel["koef_time"]);
        $stmt->bindParam(':prirost', $razdel["prirost"]);
        $stmt->bindParam(':id_project', $razdel["id_project"]);
        $stmt->bindParam(':zapusk', $razdel["zapusk"]);
        $stmt->bindParam(':nomer', $razdel["nomer"]);
        $stmt->bindParam(':date_index', $razdel["date_index"]);

        $stmt->bindParam(':id_razdel', $razdel["id_razdel"]);


        $stmt->execute();

    }



    public function show_Razdel($id_razdel){
        $stmt = $this->getConnection()->prepare("SELECT * FROM sape_razdel WHERE id_razdel  = ".$id_razdel);
        $stmt->execute();

        foreach ($stmt->fetch(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        return $row;
    }



    public function show_Razdels(){
        $stmt = $this->getConnection()->prepare("SELECT * FROM sape_razdel WHERE id_project  = ".SAPE_FOLDER_ID);
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }






    public function urls_add($id_urls, $urls, $id_project){
        $urls_array = explode("\r\n", $urls);

        $i = 0;
        while ($i < sizeof($urls_array)){
            $this->url_add($id_urls[$i], $urls_array[$i], $id_project);
            $i++;
        }
    }


    public function url_add($id_url, $name_url, $id_project){
        $stmt = $this->getConnection()->prepare("INSERT INTO `sape_url` (`id_url`, `name_url`, `id_razdel`, `status`) VALUES (:id_url, :name_url, :id_project, '0')");

        $stmt->bindParam(':id_url', $id_url);
        $stmt->bindParam(':name_url', $name_url);
        $stmt->bindParam(':id_project', $id_project);

        $stmt->execute();
    }



    public function url_update($url){
        $stmt = $this->getConnection()->prepare("UPDATE sape_url set 
                                    name_url = :name_url,
                                    id_razdel = :id_razdel,
                                    status = :status
                                    
                                    where id_url = :id_url");

        $stmt->bindParam(':id_url', $url["id_url"]);
        $stmt->bindParam(':name_url', $url["name_url"]);
        $stmt->bindParam(':id_razdel', $url["id_razdel"]);
        $stmt->bindParam(':status', $url["status"]);

        $stmt->execute();
    }




    public function get_url_in_cron($id_razdel, $nomer){

        $stmt = $this->getConnection()->prepare("SELECT * FROM sape_url WHERE id_razdel = :id_razdel ORDER BY id_url ASC LIMIT :nomer, 1");

        $stmt->bindParam(':id_razdel', $id_razdel);
        $stmt->bindParam(':nomer', $nomer);

        $stmt->execute();

        foreach ($stmt->fetch() as $key => $value) {
            $row[$key] = $value;
        }

        return $row;
    }



    public function get_urls_in_razdel($id_razdel, $nomer, $url_id){
        $stmt = $this->getConnection()->prepare("SELECT * FROM sape_url WHERE id_razdel = :id_razdel AND status = 0 AND id_url <= :id_url ORDER BY id_url DESC LIMIT :nomer");

        $stmt->bindParam(':id_razdel', $id_razdel);
        $stmt->bindParam(':id_url', $url_id);
        $stmt->bindParam(':nomer', $nomer);

        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        return $row;
    }



    public function get_url($id_url){

        $stmt = $this->getConnection()->prepare("SELECT * FROM sape_url WHERE id_url = :id_url");

        $stmt->bindParam(':id_url', $id_url);

        $stmt->execute();

        foreach ($stmt->fetch() as $key => $value) {
            $row[$key] = $value;
        }

        return $row;

    }





}
