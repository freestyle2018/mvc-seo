<?php




Class Api_Google {



    function index()
    {

        $this->add_site();

    }




    function add_site()
    {
        $header[] = "Authorization: Bearer ya29.A0AfH6SMDPZLhJOsdqcgxGPLriJfjeNRKoFgDZLNuz2ZvUxY8ClRMAegK51mqM6vuIMEZI7MbfEpxF02VtKfBRdj_Hy3G6waynXhJ0AvucP1j4NKbLYTG_nC9Xe0ucS50J9LkV2pR8rMfLDHDxNgvM3T5ccoVg1VsANKDb-52PAxSw";
        $header[] = "Accept: application/json";


        $connection = curl_init();
        curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
        curl_setopt($connection, CURLOPT_PUT, true);
        curl_setopt($connection, CURLOPT_URL, 'https://www.googleapis.com/webmasters/v3/sites/as445.ri?key=AIzaSyBxN7rs_RYjwvxzfEDxRLZ_RCwQKsn-6mQ');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $array = json_decode($info);

        print_r($array);
    }











}
