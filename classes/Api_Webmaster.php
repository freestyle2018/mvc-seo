<?php




Class Api_Webmaster {



    function __construct()
    {

    }

    function get_user()
    {
        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, YANDEX_API_URL_V4.'user/');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        return $array->user_id;
    }







    function add_site($user)
    {
        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $request = '{"host_url": "http://example.com"}';

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_POSTFIELDS, $request);
        curl_setopt($connection, CURLOPT_URL, YANDEX_API_URL_V4.'user/'.$user.'/hosts');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        return $array->host_id;
    }







    function verification_site_post($user_id, $host_id)
    {
        $header[] = "POST";
        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, YANDEX_API_URL_V4.'user/'.$user_id.'/hosts/'.$host_id.'/verification?verification_type=HTML_FILE');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        //$array = json_decode($info);

        //return $array->host_id;

        echo $info;
    }












    function verification_site_get($user_id, $host_id)
    {
        
        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, YANDEX_API_URL_V4.'user/'.$user_id.'/hosts/'.$host_id.'/verification');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        //$array = json_decode($info);

        //return $array->host_id;

        echo $info;
    }









}
