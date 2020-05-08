<?php




Class Curl {

    function index($url) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_FAILONERROR, 1);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // allow redirects
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // return into a variable
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 GTB6");
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        $stroka = curl_exec($curl);

        $newfile_img = fopen(URL_CATALOG."xpath.html", "w");
        fwrite($newfile_img, $stroka);

        return $stroka;
    }
}
