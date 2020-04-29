<?php



// контролер
Class Controller_XPath Extends Controller_Base {
    // шаблон
    public $layouts = "auth";

    // экшен
    function index()
    {

        $doc = new DOMDocument();
        $doc->preserveWhiteSpace=true;
        $doc->formatOutput=false;
        $doc->loadHTMLFile("http://www.kazak39.com/news");
        //$doc->loadHTMLFile($content);

        $xpath= new DOMXpath($doc);
        $elements = $xpath->query("//div[@id=\"block-system-main\"]//div[@class=\"view-content\"]/div//h3/a/text()");

        var_dump( (array) $elements );

        if (!is_null($elements)) {
            foreach ($elements as $element) {
                echo "<br/>[". $element->nodeName. "]";
                print_r($element);

            }
        }



        //$this->template->vars('elements', $elements);
        $this->template->view('index');
    }

}
