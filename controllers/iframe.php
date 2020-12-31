<?php

// контролер
Class Controller_Iframe Extends Controller_Base {
    // шаблон
    public $layouts = "iframe";

    // экшен
    function index() {

        $url = empty($_GET['url']) ? '' : $_GET['url'];
        $domain = empty($_GET['domain']) ? '' : $_GET['domain'];

        $this->template->vars('url', $url);
        $this->template->vars('domain', $domain);
        $this->template->view('index');
    }
}