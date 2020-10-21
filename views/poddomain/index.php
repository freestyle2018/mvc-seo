<div><a href="/poddomain">Поддомены</a> - <a href="/poddomain/add/">(добавить поддомен)</a></div>

<a target="_blank" href="/poddomain/adress/">(адреса в базу данных)</a></a><br><br>

<form id="addForm" method="post" action="">


        <?php if(isset($projects)) { ?>

            <?php

            if($page != ""){
                $page_str = "&page=".$page;
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

                    if($value["adress"] != ""){
                        echo "&nbsp;<i class='fa ";
                        if($value["posted_address"] == 1){
                            echo " blue ";
                        }
                        echo "fa-home'> <span class='adress'>".$value["adress"]."<span></i>&nbsp;";
                    }


                //echo " - <a href='/poddomain/reload?id=".$value["id"]."'>Обновить</a>";
                //echo " - <a href='/poddomain/delete?id=".$value["id"]."'>Удалить</a><br>\r\n";
                ?>

            </div>
        <?php endforeach;?>
    <?php } ?>

    Выберите операцию:
    <select id="select_bar" name="operation">
        <option value="">(не выбрана)</option>
        <option value="ssl">Установить SSL сертификат</option>
        <option value="address">Добавить адрес на сайт</option>
    </select>

    <button id="submit" type="submit" value="Выполнить">Выполнить</button>
    <?php echo "<div class='message'>".$message."</div>"; ?>

</form>

<style>
    .pagination li {
        list-style-type: none;
        float: left;
        margin-right: 3px;
    }

    .pagination li.active {
        font-size: 16px;
        font-weight: bold;
    }

    .green {
        color: #1c7430;
        font-weight: bold;
    }

    .message {
        color: #de0003;
        font-weight: bold;
    }

    .adress {
        display: none;
    }

    .blue {
        color: #020a85;
    }

</style>

<div class="answer"></div>
<div class="pagination" style="margin-left:20%;"><?php echo $pagination; ?></div>


<script type="text/javascript">

    $("i.fa-home").on("click", function() {
        $(this).children('span').toggle('slow');
    });




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
        else {
            alert("Не выбраны значения!");
        }

        return false;
    });

</script>



