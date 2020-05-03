<?php



// контролер
Class Controller_Magazin Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    static $auth;
    static $authentication;
    static $magazin_model;
    static $filter;
    static $status;

    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();
        self::$filter = new Filter();
        self::$magazin_model = new Model_Magazin();

        $status = self::$authentication["status"];

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', $status);
    }

    // экшен
    function index()
    {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $magazins = self::$magazin_model->show_Magazins();
            $this->template->vars('magazins', $magazins);

            $this->template->view('index');
        }
    }

    function edit_magazin()
    {
        $id_magazin = self::$filter->out('int',(empty($_POST['id_magazin']) ? $_GET['id_magazin'] : $_POST['id_magazin']));
        $domain_magazin = self::$filter->out('xpath',(empty($_POST['domain_magazin']) ? '' : $_POST['domain_magazin']));
        $url_skachivania_1_magazin = self::$filter->out('xpath',(empty($_POST['url_skachivania_1_magazin']) ? '' : $_POST['url_skachivania_1_magazin']));
        $url_skachivania_2_magazin = self::$filter->out('xpath',(empty($_POST['url_skachivania_2_magazin']) ? '' : $_POST['url_skachivania_2_magazin']));
        $name_product_magazin = self::$filter->out('xpath',(empty($_POST['name_product_magazin']) ? '' : $_POST['name_product_magazin']));
        $cena_product_magazin = self::$filter->out('xpath',(empty($_POST['cena_product_magazin']) ? '' : $_POST['cena_product_magazin']));
        $url_image_product_magazin = self::$filter->out('xpath',(empty($_POST['url_image_product_magazin']) ? '' : $_POST['url_image_product_magazin']));
        $atribute_key_product_magazin = self::$filter->out('xpath',(empty($_POST['atribute_key_product_magazin']) ? '' : $_POST['atribute_key_product_magazin']));
        $atribute_value_product_magazin = self::$filter->out('xpath',(empty($_POST['atribute_value_product_magazin']) ? '' : $_POST['atribute_value_product_magazin']));

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            if($domain_magazin != ""){
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
            }
            else{
                $magazin = self::$magazin_model->show_Magazin($id_magazin);
                $this->template->vars('magazin', $magazin);
                $this->template->view('edit_magazin');
            }
        }
    }


    function delete_magazin()
    {
        $id_magazin = self::$filter->out('int',(empty($_GET['id_magazin']) ? '' : $_GET['id_magazin']));

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $magazins = self::$magazin_model->delete_Magazin($id_magazin);

            $this->template->view('index');
        }
    }


}
