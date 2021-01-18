<?php

Class Controller_Expired Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    static $auth;
    static $authentication;
    static $connect;


    function __construct() {
        self::$connect = ssh2_connect(VpsConf::getSshServer(), VpsConf::getSshPort());
        if (!self::$connect) die('Не удалось установить соединение');
        ssh2_auth_password(self::$connect, VpsConf::getSshUser(), VpsConf::getSshPass());

        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', self::$authentication["status"]);
    }








    function index() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $pravilo = "//tbody[@id=\"tr\"]//tr/td[1]//h5";

            $doc = new DOMDocument();
            $doc->preserveWhiteSpace=true;
            $doc->formatOutput=false;

            $date_osvobojdeniya = mktime(date("H"), date("i"), date("s"), date("m")  , date("d") + 5, date("Y"));
            $date_osvobojdeniya = date("Y-m-d", $date_osvobojdeniya);


            $url = "https://expired.ru/lists/?condition=have&domain=&yoldmin=5&yoldmax=&ixmin=10&ixmax=&dcmin=&dcmax=&ddmin=&ddmax=$date_osvobojdeniya&chreg=lr&chcount=&zone=&swmin=&swmax=&linksmin=&linksmax=&alexamin=&alexamax=&limit=500&nounfreed=on&unf_status=&adv=on&orderby=isordered&desc=";

            $curl = new Curl();
            $stroka = $curl->index($url);

            @$doc->loadHTML($stroka);
            $xpath= new DOMXpath($doc);
            $elements = $xpath->query($pravilo);

            foreach ($elements as $element) {
                $name[] = utf8_decode($element->textContent);
                $urls[] =@ idn_to_ascii(utf8_decode($element->textContent));
            }


            $this->template->vars('name', $name);
            $this->template->vars('url', $urls);
        }

        $this->template->view('view');
    }








    function delete_zayavka($name, $domain) {
        $model = new Model_Expired();
        $exp = new Expired();
        if($exp->delete($name) == true){
            $domain["status"] = "Удалена";
            $model->update_domain($domain);
        }
    }


















    function domains() {
        $model = new Model_Expired();
        $domains = $model->domains();





        // получаю и обрабатываю данные из expired.ru
        $exp = new Expired();
        $array_1 = $exp->spisok();
        $array_2 = $exp->domains();
        $expired_domains = array();
        $regist_domains = array();

        //print_r($array_2);

        if(isset($array_1)){
            foreach ($array_1 as $key => $value) {
                //print_r($value);

                $expired_domain = $model->search_by_name($value["domain"]["$"]);
                $expired_domains[$expired_domain["id"]] = $value;
            }
        }



        foreach ($array_2 as $key => $value) {
            $my_domain = $model->search_by_name($value["domain"]["$"]);

            if($my_domain != ""){
                $regist_domains[$my_domain["id"]] = $value;
            }
        }











        // перезаписываю актуальные данные - 1
        foreach ($expired_domains as $key => $value) {
            $domain = $model->show_Domain($key);

            foreach ($value as $key_2 => $value_2) {
                if($key_2 == "id"){
                    $domain[0]["expired_id"] = $value_2["$"];
                }
                else if ($key_2 != "domain") {
                    $domain[0][$key_2] = $value_2["$"];
                }
            }

            //print_r($domain[0]);

            $model->update_domain($domain[0]);
        }







        // перезаписываю актуальные данные - 2
        foreach ($regist_domains as $key => $value) {
            $domain = $model->show_Domain($key);

            foreach ($value as $key_2 => $value_2) {
                if($key_2 == "id"){
                    $domain[0]["expired_id"] = $value_2["$"];
                }
            }

            $model->update_domain($domain[0]);
        }




















        $x = 0;
        foreach ($domains as $key => $domain) {

            if($exp->check_dns($domain["expired_id"]) == true){
                $domain["status"] = "Зарегистрирован";
                $domains[$x]["status"] = "Зарегистрирован";
                $model->update_domain($domain);
            }



            if($domain["price"] != ""  && $domain["status"] != "Зарегистрирован" && $domain["status"] != "Продлен" && $domain["status"] != "Удалена"){
                $time_1 = (int)strtotime(date("Y-m-d H:i:s"));
                $time_2 = (int)strtotime($domain["freedate"]);

                $difference_time = abs($time_1-$time_2);

                //echo $difference_time."\r\n";

                $time_in_days = (int)floor((($difference_time / 60) / 60) / 24);

                //echo $time_in_days."\r\n";


                if($time_in_days <= 2){
                    $domains[$x]["time_expired"] = "red";
                }
                else if(2 < $time_in_days && $time_in_days <= 5){
                    $domains[$x]["time_expired"] = "yellow";
                }
                else if(5 < $time_in_days && $time_in_days <= 15){
                    $domains[$x]["time_expired"] = "green";
                }
                else if(15 < $time_in_days && $time_in_days <= 30){
                    $domains[$x]["time_expired"] = "blue";
                }
                else if(30 < $time_in_days){
                    $domains[$x]["time_expired"] = "grey";
                }
            }



            /*if($domain["price"] != "" && $exp->check_dns($domain["expired_id"]) == false && ($domain["status"] == "Удален" || $domain["status"] == "Ожидание")){
                $domain["status"] = "Продлен";
                $model->update_domain($domain);
            }*/


            $x++;
        }










        $this->template->vars('domains', $domains);
        $this->template->vars('expired_domains', $expired_domains);
        $this->template->vars('message', "");
        $this->template->view('domains');

    }




    function proverka_working_webarchive() {
        $stream = ssh2_exec(self::$connect, "pgrep wayback_machine");
        stream_set_blocking($stream, true);
        $result =@ stream_get_contents($stream);

        if($result == ""){
            return false;
        }
        else{
            return $result;
        }
    }





    function proverka_zapusk_webarchive() {
        $model = new Model_Expired();

        $proverka = $this->proverka_working_webarchive();
        $proverka_bd = sizeof($model->load_domain_out_webarchive());

        if($proverka == false && $proverka_bd == 0){
            return true;
        }
        else{
            return false;
        }

    }







    function test() {
        $exp = new Expired();

        $array = $exp->spisok();
        var_dump($array);



        $name = "fashioninsider.ru";
        $exp->domains($name);


        //$id_domain = 1468688;
        //$id_domain = 1470010;
        //$exp->check_dns_2($id_domain);


        //$name = "sapo-gi.ru";
        //$exp->set($name);




        //$name = "sev-elektrik.ru";
        //$exp->delete($name);


        //$name = "sev-elektrik.ru";
        //$exp->check_dns_2($name);

    }






    function percentage_of_readiness() {

        $model = new Model_Expired();
        $domain = $model->load_domain_out_webarchive();
        $nomer_domain =@ $domain[0]["id"];

        $data = file_get_contents(URL_SUBDOMAIN.DOMAIN_API."/".DOMAIN_HTML."/files/wayback_machine/otvet.txt");
        // Download completed in 2911.54s, saved in websites/stroitelniportal.ru/ (7899 files)
        // Download completed in 1.51s, saved in websites/sbm-universal.ru/ (218 files)
        $pos = strpos($data, 'Download completed');

        if($data == ""){
            echo '{"nomer":"'.$nomer_domain.'","value":"0%"}';
        }
        else{
            if($pos !== false){
                echo '{"nomer":"'.$nomer_domain.'","value":"Закончена!"}';

                $podstroka = substr($data, $pos);

                $domain = preg_replace("/(Download\scompleted\sin\s\d+\.\d+s,\ssaved\sin\swebsites\/|\/\s\(\d+\sfiles\)\n)/", "", $podstroka);

                $model = new Model_Expired();
                $model->end_load_domain_out_webarchive($domain);
            }
            else{
                $position_poslednei_levoi_skobki = strrpos($data,"(");
                $podstroka = substr($data, $position_poslednei_levoi_skobki);
                $podstroka = preg_replace("/(\(|\))/", "", $podstroka);

                $position_slesh = strrpos($podstroka,"/");
                $page_now = (int)substr($podstroka, 0, $position_slesh);
                $page_all = (int)substr($podstroka, $position_slesh + 1);

                //echo $page_now." - ".$page_all." - ";

                $j =@ (($page_now / $page_all) * 100);

                $percent = floor($j);

                echo '{"nomer":"'.$nomer_domain.'","value":"'.$percent.'%"}';
            }
        }
    }








    function stop_loading_webarchive() {
        $pid = $this->proverka_working_webarchive();

        if($pid !== false){
            $stream = ssh2_exec(self::$connect, "kill ".$pid);
        }

        $model = new Model_Expired();
        $domain = $model->load_domain_out_webarchive();

        //echo $pid;
        //print_r($domain[0]);

        $domain[0]["load_site"] = "";
        $model->update_domain($domain[0]);

        echo '{"nomer":"'.$domain[0]["id"].'"}';
    }













    function operation() {

        $domains = empty($_POST['domains']) ? array() : $_POST['domains'];
        $operation = empty($_POST['operation']) ? '' : $_POST['operation'];

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){

            $model = new Model_Expired();
            $exp = new Expired();

            $x = 0;
            foreach ($domains as $key => $value) {

                $domains = "";

                $info_domain[$x] = $model->show_Domain($value);

                $id = $info_domain[$x][0]["id"];
                $name = $info_domain[$x][0]["name"];
                $archive_timestamp = $info_domain[$x][0]["archive_timestamp"];

                if($operation == "delete"){
                    $model->delete($name);
                    ssh2_exec(self::$connect, "rm -rf /root/websites/".$name."/* | rm -rf /root/websites/".$name.";");
                    $this->delete_zayavka($name, $info_domain[$x][0]);

                }
                else if($operation == "clear"){

                    $this->delete_zayavka($name, $info_domain[$x][0]);

                    $info_domain[$x][0]["load_site"] = "";
                    $info_domain[$x][0]["status"] = "";
                    $model->update_domain($info_domain[$x][0]);

                    ssh2_exec(self::$connect, "rm -rf /root/websites/".$name."/* | rm -rf /root/websites/".$name.";");
                }
                else if($operation == "load_out_webarchive"){

                    $proverka = $this->proverka_zapusk_webarchive();

                    if($proverka == true){

                        $info_domain[$x][0]["load_site"] = 0;
                        $model->update_domain($info_domain[$x][0]);

                        echo '{"nomer":"'.$id.'","value":""}';

                        if($archive_timestamp != ""){
                            ssh2_exec(self::$connect, "wayback_machine_downloader ".$name." -t ".$archive_timestamp." -a > ".URL_SUBDOMAIN.DOMAIN_API."/".DOMAIN_HTML."/files/wayback_machine/otvet.txt;");
                        }
                        else{
                            ssh2_exec(self::$connect, "wayback_machine_downloader ".$name." -a > ".URL_SUBDOMAIN.DOMAIN_API."/".DOMAIN_HTML."/files/wayback_machine/otvet.txt;");
                        }

                        exit();

                    }
                    else{
                        echo '{"value":"Не возможно запустить!"}';
                    }

                }
                else if($operation == "zayavka_199"){
                    $exp->set($name);
                    $array = $exp->spisok();

                    foreach ($array as $key => $value) {

                        if($value["domain"]["$"] == $name){

                            foreach ($value as $key_2 => $value_2) {
                                if($key_2 != "domain" && $key_2 != "id"){
                                    $info_domain[$x][0][$key_2] = $value_2["$"];
                                }
                            }
                        }

                        $model->update_domain($info_domain[$x][0]);
                    }

                }
                else if($operation == "delete_zayavka"){
                    $this->delete_zayavka($name, $info_domain[$x][0]);
                }

                $x++;
            }


            if($operation == "delete" || $operation == "clear" || $operation == "zayavka_199" || $operation == "delete_zayavka"){
                echo '{"value":""}';
            }


        }

    }







    function cheked() {
        $domain = $_POST['domain'];
        $date_add = date("Y-m-d H:i:s", strtotime('+ 2 hours'));
        $timestamp = $_POST['timestamp'];


        $model = new Model_Expired();
        $model->add($domain, $date_add, $timestamp);
    }


    function delete() {
        $domain = $_POST['domain'];

        $model = new Model_Expired();
        $model->delete($domain);
    }



}