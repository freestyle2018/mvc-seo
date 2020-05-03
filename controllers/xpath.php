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

            if($url != "" && $pravilo != ""){
                $doc = new DOMDocument();
                $doc->preserveWhiteSpace=true;
                $doc->formatOutput=false;
                //$doc->loadHTMLFile("http://www.kazak39.com/news");
                //@$doc->loadHTMLFile("https://kranimport.ru/catalog/telfery/type-t/t01-t17.html");
                @$doc->loadHTMLFile($url);
                //$doc->loadHTMLFile($content);

                $xpath= new DOMXpath($doc);
                //$elements = $xpath->query("//div[@id=\"block-system-main\"]//div[@class=\"view-content\"]/div//h3/a/text()");
                //$elements = $xpath->query('//div[@class="page-descr"]//h3[position()>1]/text()');
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
