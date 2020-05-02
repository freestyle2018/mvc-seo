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




}
