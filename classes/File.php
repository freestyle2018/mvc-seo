<?php

Class File {

    function load($name, $code)
    {

        $content = "";

        $content .= "<html>";
        $content .=	"<head>";
            $content .=	"	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
            $content .=	"</head>";
        $content .=	"<body>Verification: ".$code."</body>";
        $content .= "</html>";




        $handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/yandex_".$code.".html","w+");
        //$handle = fopen("/home/admin/web/beione.klevomut-shop.ru/public_html/yandex_".$code.".html","w+");
        fwrite($handle,$content); // Записать переменную в файл
        fclose($handle); // Закрыть файл


    }



}