<?php

Class Controller_Expired Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    static $auth;
    static $authentication;


    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', self::$authentication["status"]);
    }


    function index() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $pravilo = "//tbody[@id=\"tr\"]//tr/td[1]//h5";

            $doc = new DOMDocument();
            $doc->preserveWhiteSpace=true;
            $doc->formatOutput=false;

            $date_osvobojdeniya = mktime(date("H"), date("i"), date("s"), date("m")  , date("d") + 5, date("Y"));
            $date_osvobojdeniya = date("Y-m-d", $date_osvobojdeniya);


            $url = "https://expired.ru/lists/?condition=have&domain=&yoldmin=5&yoldmax=&ixmin=10&ixmax=&dcmin=&dcmax=&ddmin=&ddmax=$date_osvobojdeniya&chreg=lr&chcount=&zone=&swmin=&swmax=&linksmin=&linksmax=&alexamin=&alexamax=&limit=500&nounfreed=on&unf_status=&adv=on&orderby=isordered&desc=";

            $curl = new Curl();
            $stroka = $curl->index($url);

            @$doc->loadHTML($stroka);
            $xpath= new DOMXpath($doc);
            $elements = $xpath->query($pravilo);

            foreach ($elements as $element) {
                $name[] = utf8_decode($element->textContent);
                $urls[] =@ idn_to_ascii(utf8_decode($element->textContent));
            }


            $this->template->vars('name', $name);
            $this->template->vars('url', $urls);
        }

        $this->template->view('view');
    }










    function domains() {
        $model = new Model_Expired();
        $domains = $model->domains();

        $this->template->vars('domains', $domains);
        $this->template->vars('message', "");
        $this->template->view('domains');

    }





    function operation() {

        $domains = empty($_POST['domains']) ? array() : $_POST['domains'];
        $operation = empty($_POST['operation']) ? '' : $_POST['operation'];

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $model = new Model_Expired();

            $x = 0;
            foreach ($domains as $key => $value) {

                $info_domain[$x] = $model->show_Domain($value);

                $id = $info_domain[$x][0]["id"];
                $name = $info_domain[$x][0]["name"];

                if($operation == "delete"){
                    $model->delete($name);
                }

                $x++;
            }
        }

    }







    function cheked() {
        $domain = $_POST['domain'];
        $date_add = date("Y-m-d H:i:s", strtotime('+ 2 hours'));
        $timestamp = $_POST['timestamp'];


        $model = new Model_Expired();
        $model->add($domain, $date_add, $timestamp);
    }


    function delete() {
        $domain = $_POST['domain'];

        $model = new Model_Expired();
        $model->delete($domain);
    }



}