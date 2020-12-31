<?php




Class Api_Google {



    function index($name)
    {

        if(CREATE_HTTPS_DOMAIN == "yes"){
            $prefiks = "https://";
        }
        else{
            $prefiks = "http://";
        }


        $domain_http = $prefiks.$name.".".DOMAIN;
        $domain = $prefiks.$name.".".DOMAIN;


        $this->add_site($domain);
        $code = $this->verification_site($domain_http);

        $file = new File();
        $file->load_google($name, $code);

        $this->verification_site_load($domain_http);
    }




    function add_site($name)
    {
        $header[] = "Authorization: Bearer ".GOOGLE_TOKEN;
        $header[] = "Accept: application/json";


        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_PUT, true);
        curl_setopt($connection, CURLOPT_URL, GOOGLE_API_URL_V3.'sites/'.$name.'?key='.GOOGLE_KEY);
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($array);
    }





    function verification_sites()
    {
        $header[] = "Authorization: Bearer ".GOOGLE_TOKEN;
        $header[] = "Accept: application/json";


        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_URL, 'https://www.googleapis.com/siteVerification/v1/webResource?key='.GOOGLE_KEY);
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($array);
    }






    function verification_site($name)
    {
        $header[] = "Authorization: Bearer ".GOOGLE_TOKEN;
        $header[] = "Accept: application/json";
        $header[] = "Content-Type: application/json";

        $request =
        "{
          \"site\": {
            \"identifier\": \"$name\",
            \"type\": \"SITE\"
          },
          \"verificationMethod\": \"FILE\"
        }";


        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_POSTFIELDS, $request);
        curl_setopt($connection, CURLOPT_URL, 'https://www.googleapis.com/siteVerification/v1/token?key='.GOOGLE_KEY);
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($array);

        return $array->token;
    }




    function verification_site_load($name)
    {
        $header[] = "Authorization: Bearer ".GOOGLE_TOKEN;
        $header[] = "Accept: application/json";
        $header[] = "Content-Type: application/json";

        $request =
        "{
          \"site\": {
            \"identifier\": \"$name\",
            \"type\": \"SITE\"
          }
        }";


        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_POSTFIELDS, $request);
        curl_setopt($connection, CURLOPT_URL, 'https://www.googleapis.com/siteVerification/v1/webResource?verificationMethod=FILE&key='.GOOGLE_KEY);
        curl_setopt($connection, CURLOPT_POST, true);
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($array);
    }

    







}
