<?php




Class Expired {

    public static $auth;


    function __construct() {
        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=auth&username='.EXPIRED_LOGIN.'&password='.EXPIRED_PASS.'&out=xml');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = simplexml_load_string($info);

        self::$auth = $otvet->auth;
    }





    function set($name) {

        $point_position = strrpos($name, ".");
        $domain = substr($name, 0, $point_position);

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=backorder.api.set&auth='.self::$auth.'&out=xml&domain='.$domain.'.ru&contact=21188&price=199');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = simplexml_load_string($info);

        //var_dump($otvet);
    }



    function delete($name) {

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=backorder.api.delete&auth='.self::$auth.'&out=xml&domain='.$name);
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = json_decode($info, true);

        if(isset($otvet["error"])){
            $size = sizeof($otvet["error"]);
        }

        $size = empty($size) ? 0 : $size;

        if($size == 1){
            return false;
        }
        else{
            return true;
        }

        //var_dump($otvet);
    }





    function spisok() {

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=backorder.api.list&auth='.self::$auth.'&out=json');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = json_decode($info, true);


        if(isset($otvet["doc"]["bids"])){

            $size = sizeof($otvet["doc"]["bids"]);

            //echo "xxxxxxxxxxxxxxxxxxxxx = ".$size;

            if($size == 1 || $size == 0){
                //$array[0] = $otvet["doc"]["bids"];
                $array = ['0' => $otvet["doc"]["bids"]["bid"]];
                return $array;
            }
            else{
                return $otvet["doc"]["bids"]["bid"];
            }
        }



    }






    function domains() {

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=domain&auth='.self::$auth.'&out=json');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = json_decode($info, true);

        return $otvet["doc"]["elem"];

    }






    function check_dns($id_domain) {

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=domain.ns&auth='.self::$auth.'&out=json&elid='.$id_domain.'&sok=ok');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = json_decode($info, true);

        if(isset($otvet["doc"]["doc"]["ns0"])){
            $size = sizeof($otvet["doc"]["doc"]["ns0"]);
        }

        $size = empty($size) ? 0 : $size;

        if($size == 1){
            return true;
        }
        else{
            return false;
        }

    }








    function check_dns_2($id_domain) {

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=domain.ns&auth='.self::$auth.'&out=json&elid='.$id_domain.'&sok=ok');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = json_decode($info, true);

        var_dump($otvet);

        /*if(isset($otvet["doc"]["doc"]["ns0"])){
            $size = sizeof($otvet["doc"]["doc"]["ns0"]);
        }

        $size = empty($size) ? 0 : $size;

        if($size == 1){
            return true;
        }
        else{
            return false;
        }*/

    }








    function prices($name) {

        $connection = curl_init();
        curl_setopt($connection, CURLOPT_URL, 'https://api.expired.ru/billmgr?func=backorder.api.prices&domain='.$name.'&auth='.self::$auth.'&out=xml');
        curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
        $info = curl_exec($connection);
        curl_close($connection);

        $otvet = simplexml_load_string($info);

        var_dump($otvet);
    }






}










