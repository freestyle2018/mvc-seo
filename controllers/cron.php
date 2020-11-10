<?php



// контролер
Class Controller_Cron Extends Controller_Base {
    // шаблон
    public $layouts = "auth";



    function api()
    {
        $cron = new Cron();
        $info = $cron->api();

        $this->template->vars('info', $info);
        $this->template->view('index');
    }



    // экшен
    function index()
    {
        $cron = new Cron();
        $info = $cron->start();

        $this->template->vars('info', $info);
        $this->template->view('index');
    }

    function proverka()
    {
        $cron = new Cron();
        $info = $cron->end();

        $this->template->vars('info', $info);
        $this->template->view('index');
    }

    function load_product()
    {
        $cron = new Cron();
        $info = $cron->load_product();

        $this->template->vars('info', $info);
        $this->template->view('index');
    }


    function create_poddomain()
    {
        $filter = new Filter();
        $https = $filter->out('string',(empty($_GET['https']) ? null : $_GET['https']));

        $cron = new Cron();
        $cron->create_poddomain($https);
        $info = "";

        $this->template->vars('info', $info);
        $this->template->view('index');
    }

    function https_and_ssl()
    {
        $cron = new Cron();
        $cron->https_and_ssl();
        $info = "";

        $this->template->vars('info', $info);
        $this->template->view('index');
    }

}
