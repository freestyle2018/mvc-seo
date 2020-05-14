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
        $article_product_magazin = self::$filter->out('xpath', (empty($_POST['article_product_magazin']) ? '' : $_POST['article_product_magazin']));
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
                    "article_product_magazin" => $article_product_magazin,
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
        $zapusk = self::$filter->out('xpath', (empty($_POST['zapusk']) ? '' : $_POST['zapusk']));
        $zapusk_time = self::$filter->out('date', (empty($_POST['zapusk_time']) ? date("Y-m-d H:i:s") : $_POST['zapusk_time']));

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
                "id_magazin" => $id_magazin,
                "zapusk" => $zapusk,
                "zapusk_time" => $zapusk_time
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
        $zapusk = self::$filter->out('xpath', (empty($_POST['zapusk']) ? '' : $_POST['zapusk']));
        $zapusk_time = self::$filter->out('date', (empty($_POST['zapusk_time']) ? '' : $_POST['zapusk_time']));

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
                "id_magazin" => $id_magazin,
                "zapusk" => $zapusk,
                "zapusk_time" => $zapusk_time
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

    function clone_category()
    {
        $id_category = self::$filter->out('xpath', (empty($_POST['id_category']) ? $_GET['id_category'] : $_POST['id_category']));
        $id_magazin = self::$filter->out('xpath', (empty($_POST['id_magazin']) ? $_GET['id_magazin'] : $_POST['id_magazin']));

        if (self::$authentication["auth"] === true && self::$authentication["status"] == "admin") {

            $category = self::$magazin_model->show_Category($id_category);
            $category["name_category"] = $category["name_category"]." (копия)";


            self::$magazin_model->add_category_in_Magazin($category);
            $this->show_magazin();

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







    function load_category_page()
    {
        $schet = $_POST['schet'];
        $max_schet = $_POST['max_schet'];

        $id_magazin = $_POST['id_magazin'];
        $id_category = $_POST['id_category'];

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $magazin = new Magazin();
            $magazin->load_products($id_magazin, $id_category, $schet, $max_schet);
        }
    }




}
