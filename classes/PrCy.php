<?php




Class PrCy {

    protected $url;
    private $key;

    function __construct() {
        $this->url = PR_CY_URL;
        $this->key = PR_CY_KEY;
    }

    function start($name_domain) {
        $this->create_project($name_domain);
        $this->proverka_index($name_domain);
    }

    function create_project($name_domain) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $this->url."/analysis/update/base/".$name_domain."?key=".$this->key);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, ['Accept: application/json']);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_CAINFO,  realpath('cacert.pem'));
        curl_exec($curl);
        curl_close($curl);
    }

    function proverka_index($name_domain) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $this->url."/analysis/base/".$name_domain."?tests=yandexIndex&excludeHistory=1&key=".$this->key);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "GET");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, ['Accept: application/json']);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_CAINFO,  realpath('cacert.pem'));
        $result = curl_exec($curl);
        curl_close($curl);

        $otvet = json_decode($result, true);
        $index = $otvet["yandexIndex"]["yandexIndex"] > 0 ? true : false;

        return $index;
    }



}
