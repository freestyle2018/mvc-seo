<?php




Class Cron {

    public static $my_id;
    public static $client;

    function start() {
        $sape_model = new Model_Sape();
        $row = $sape_model->show_Razdels();



        $i = 0;
        while ($i <= sizeof($row) - 1){
            echo $row[$i]["date_next"];

            // сраниваем время в базе и настоящее (пришло ли время покупать)
            if((int)strtotime($row[$i]["date_next"]) < (int)strtotime(date("Y-m-d H:i:s")) && $row[$i]["zapusk"] == "on"){

                echo $row[$i]["date_next"];

                $sape = new Sape();

                $url_for_zakupka = $sape_model->get_url_for_zakupka($row[$i]["id_razdel"], $row[$i]["nomer"]);

                $id_url = $url_for_zakupka["id_url"];
                $name_url = $url_for_zakupka["name_url"];

                $sape->new_url($id_url, $name_url);


                $razdel_info = $sape_model->show_Razdel($row[$i]["id_razdel"]);


                $date_next = mktime(date("H")+$razdel_info["shag_time"], date("i"), date("s"), date("m")  , date("d")+1, date("Y"));
                $razdel_info["date_next"] = date("Y-m-d H:i:s", $date_next);
                $razdel_info["nomer"] += 1;

                print_r($razdel_info);
                $sape_model->update_Razdel($razdel_info);

            }

            $i++;
        }







    }



}
