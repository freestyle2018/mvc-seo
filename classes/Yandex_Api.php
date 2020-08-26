<?php





Class YandexApi {


    function index() {
        $user_id = $this->curl ([ 10002 => YANDEX_API_URL, 10023 => ['Authorization: OAuth ' . YANDEX_TOKEN] ]);
        $user_id = strstr($user_id, 'user_id') ? json_decode ($user_id, true)['user_id'] : die($user_id);

        $domain = "msk.ivan.tk"

        $this->add_domain($domain, $user_id, 'Authorization: OAuth ' . YANDEX_TOKEN)
    }


    function add_domain ($domain, $user_id, $token)
    {
        //добавление доменов в вебмастер через api
        //10002 -> url, 47 -> post, 10015 -> postfields, 42 -> headers
        $response = $this->curl ([ 10002 => YANDEX_API_URL . $user_id . '/hosts/', 47=> true, 10015=> json_encode(['host_url' => $domain]), 10023 => ['Content-type: application/json', $token] ]);
        if ( !isset(json_decode($response)->host_id) ) return false;

        //подтверждение прав
        $host_id = 'http:'.$domain.':80';
        $response = $this->curl ([ 10002 => YANDEX_API_URL . $user_id . '/hosts/' . $host_id . '/verification/?verification_type=' . YANDEX_VERIFICATION, 47=> true, 10023 => [ $token ] ]);
        $response = json_decode($response);
        if ( !isset($response->verification_uin) ) return false;
        return $response->verification_uin;
    }


    function curl ($opt)
    {//var_dump(get_defined_constants(true)['curl']);//числовые знач констант
        if (!is_array($opt)) return false;
        $ch = curl_init();
        //78 -> connecttimeout, 13 -> timeout, 19913 -> RETURNTRANSFER, 52 -> FOLLOWLOCATION, 68 -> MAXREDIRS, 58 -> AUTOREFERER
        curl_setopt_array($ch, $opt + [78 => 5, 13=> 10, 19913 => true, 52 => true, 68 => 20, 58=> true]);
        $response = curl_exec ($ch);
        curl_close($ch);
        return $response;
    }










}
