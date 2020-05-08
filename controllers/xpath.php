<?php



// контролер
Class Controller_XPath Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    // экшен
    function index()
    {
        $auth = new Authentication();
        $authentication = $auth->index();

        if($authentication["auth"] === true && $authentication["status"] == "admin"){
            $filter = new Filter();

            $url = $filter->out('string',(empty($_POST['url']) ? '' : $_POST['url']));
            $pravilo = (empty($_POST['pravilo']) ? '' : $_POST['pravilo']);
            $zapros = (empty($_POST['zapros']) ? '' : $_POST['zapros']);

            if($url != "" && $pravilo != ""){

                $doc = new DOMDocument();
                $doc->preserveWhiteSpace=true;
                $doc->formatOutput=false;

                if($zapros != ''){
                    $curl = new Curl();
                    $stroka = $curl->index($url);

                    @$doc->loadHTML($stroka);
                }
                else {
                    @$doc->loadHTMLFile($url);
                }


                $xpath= new DOMXpath($doc);
                $elements = $xpath->query($pravilo);

                $this->template->vars('elements', $elements);
            }

            $this->template->vars('authentication', $authentication["auth"]);
            $this->template->vars('url', $url);
            $this->template->vars('pravilo', $pravilo);
            $this->template->view('index');
        }




    }

}
