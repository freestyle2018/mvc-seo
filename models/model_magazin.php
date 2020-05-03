<?php

// модель
Class Model_Magazin{

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

    public function show_Magazins(){
        $stmt = $this->getConnection()->prepare("SELECT * FROM opencart_magazin");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        return $row;
    }


    public function show_Magazin($id_magazin){
        $stmt = $this->getConnection()->prepare("SELECT * FROM opencart_magazin WHERE id_magazin = ".$id_magazin);
        $stmt->execute();

        foreach ($stmt->fetch(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        return $row;
    }


    public function update_Magazin($magazin){

        $stmt = $this->getConnection()->prepare("UPDATE opencart_magazin set 
                                    domain_magazin  = :domain_magazin,
                                    url_skachivania_1_magazin = :url_skachivania_1_magazin,
                                    url_skachivania_2_magazin = :url_skachivania_2_magazin,
                                    name_product_magazin = :name_product_magazin,
                                    cena_product_magazin = :cena_product_magazin,
                                    url_image_product_magazin = :url_image_product_magazin,
                                    atribute_key_product_magazin = :atribute_key_product_magazin,
                                    atribute_value_product_magazin  = :atribute_value_product_magazin
                                    
                                    where id_magazin = :id_magazin");


        $stmt->bindParam(':domain_magazin', $magazin["domain_magazin"]);
        $stmt->bindParam(':url_skachivania_1_magazin', $magazin["url_skachivania_1_magazin"]);
        $stmt->bindParam(':url_skachivania_2_magazin', $magazin["url_skachivania_2_magazin"]);
        $stmt->bindParam(':name_product_magazin', $magazin["name_product_magazin"]);
        $stmt->bindParam(':cena_product_magazin', $magazin["cena_product_magazin"]);
        $stmt->bindParam(':url_image_product_magazin', $magazin["url_image_product_magazin"]);
        $stmt->bindParam(':atribute_key_product_magazin', $magazin["atribute_key_product_magazin"]);
        $stmt->bindParam(':atribute_value_product_magazin', $magazin["atribute_value_product_magazin"]);
        $stmt->bindParam(':id_magazin', $magazin["id_magazin"]);

        $stmt->execute();
    }



    public function delete_Magazin($id_razdel){
        $stmt = $this->getConnection()->prepare("DELETE FROM opencart_magazin WHERE id_magazin = :id_magazin");
        $stmt->bindParam(':id_magazin', $id_magazin);
        $stmt->execute();
    }


}
