<?php



// контролер
Class Controller_Cron Extends Controller_Base {
    // шаблон
    public $layouts = "auth";

    // экшен
    function index()
    {
        $cron = new Cron();
        $info = $cron->start();

        $this->template->vars('info', $info);
        $this->template->view('index');
    }

}
