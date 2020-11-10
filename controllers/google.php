<?php

Class Controller_Google Extends Controller_Base {
    // шаблон
    public $layouts = "google";
    static $authentication;


    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();
    }


    function index() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $client = new Google\Client();
            $client->setAuthConfig('client_secret.json');
            $client->setScopes(array('https://www.googleapis.com/auth/siteverification', 'https://www.googleapis.com/auth/webmasters', 'https://www.googleapis.com/auth/siteverification.verify_only'));

            if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
                $client->setAccessToken($_SESSION['access_token']);
                //$drive = new Google_Service_Drive($client);
                //$files = $drive->files->listFiles(array())->getFiles();
                //echo json_encode($files);

                //var_dump($_SESSION['access_token']);

                $serviceWebmasters = new Google_Service_Webmasters( $client );
                $listSites = $serviceWebmasters->sites->listSites();
            } else {
                $redirect_uri = 'https://' . $_SERVER['HTTP_HOST'] . '/google/oauth/';
                header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
            }
        }
    }


    function oauth() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $client = new Google\Client();
            $client->setAuthConfigFile('client_secret.json');
            $client->setRedirectUri('https://' . $_SERVER['HTTP_HOST'] . '/google/oauth/');
            $client->setScopes(array('https://www.googleapis.com/auth/siteverification', 'https://www.googleapis.com/auth/webmasters', 'https://www.googleapis.com/auth/siteverification.verify_only'));

            if (! isset($_GET['code'])) {
                $auth_url = $client->createAuthUrl();
                header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
            } else {
                $client->authenticate($_GET['code']);
                $_SESSION['access_token'] = $client->getAccessToken();

                //var_dump($_SESSION['access_token']);

                $token = $_SESSION['access_token']["access_token"];

                //echo $token;


                $redirect_uri = 'https://' . $_SERVER['HTTP_HOST'] . '/google/token/?token='.$token;
                header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
                //var_dump($_SESSION['access_token']);
            }
        }
    }

    function token() {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            echo $_GET["token"];
        }
    }

}