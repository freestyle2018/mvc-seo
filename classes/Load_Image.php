<?php




Class Load_Image {



    function index($domain, $catalog, $nazvanie_papki, $proizvodstvo, $array_img_new, $name_img) {


        // создаем каталоги при их отсуствии
        $dir_catalog = URL_CATALOG.$catalog;
        if (!file_exists($dir_catalog)) {
            mkdir($dir_catalog);
            chmod($dir_catalog, 0755);
        }

        if($nazvanie_papki != ""){
            $dir_nazvaie_papki = URL_CATALOG.$catalog."/".$nazvanie_papki;
            if (!file_exists($dir_nazvaie_papki)) {
                mkdir($dir_nazvaie_papki);
                chmod($dir_nazvaie_papki, 0755);
            }

            if($proizvodstvo != ""){
                $dir_proizvodstvo = URL_CATALOG.$catalog."/".$nazvanie_papki."/".$proizvodstvo;
                if (!file_exists($dir_proizvodstvo)) {
                    mkdir($dir_proizvodstvo);
                    chmod($dir_nazvaie_papki, 0755);
                }
            }
        }






        // перебираем все изображения
        for ($y=0; $y<=sizeof($array_img_new)-1; $y++){

            $curl = new Curl();

            $url_image = $domain.$array_img_new[$y];
            $copy_img = $curl->image($url_image);

            $rasshirenie = $this->rasshirenie($url_image);

            $url_save_image = $catalog."/";
            if($nazvanie_papki != ""){
                $url_save_image .= $nazvanie_papki."/";
                if($proizvodstvo != ""){
                    $url_save_image .= $proizvodstvo."/";
                }
            }

            if($y == 0){
                $url_img_glav = "/catalog/".$url_save_image.$name_img."_".$y.$rasshirenie;
            }

            $newfile_img = fopen(URL_CATALOG.$url_save_image.$name_img."_".$y.$rasshirenie, "w");
            fwrite($newfile_img, $copy_img);
            $copy_img = "";
        }

        return $url_img_glav;
    }


    function rasshirenie($url) {
        if(preg_match("/\.jpeg/", $url)){
            $rasshirenie = ".jpeg";
        }
        elseif (preg_match("/\.jpg/", $url)){
            $rasshirenie = ".jpg";
        }
        elseif (preg_match("/\.gif/", $url)){
            $rasshirenie = ".gif";
        }
        elseif (preg_match("/\.png/", $url)){
            $rasshirenie = ".png";
        }
        elseif (preg_match("/\.tiff/", $url)){
            $rasshirenie = ".tiff";
        }

        return $rasshirenie;
    }





}
