<?php

Class Controller_Filter Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    static $auth;
    static $authentication;

    public $schet = 1;


    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
    }

    function index() {

    }

    function products() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $this->template->view('index');
        }
    }


    function filter_products() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){


            $name_category = empty($_POST['name_category']) ? '' : $_POST['name_category'];
            $children_category = empty($_POST['children_category']) ? '' : $_POST['children_category'];
            $children_category_description = empty($_POST['children_category_description']) ? '' : $_POST['children_category_description'];
            $attributes    = empty($_POST['attribute']) ? '' : $_POST['attribute'];

            $massiv_category_1_yroven         = array();
            $massiv_category_1_yroven_new     = array();
            $massiv_category_2_yroven         = array();
            $massiv_category_product_1_yroven = array();
            $massiv_category_product_2_yroven = array();



            $filter_model = new Model_Filter();



            //вставляю дочернюю категорию
            $filter_model->insert_children_category($name_category, $children_category, $children_category_description);






            // ищу ВСЕ категории 1-ГО уровня вложенности, в которых ЕСТЬ продукты, удовлетворящие данным условиям
            $category_first = $filter_model->categories_first($name_category, $attributes);

            foreach ($category_first as $value_1) {
                $massiv_category_1_yroven["category_id"][] = $value_1["category_id"];
                $massiv_category_1_yroven["name"][] = $value_1["name"];

                // Нахожу все продукты, удовлетворящим условиям поиска,
                // и для КАЖДОЙ категории, найденной ранее
                $products_in_category_first = $filter_model->products_in_categories($value_1["category_id"], $name_category, $attributes);

                foreach ($products_in_category_first as $value_2) {
                    $massiv_category_product_1_yroven["name"][] = $value_1["name"];
                    $massiv_category_product_1_yroven["product_id"][] = $value_2["product_id"];
                    $massiv_category_product_1_yroven["category_id"][] = $value_2["category_id"];
                }

            }



            //var_dump($massiv_category_product_1_yroven);





            // ищу ВСЕ категории 2-ГО уровня вложенности После category_id 1-ГО уровня, в которых ЕСТЬ продукты, удовлетворящие данным условиям
            $category_second = $filter_model->categories_second($name_category, $attributes);



            foreach ($category_second as $value_1) {
                $massiv_category_2_yroven["category_id"][] = $value_1["category_id"];
                $massiv_category_2_yroven["parent_id"][] = $value_1["parent_id"];
                $massiv_category_2_yroven["name"][] = $value_1["name"];

                // Нахожу все продукты, удовлетворящим условиям поиска,
                // и для КАЖДОЙ категории, найденной ранее
                $products_in_category_second = $filter_model->products_in_categories($value_1["category_id"], $name_category, $attributes);

                foreach ($products_in_category_second as $value_2) {
                    $massiv_category_product_2_yroven["name"][] = $value_1["name"];
                    $massiv_category_product_2_yroven["product_id"][] = $value_2["product_id"];
                    $massiv_category_product_2_yroven["category_id"][] = $value_2["category_id"];
                }

            }





            //echo "<br><br><br><br><br>";


            var_dump($massiv_category_2_yroven);









            $massiv_category_product_1_yroven_new = array();
            $massiv_category_product_2_yroven_new = array();

            $max_id_category = $filter_model->max_category();
            $id_parent_category = $filter_model->id_category($name_category);
            $id_children_category = $filter_model->id_category($children_category);


            //echo $id_children_category;














            // ДАМП КАТЕГОРИЙ 1 УРОВНЯ

            $dump_categories_first = "";

            for ($j=0; $j < sizeof($massiv_category_1_yroven["category_id"]); $j++){

                $max_id_new = $max_id_category + $j + 1;

                // формирую дамп из категорий первого уровня (производители)
                $dump_categories_first .= $filter_model->create_dump_categories_first($j, $max_id_new, $id_parent_category, $id_children_category, $children_category, $massiv_category_1_yroven);


                // сохраняю ДЛЯ ПРОДУКТОВ массив ключ => значение; старая категория => новая категория;
                $old_category = $massiv_category_1_yroven["category_id"][$j];
                $massiv_category_product_1_yroven_new[($old_category)] = $max_id_new;


                // этот массив необходим для связки старых и новых категорий 1-ГО уровня
                $massiv_category_1_yroven_new["name"][($old_category)] = $massiv_category_1_yroven["name"][$j];
                $massiv_category_1_yroven_new["category_id"][($old_category)] = $max_id_new;
            }

            echo $dump_categories_first;






















            // ДАМП ПРОДУКТОВ КАТЕГОРИЙ 1 УРОВНЯ И ДОЧЕРНЕЙ КАТЕГОРИИ ($id_children_category)

            $dump_products_in_categories_first = "";

            for ($j=0; $j < sizeof($massiv_category_product_1_yroven["name"]) - 1; $j++){

                $old_category = $massiv_category_product_1_yroven["category_id"][$j];
                $new_category = $massiv_category_product_1_yroven_new[($old_category)];

                // формирую дамп из продуктов, входящих в категорий первого уровня (производители)
                $dump_products_in_categories_first .= $filter_model->create_dump_products_in_categories_first($j, $massiv_category_product_1_yroven, $new_category, $id_children_category);

            }

            echo $dump_products_in_categories_first;






















            // ДАМП КАТЕГОРИЙ 2 УРОВНЯ

            $dump_categories_second = "";

            for ($j=0; $j < sizeof($massiv_category_2_yroven["category_id"]); $j++){

                $max_id_new = $max_id_category + sizeof($massiv_category_1_yroven["category_id"]) + $j + 1;

                $id_parent = $massiv_category_2_yroven["parent_id"][$j];

                // формирую дамп из категорий первого уровня (производители)
                $dump_categories_second .= $filter_model->create_dump_categories_second($j, $max_id_new, $id_parent, $id_parent_category, $id_children_category, $children_category, $massiv_category_1_yroven_new, $massiv_category_2_yroven);


                // сохраняю ДЛЯ ПРОДУКТОВ массив ключ => значение; старая категория => новая категория;
                $old_category = $massiv_category_2_yroven["category_id"][$j];
                $massiv_category_product_2_yroven_new[($old_category)] = $max_id_new;
            }

            echo $dump_categories_second;




            











            // ДАМП ПРОДУКТОВ КАТЕГОРИЙ 2 УРОВНЯ

            $dump_products_in_categories_second = "";

            for ($j=0; $j < sizeof($massiv_category_product_2_yroven["name"]) - 1; $j++){

                $old_category = $massiv_category_product_2_yroven["category_id"][$j];
                $new_category = $massiv_category_product_2_yroven_new[($old_category)];

                // формирую дамп из продуктов, входящих в категорий первого уровня (производители)
                $dump_products_in_categories_second .= $filter_model->create_dump_products_in_categories_second($j, $massiv_category_product_2_yroven, $new_category);

            }

            echo $dump_products_in_categories_second;






            $dump = $dump_categories_first."\r\n\r\n\r\n".$dump_products_in_categories_first."\r\n\r\n\r\n".$dump_categories_second."\r\n\r\n\r\n".$dump_products_in_categories_second;



            $file = new File();
            $file->load_filter($dump);




            //$decode = json_decode($info);

            
            //echo $decode;


            //$this->schet = 1;
            //echo '{"schet":'.$this->schet.'}';









        }
    }



}