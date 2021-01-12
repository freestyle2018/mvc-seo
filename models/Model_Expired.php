<?php

// модель
Class Model_Expired{

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


    public function add($name_domain, $date_add, $timestamp){
        $stmt = $this->getConnection()->prepare("INSERT INTO `expired` (`id`, `name`, `date_add`, `archive_timestamp`, `load_site`) VALUES (NULL, :name, :date_add, :archive_timestamp, '')");

        $stmt->bindParam(':name', $name_domain);
        $stmt->bindParam(':date_add', $date_add);
        $stmt->bindParam(':archive_timestamp', $timestamp);

        return $stmt->execute();
    }



    public function delete($name_domain){

        $stmt = $this->getConnection()->prepare("DELETE FROM expired WHERE name LIKE :name");
        $stmt->bindParam(':name', $name_domain);
        $stmt->execute();

    }



    public function show_Domain($id){
        $stmt = $this->getConnection()->prepare("SELECT * FROM expired WHERE id=".$id);
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }

    }



    public function domains(){

        $stmt = $this->getConnection()->prepare("SELECT * FROM expired ");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }

    }




    public function update_domain($domain){
        $stmt = $this->getConnection()->prepare("UPDATE expired set 
                                    name = :name,
                                    date_add = :date_add,
                                    archive_timestamp = :archive_timestamp,
                                    load_site = :load_site
                                    
                                    where id = :id");

        //echo $domain["name"]." - ".$domain["id"];

        $stmt->bindParam(':name', $domain["name"]);
        $stmt->bindParam(':date_add', $domain["date_add"]);
        $stmt->bindParam(':archive_timestamp', $domain["archive_timestamp"]);
        $stmt->bindParam(':load_site', $domain["load_site"]);

        $stmt->bindParam(':id', $domain["id"]);


        $stmt->execute();
    }





    public function load_domain_out_webarchive(){
        $stmt = $this->getConnection()->prepare("SELECT * FROM expired WHERE load_site = '0'");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
        else{
            return array();
        }
    }



    public function end_load_domain_out_webarchive($domain){
        //$stmt = $this->getConnection()->prepare("UPDATE `expired` set load_site = '1' WHERE `name` LIKE ':domain'");
        $stmt = $this->getConnection()->prepare("UPDATE `expired` set load_site = '1' WHERE `name` LIKE '".$domain."'");

        //$stmt->bindParam(':domain', $domain);

        $stmt->execute();
    }








}
