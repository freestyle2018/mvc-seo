<?php

// контролер
Class Controller_Index Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    // экшен
    function index() {

        $auth = new Authentication();
        $authentication = $auth->index();

        $this->template->vars('authentication', $authentication["auth"]);
        $this->template->view('index');
    }
}