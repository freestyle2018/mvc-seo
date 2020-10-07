<?php

// модель
Class Model_Poddomain{

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


    public function show_Poddomains(){
        $stmt = $this->getConnection()->prepare("SELECT * FROM poddomain");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }



    public function show_create_Poddomain(){
        $stmt = $this->getConnection()->prepare("SELECT * FROM poddomain WHERE indikator = 0 ORDER BY id LIMIT 1");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }


    public function update_Poddomain($domain){
        $stmt = $this->getConnection()->prepare("UPDATE poddomain set 
                                    name = :name,
                                    name_url = :name_url,
                                    name_rus = :name_rus,
                                    indikator = :indikator
                                    
                                    where id = :id");

        echo $domain["name"]." - ".$domain["id"];

        $stmt->bindParam(':name', $domain["name"]);
        $stmt->bindParam(':name_url', $domain["name_url"]);
        $stmt->bindParam(':name_rus', $domain["name_rus"]);
        $stmt->bindParam(':indikator', $domain["indikator"]);

        $stmt->bindParam(':id', $domain["id"]);


        $stmt->execute();
    }

    public function add_Poddomain($name, $name_url, $name_rus, $indikator){

        $stmt_1 = $this->getConnection()->prepare("SELECT * FROM poddomain WHERE name LIKE '$name'");
        $stmt_1->execute();

        $count = count($stmt_1->fetchAll(PDO::FETCH_NAMED));

        if($count == 0){
            $stmt = $this->getConnection()->prepare("INSERT INTO `poddomain` (`id`, `name`, `name_url`, `name_rus`, `indikator`) VALUES (NULL, :name, :name_url, :name_rus, :indikator)");

            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':name_url', $name_url);
            $stmt->bindParam(':name_rus', $name_rus);
            $stmt->bindParam(':indikator', $indikator);

            return $stmt->execute();
        }
    }





    public function delete_Poddomain($id){
        $stmt = $this->getConnection()->prepare("DELETE FROM poddomain WHERE id = :id");
        $stmt->bindParam(':id', $id);
        $stmt->execute();
    }





}
