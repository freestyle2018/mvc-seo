<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// контролер
Class Controller_User Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    // экшен
    function index() {
        $info = "";

        $this->template->vars('info', $info);
        $this->template->view('index');
    }


    function regist() {
        $filter = new Filter();
        $auth = new Authentication();
        $authentication = $auth->index();

        $email = empty($_POST['email']) ? '' : $_POST['email'];
        $pass = empty($_POST['pass']) ? '' : $_POST['pass'];
        $pass2 = empty($_POST['pass2']) ? '' : $_POST['pass2'];

        if($email != '' && $pass != '' && $pass2 != ''){
            $data = self::$auth->register($email, $pass, $pass2);
            $this->template->vars('message', $data["message"]);
        }
        else if ($email = '') {
            $this->template->vars('message', "Not all fields are filled!");
        }
        else {
            $this->template->vars('message', "");
        }

        $this->template->vars('authentication', $authentication["auth"]);
        $this->template->vars('email', $filter->doXssClean($email));
        $this->template->view('regist');
    }


    function login() {
        session_start();
        $filter = new Filter();
        $auth = new Authentication();
        $authentication = $auth->index();

        $error = empty($_GET['error']) ? '' : $_GET['error'];
        $email = empty($_POST['email']) ? '' : $_POST['email'];
        $pass = empty($_POST['pass']) ? '' : $_POST['pass'];

        if($email != '' && $pass != ''){
            $data = self::$auth->login($email, $pass);

            if($data["error"] != 1) {
                $_SESSION["email"] = $email;
                $authentication = $auth->index();
            }

            $this->template->vars('message', $data["message"]);
        }
        else if ($email = '') {
            $this->template->vars('message', "Not all fields are filled!");
        }
        else {
            $this->template->vars('message', "");
        }

        $this->template->vars('authentication', $authentication["auth"]);
        $this->template->vars('error', $filter->doXssClean($error));
        $this->template->vars('email', $filter->doXssClean($email));
        $this->template->view('login');
    }

    function activate() {
        $code = empty($_POST['code']) ? '' : $_POST['code'];
        $auth = empty($_POST['auth']) ? 'off' : $_POST['auth'];

        if($auth == "on"){
            $data = self::$auth->activate($code);
            $this->template->vars('message', $data['message']);
        }
        else{
            $this->template->vars('message', "");
        }

        $this->template->vars('code', $code);
        $this->template->view('activate');
    }

    function reset_password() {
        $auth = new Authentication();
        $authentication = $auth->index();

        $mail = empty($_POST['mail']) ? '' : $_POST['mail'];
        $auth = empty($_POST['auth']) ? 'off' : $_POST['auth'];

        if($auth == "on"){
            $data = self::$auth->requestReset($mail);
            $this->template->vars('message', $data['message']);
        }
        else{
            $this->template->vars('message', "");
        }


        $this->template->vars('authentication', $authentication["auth"]);
        $this->template->vars('mail', $mail);

        $this->template->view('reset');
    }

    function reset() {
        $filter = new Filter();
        $auth = new Authentication();
        $authentication = $auth->index();

        $code = $filter->out('string',(empty($_POST['code']) ? '' : $_POST['code']));
        $pass_1 = $filter->out('string',(empty($_POST['pass_1']) ? '' : $_POST['pass_1']));
        $pass_2 = $filter->out('string',(empty($_POST['pass_2']) ? '' : $_POST['pass_2']));
        $auth = $filter->out('string',(empty($_POST['auth']) ? 'off' : $_POST['auth']));

        if($auth == "on"){
            $data = self::$auth->resetPass($code, $pass_1, $pass_2);
            //$info = self::$auth->getBaseUser($data["id"]);

            $this->template->vars('message', $data["message"]);
        }
        else{
            $this->template->vars('message', "");
        }


        $this->template->vars('authentication', $authentication["auth"]);
        $this->template->vars('code', $code);

        $this->template->view('reset2');
    }



    function info() {
        $auth = new Authentication();
        $filter = new Filter();
        $authentication = $auth->index();
        $model = new Model_Users();

        if($authentication["auth"] === true) {
            $users = $model->get_Users();
            $this->template->vars('Users', $filter->doXssClean($users));

            $this->template->vars('text', "The text is visible after authorization!");
        }

        $this->template->vars('authentication', $authentication["auth"]);
        $this->template->vars('status', $authentication["status"]);

        $this->template->view('info');
    }

    function add() {
        $auth = new Authentication();
        $filter = new Filter();
        $model = new Model_Users();

        $name = $filter->out('string',(empty($_POST['name']) ? '' : $_POST['name']));
        $email = $filter->out('email',(empty($_POST['email']) ? '' : $_POST['email']));
        $category = $filter->out('string',(empty($_POST['category']) ? '' : $_POST['category']));

        $authentication = $auth->index();

        if($name != "" && $email != "" && $category != ""){
            if($authentication["auth"] === true) {
                $proverka = $model->add_Users($name, $email, $category);

                if($proverka === true){
                    $this->info();
                }
            }
        }
        else{
            $this->template->vars('error', "Not all fields are filled!");
        }

        $this->template->vars('name', $filter->doXssClean($name));
        $this->template->vars('email', $filter->doXssClean($email));
        $this->template->vars('category', $filter->doXssClean($category));

        if(!isset($proverka)){
            $this->template->vars('authentication', $authentication["auth"]);
            $this->template->view('add');
        }

    }

    function delete() {
        $auth = new Authentication();
        $filter = new Filter();
        $model = new Model_Users();

        $authentication = $auth->index();

        $user_id = $filter->out('int',(empty($_GET['user_id']) ? '' : $_GET['user_id']));

        if($authentication["auth"] === true && $authentication["status"] === "admin") {
            $model->delete_Users($user_id);
        }

        $this->info();
    }

    function out() {
        //echo $decawrgfr;

        $auth = new Authentication();
        $authentication = $auth->out();

        $this->template->vars('authentication', false);
        $this->template->view('out');
    }

}
