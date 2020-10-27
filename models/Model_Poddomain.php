<?php

// модель
Class Model_Poddomain{

    const SHOW_BY_DEFAULT = 20;

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


    public function show_Poddomain($id){
        $stmt = $this->getConnection()->prepare("SELECT * FROM poddomain WHERE id=".$id);
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }

    public function show_Poddomains(){
        $stmt = $this->getConnection()->prepare("SELECT * FROM poddomain ORDER BY id ASC");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }

    public static function get_Poddomains_Limit($page, $sort, $limit = null){

        $limit = $limit ? $limit : self::SHOW_BY_DEFAULT;
        $offset = ($page - 1) * $limit;
        $db = Model_Poddomain::getConnection();

        if($sort == ""){
            $sql = 'SELECT * FROM poddomain ORDER BY id ASC LIMIT :limit OFFSET :offset ';
        }
        else{
            $sql = 'SELECT * FROM poddomain ORDER BY ' . $sort . ' LIMIT :limit OFFSET :offset ';
        }

        $result = $db->prepare($sql);
        $result->bindParam(':limit', $limit, PDO::PARAM_INT);
        $result->bindParam(':offset', $offset, PDO::PARAM_INT);
        $result->execute();


        foreach ($result->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
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
                                    adress = :adress,   
                                    paspisanie = :paspisanie,
                                    posted_address = :posted_address,
                                    indikator = :indikator
                                    
                                    where id = :id");

        //echo $domain["name"]." - ".$domain["id"];

        $stmt->bindParam(':name', $domain["name"]);
        $stmt->bindParam(':name_url', $domain["name_url"]);
        $stmt->bindParam(':name_rus', $domain["name_rus"]);
        $stmt->bindParam(':adress', $domain["adress"]);
        $stmt->bindParam(':paspisanie', $domain["paspisanie"]);
        $stmt->bindParam(':posted_address', $domain["posted_address"]);
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





    public function count_Poddomain(){
        $stmt = $this->getConnection()->prepare("SELECT count(id) AS count FROM poddomain");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }








}
