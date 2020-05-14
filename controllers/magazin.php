<?php



// контролер
Class Controller_Magazin Extends Controller_Base
{
    // шаблон
    public $layouts = "first_layouts";

    static $auth;
    static $authentication;
    static $magazin_model;
    static $model_opencart;
    static $filter;
    static $status;
    static $doc_category;
    static $doc_product;

    function __construct()
    {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();
        self::$filter = new Filter();
        self::$magazin_model = new Model_Magazin();

        self::$doc_category = new DOMDocument();
        self::$doc_category->preserveWhiteSpace = true;
        self::$doc_category->formatOutput = false;

        self::$doc_product = new DOMDocument();
        self::$doc_product->preserveWhiteSpace = true;
        self::$doc_product->formatOutput = false;

        $status = self::$authentication["status"];

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', $status);
    }

    // экшен
    function index()
    {
        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {
            $magazins = self::$magazin_model->show_Magazins();
            $this->template->vars('magazins', $magazins);

            $this->template->view('index');
        }
    }

    function edit_magazin()
    {
        $id_magazin = self::$filter->out('int', (empty($_POST['id_magazin']) ? $_GET['id_magazin'] : $_POST['id_magazin']));
        $domain_magazin = self::$filter->out('xpath', (empty($_POST['domain_magazin']) ? '' : $_POST['domain_magazin']));
        $url_skachivania_1_magazin = self::$filter->out('xpath', (empty($_POST['url_skachivania_1_magazin']) ? '' : $_POST['url_skachivania_1_magazin']));
        $url_skachivania_2_magazin = self::$filter->out('xpath', (empty($_POST['url_skachivania_2_magazin']) ? '' : $_POST['url_skachivania_2_magazin']));
        $name_product_magazin = self::$filter->out('xpath', (empty($_POST['name_product_magazin']) ? '' : $_POST['name_product_magazin']));
        $cena_product_magazin = self::$filter->out('xpath', (empty($_POST['cena_product_magazin']) ? '' : $_POST['cena_product_magazin']));
        $url_image_product_magazin = self::$filter->out('xpath', (empty($_POST['url_image_product_magazin']) ? '' : $_POST['url_image_product_magazin']));
        $atribute_key_product_magazin = self::$filter->out('xpath', (empty($_POST['atribute_key_product_magazin']) ? '' : $_POST['atribute_key_product_magazin']));
        $atribute_value_product_magazin = self::$filter->out('xpath', (empty($_POST['atribute_value_product_magazin']) ? '' : $_POST['atribute_value_product_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {
            if ($domain_magazin != "") {
                $magazin_info = array(
                    "id_magazin" => $id_magazin,
                    "domain_magazin" => $domain_magazin,
                    "url_skachivania_1_magazin" => $url_skachivania_1_magazin,
                    "url_skachivania_2_magazin" => $url_skachivania_2_magazin,
                    "name_product_magazin" => $name_product_magazin,
                    "cena_product_magazin" => $cena_product_magazin,
                    "url_image_product_magazin" => $url_image_product_magazin,
                    "atribute_key_product_magazin" => $atribute_key_product_magazin,
                    "atribute_value_product_magazin" => $atribute_value_product_magazin
                );

                self::$magazin_model->update_Magazin($magazin_info);

                $this->index();
            } else {
                $magazin = self::$magazin_model->show_Magazin($id_magazin);
                $this->template->vars('magazin', $magazin);
                $this->template->view('edit_magazin');
            }
        }
    }


    function delete_magazin()
    {
        $id_magazin = self::$filter->out('int', (empty($_GET['id_magazin']) ? '' : $_GET['id_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {
            self::$magazin_model->delete_Magazin($id_magazin);

            $this->index();
        }
    }

    function add_magazin()
    {
        $domain_magazin = self::$filter->out('xpath', (empty($_POST['domain_magazin']) ? '' : $_POST['domain_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {

            if ($domain_magazin != "") {
                self::$magazin_model->add_Magazin($domain_magazin);
                $this->index();
            } else {
                $this->template->vars('domain_magazin', $domain_magazin);
                $this->template->view('add_magazin');
            }


        }
    }


    function show_magazin()
    {
        $id_magazin = self::$filter->out('int', (empty($_GET['id_magazin']) ? '' : $_GET['id_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {
            $magazin = self::$magazin_model->show_Magazin($id_magazin);
            $categories = self::$magazin_model->show_categories_in_Magazin($id_magazin);

            $this->template->vars('magazin', $magazin);
            $this->template->vars('categories', $categories);

            $this->template->view('show_magazin');
        }
    }


    function add_category()
    {
        $glav_category = self::$filter->out('xpath', (empty($_POST['glav_category']) ? '' : $_POST['glav_category']));
        $name_category = self::$filter->out('xpath', (empty($_POST['name_category']) ? '' : $_POST['name_category']));
        $url_category = self::$filter->out('xpath', (empty($_POST['url_category']) ? '' : $_POST['url_category']));
        $nazvanie_papki_category = self::$filter->out('xpath', (empty($_POST['nazvanie_papki_category']) ? '' : $_POST['nazvanie_papki_category']));
        $attribute_group_category = self::$filter->out('xpath', (empty($_POST['attribute_group_category']) ? '' : $_POST['attribute_group_category']));
        $catalog_category = self::$filter->out('xpath', (empty($_POST['catalog_category']) ? '' : $_POST['catalog_category']));
        $schet_category = self::$filter->out('xpath', (empty($_POST['schet_category']) ? '1' : $_POST['schet_category']));
        $schet_max_category = self::$filter->out('xpath', (empty($_POST['schet_max_category']) ? '1' : $_POST['schet_max_category']));
        $id_magazin = self::$filter->out('xpath', (empty($_POST['id_magazin']) ? $_GET['id_magazin'] : $_POST['id_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {

            $category = array(
                "glav_category" => $glav_category,
                "name_category" => $name_category,
                "attribute_group_category" => $attribute_group_category,
                "url_category" => $url_category,
                "nazvanie_papki_category" => $nazvanie_papki_category,
                "catalog_category" => $catalog_category,
                "schet_category" => $schet_category,
                "schet_max_category" => $schet_max_category,
                "id_magazin" => $id_magazin
            );

            if ($name_category != "") {
                self::$magazin_model->add_category_in_Magazin($category);
                $this->show_magazin();
            } else {
                $magazin = self::$magazin_model->show_Magazin($id_magazin);

                $this->template->vars('magazin', $magazin);
                $this->template->vars('category', $category);
                $this->template->view('add_category');
            }
        }
    }


    function delete_category()
    {
        $id_magazin = self::$filter->out('xpath', (empty($_POST['id_magazin']) ? $_GET['id_magazin'] : $_POST['id_magazin']));
        $id_category = self::$filter->out('xpath', (empty($_POST['id_category']) ? $_GET['id_category'] : $_POST['id_category']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {
            self::$magazin_model->delete_category($id_category);
            $this->show_magazin();
        }
    }


    function edit_category()
    {
        $id_category = self::$filter->out('xpath', (empty($_POST['id_category']) ? $_GET['id_category'] : $_POST['id_category']));
        $glav_category = self::$filter->out('xpath', (empty($_POST['glav_category']) ? '' : $_POST['glav_category']));
        $name_category = self::$filter->out('xpath', (empty($_POST['name_category']) ? '' : $_POST['name_category']));
        $attribute_group_category = self::$filter->out('xpath', (empty($_POST['attribute_group_category']) ? '' : $_POST['attribute_group_category']));
        $url_category = self::$filter->out('xpath', (empty($_POST['url_category']) ? '' : $_POST['url_category']));
        $nazvanie_papki_category = self::$filter->out('xpath', (empty($_POST['nazvanie_papki_category']) ? '' : $_POST['nazvanie_papki_category']));
        $catalog_category = self::$filter->out('xpath', (empty($_POST['catalog_category']) ? '' : $_POST['catalog_category']));
        $schet_category = self::$filter->out('xpath', (empty($_POST['schet_category']) ? '1' : $_POST['schet_category']));
        $schet_max_category = self::$filter->out('xpath', (empty($_POST['schet_max_category']) ? '1' : $_POST['schet_max_category']));
        $id_magazin = self::$filter->out('xpath', (empty($_POST['id_magazin']) ? $_GET['id_magazin'] : $_POST['id_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {

            $category = array(
                "id_category" => $id_category,
                "glav_category" => $glav_category,
                "name_category" => $name_category,
                "attribute_group_category" => $attribute_group_category,
                "url_category" => $url_category,
                "nazvanie_papki_category" => $nazvanie_papki_category,
                "catalog_category" => $catalog_category,
                "schet_category" => $schet_category,
                "schet_max_category" => $schet_max_category,
                "id_magazin" => $id_magazin
            );

            if ($name_category != "") {
                self::$magazin_model->update_Category($category);
                $this->show_magazin();
            } else {
                $magazin = self::$magazin_model->show_Magazin($id_magazin);
                $category = self::$magazin_model->show_Category($id_category);

                $this->template->vars('magazin', $magazin);
                $this->template->vars('category', $category);
                $this->template->view('edit_category');
            }
        }
    }


    function load_category()
    {
        $id_category = self::$filter->out('xpath', (empty($_POST['id_category']) ? $_GET['id_category'] : $_POST['id_category']));

        $id_magazin = self::$filter->out('xpath', (empty($_POST['id_magazin']) ? $_GET['id_magazin'] : $_POST['id_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {
            $magazin = self::$magazin_model->show_Magazin($id_magazin);
            $category = self::$magazin_model->show_Category($id_category);

            $this->template->vars('magazin', $magazin);
            $this->template->vars('category', $category);
            $this->template->view('load_category');
        }
    }





    function xpath_zapros($query, $parametr = null)
    {
        $xpath_category = new DOMXpath(self::$doc_product);
        $info = $xpath_category->query($query);

        foreach ($info as $element) {
            if ($parametr == 'array') {
                $text[] = $element->textContent;
            } elseif ($parametr == null) {
                $text = $element->textContent;
            }
        }

        return $text;
    }

    function parametru_atribute($key, $value)
    {
        $array = array();

        for ($y=0; $y<=sizeof($key)-1; $y++){
            if($key[$y] == "Производительность, м3/ч" || $key[$y] == "Производитель" || $key[$y] == "Производство"){
                $array["proizvodstvo"] = $value[$y];
            }
            else if($key[$y] == "Серия"){
                $array["seria"] = $value[$y];
            }
            else if($key[$y] == "Модель"){
                $array["model"] = $value[$y];
            }
            else if($key[$y] == "Страна"){
                $array["strana"] = $value[$y];
            }
            else if($key[$y] == "Длина (см)"){
                $array["dlina"] = $value[$y];
            }
            else if($key[$y] == "Ширина (см)" || $key[$y] == "Глубина (см)"){
                $array["wirina"] = $value[$y];
            }
            else if($key[$y] == "Высота с опорой (см)" || $key[$y] == "Высота (см)"){
                $array["vusota"] = $value[$y];
            }
        }

        return $array;
    }

    function load_category_page()
    {

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $schet = $_POST['schet'];
            $max_schet = $_POST['max_schet'];

            $id_magazin = $_POST['id_magazin'];
            $id_category = $_POST['id_category'];

            $magazin = self::$magazin_model->show_Magazin($id_magazin);
            $category = self::$magazin_model->show_Category($id_category);

            $url_category = $category['url_category'];
            $glav_category = $category['glav_category'];
            $name_category = $category['name_category'];
            $catalog_category = $category['catalog_category'];
            $nazvanie_papki_category = $category['nazvanie_papki_category'];
            $attribute_group_category = $category['attribute_group_category'];

            $domain_magazin = $magazin['domain_magazin'];
            $url_skachivania_1_magazin = htmlspecialchars_decode($magazin['url_skachivania_1_magazin']);
            $name_product_magazin = htmlspecialchars_decode($magazin['name_product_magazin']);
            $url_image_product_magazin = htmlspecialchars_decode($magazin['url_image_product_magazin']);
            $cena_product_magazin = htmlspecialchars_decode($magazin['cena_product_magazin']);
            $atribute_key_product_magazin = htmlspecialchars_decode($magazin['atribute_key_product_magazin']);
            $atribute_value_product_magazin = htmlspecialchars_decode($magazin['atribute_value_product_magazin']);

            if($schet > $max_schet){
                echo "Задание выполнено!";
                exit();
            }

            // Получаем список urls на продукты в категории
            @self::$doc_category->loadHTMLFile($domain_magazin.$url_category.$schet);
            $xpath_category = new DOMXpath(self::$doc_category);
            $urls_product = $xpath_category->query($url_skachivania_1_magazin);

            if (isset($urls_product)) {
                foreach ($urls_product as $element) {
                    $urls_product_array[] = $element->textContent;
                }
            }



            // Перебираем продукты по одному
            for ($j=0; $j<=sizeof($urls_product_array)-1; $j++){
            //for ($j=0; $j<=0; $j++){

                //sleep(SLEEP_TIME); // задержка между запросами


                // делаю парсинг конкретного продукта
                @self::$doc_product->loadHTMLFile($domain_magazin.$urls_product_array[$j]);






                /////// получаю информацию о продукте - НАЧАЛО
                $name = $this->xpath_zapros($name_product_magazin);
                $magazin = new Magazin();

                $name_img = strtolower(substr($magazin->translit($name), 0, 90));
                if($cena_product_magazin != ""){
                    $cena = $this->xpath_zapros($cena_product_magazin);
                }
                $array_img_new = $this->xpath_zapros($url_image_product_magazin, 'array');
                // работаю с атрибутами продукта
                $atributu_parametr_chast_1_clear = $this->xpath_zapros($atribute_key_product_magazin, 'array');
                $atributu_value_chast_1_clear = $this->xpath_zapros($atribute_value_product_magazin, 'array');
                $atributu_parametr = $this->parametru_atribute($atributu_parametr_chast_1_clear, $atributu_value_chast_1_clear);
                /////// получаю информацию о продукте - КОНЕЦ







                self::$model_opencart = new Model_Opencart();


                // 001 Проверяю есть ли ГЛАВНАЯ КАТЕГОРИЯ:  $glav_category
                // Если не существует добавляю в базу и узнаю ID категории
                if($glav_category != ""){
                    $glav_category_info = self::$model_opencart->zapis_Glav_Category($glav_category);
                }
                $glav_category_id = isset($glav_category_info["id"]) ? $glav_category_info["id"] : '';







                // 001 Проверяю есть ли КАТЕГОРИЯ:  $name_category
                // Если не существует добавляю в базу и узнаю ID категории
                $category = self::$model_opencart->zapis_Category($name_category, $glav_category_id);






                // Проверяю есть такая категория ПРОИЗВОДИТЕЛЬ
                if(isset($atributu_parametr["proizvodstvo"])){
                    // Если не существует ПРОИЗВОДИТЕЛЯ добавляю в базу и узнаю ID производителя
                    $manufacturer_id = self::$model_opencart->zapis_Manufacturer($atributu_parametr["proizvodstvo"]);

                    // Проверяю существует категория ПРОИЗВОДИТЕЛЬ
                    // если нет, добавляю.
                    $category_proizvodstvo = self::$model_opencart->zapis_Proizvodstvo($atributu_parametr["proizvodstvo"], $category["id"], $category["name_eng"], $glav_category_id);
                }






                // Проверяю есть такая категория СЕРИЯ
                if(isset($atributu_parametr["seria"])){
                    // Проверяю существует категория СЕРИЯ
                    // если нет, добавляю.
                    $category_seria = self::$model_opencart->zapis_Seria($atributu_parametr["seria"], $category["id"], $category_proizvodstvo["id"], $category["name_eng"], $category_proizvodstvo["name_eng"], $glav_category_id);
                }






                // Загружаем изображения на сайт
                $load_image = new Load_Image();
                $proizvodstvo = isset($atributu_parametr["proizvodstvo"])  ? $atributu_parametr["proizvodstvo"] : '';
                $url_img_glav = $load_image->index($domain_magazin, $catalog_category, $nazvanie_papki_category, $proizvodstvo, $array_img_new, $name_img);














                // добавляем атрибуты в базу данных
                $id_attribute_group = self::$model_opencart->zapis_Atribute_Group($attribute_group_category);
                $mgomernui_massiv_attribytov = self::$model_opencart->zapis_Atributes($id_attribute_group, $atributu_parametr_chast_1_clear, $atributu_value_chast_1_clear);








                // запись в базу непосредственно ПРОДУКТа
                $model = isset($atributu_parametr["model"])  ? $atributu_parametr["model"] : '';
                $manufacturer_id = isset($manufacturer_id) ? $manufacturer_id : '';
                $cena = isset($cena_product_magazin) ? $cena_product_magazin : '';
                $dlina = isset($atributu_parametr["dlina"])  ? $atributu_parametr["dlina"] : '';
                $wirina = isset($atributu_parametr["model"])  ? $atributu_parametr["wirina"] : '';
                $vusota = isset($atributu_parametr["model"])  ? $atributu_parametr["vusota"] : '';

                $category_id = isset($category["id"]) ? $category["id"] : '';
                $proizvodstvo_id = isset($category_proizvodstvo["id"]) ? $category_proizvodstvo["id"] : '';
                $seria_id = isset($category_seria["id"]) ? $category_seria["id"] : '';

                self::$model_opencart->zapis_Product($name, $model, $manufacturer_id, $cena, $url_img_glav, $dlina, $wirina, $vusota, $array_img_new, $name_img, $catalog_category, $nazvanie_papki_category, $proizvodstvo, $glav_category_id, $category_id, $proizvodstvo_id, $seria_id, $mgomernui_massiv_attribytov);





            }
            $schet += 1;

            $category = self::$magazin_model->show_Category($id_category);
            $category["schet_category"] = $schet;
            self::$magazin_model->update_Category($category);


            //header("Content-type: application/json; charset=utf-8");
            echo '{"schet":'.$schet.'}';

        }


    }

    function test()
    {
        self::$model_opencart = new Model_Opencart();
        $array = self::$model_opencart->zapis_Category('Тельферы (тали) 1 тонна');

        print_r($array);
    }

}
