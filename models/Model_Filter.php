<?php

Class Model_Filter{

    static $db;

    public static function getConnection()
    {
        // Устанавливаем соединение
        $dsn = "mysql:host=".DbConf::getDbHost().";dbname=".DbConf::getDbMagazin();
        self::$db = new PDO($dsn, DbConf::getDbUser(), DbConf::getDbPass());
        // Задаем кодировку
        //$db->exec("set names utf8");

        self::$db->exec("SET NAMES 'utf8'");
        self::$db->exec("SET CHARACTER SET 'utf8'");
        self::$db->exec("SET SESSION collation_connection = 'utf8_general_ci'");



        self::$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        self::$db->setAttribute(PDO::ATTR_PERSISTENT, false);
        return self::$db;
    }





    public function search_category($name_category){
        $stmt = $this->getConnection()->prepare("SELECT * FROM oc_category_description WHERE `name` LIKE ':name_category'");

        $stmt->bindParam(':name_category', $name_category);

        $stmt->execute();

        if(is_array($stmt->fetch())){
            foreach ($stmt->fetch() as $key => $value) {
                $row[$key] = $value;
            }

            return true;
        }
    }





    public function insert_children_category($name_category, $children_category, $children_category_description){
        $id_parent_category = $this->id_category($name_category);

        $otvet = $this->search_category($children_category);
        if($otvet === true) {
            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (NULL, '', '".$id_parent_category."', '1', '1', '1', '1', '".date("Y-m-d h:i:s")."', '".date("Y-m-d h:i:s")."')");

            $stmt->execute();
            $max_id_children_category = self::$db->lastInsertId("category_id");


            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$max_id_children_category."', '1', '".$children_category."', '', '".$children_category_description." купить на нашем сайте', '".$children_category_description." купить на нашем сайте', '');");
            $stmt->execute();


            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_children_category."', '".$id_parent_category."', '0');");
            $stmt->execute();


            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_children_category."', '".$max_id_children_category."', '1');");
            $stmt->execute();


            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$max_id_children_category."', '0', '11');");
            $stmt->execute();


            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$max_id_children_category."', '0');");
            $stmt->execute();
        }
    }






















    public function attributes($attributes){
        //var_dump($attributes["name"]);

        $sql = "";

        $attributes_name = "";
        $attributes_value = "";
        $attributes_like = "";
        $attributes_ot_do = "";

        $name = array();
        $values = array();
        $likes = array();
        $ot = array();
        $do = array();

        $size_attributes = sizeof($attributes["name"]) - 1;
        $kolichestvo_sovpadenii = 0;


        // из многомерного создаем несколько одномерных массивов
        foreach ($attributes as $key=>$value) {
            foreach ($value as $inner_key=>$inner_value) {
                if($key == "name"){
                    $name[] = $inner_value;
                }
                if($key == "value"){
                    $values[] = $inner_value;
                }
                if($key == "like"){
                    $likes[] = $inner_value;
                }
                if($key == "ot"){
                    $ot[] = $inner_value;
                }
                if($key == "do"){
                    $do[] = $inner_value;
                }
            }
        }



        /*var_dump($name);
        echo "\r\n\r\n\r\n";

        var_dump($values);
        echo "\r\n\r\n\r\n";

        var_dump($ot);
        echo "\r\n\r\n\r\n";

        var_dump($do);*/


        // считаем сколько запросов name - value
        $size_name = 0;
        for ($i = 0; $i <= $size_attributes; $i++) {
            if($values[$i] != ""){
                $size_name++;
                $kolichestvo_sovpadenii++;
            }
        }



        // добавляем в запрос условия
        for ($i = 0; $i <= $size_attributes - 1; $i++) {
            if($ot[$i] == "" && $do[$i] == ""){
                $limit = $i + 1;
                if($likes[$i] != 1 && $limit < $size_name){
                    $attributes_name .= "'".$name[$i]."', ";
                    $attributes_value .= "'".$values[$i]."', ";
                }
                else if ($likes[$i] == 1 && $limit < $size_name && $name[$i] != ""){
                    $attributes_name .= "'".$name[$i]."', ";
                    $attributes_like .= " AND prod_att.text LIKE '%".$values[$i]."%' ";
                }
                else if ($likes[$i] == 1 && $limit == $size_name && $name[$i] != ""){
                    $attributes_name .= "'".$name[$i]."'";
                    $attributes_like .= " AND prod_att.text LIKE '%".$values[$i]."%' ";
                }
                else{
                    $attributes_name .= "'".$name[$i]."'";
                    $attributes_value .= "'".$values[$i]."'";
                }
            }
            else{
                $attributes_ot_do .= " OR (att_des.name = '".$name[$i]."'";

                if($ot[$i] != ""){
                    $attributes_ot_do .= " AND prod_att.text > ".$ot[$i];
                }

                if($do[$i] != ""){
                    $attributes_ot_do .= " AND prod_att.text < ".$do[$i];
                }

                $attributes_ot_do .= ")";
            }
        }





        $sql .= " AND (";

        if($attributes_name != ""){
            $sql .= "att_des.name IN (".$attributes_name.")";
        }
        if($attributes_value != ""){
            $sql .= " AND prod_att.text IN (".$attributes_value.")";
        }
        if($attributes_like != ""){
            $sql .= " $attributes_like ";
        }
        if($attributes_ot_do != ""){
            $sql .= " $attributes_ot_do ";
        }

        $sql .= ")";


        //$sql .= "att_des.name IN (".$attributes_name.") AND prod_att.text IN (".$attributes_value.") ".$attributes_like." ".$attributes_ot_do;

        /*AND (att_des.name IN ('Страна', 'Цвет', 'Производитель') AND prod_att.text IN ('Италия', 'Хром', 'Migliore')
         OR (att_des.name = 'Высота излива, (см)' AND prod_att.text > 9)
        )*/

        $sql .= "           GROUP BY prod_att.product_id
                            HAVING COUNT(prod_att.product_id) = $kolichestvo_sovpadenii";

        return $sql;

    }



    // ищу ВСЕ категории из Manufacturer, в которых ЕСТЬ продукты, удовлетворящие данным условиям
    public function categories_first($name_category, $attributes){

        $attribitties_mysql = $this->attributes($attributes);

        $sql = "SELECT category_id, name 
                FROM  `oc_category_description` 
                WHERE  `category_id` IN (
                    SELECT category_id 
                    FROM `oc_product_to_category` 
                    WHERE product_id IN (
                        SELECT prod_att.product_id
                        FROM oc_product_attribute prod_att, oc_attribute att, oc_attribute_group_description att_group_des, oc_attribute_description att_des
                            WHERE att.attribute_group_id = att_group_des.attribute_group_id
                            AND att_group_des.name LIKE '$name_category'
                            AND prod_att.attribute_id = att.attribute_id
                            AND att.attribute_id = att_des.attribute_id
                            $attribitties_mysql
                    ) 
                ) 
                AND `category_id` IN (
                    SELECT oc_category.category_id 
                    FROM  oc_category, oc_category_description
                    WHERE  oc_category.parent_id = oc_category_description.category_id
                    AND oc_category_description.name LIKE '$name_category'
                ) 
                AND name IN (
                    SELECT name FROM oc_manufacturer
                )";

        //echo $sql;

        $stmt = $this->getConnection()->prepare($sql);
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }





    // Нахожу все продукты, удовлетворящим условиям поиска,
    // и для КАЖДОЙ категории
    public function products_in_categories($id_category, $name_category, $attributes){

        $attribitties_mysql = $this->attributes($attributes);

        $sql = "SELECT product_id, category_id
                FROM `oc_product_to_category` 
                WHERE  `category_id` = ".$id_category." 
                AND product_id IN (
                    SELECT prod_att.product_id
                        FROM oc_product_attribute prod_att, oc_attribute att, oc_attribute_group_description att_group_des, oc_attribute_description att_des
                            WHERE att.attribute_group_id = att_group_des.attribute_group_id
                            AND att_group_des.name LIKE '$name_category'
                            AND prod_att.attribute_id = att.attribute_id
                            AND att.attribute_id = att_des.attribute_id
                            $attribitties_mysql
                ) ";

        //echo $sql;

        $stmt = $this->getConnection()->prepare($sql);
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        //var_dump($row);

        if(isset($row)){
            return $row;
        }
    }


















    // ищу ВСЕ категории 2-ГО уровня вложенности После category_id 1-ГО уровня, в которых ЕСТЬ продукты, удовлетворящие данным условиям
    public function categories_second($name_category, $attributes){

        $attribitties_mysql = $this->attributes($attributes);


        $sql = "SELECT t1.category_id, t1.name, cat_1.parent_id
            FROM  oc_category_description t1
            LEFT JOIN oc_product_to_category t2 ON t1.category_id = t2.category_id
            LEFT JOIN oc_category cat_1 ON t1.category_id = cat_1.category_id
            WHERE t2.product_id IN (
                SELECT prod_att.product_id
                FROM oc_product_attribute prod_att, oc_attribute att, oc_attribute_group_description att_group_des, oc_attribute_description att_des
                    WHERE att.attribute_group_id = att_group_des.attribute_group_id
                    AND att_group_des.name LIKE '$name_category'
                    AND prod_att.attribute_id = att.attribute_id
                    AND att.attribute_id = att_des.attribute_id
                    $attribitties_mysql
            )
            AND cat_1.parent_id IN (
                SELECT cat.category_id
				FROM oc_category_description cat_des
				LEFT JOIN oc_category cat ON cat.parent_id = cat_des.category_id
				LEFT JOIN oc_category_description cat_des_2 ON cat.category_id = cat_des_2.category_id
				WHERE cat_des.name LIKE  '$name_category'
				AND cat_des_2.name IN (
					SELECT name FROM oc_manufacturer
				)
				GROUP BY category_id
            )
            
            GROUP BY t1.category_id";


        //echo $sql;

        $stmt = $this->getConnection()->prepare($sql);
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row;
        }
    }








    public function id_category($name_category){
        $stmt = $this->getConnection()->prepare("SELECT category_id FROM  `oc_category_description` WHERE  `name` LIKE  '".$name_category."'");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        return $row[0]["category_id"];
    }






    public function max_category(){
        $stmt = $this->getConnection()->prepare("SELECT MAX(category_id) AS max FROM `oc_category`");
        $stmt->execute();

        foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
            $row[$key] = $value;
        }

        if(isset($row)){
            return $row[0]["max"];
        }
    }











    public function create_dump_categories_first($j, $max_id_new, $id_parent_category, $id_children_category, $children_category, $massiv_category_1_yroven){

        $dump = "";


        $dump .= "INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (".$max_id_new.", '', '".$id_children_category."', '1', '1', '1', '1', '".date("Y-m-d h:i:s")."', '".date("Y-m-d h:i:s")."');\r\n";


        require './files/filter/title.php';


        $stroka = mb_strtolower($massiv_category_1_yroven["name"][$j])." ".mb_strtolower($children_category);
        $title = ucfirst(str_replace("...", $stroka, $title_array[$random]));
        $description_konec = "от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.";




        $dump .= "INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$max_id_new."', '1', '".$massiv_category_1_yroven["name"][$j]."', '', '".$title."', '".$title." ".$description_konec."', '');\r\n";





        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$max_id_new."', '2');\r\n";
        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$id_children_category."', '1');\r\n";
        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$id_parent_category."', '0');\r\n";






        $dump .= "INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$max_id_new."', '0', '11');\r\n";
        $dump .= "INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$max_id_new."', '0');\r\n";






        $translit = new Translit();
        $url_alias = strtolower($translit->english($massiv_category_1_yroven["name"][$j]." ".$children_category));

        $dump .= "INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES ('', 'category_id=".$max_id_new."', '".$url_alias."');\r\n";



        return $dump;
    }










    public function create_dump_products_in_categories_first($j, $massiv_category_product_1_yroven, $new_category, $id_children_category){
        $dump = "";



        $dump .= "INSERT INTO oc_product_to_category  (`product_id`, `category_id`) VALUES ('".$massiv_category_product_1_yroven["product_id"][$j]."', '".$new_category."');\r\n";
        $dump .= "INSERT INTO oc_product_to_category  (`product_id`, `category_id`) VALUES ('".$massiv_category_product_1_yroven["product_id"][$j]."', '".$id_children_category."');\r\n";

        return $dump;
    }

























    public function create_dump_categories_second($j, $max_id_new, $id_parent, $id_parent_category, $id_children_category, $children_category, $massiv_category_1_yroven_new, $massiv_category_2_yroven){
        $dump = "";
        $stroka = "";

        $dump .= "INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (".$max_id_new.", '', '".$id_parent."', '1', '1', '1', '1', '".date("Y-m-d h:i:s")."', '".date("Y-m-d h:i:s")."');\r\n";


        require './files/filter/title.php';


        $stroka = mb_strtolower($massiv_category_2_yroven["name"][$j])." ".mb_strtolower($massiv_category_1_yroven_new["name"][$id_parent])." ".mb_strtolower($children_category);
        $title = ucfirst(str_replace("...", $stroka, $title_array[$random]));
        $description_konec = "от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.";


        $dump .= "INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$max_id_new."', '1', '".$massiv_category_2_yroven["name"][$j]."', '', '".$title."', '".$title." ".$description_konec."', '');\r\n";



        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$max_id_new."', '3');\r\n";
        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$massiv_category_1_yroven_new["category_id"][$id_parent]."', '2');\r\n";
        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$id_children_category."', '1');\r\n";
        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$id_parent_category."', '0');\r\n";




        $dump .= "INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$max_id_new."', '0', '11');\r\n";
        $dump .= "INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$max_id_new."', '0');\r\n";




        $dump .= "INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$max_id_new."', '".$id_parent_category."', '0');\r\n";




        $translit = new Translit();
        $url_alias = strtolower($translit->english($massiv_category_2_yroven["name"][$j]." ".$massiv_category_1_yroven_new["name"][$id_parent]." ".$children_category));

        $dump .= "INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES ('', 'category_id=".$max_id_new."', '".$url_alias."');\r\n";



        return $dump;

    }















    public function create_dump_products_in_categories_second($j, $massiv_category_product_2_yroven, $new_category){
        $dump = "";

        $dump .= "INSERT INTO oc_product_to_category  (`product_id`, `category_id`) VALUES ('".$massiv_category_product_2_yroven["product_id"][$j]."', '".$new_category."');\r\n";

        return $dump;
    }
























    

}
