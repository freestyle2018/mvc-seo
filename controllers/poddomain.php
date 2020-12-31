<?php

// контролер
Class Controller_Poddomain Extends Controller_Base {

    // шаблон
    public $layouts = "first_layouts";

    static $auth;
    static $authentication;
    static $contr;
    static $model;
    static $filter;
    static $status;

    public $message;

    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();
        self::$contr = new Domain();
        self::$filter = new Filter();
        self::$model = new Model_Poddomain();

        $status = self::$authentication["status"];

        $this->template = new Template($this->layouts, get_class($this));


        //$this->message = '';

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', $status);
    }



    // экшен
    function index() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $page = self::$filter->out('int',(empty($_GET['page']) ? '1' : $_GET['page']));
            $sort_get = self::$filter->out('string',(empty($_GET['sort']) ? '' : $_GET['sort']));
            $sum = self::$filter->out('int',(empty($_GET['sum']) ? self::$model::SHOW_BY_DEFAULT : $_GET['sum']));

            $sort = new Sort();
            $sortirovka = $sort->get($sort_get);

            $info = self::$model->get_Poddomains_Limit($page, $sortirovka[2], $sum);

            $row = self::$model->count_Poddomain();
            $total = $row["0"]["count"];


            $pagination = new Pagination($total, $page, $sum, '');

            $this->template->vars('projects', $info);
            $this->template->vars('sum', $sum);
            $this->template->vars('page', $page);
            $this->template->vars('total', $total);
            $this->template->vars('sortirovka', $sortirovka);
            $this->template->vars('pagination', $pagination->get($sortirovka, $sum));
            $this->template->vars('message', $this->message);
        }

        $this->template->view('index');
    }

    function show() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $id = self::$filter->out('int',(empty($_GET['id']) ? $_POST['id'] : $_GET['id']));

            if(isset($_POST)){
                self::$model->update_Poddomain($_POST);
            }

            $domain = self::$model->show_Poddomain($id);

            $this->template->vars('domain', $domain[0]);
        }

        $this->template->view('show');
    }



    function test() {
        /*$name = "angarsk";

        $google = new Api_Google();
        $google->index($name);

        $name = "http://angarsk.ru";

        $google = new Sape();
        echo $google->name_url($name);*/


        $yandex_xml = new Yandex_Xml();
        $otvet = $yandex_xml->proverka_index("afterblowlob.bessti.ru");


        var_dump($otvet);
        //var_dump($otvet->response->grouping->group->doccount);
        //var_dump($otvet["response"]["grouping"]["group"]["doccount"]);

        echo $otvet;


    }

    function add() {

        $name = self::$filter->out('string',(empty($_POST['name']) ? '' : $_POST['name']));
        $name_url = self::$filter->out('string',(empty($_POST['name_url']) ? '' : $_POST['name_url']));
        $name_rus = self::$filter->out('string',(empty($_POST['name_rus']) ? '' : $_POST['name_rus']));
        $indikator = self::$filter->out('int',(empty($_POST['indikator']) ? '0' : $_POST['indikator']));
        $ssl = self::$filter->out('string',(empty($_POST['ssl']) ? null : $_POST['ssl']));

        //echo "indikator = ".$indikator."<br>\r\n";


        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            if($name != ""){

                self::$model->add_Poddomain($name, $name_url, $name_rus, $indikator);

                if($indikator == 1) {
                    self::$contr->index($name, $name_url, $name_rus, $ssl);
                    sleep(30);
                    $api = new Api_Webmaster();
                    $api->add_site_in_webmaster($name);
                }

                /*$this->layouts = "poddomain";
                $this->template = new Template($this->layouts, get_class($this));
                $this->template->vars('response', 'yes');
                $this->template->view('response');*/

            }
            else{
                $this->template->vars('name', $name);
                $this->template->vars('name_url', $name_url);
                $this->template->vars('name_rus', $name_rus);
                $this->template->vars('indikator', $indikator);
                $this->template->vars('ssl', $ssl);
            }
        }
        if($name == ""){
            $this->template->view('add');
        }

    }




    function operation() {

        $ids_poddomain = empty($_POST['ids_poddomain']) ? array() : $_POST['ids_poddomain'];
        $operation = empty($_POST['operation']) ? '' : $_POST['operation'];

        //var_dump($ids_poddomain);

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){




                $x = 0;
                foreach ($ids_poddomain as $key => $value) {

                    //echo "value = ".$value."<br>\r\n";

                    $info_poddomain[$x] = self::$model->show_Poddomain($value);

                    $id = $info_poddomain[$x][0]["id"];
                    $name = $info_poddomain[$x][0]["name"];
                    $address = $info_poddomain[$x][0]["adress"];
                    $paspisanie = $info_poddomain[$x][0]["paspisanie"];

                    if($operation == "ssl"){
                        self::$contr->installation_ssl_certificate($name, "yes");
                        sleep(30);
                        self::$contr->replace_config($name, "yes", 2);
                        self::$contr->open_basedir($name, "yes", 2);

                        $info_poddomain[$x][0]["ssl_indikator"] = 1;
                        self::$model->update_Poddomain($info_poddomain[$x][0]);
                    }
                    else if($operation == "http"){
                        self::$contr->replace_config($name, "no", 2);

                        $info_poddomain[$x][0]["ssl_indikator"] = 0;
                        self::$model->update_Poddomain($info_poddomain[$x][0]);
                    }
                    else if($operation == "address"){
                        self::$contr->posted_adress($name, $address, $paspisanie);
                        $info_poddomain[$x][0]["posted_address"] = 1;
                        self::$model->update_Poddomain($info_poddomain[$x][0]);
                    }
                    else if($operation == "add_webmaster"){
                        $api = new Api_Webmaster();
                        $api->add_site_in_webmaster($name);
                    }
                    else if($operation == "clear"){
                        self::$contr->delete_domain($name);
                        self::$contr->delete_database($name);

                        $info_poddomain[$x][0]["posted_address"] = 0;
                        $info_poddomain[$x][0]["indikator"] = 0;
                        $info_poddomain[$x][0]["ssl_indikator"] = 0;

                        self::$model->update_Poddomain($info_poddomain[$x][0]);
                    }
                    else if($operation == "delete"){
                        self::$contr->delete_domain($name);
                        //self::$contr->delete_database($name);
                        //sleep(20);


                        self::$model->delete_Poddomain($id);
                    }



                    //sleep(1);
                    $x++;
                }


                //self::$contr->exit_connect();


                //$this->layouts = "poddomain";
                //$this->template = new Template($this->layouts, get_class($this));
                //$this->template->vars('response', 'yes');

        }

        //$this->template->view('response');
    }




    function adress_cdek() {

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $first = empty($_POST['first']) ? '' : $_POST['first'];
            $last = empty($_POST['last']) ? '' : $_POST['last'];

            $cdek = new Model_Cdek();

            

            if($first != ""){

                $info_poddomain = self::$model->show_Poddomains();

                $x = $first - 1;
                while ($x <= $last - 1){
                    $name = $info_poddomain[$x]["name"];

                    $info = $cdek->find_cdek_adress($name);
                    $nomer_adress = rand(0, sizeof($info)-1);

                    //print_r($info);

                    if($info[$nomer_adress]["adress"] != ""){
                        $adress = $info[$nomer_adress]["city"].", ".$info[$nomer_adress]["adress"];
                        $paspisanie = $info[$nomer_adress]["paspisanie"];
                    }
                    else {
                        $adress = " ";
                    }


                    $info_poddomain[$x]["adress"] = $adress;
                    $info_poddomain[$x]["paspisanie"] = $paspisanie;

                    self::$model->update_Poddomain($info_poddomain[$x]);

                    $x++;
                }
            }
        }

        $this->template->view('adress-cdek');
    }



    function adress_pochta() {

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $first = empty($_POST['first']) ? '' : $_POST['first'];
            $last = empty($_POST['last']) ? '' : $_POST['last'];

            $pochta = new Model_Pochta();



            if($first != ""){

                $info_poddomain = self::$model->show_Poddomains();

                $x = $first - 1;
                while ($x <= $last - 1){
                    $gorod = $info_poddomain[$x]["gorod"];

                    if($info_poddomain[$x]["adress"] == " "){
                        $info = $pochta->find_pochta_adress($gorod);
                        $nomer_adress = rand(0, sizeof($info)-1);

                        $adress = $info[$nomer_adress]["adress"];
                        $paspisanie = "Пн-Пт 10:00-19:00<br> Сб 10:00-16:00";

                        if($adress != ""){
                            $info_poddomain[$x]["adress"] = $adress;
                            $info_poddomain[$x]["paspisanie"] = $paspisanie;

                            self::$model->update_Poddomain($info_poddomain[$x]);
                        }


                    }

                    $x++;
                }
            }
        }
        $this->template->view('adress-pochta');
    }




    function delete() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $id = self::$filter->out('int',(empty($_GET['id']) ? '' : $_GET['id']));
            self::$model->delete_Poddomain($id);

            $this->index();
        }
    }




}