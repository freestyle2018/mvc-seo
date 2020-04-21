<?php

// модель
Class Model_Sape{

    //static $db;




    public static function getConnection()
    {
        // Устанавливаем соединение
        $dsn = "mysql:host=".DB_HOST.";dbname=".DB_NAME;
        $db = new PDO($dsn, DB_USER, DB_PASS);
        // Задаем кодировку
        $db->exec("set names utf8");
        $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $db->setAttribute(PDO::ATTR_PERSISTENT, false);
        return $db;
    }


    public function add_Razdel($id_razdel, $name_razdel, $date_next, $kolichestvo_urls, $date_start = null, $date_end = null, $shag_time = 4, $koef_time = 120, $prirost = 'static', $id_folder = SAPE_FOLDER_ID, $zapusk = 'off'){

        $stmt = $this->getConnection()->prepare("INSERT INTO `sape_razdel` (`id_razdel`, `name_razdel`, `date_next`, `date_start`, `date_end`, `shag_time`, `koef_time`, `kolichestvo_urls`, `prirost`, `id_project`, `zapusk`) VALUES (:id_razdel, :name_razdel, :date_next, NULL, NULL, :shag_time, :koef_time, :kolichestvo_urls, :prirost, :id_folder, :zapusk)");

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

        return $stmt->execute();
    }



    public function delete_Razdel($id_razdel){
        $stmt = $this->getConnection()->prepare("DELETE FROM sape_razdel WHERE id_razdel = :id_razdel");
        $stmt->bindParam(':id_razdel', $id_razdel);
        $stmt->execute();
    }


    public function update_Razdel_2($id_razdel, $name_razdel, $date_next, $kolichestvo_urls, $date_start, $date_end, $shag_time, $koef_time , $prirost, $id_folder, $zapusk){

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
                                    zapusk = :zapusk 
                                    
                                    where id_razdel = :lastname");

        $stmt->bindParam(':name_razdel', $name_razdel);
        $stmt->bindParam(':date_next', $date_next);
        $stmt->bindParam(':kolichestvo_urls', $kolichestvo_urls);
        $stmt->bindParam(':date_start', $date_start);
        $stmt->bindParam(':date_end', $date_end);
        $stmt->bindParam(':shag_time', $shag_time);
        $stmt->bindParam(':koef_time', $koef_time);
        $stmt->bindParam(':prirost', $prirost);
        $stmt->bindParam(':id_project', $id_folder);
        $stmt->bindParam(':zapusk', $zapusk);

        $stmt->bindParam(':lastname', $id_razdel);


        $stmt->execute();

    }



    public function show_Razdel($id_razdel){

        $stmt = $this->getConnection()->prepare("SELECT * FROM sape_razdel WHERE id_razdel  = ".$id_razdel);

        $stmt->execute();


        foreach ($stmt->fetch() as $key => $value) {
            $row[$key] = $value;
        }

        return $row;
    }





}
