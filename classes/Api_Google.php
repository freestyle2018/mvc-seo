<?php




Class Api_Google {



    function index()
    {

        $this->add_site();

    }




    function add_site()
    {
        $header[] = "Authorization: Bearer ya29.A0AfH6SMA8a--k9DPB2vJZvMJWMjHHpr79Q1PD9erqUAvc7XbNXzD9vxXcecbkhhxenpashtsghFWnorgSpMk2piqL06sEVo1R1lBXqG8tCBbIu3bif98xjH3dSQy0rPdfkhwsx4JhdWMDBUTriayzmElE5MH-eyGlFn-ZrKzv58E";
        $header[] = "Accept: application/json";


        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_PUT, true);
        curl_setopt($connection, CURLOPT_URL, 'https://www.googleapis.com/webmasters/v3/sites/aaaaa.ri?key=AIzaSyBxN7rs_RYjwvxzfEDxRLZ_RCwQKsn-6mQ');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($array);
    }











}
