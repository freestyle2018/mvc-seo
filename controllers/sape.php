<?php



// контролер
Class Controller_Sape Extends Controller_Base {
    // шаблон
    public $layouts = "sape";

    static $auth;
    static $authentication;
    static $sape;
    static $filter;
    static $status;

    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();
        self::$sape = new Sape();
        self::$filter = new Filter();

        $status = self::$authentication["status"];

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', $status);
    }

    // экшен
    function index()
    {
        //if(self::$authentication["auth"] === true && self::$status == "admin"){
            $info = self::$sape->index();
            $this->template->vars('projects', $info["projects"]);
        //}

        $this->template->view('index');
    }


    function edit_razdel()
    {
        $name_project = self::$filter->out('string',(empty($_POST['name_project']) ? '' : $_POST['name_project']));
        $id_project = self::$filter->out('int',(empty($_POST['id_project']) ? $_GET['id_project'] : $_POST['id_project']));

        //if(self::$authentication["auth"] === true && self::$status == "admin"){
            if($name_project != ""){
                self::$sape->project_update($id_project, $name_project);
                $this->index();
            }
            else{
                $project = self::$sape->get_project($id_project);
                $this->template->vars('name_project', $project["name"]);
                $this->template->vars('id_project', $id_project);
                $this->template->view('edit_razdel');
            }
        //}
    }


    function add_razdel()
    {

        $name_project = self::$filter->out('string',(empty($_POST['name_project']) ? '' : $_POST['name_project']));

        //if(self::$authentication["auth"] === true && self::$status == "admin"){
            if($name_project != ""){
                $project_id = self::$sape->project_add($name_project);
                $this->index();
            }
            else{
                $this->template->vars('name_project', $name_project);
                $this->template->view('add_razdel');
            }
        //}
    }


    function delete_razdel()
    {
        $id_project = self::$filter->out('string',(empty($_GET['id_project']) ? '' : $_GET['id_project']));

        //if(self::$authentication["auth"] === true && self::$status == "admin"){
            self::$sape->project_delete($id_project);
            $this->index();
        //}
    }



    function show_project()
    {

        $id_project = self::$filter->out('int',(empty($_GET['id_project']) ? '' : $_GET['id_project']));

        //if(self::$authentication["auth"] === true && self::$status == "admin"){
            if($id_project != ""){
                $project = self::$sape->get_project($id_project);
                $info = self::$sape->get_urls($id_project);
                $this->template->vars('project', $project);
                $this->template->vars('info', $info);

                $this->template->view('show_project');
            }
        //}

    }


    function add_urls()
    {
        $urls = empty($_POST['urls']) ? '' : $_POST['urls'];
        $id_project = self::$filter->out('int',(empty($_GET['id_project']) ? '' : $_GET['id_project']));

        //if(self::$authentication["auth"] === true && self::$status == "admin"){
            // Отображаем сам проект
            $project = self::$sape->get_project($id_project);
            $this->template->vars('project', $project);
            $this->template->vars('urls', $urls);

            if($urls != ""){
                //Записываем Urls
                self::$sape->urls_add($urls, $id_project);

                // Отображаем ссылки проект
                $info = self::$sape->get_urls($id_project);
                $this->template->vars('info', $info);
                $this->template->view('show_project');
            }
            else{
                $this->template->view('add_urls');
            }
        //}
    }


    function delete_url()
    {
        $id_url = self::$filter->out('int',(empty($_GET['id_url']) ? '' : $_GET['id_url']));
        self::$sape->url_delete($id_url);

        $id_project = self::$filter->out('int',(empty($_GET['id_project']) ? '' : $_GET['id_project']));
        $this->show_project();
    }



}
