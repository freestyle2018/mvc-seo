<?php




Class Cron {

    public static $my_id;
    public static $client;

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
                $url_for_zakupka = $sape_model->get_url_for_zakupka($row[$i]["id_razdel"], $row[$i]["nomer"]);

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
        $pr_cy = new PrCy();

        $row = $sape_model->show_Razdels(); // просматриваем все разделы
        $i = 0;

        while ($i <= sizeof($row) - 1){

            $nomer = $row[$i]["nomer"] + 1;
            $id_razdel = $row[$i]["id_razdel"];

            // получает весь список urls которые меньше nomer (т.е. уже закуплены)
            $info_urls = $sape_model->get_urls_in_razdel($id_razdel, $nomer);


            $j = 0;
            while ($j <= sizeof($info_urls) - 1){

                $name_url = $info_urls[$j]["name_url"];
                $id_url   = $info_urls[$j]["id_url"];

                $index = $pr_cy->start($name_url);

                if($index == true){
                    $sape = new Sape();
                    $sape->delete_url($id_url);
                }

                $j++;
            }






            $i++;
        }

    }


}
