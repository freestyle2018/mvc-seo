<div><a href="/poddomain">Поддомены</a> - <a href="/poddomain/add/">(добавить поддомен)</a></div>

<a target="_blank" href="/poddomain/adress/">(адреса в базу данных)</a></a><br><br>

<form id="addForm" method="post" action="">


        <?php if(isset($projects)) { ?>

            <?php

            if($page != ""){
                $page_str = "&page=".$page."&sum=".$sum;
            }

            $razdelu = array(
                'id'    => 'ID',
                'name'  => 'Название',
            );

            foreach ($razdelu as $key => $value):

                echo $value."\r\n";
                if($key == $sortirovka[0] && $sortirovka[1] == ""){
                    echo "<b><a href='?sort=".$key."$page_str'>(по возраст.)</a></b><a href='?sort=-".$key."$page_str'>(по убыв.)</a><br>";
                }
                elseif($key == $sortirovka[0] && $sortirovka[1] == "-"){
                    echo "<a href='?sort=".$key."$page_str'>(по возраст.)</a><b><a href='?sort=-".$key."$page_str'>(по убыв.)</a></b><br>";
                }
                else{
                    echo "<a href='?sort=".$key."$page_str'>(по возраст.)</a><a href='?sort=-".$key."$page_str'>(по убыв.)</a><br>";
                }

            endforeach;
            ?>



            <select class='select_page select_page_1'>
                <option value='25'>25</option>
                <option value='50'>50</option>
                <option value='100'>100</option>
                <option value='250'>250</option>
            </select>


            <span class="check-block">
                <i class='fa fa-check-square check'></i>
                <i class='fa fa-check check'></i>
            </span>




        <?php echo "<br>"; ?>
        <?php foreach($projects as $key=>$value) :?>
            <div class='quick-links'>

                <?php
                //echo "<input type='checkbox' name='".$value["id"]."' value=".$value["id"]."> - ";
                echo "<input type='checkbox' name='ids_poddomain[]' value=".$value["id"]."> - ";
                echo $value["id"]." - ";


                echo "<a target='_blank'";
                    if($value["indikator"] == 1){
                        echo " class='green' ";
                    }
                    echo "href='http://".$value["name"].".".DOMAIN."'>".$value["name"].".".DOMAIN."</a>";

                    echo "<a target='_blank' href='/poddomain/show/?id=".$value["id"]."'><i class='fa fa-eye'></i></a>";


                    if($value["adress"] != ""){
                        echo "&nbsp;<i class='fa ";

                        if($value["adress"] == ", "){
                            echo " red ";
                        }
                        else if($value["posted_address"] == 1){
                            echo " green ";
                        }
                        echo "fa-home'> <span class='adress'>".$value["adress"]."<span></i>&nbsp;";
                    }


                //echo " - <a href='/poddomain/reload?id=".$value["id"]."'>Обновить</a>";
                //echo " - <a href='/poddomain/delete?id=".$value["id"]."'>Удалить</a><br>\r\n";
                ?>

            </div>
        <?php endforeach;?>

        <select class='select_page select_page_2'>
            <option value='25'>25</option>
            <option value='50'>50</option>
            <option value='100'>100</option>
            <option value='250'>250</option>
        </select>

        <span class="check-block">
            <i class='fa fa-check-square check'></i>
            <i class='fa fa-check check'></i>
        </span>
        <br>


    <?php } ?>

    Выберите операцию:
    <select id="select_bar" name="operation">
        <option value="">(не выбрана)</option>
        <option value="ssl">Установить SSL сертификат и HTTPS</option>
        <option value="address">Добавить адрес на сайт</option>
        <option value="add_webmaster">Добавить сайт в Вебмастер</option>
    </select>

    <button id="submit" type="submit" value="Выполнить">Выполнить</button>
    <?php echo "<div class='message'>".$message."</div>"; ?>

</form>

<div class="answer"></div>
<div class="pagination" style="margin-left:20%;"><?php echo $pagination; ?></div>


<script type="text/javascript">


    // разбивает GET запрос на переменные
    function getUrlVars()
    {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for(var i = 0; i < hashes.length; i++)
        {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }


    // после загрузки страницы показывает в select нужное количество страниц
    $(document).ready(function() {
        $array = getUrlVars();
        $sum = $array["sum"];

        $(".select_page option[value='" + $sum + "']").attr("selected", "selected");
    });

    function select()
    {
        $url = $(location).attr('href');
        $url = $url.replace(/&sum=\d{2,4}/g, '');
        window.location.href = $url + "&sum=" + $info;
    }

    // выбор пункта select_page
    // и перезагрузка страницы
    $(".select_page_1").change(function() {
        $info = $(".select_page_1 option:selected").val();
        select();
    });

    $(".select_page_2").change(function() {
        $info = $(".select_page_2 option:selected").val();
        select();
    });




    // выбрать все input-checkbox
    $check_all = false;
    $('.check-block').on('click', function() {

        //alert("aregaesgh");

        $(".check").toggle();

        if($check_all == false){
            $("input[name~='ids_poddomain[]']").prop('checked', true);
            $check_all = true;
        }
        else{
            $("input[name~='ids_poddomain[]']").prop('checked', false);
            $check_all = false;
        }

    });


    // отображать адрес рядом с иконкой
    $("i.fa-home").on("click", function() {
        $(this).children('span').toggle('slow');
    });


   /* $("#submit").on("click", function() {

        if ($("input[name~='ids_poddomain[]']").is(':checked')){
            $("#select_bar").attr("disabled", true);
            $("#submit").attr("disabled", true);
        }
        else {
            alert("Не выбраны значения!");
        }

    });*/


    // ajax обработка формы запроса
    $("#addForm").on('submit', function (e) {
        e.preventDefault();

        var form = $('#addForm')[0];
        var formData = new FormData(form);

        $("#select_bar").attr("disabled", true);
        $("#submit").attr("disabled", true);

        console.log(formData);

        if ($("input[name~='ids_poddomain[]']").is(':checked')){
            $.ajax({
                type: 'POST', // метод отправки
                processData: false,
                contentType: false,
                async: false,
                url: '/poddomain/operation/',
                data : formData,
                beforeSend: function(){
                    console.log("ajax!!!!");
                    $(".answer").html("Выполнение операции...");
                },
                success: function(data){
                    $(".answer").html("Закончено!");
                },
                error: function(data){
                    console.log(data); // выводим ошибку в консоль
                }
            });
        }

        return false;
    });

</script>



