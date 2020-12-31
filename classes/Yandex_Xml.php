<?php

use Zend\XmlRpc\Client;
use Zend\XmlRpc\Value;


Class Yandex_Xml {



    function proverka_index($name)
    {


        $get_zapros = "https://yandex.ru/search/xml?user=".YANDEX_XML_LOGIN."&key=".YANDEX_XML_KEY."&query=site%3Ahttp%3A%2F%2F".$name."&l10n=ru&sortby=tm.order%3Dascending&filter=none&groupby=attr%3D%22%22.mode%3Dflat.groups-on-page%3D10.docs-in-group%3D1";

        $curl = new Curl();
        $stroka = $curl->index($get_zapros);


        //$parser = new XML_Parser();
        //$otvet = $parser->parse($stroka);

        $otvet = simplexml_load_string($stroka);

        //var_dump($otvet);


        if(isset($otvet->response->results->grouping->group->doccount)){
            $proverka = $otvet->response->results->grouping->group->doccount;

            if($proverka >= 1) {
                return true;
            }
            else{
                return false;
            }

        }
        else{
            return false;
        }
    }










}