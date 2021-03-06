<?php




Class Cron {

    public static $my_id;
    public static $client;


    function api() {
        $api = new Api_Webmaster();
        $user_id = $api->get_user();
        $host_id = $api->add_site($user_id);

        $api->verification_site_post($user_id, $host_id);
        $api->verification_site_get($user_id, $host_id);

    }






    // закупаем ссылки
    function start() {
        $sape_model = new Model_Sape();
        $row = $sape_model->show_Razdels(); // просматриваем все разделы

        $i = 0;
        while ($i <= sizeof($row) - 1){

            // сраниваем время в базе и настоящее (пришло ли время покупать)
            if((int)strtotime($row[$i]["date_next"]) < (int)strtotime(date("Y-m-d H:i:s")) && $row[$i]["zapusk"] == "on"){

                $sape = new Sape();

                // получаем ссылку, которую нужно купить
                $url_for_zakupka = $sape_model->get_url_in_cron($row[$i]["id_razdel"], $row[$i]["nomer"]);

                $id_url = $url_for_zakupka["id_url"];
                $name_url = $url_for_zakupka["name_url"];

                // закупаем ссылку в Sape
                $sape->new_url($id_url, $name_url, 1);

                // Получаем данные о razdel
                $razdel_info = $sape_model->show_Razdel($row[$i]["id_razdel"]);

                // Изменяем данные
                $date_next = mktime(date("H")+$razdel_info["shag_time"], date("i"), date("s"), date("m")  , date("d"), date("Y"));
                $razdel_info["date_next"] = date("Y-m-d H:i:s", $date_next);
                $razdel_info["nomer"] += 1;

                // Сохраняем razdel в базе данных изменив nomer и date_next
                $sape_model->update_Razdel($razdel_info);
            }
            $i++;
        }
    }


    function end() {
        $sape_model = new Model_Sape();
        $pr_cy      = new PrCy();
        $yandex_xml = new Yandex_Xml();


        $row = $sape_model->show_Razdels(); // просматриваем все разделы
        var_dump($row);
        //exit();

        $i = 0;
        while ($i <= sizeof($row) - 1){

            // проверяю пришло ли время проверки индексации
            if((int)strtotime($row[$i]["date_index"]) < (int)strtotime(date("Y-m-d H:i:s"))){
                $nomer = $row[$i]["nomer"] - 1;
                $id_razdel = $row[$i]["id_razdel"];


                $url_info = $sape_model->get_url_in_cron($id_razdel, $nomer);
                $url_id   = $url_info["id_url"];

                //echo "url_id = ".$url_id;

                // получает весь список urls которые меньше nomer (т.е. уже закуплены)
                $info_urls = $sape_model->get_urls_in_razdel($id_razdel, SAPE_KOLVO_PROVERKI_INDEX_URL, $url_id);

                //var_dump($info_urls);


                $j = 0;
                while ($j < SAPE_KOLVO_PROVERKI_INDEX_URL){

                    $name_url = $info_urls[$j]["name_url"];
                    $id_url   = $info_urls[$j]["id_url"];


                    if($info_urls[$j]["status"] == 0){

                        if(PROVERKA_INDEX == "PR_CY"){
                            $index = $pr_cy->start($name_url);
                        }
                        else if(PROVERKA_INDEX == "YANDEX_XML"){
                            $index = $yandex_xml->proverka_index($name_url);
                            sleep(1);
                        }


                        if($index == true){
                            $sape = new Sape();
                            $sape->delete_url($id_url);

                            // меняем статус ссылки, что проиндексирован
                            $info_urls[$j]["status"] = 1;
                            $sape_model->url_update($info_urls[$j]);
                        }
                    }

                    $j++;
                }


                // Изменяем данные
                $date_index = mktime(date("H") + SAPE_SHAG_INDEX_TIME, date("i"), date("s"), date("m")  , date("d"), date("Y"));
                $row[$i]["date_index"] = date("Y-m-d H:i:s", $date_index);



                // Сохраняем razdel в базе данных изменив date_index
                $sape_model->update_Razdel($row[$i]);
            }

            $i++;
        }
    }





    function load_product() {
        $magazin_model = new Model_Magazin();
        $magazins = $magazin_model->show_Magazins();

        $i = 0;
        while ($i <= sizeof($magazins) - 1){
            $id_magazin = $magazins[$i]["id_magazin"];
            $categories = $magazin_model->show_categories_in_Magazin($id_magazin);

            if(isset($categories)){
                $j = 0;
                while ($j <= sizeof($categories) - 1){
                    $id_category = $categories[$j]["id_category"];

                    $schet = $categories[$j]["schet_category"];
                    $max_schet = $categories[$j]["schet_max_category"];
                    $time_zapusk = $categories[$j]["zapusk_time"];

                    if($categories[$j]["zapusk"] == "on" && (int)strtotime($time_zapusk) < (int)strtotime(date("Y-m-d H:i:s"))){
                        $magazin = new Magazin();
                        $magazin->load_products($id_magazin, $id_category, $schet, $max_schet);
                    }

                    $j += 1;
                }
            }
            $i += 1;
        }
    }




    function create_poddomain($https=null) {
        $https = $https ? $https : CREATE_HTTPS_DOMAIN;

        $model = new Model_Poddomain();
        $info_domain = $model->show_cron_Poddomain("create");

        $info_domain[0]["indikator"] = 1;
        $model->update_Poddomain($info_domain[0]);

        if(!empty($info_domain[0])) {
            $name = $info_domain[0]["name"];
            $name_url = $info_domain[0]["name_url"];
            $name_rus = $info_domain[0]["name_rus"];

            $poddomain = new Domain();
            $poddomain->index($name, $name_url, $name_rus, $https);

            $api = new Api_Webmaster();
            $api->add_site_in_webmaster($name);
        }
        else{
            echo "пусто";
        }
    }



    


    function https_and_ssl() {
        $model = new Model_Poddomain();
        $info_domain = $model->show_cron_Poddomain("ssl");

        if(!empty($info_domain[0])) {
            $name = $info_domain[0]["name"];

            $poddomain = new Domain();
            $poddomain->installation_ssl_certificate($name, "yes");

            $info_domain[0]["ssl_indikator"] = 1;
            $model->update_Poddomain($info_domain[0]);

            sleep(30);
            $poddomain->replace_config($name, "yes", 2);
            $poddomain->open_basedir($name, "yes", 2);
            //$poddomain->service_httpd_restart();
            //$poddomain->exit_connect();
        }
        else{
            echo "пусто";
        }



    }










}










