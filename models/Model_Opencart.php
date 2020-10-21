<?php

// модель
Class Model_Opencart{

    static $db;

    public static function getConnection()
    {
        // Устанавливаем соединение
        $dsn = "mysql:host=".DbConf::getDbHost().";dbname=".DbConf::getDbName_OPENCART();
        self::$db = new PDO($dsn, DbConf::getDbUser(), DbConf::getDbPass());
        // Задаем кодировку
        self::$db->exec("set names utf8");
        self::$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        self::$db->setAttribute(PDO::ATTR_PERSISTENT, false);
        return self::$db;
    }



    public function zapis_Manufacturer($proizvodstvo){
        // Проверяю есть такой ПРОИЗВОДИТЕЛЬ $proizvodstvo
        $stmt = $this->getConnection()->prepare("SELECT count(*) FROM `oc_manufacturer` WHERE `name` LIKE '".$proizvodstvo."'");
        $stmt->execute();

        // Если не существует добавляю в базу и узнаю ID производителя
        if($stmt->rowCount() == 0){

            if(DbConf::getDbCms() == "opencart"){
                $stmt = $this->getConnection()->prepare("INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES (NULL, '".$proizvodstvo."', '', '0')")->execute();
                $manufacturer_id = self::$db->lastInsertId("manufacturer_id");
            }
            else if(DbConf::getDbCms() == "ocstore"){
                $stmt = $this->getConnection()->prepare("INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES (NULL, '".$proizvodstvo."', '0')")->execute();
                $manufacturer_id = self::$db->lastInsertId("manufacturer_id");

                $this->getConnection()->prepare("INSERT INTO `oc_manufacturer_description` (`manufacturer_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES ('".$manufacturer_id."', '1', '".$proizvodstvo."', '".$proizvodstvo."', '".$proizvodstvo."', '".$proizvodstvo."', '".$proizvodstvo."', '');")->execute();

            }

            $this->getConnection()->prepare("INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES ('".$manufacturer_id."', '0')")->execute();

            return $manufacturer_id;
        }

        return '';
    }












    // 001 Проверяю есть ли КАТЕГОРИЯ:  $glav_category
    // Если не существует добавляю в базу и узнаю ID производителя

    // таблица oc_category_description
    // category_id 	language_id 	name 	description 	meta_title 	meta_description 	meta_keyword

    // таблица oc_category
    // category_id 	image 	parent_id 	top 	column 	sort_order 	status 	date_added 	date_modified

    // таблица oc_category_path
    // category_id    path_id    level

    // таблица oc_category_to_layout
    // category_id    store_id   layout_id

    // таблица oc_category_to_store
    // category_id    store_id
    public function zapis_Glav_Category($name_category){
        $magazin = new Magazin();

        $stmt = $this->getConnection()->prepare("SELECT category_id, name FROM `oc_category_description` WHERE `name` LIKE '".$name_category."'");
        $stmt->execute();

        if($stmt->rowCount() == 0){
            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (NULL, '', '0', '1', '1', '1', '1', '".date('Y-m-d h:i:s')."', '".date('Y-m-d h:i:s')."')")->execute();
            $category_id = self::$db->lastInsertId("category_id");

            $title_array = array("... купить в интернет-магазине по низкой цене", "Купить ... по доступной цене", "Купить ... - лучшие предложения и цены", "Купить ..., доступная цена товара", "... - купить в интернет-магазине Выбор-Сантехники", "Купить ... - доступные цены в нашем магазине", "... купить, цена на ...", "Купить ... - цены, подбор и расценки");
            $description_konec = "от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.";
            $random = rand(0, sizeof($title_array) - 1);
            $title = str_replace("...", $name_category, $title_array[$random]);

            if(DbConf::getDbCms() == "opencart"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$category_id."', '1', '".$name_category."', '', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }
            else if(DbConf::getDbCms() == "ocstore"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES ('".$category_id."', '1', '".$name_category."', '', '".$title."', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }

            $this->getConnection()->prepare("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$category_id."', '".$category_id."', '0')")->execute();

            $this->getConnection()->prepare("INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$category_id."', '0', '0')")->execute();

            $this->getConnection()->prepare("INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$category_id."', '0')")->execute();


            $query = "category_id=".$category_id;
            $name_category_eng = $magazin->translit($name_category);
            $keyword = $name_category_eng;

            $this->getConnection()->prepare("INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES (NULL, '".$query."', '".$keyword."')")->execute();

            return array("id" => $category_id, "name_eng" => $name_category_eng);
        }
        else{
            foreach ($stmt->fetch(PDO::FETCH_NAMED) as $key => $value) {
                $row[$key] = $value;
            }

            $name_category_eng = $magazin->translit($row["name"]);

            return array("id" => $row["category_id"], "name_eng" => $name_category_eng);
        }
    }











    // 001 Проверяю есть ли КАТЕГОРИЯ:  $name_category
    // Если не существует добавляю в базу и узнаю ID производителя

    // таблица oc_category_description
    // category_id 	language_id 	name 	description 	meta_title 	meta_description 	meta_keyword

    // таблица oc_category
    // category_id 	image 	parent_id 	top 	column 	sort_order 	status 	date_added 	date_modified

    // таблица oc_category_path
    // category_id    path_id    level

    // таблица oc_category_to_layout
    // category_id    store_id   layout_id

    // таблица oc_category_to_store
    // category_id    store_id
    public function zapis_Category($name_category, $glav_category_id){
        $magazin = new Magazin();

        $stmt = $this->getConnection()->prepare("SELECT category_id, name FROM `oc_category_description` WHERE `name` LIKE '".$name_category."'");
        $stmt->execute();

        if($stmt->rowCount() == 0){
            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (NULL, '', '0', '1', '1', '1', '1', '".date('Y-m-d h:i:s')."', '".date('Y-m-d h:i:s')."')")->execute();
            $category_id = self::$db->lastInsertId("category_id");

            $title_array = array("... купить в интернет-магазине по низкой цене", "Купить ... по доступной цене", "Купить ... - лучшие предложения и цены", "Купить ..., доступная цена товара", "... - купить в интернет-магазине Выбор-Сантехники", "Купить ... - доступные цены в нашем магазине", "... купить, цена на ...", "Купить ... - цены, подбор и расценки");
            $description_konec = "от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.";
            $random = rand(0, sizeof($title_array) - 1);
            $title = str_replace("...", $name_category, $title_array[$random]);

            if(DbConf::getDbCms() == "opencart"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$category_id."', '1', '".$name_category."', '', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }
            else if(DbConf::getDbCms() == "ocstore"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES ('".$category_id."', '1', '".$name_category."', '', '".$title."', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }

            if($glav_category_id != ''){
                $this->getConnection()->prepare("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$category_id."', '".$glav_category_id."', '0')")->execute();

                $this->getConnection()->prepare("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$category_id."', '".$category_id."', '1')")->execute();
            }
            else{
                $this->getConnection()->prepare("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$category_id."', '".$category_id."', '0')")->execute();
            }


            $this->getConnection()->prepare("INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$category_id."', '0')")->execute();


            $query = "category_id=".$category_id;
            $name_category_eng = strtolower($magazin->translit($name_category));
            $keyword = $name_category_eng;

            $this->getConnection()->prepare("INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES (NULL, '".$query."', '".$keyword."')")->execute();

            return array("id" => $category_id, "name_eng" => $name_category_eng);
        }
        else{
            foreach ($stmt->fetch(PDO::FETCH_NAMED) as $key => $value) {
                $row[$key] = $value;
            }

            $name_category_eng = strtolower($magazin->translit($row["name"]));

            return array("id" => $row["category_id"], "name_eng" => $name_category_eng);
        }
    }










    public function zapis_Proizvodstvo($proizvodstvo, $category_id, $category_name_eng, $glav_category_id){
        $magazin = new Magazin();

        $stmt = $this->getConnection()->prepare("SELECT category_id, name FROM `oc_category_description` WHERE `name` LIKE '".$proizvodstvo."' AND category_id IN (SELECT category_id FROM `oc_category` WHERE `parent_id` = ".$category_id.")");
        $stmt->execute();

        if($stmt->rowCount() == 0){
            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (NULL, '', '".$category_id."', '1', '1', '1', '1', '".date('Y-m-d h:i:s')."', '".date('Y-m-d h:i:s')."')")->execute();
            $proizvodstvo_id = self::$db->lastInsertId("category_id");


            $title_array = array("... купить в интернет-магазине по низкой цене", "Купить ... по доступной цене", "Купить ... - лучшие предложения и цены", "Купить ..., доступная цена товара", "... - купить в интернет-магазине Выбор-Сантехники", "Купить ... - доступные цены в нашем магазине", "... купить, цена на ...", "Купить ... - цены, подбор и расценки");
            $description_konec = "от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.";
            $random = rand(0, sizeof($title_array) - 1);
            $title = str_replace("...", $proizvodstvo, $title_array[$random]);

            if(DbConf::getDbCms() == "opencart"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$proizvodstvo_id."', '1', '".$proizvodstvo."', '', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }
            else if(DbConf::getDbCms() == "ocstore"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES ('".$proizvodstvo_id."', '1', '".$proizvodstvo."', '', '".$title."', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }

            if($glav_category_id != ''){
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$proizvodstvo_id."', '".$glav_category_id."', '0')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$proizvodstvo_id."', '".$category_id."', '1')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$proizvodstvo_id."', '".$proizvodstvo_id."', '2')");
            }
            else{
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$proizvodstvo_id."', '".$category_id."', '0')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$proizvodstvo_id."', '".$proizvodstvo_id."', '1')");
            }


            $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$proizvodstvo_id."', '0', '0')");
            $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$proizvodstvo_id."', '0')");


            $query = "category_id=".$proizvodstvo_id;
            $proizvodstvo_eng = strtolower($magazin->translit($proizvodstvo));
            $keyword = $category_name_eng."/".$proizvodstvo_eng;

            $this->getConnection()->prepare()->execute("INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES (NULL, '".$query."', '".$keyword."')");

            return array("id" => $category_id, "name_eng" => $proizvodstvo_eng);
        }
        else{
            foreach ($stmt->fetch(PDO::FETCH_NAMED) as $key => $value) {
                $row[$key] = $value;
            }
            $proizvodstvo_eng = strtolower($magazin->translit($row["name"]));

            return array("id" => $row["category_id"], "name_eng" => $proizvodstvo_eng);
        }
    }











    public function zapis_Seria($seria, $category_id, $proizvodstvo_id, $category_name_eng, $proizvodstvo_name_eng, $glav_category_id){
        $magazin = new Magazin();

        $stmt = $this->getConnection()->prepare("SELECT category_id, name FROM `oc_category_description` WHERE `name` LIKE '".$seria."' AND category_id IN (SELECT category_id FROM `oc_category` WHERE `parent_id` = ".$proizvodstvo_id.")");
        $stmt->execute();

        if($stmt->rowCount() == 0){
            $stmt = $this->getConnection()->prepare("INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES (NULL, '', '".$category_id."', '1', '1', '1', '1', '".date('Y-m-d h:i:s')."', '".date('Y-m-d h:i:s')."')")->execute();
            $seria_id = self::$db->lastInsertId("category_id");


            $title_array = array("... купить в интернет-магазине по низкой цене", "Купить ... по доступной цене", "Купить ... - лучшие предложения и цены", "Купить ..., доступная цена товара", "... - купить в интернет-магазине Выбор-Сантехники", "Купить ... - доступные цены в нашем магазине", "... купить, цена на ...", "Купить ... - цены, подбор и расценки");
            $description_konec = "от известных производителей. Высокое качество и гарантии на весь предлагаемый товар. Быстрая доставка в нашем интернет-магазине.";
            $random = rand(0, sizeof($title_array) - 1);
            $title = str_replace("...", $seria, $title_array[$random]);

            if(DbConf::getDbCms() == "opencart"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$seria_id."', '1', '".$seria."', '', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }
            else if(DbConf::getDbCms() == "ocstore"){
                $this->getConnection()->prepare("INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES ('".$seria_id."', '1', '".$seria."', '', '".$title."', '".$title."', '".$title." ".$description_konec."', '')")->execute();
            }

            if($glav_category_id != ''){
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$seria_id."', '".$glav_category_id."', '0')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$seria_id."', '".$category_id."', '1')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$seria_id."', '".$proizvodstvo_id."', '2')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$seria_id."', '".$seria_id."', '3')");
            }
            else{
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$seria_id."', '".$category_id."', '0')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$seria_id."', '".$proizvodstvo_id."', '1')");
                $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$seria_id."', '".$seria_id."', '2')");
            }

            $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$seria_id."', '0', '0')");
            $this->getConnection()->prepare()->execute("INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$seria_id."', '0')");

            $query = "category_id=".$seria_id;
            $seria_eng = strtolower($magazin->translit($seria));
            $keyword = $category_name_eng."/".$proizvodstvo_name_eng."/".$seria_eng;
            $this->getConnection()->prepare()->execute("INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES (NULL, '".$query."', '".$keyword."')");
        }
        else{
            foreach ($stmt->fetch(PDO::FETCH_NAMED) as $key => $value) {
                $row[$key] = $value;
            }
            $seria_eng = strtolower($magazin->translit($row["name"]));

            return array("id" => $row["category_id"], "name_eng" => $seria_eng);
        }
    }








    // Проверяю есть ли ГРУППА атрибутов
    // Если нет добавляю в базу

    // таблица oc_attribute_group_description
    // attribute_group_id 	language_id 	name

    // таблица oc_attribute_group
    // attribute_group_id 	sort_order
    public function zapis_Atribute_Group($attribute_group){
        $magazin = new Magazin();

        $stmt = $this->getConnection()->prepare("SELECT * FROM `oc_attribute_group_description` WHERE `name` LIKE '".$attribute_group."'");
        $stmt->execute();

        if($stmt->rowCount() == 0){
            $this->getConnection()->prepare("INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES (NULL, '0')")->execute();
            $id_attribute_group = self::$db->lastInsertId("category_id");

            $this->getConnection()->prepare()->execute("INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES ('".$id_attribute_group."', '1', '".$attribute_group."')");

            return $id_attribute_group;
        }
        else{
            foreach ($stmt->fetch(PDO::FETCH_NAMED) as $key => $value) {
                $row[$key] = $value;
            }

            return $row["attribute_group_id"];
        }
    }



    public function zapis_Atributes($id_attribute_group, $atributu_parametr, $atributu_value){
        // Проверяю есть ли ВСЕ атрибуты в моей ГРУППе атрибутов
        // если нет записываю
        for ($y=0; $y<=sizeof($atributu_parametr)-1; $y++){
            $stmt = $this->getConnection()->prepare("SELECT * FROM `oc_attribute_description` WHERE `name` LIKE '".$atributu_parametr[$y]."' AND `attribute_id` IN (SELECT `attribute_id` FROM `oc_attribute` WHERE `attribute_group_id` = '".$id_attribute_group."')");
            $stmt->execute();

            if($stmt->rowCount() == 0){
                $this->getConnection()->prepare("INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES (NULL, '".$id_attribute_group."', '0')")->execute();

                $id_attribute = self::$db->lastInsertId("attribute_id");

                $this->getConnection()->prepare("INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES ('".$id_attribute."', '1', '".$atributu_parametr[$y]."')")->execute();
            }
        }



        // Создаю массив многомерный
        // где 1 - $atributu_parametr_chast_1_clear[$y] - параметр атрибута
        // где 2 - (id атрибута в базе OpenCart)
        // где 3 - $atributu_value_chast_1_clear[$y] - значение атрибута
        for ($y=0; $y<=sizeof($atributu_parametr)-1; $y++){
            $stmt = $this->getConnection()->prepare("SELECT * FROM `oc_attribute_description` WHERE `name` LIKE '".$atributu_parametr[$y]."' AND `attribute_id` IN (SELECT `attribute_id` FROM `oc_attribute` WHERE `attribute_group_id` = '".$id_attribute_group."')");
            $stmt->execute();

            foreach ($stmt->fetchAll(PDO::FETCH_NAMED) as $key => $value) {
                $row[$key] = $value;
            }

            $mgomernui_massiv_attribytov[$y][0] = $atributu_parametr[$y];
            $mgomernui_massiv_attribytov[$y][1] = $row[0]["attribute_id"];
            $mgomernui_massiv_attribytov[$y][2] = $atributu_value[$y];

        }

        return $mgomernui_massiv_attribytov;
    }









    public function zapis_Product($name, $model, $manufacturer_id, $cena, $url_img_glav, $dlina, $wirina, $vusota, $array_img_new, $name_img, $catalog_image, $nazvanie_papki_image, $proizvodstvo, $glav_category_id, $category_id, $proizvodstvo_id, $seria_id, $mgomernui_massiv_attribytov, $article){

        $this->getConnection()->prepare("INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES (NULL, '".$model."', '', '', '', '', '', '', '0', 1, 7, '".$url_img_glav."', '".$manufacturer_id."', '1', '".$cena."', 0, 0, '".date('Y-m-d')."', '', 1, '".$dlina.".00000000', '".$wirina.".00000000', '".$vusota.".00000000', 1, 1, 1, 1, 1, 5, '".date('Y-m-d h:i:s')."', '".date('Y-m-d h:i:s')."')")->execute();

        $product_id = self::$db->lastInsertId("product_id");

        for ($y=1; $y<=sizeof($array_img_new)-1; $y++){
            $load_image = new Load_Image();
            $rasshirenie = $load_image->rasshirenie($array_img_new[$y]);

            $catalog_url_image = "'/catalog/".$catalog_image."/";

            if($nazvanie_papki_image != ""){
                $catalog_url_image .= $nazvanie_papki_image."/";
                if($proizvodstvo != ""){
                    $catalog_url_image .= $proizvodstvo."/";
                }
            }

            $this->getConnection()->prepare("INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('', '".$product_id."', '".$catalog_url_image.$name_img."_".$y.$rasshirenie."', '".$y."')")->execute();

        }

        $this->getConnection()->prepare("INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('".$product_id."', '0')")->execute();
        $this->getConnection()->prepare("INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('".$product_id."', 0, 0)")->execute();


        // загружаем продукт в категории
        if(DbConf::getDbCms() == "opencart"){
            if($glav_category_id != ""){
                $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('".$product_id."', '".$glav_category_id."')")->execute();
            }
            $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('".$product_id."', '".$category_id."')")->execute();

            if($proizvodstvo_id != ""){
                $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('".$product_id."', '".$proizvodstvo_id."')")->execute();
            }

            if($seria_id != ""){
                $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('".$product_id."', '".$seria_id."')")->execute();
            }
        }
        else if(DbConf::getDbCms() == "ocstore"){
            if($seria_id != ""){
                $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$seria_id."', '1')")->execute();
                $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$proizvodstvo_id."', '0')")->execute();
                $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$category_id."', '0')")->execute();
                $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$glav_category_id."', '0')")->execute();
            }
            else{
                if($proizvodstvo_id != ""){
                    $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$proizvodstvo_id."', '1')")->execute();
                    $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$category_id."', '0')")->execute();
                    $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$glav_category_id."', '0')")->execute();
                }
                else{
                    $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$category_id."', '1')")->execute();
                    if($glav_category_id != ""){
                        $this->getConnection()->prepare("INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES ('".$product_id."', '".$glav_category_id."', '0')")->execute();
                    }
                }
            }
        }

        


        if(DbConf::getDbCms() == "opencart"){
            $this->getConnection()->prepare("INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('".$product_id."', '1', '".$name."', '', '', '".$name."', '".$name."', '')")->execute();
        }
        else if(DbConf::getDbCms() == "ocstore"){
            $this->getConnection()->prepare("INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES ('".$product_id."', '1', '".$name."', '', '', '".$name."', '".$name."', '".$name."', '')")->execute();
        }


        $query = "product_id=".$product_id;
        $keyword = $name_img;
        $this->getConnection()->prepare("INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES (NULL, '".$query."', '".$keyword."')")->execute();



        


        for ($y=0; $y<=sizeof($mgomernui_massiv_attribytov)-1; $y++){
            $this->getConnection()->prepare("INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES ('".$product_id."', '".$mgomernui_massiv_attribytov[$y][1]."', '1', '".$mgomernui_massiv_attribytov[$y][2]."')")->execute();
        }


    }






}

















