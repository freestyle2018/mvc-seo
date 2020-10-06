<?php

$api = new Api_Webmaster();
$user_id = $api->get_user();
$host_id = $api->add_site($user_id);


echo "user = ".$user_id."<br>\r\n";
echo "host = ".$host_id."<br>\r\n";



$code = $api->verification_site_get($user_id, $host_id);

echo $code;



Class Api_Webmaster {



    function get_user()
    {
        $header[] = "Authorization: OAuth AgAAAAAFNAeqAAaAudFCDKnTak3Fu6iGl-r8MQ8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        return $array->user_id;
    }







    function add_site($user)
    {
        $header[] = "Authorization: OAuth AgAAAAAFNAeqAAaAudFCDKnTak3Fu6iGl-r8MQ8";
        $header[] = "Content-Type: application/json; charset=utf-8";

        $request = '{"host_url": "https://beione.klevomut-shop.ru"}';

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
        $header[] = "Authorization: OAuth AgAAAAAFNAeqAAaAudFCDKnTak3Fu6iGl-r8MQ8";
        $header[] = "Content-Type: application/json; charset=utf-8";

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/'.$user_id.'/hosts/'.$host_id.'/verification');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);
		
		$array = json_decode($info);
		
		return $array->verification_uin;
    }
	
	



    function verification_site_post($user_id, $host_id)
    {
        
		
		//$header[] = "POST";
		$header[] = "Authorization: OAuth AgAAAAAFNAeqAAaAudFCDKnTak3Fu6iGl-r8MQ8";
        $header[] = "Content-Type: application/json; charset=utf-8";
		

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://api.webmaster.yandex.net/v4/user/'.$user_id.'/hosts/'.$host_id.'?verification_type=HTML_FILE');
		curl_setopt($connection, CURLOPT_POST, true);
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);
		
		$array = json_decode($info);
		
		print_r($array);
		
		
		//echo "sdagaerhgserh";
		
		//$array = json_decode($info);
		
		//print_r($array);
		
		//return $array->verification_state;
    }


}

















$file = new File();
$file->load($code);


$api->verification_site_post($user_id, $host_id);



Class File {

    function load($code)
    {
        
		$content = "";
		
		$content .= "<html>";
		$content .=	"<head>";
		$content .=	"	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>";
		$content .=	"</head>";
		$content .=	"<body>Verification: ".$code."</body>";
		$content .= "</html>";
		
		
		
		
		//$handle = fopen(URL_SUBDOMAIN.$name.".".DOMAIN."/".DOMAIN_HTML."/yandex.html","w+");
		$handle = fopen("/home/admin/web/beione.klevomut-shop.ru/public_html/yandex_".$code.".html","w+");
        fwrite($handle,$content); // Записать переменную в файл
        fclose($handle); // Закрыть файл
		
		
    }



}
























