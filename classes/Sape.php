<?php

use Zend\XmlRpc\Client;
use Zend\XmlRpc\Value;



Class Sape {

    public static $my_id;
    public static $client;

    function __construct() {
        self::$client = new Client('http://api.sape.ru/xmlrpc/?v=extended');
        $arg1 = SAPE_NAME;
        $arg2 = SAPE_TOKEN;
        self::$my_id = self::$client->call('sape.login', array($arg1, $arg2));
    }

    function index() {
        $result = array();

        $result["projects"] = $this->get_projects();

        return $result;
    }

    function delete_url($id_url) {
        //(int) sape.placements_delete_url( (int) urlId[, (string) status = null] )
        $result = self::$client->call('sape.placements_delete_url', array($id_url));
    }

    function get_urls($id_project) {
        // (array) sape.get_urls( (int) projectId[, (boolean) showDeleted = false[, (array) options = array()]] )
        $result = self::$client->call('sape.get_urls', array($id_project));

        return $result;
    }


    function urls_add($urls, $id_project) {
        $urls_array = explode("\r\n", $urls);
        $id_urls = array();

        $i = 0;
        while ($i < sizeof($urls_array)){
            $id_urls[$i] = $this->url_add($id_project, $urls_array[$i]);
            $i++;
        }

        return $id_urls;
    }

    function url_add($id_project, $url) {
        // (int) sape.url_add( (int) projectId, (string) url[, (string) name[, (int|string) keyword]] )
        $result = self::$client->call('sape.url_add', array($id_project, $url));

        return $result;
    }

    function project_update($id_project, $name_project) {

        $options  = array(
            "name" => $name_project
        );

        // (boolean) sape.project_update( (int) projectId, (array) options )
        $result = self::$client->call('sape.project_update', array($id_project, $options));
    }





    function get_project($id_project) {
        $result = self::$client->call('sape.get_project', array($id_project));

        return $result;
    }


    function get_projects() {
        // Запрашивает все проекты в аккаунте
        //(array) sape.get_projects_folders()
        $result = self::$client->call('sape.get_projects_folders');

        $i = 0;
        while ($i < sizeof($result)){
            if($result[$i]["folder_id"] == SAPE_FOLDER_ID){
                $id_project[$i] = $result[$i]["project_id"];

                // Получение параметров проекта пользователя.
                $get_project[$i] = self::$client->call('sape.get_project', array($id_project[$i]));
            }
            $i++;
        }

        return $get_project;
    }



    function project_add($name_project) {
        $name = $name_project;

        $options  = array(
            "folder_id" => SAPE_FOLDER_ID
        );

        //(int) sape.project_add( (string) name[, (array) options = array()] )
        $result = self::$client->call('sape.project_add', array($name, $options));

        return $result;
    }


    function project_delete($id_project) {
        // (boolean) sape.project_delete( (int) projectId )
        self::$client->call('sape.project_delete', array($id_project));
    }


    function url_delete($id_url) {
        // (boolean) sape.url_delete( (int) urlId )
        self::$client->call('sape.url_delete', array($id_url));
    }


    function new_url($id_url, $name_url) {
    //function pokupka_url() {
        $urlId = SAPE_ID_URL;

        $filter = array(
            "cy_from" => 10,
            "price_2" => 7,
            "domain_level" => 2,
            "no_double_in_folder" => 1,
            "level_from" => 1,
            "level_2" => 1
        );

        $pn = rand(0, 2);
        $ps = 100;

        // (array) sape.search( (int) urlId, (array) filter[, (int) pn[, (int) ps = 100]] )
        $result = self::$client->call('sape.search', array($urlId, $filter, $pn, $ps));
        $id = array();


        $i = 0;
        while ($i <= 99){
            $id[$i] = $result[$i]["pages"][0]["id"];
            $i++;
        }

        $nomer_plojadki = rand(0, 99);
        $id_plojadki = $id[$nomer_plojadki];

        //self::$client->call('sape.placement_create', array($id_plojadki, $id_url, $name_url));
        self::$client->call('sape.placement_create', array($id_plojadki, $id_url, $name_url));
    }



}
