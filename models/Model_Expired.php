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
        $stmt = $this->getConnection()->prepare("INSERT INTO `expired` (`id`, `name`, `date_add`, `archive_timestamp`, `load_site`) VALUES (NULL, :name, :date_add, :archive_timestamp, '0')");

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





}
