<?php




Class Api_Webmaster {



    function add_site_in_webmaster($name)
    {
        $domain = "https://".$name.".".DOMAIN;

        $user_id = (int)$this->get_user();
        $host_id = $this->add_site($user_id, $domain);

        echo "user = ".$user_id."<br>\r\n";
        echo "host = ".$host_id."<br>\r\n";

        $code = $this->verification_site_get($user_id, $host_id);



        // закачиваем файл на поддомен
        $file = new File();
        $file->load($name, $code);


        // Непосредственно потверждаем регистрацию сайта
        $this->verification_site_post($user_id, $host_id);

    }






    function get_user()
    {
        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($array);

        return $array->user_id;
    }







    function add_site($user, $domain)
    {
        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $request = '{"host_url": "'.$domain.'"}';

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_POSTFIELDS, $request);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/'.$user.'/hosts');
        curl_setopt($connection, CURLOPT_POST, true);
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($info);

        return $array->host_id;
    }





    function verification_site_get($user_id, $host_id)
    {
        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/'.$user_id.'/hosts/'.$host_id.'/verification');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        print_r($info);

        $array = json_decode($info);

        return $array->verification_uin;
    }






    function verification_site_post($user_id, $host_id)
    {

        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/'.$user_id.'/hosts/'.$host_id.'/verification?verification_type=HTML_FILE');
        curl_setopt($connection, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($info);
    }


    function verification_site_post_get_info($user_id, $host_id)
    {

        $header[] = "Authorization: OAuth ".YANDEX_TOKEN;
        $header[] = "Content-Type: application/json; charset=utf-8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/'.$user_id.'/hosts/'.$host_id.'/verification');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($info);
    }


}
