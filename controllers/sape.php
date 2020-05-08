<?php



// контролер
Class Controller_Sape Extends Controller_Base {
    // шаблон
    public $layouts = "first_layouts";

    static $auth;
    static $authentication;
    static $sape;
    static $sape_model;
    static $filter;
    static $status;

    function __construct() {
        self::$auth = new Authentication();
        self::$authentication = self::$auth->index();
        self::$sape = new Sape();
        self::$filter = new Filter();
        self::$sape_model = new Model_Sape();

        $status = self::$authentication["status"];

        $this->template = new Template($this->layouts, get_class($this));

        $this->template->vars('authentication', self::$authentication["auth"]);
        $this->template->vars('status', $status);
    }

    // экшен
    function index()
    {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            //$info = self::$sape->index();
            $info = self::$sape_model->show_Razdels();

            $this->template->vars('projects', $info);
        }

        $this->template->view('index');
    }


    function edit_razdel()
    {
        $name_project = self::$filter->out('string',(empty($_POST['name_project']) ? '' : $_POST['name_project']));
        $zapusk = self::$filter->out('string',(empty($_POST['zapusk']) ? '' : $_POST['zapusk']));
        $date_next = self::$filter->out('date',(empty($_POST['date_next']) ? '' : $_POST['date_next']));
        $shag_time = self::$filter->out('int',(empty($_POST['shag_time']) ? '' : $_POST['shag_time']));
        $kolichestvo_urls = self::$filter->out('int',(empty($_POST['kolichestvo_urls']) ? '' : $_POST['kolichestvo_urls']));
        $nomer = self::$filter->out('int',(empty($_POST['nomer']) ? '' : $_POST['nomer']));
        $id_project = self::$filter->out('int',(empty($_POST['id_project']) ? $_GET['id_project'] : $_POST['id_project']));


        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            if($name_project != ""){
                self::$sape->project_update($id_project, $name_project);

                //echo "nomer = ".$nomer; $nomer = 0;

                $razdel_info = array("id_razdel" => $id_project, "name_razdel" => $name_project, "date_next" => $date_next, "kolichestvo_urls" => $kolichestvo_urls, "date_start" => null, "date_end" => null, "shag_time" => $shag_time, "koef_time" => 120, "prirost" => 'static', "id_project" => SAPE_FOLDER_ID, "zapusk" => $zapusk, "nomer" => $nomer);

                self::$sape_model->update_Razdel($razdel_info);

                $this->index();
            }
            else{
                $project = self::$sape->get_project($id_project);
                $info_db = self::$sape_model->show_Razdel($id_project);
                $this->template->vars('info_db', $info_db);
                $this->template->vars('name_project', $project["name"]);
                $this->template->vars('id_project', $id_project);
                $this->template->view('edit_razdel');
            }
        }
    }


    function add_razdel()
    {

        $name_project = self::$filter->out('string',(empty($_POST['name_project']) ? '' : $_POST['name_project']));
        $kolichestvo_urls = self::$filter->out('string',(empty($_POST['kolichestvo_urls']) ? '' : $_POST['kolichestvo_urls']));

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            if($name_project != ""){
                $project_id = self::$sape->project_add($name_project);
                self::$sape_model->add_Razdel($project_id, $name_project, date("Y-m-d H:i:s"), $kolichestvo_urls);
                $this->index();
            }
            else{
                $this->template->vars('name_project', $name_project);
                $this->template->vars('kolichestvo_urls', $kolichestvo_urls);
                $this->template->view('add_razdel');
            }
        }
    }


    function delete_razdel()
    {
        $id_project = self::$filter->out('string',(empty($_GET['id_project']) ? '' : $_GET['id_project']));

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            self::$sape->project_delete($id_project);
            self::$sape_model->delete_Razdel($id_project);
            self::$sape_model->delete_all_urls_in_Razdel($id_project);
            $this->index();
        }
    }



    function show_project()
    {

        $id_project = self::$filter->out('int',(empty($_GET['id_project']) ? '' : $_GET['id_project']));

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            if($id_project != ""){
                $project = self::$sape->get_project($id_project);
                $info = self::$sape->get_urls($id_project);

                $this->template->vars('project', $project);
                $this->template->vars('info', $info);
                $this->template->view('show_project');
            }
        }

    }


    function add_urls()
    {
        $urls = empty($_POST['urls']) ? '' : $_POST['urls'];
        $id_project = self::$filter->out('int',(empty($_GET['id_project']) ? '' : $_GET['id_project']));

        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            // Отображаем сам проект
            $project = self::$sape->get_project($id_project);
            $this->template->vars('project', $project);
            $this->template->vars('urls', $urls);

            if($urls != ""){
                //Записываем Urls
                $id_urls = self::$sape->urls_add($urls, $id_project);
                print_r($id_urls);

                self::$sape_model->urls_add($id_urls, $urls, $id_project);

                // Отображаем ссылки проект
                $info = self::$sape->get_urls($id_project);
                $this->template->vars('info', $info);
                $this->template->view('show_project');
            }
            else{
                $this->template->view('add_urls');
            }
        }
    }


    function delete_url()
    {
        if(self::$authentication["auth"] === true && self::$authentication["status"] == "admin"){
            $id_url = self::$filter->out('int',(empty($_GET['id_url']) ? '' : $_GET['id_url']));
            self::$sape->url_delete($id_url);

            $id_project = self::$filter->out('int',(empty($_GET['id_project']) ? '' : $_GET['id_project']));
            $this->show_project();
        }


    }



}
