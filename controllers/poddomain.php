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

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            if($name != ""){
                self::$model->add_Poddomain($name);
                self::$contr->index($name);

                $this->index();
            }
            else{
                $this->template->vars('name', $name);
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