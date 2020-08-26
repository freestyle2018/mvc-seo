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

    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();
        self::$contr = new Domain();
        self::$filter = new Filter();
        self::$model = new Model_Poddomain();

        $status = self::$authentication["status"];

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', $status);
    }

    // экшен
    function index() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $info = self::$model->show_Poddomains();
            $this->template->vars('projects', $info);
        }

        $this->template->view('index');
    }


    function add() {

        $name = self::$filter->out('string',(empty($_POST['name']) ? '' : $_POST['name']));
        $name_url = self::$filter->out('string',(empty($_POST['name_url']) ? '' : $_POST['name_url']));
        $name_rus = self::$filter->out('string',(empty($_POST['name_rus']) ? '' : $_POST['name_rus']));
        $indikator = self::$filter->out('int',(empty($_POST['indikator']) ? '0' : $_POST['indikator']));

        //echo "indikator = ".$indikator."<br>\r\n";

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            if($name != ""){

                self::$model->add_Poddomain($name, $name_url, $name_rus, $indikator);

                if($indikator == 1) {
                    self::$contr->index($name, $name_url, $name_rus);
                    exit();
                }
                else {
                    $this->index();
                    //exit();
                }
            }
            else{
                $this->template->vars('name', $name);
                $this->template->vars('name_url', $name_url);
                $this->template->vars('name_rus', $name_rus);
                $this->template->vars('indikator', $indikator);
                $this->template->view('add');
            }
        }
    }





    function delete() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $id = self::$filter->out('int',(empty($_GET['id']) ? '' : $_GET['id']));
            self::$model->delete_Poddomain($id);

            $this->index();
        }
    }




}