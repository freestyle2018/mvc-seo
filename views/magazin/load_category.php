
<a href="/magazin/">Все магазины</a>: <a href="/magazin/add_magazin/">(добавить магазин)</a><br>
Магазин: <a class="title" href="/magazin/show_magazin/?id_magazin=<?php echo $magazin["id_magazin"]; ?>"><?php echo $magazin["domain_magazin"]; ?></a>
-
Категория: <span class="title"><?php echo $category["name_category"]; ?></span><br><br>

<form method="post" id="addForm" action="">
    Страница: <input type="text" class="schet" name="schet" value="<?php echo $category["schet_category"]; ?>"> /
    <?php echo $category["schet_max_category"]; ?><br><br>
    <input type="hidden" class="max_schet" name="max_schet" value="<?php echo $category["schet_max_category"]; ?>">
    <input type="hidden" name="id_category" value="<?php echo $category["id_category"]; ?>">
    <input type="hidden" name="id_magazin" value="<?php echo $category["id_magazin"]; ?>">
    <input type="hidden" name="url_skachivania_1_magazin" value="<?php echo $magazin["url_skachivania_1_magazin"]; ?>">
    <input type="hidden" name="name_product_magazin" value="<?php echo $magazin["name_product_magazin"]; ?>">
    <input type="submit" id="submit" value="ЗАПУСТИТЬ" />
    <button id="submit_no_stop">БЕЗ ОСТАНОВКИ</button>
</form>


<div class="answer_one"></div>
<div class="answer"></div>


<script type="text/javascript">

    var load_bez_ostanovki = "off";

    function ajaxLoad(e) {
        e.preventDefault();

        var form = $('#addForm')[0];
        var formData = new FormData(form);

        $.ajax({
            type: 'POST', // метод отправки
            processData: false,
            contentType: false,
            //async: false,
            url: '/magazin/load_category_page/',
            data : formData,
            //dataType: 'JSON',
            beforeSend: function(){
                $(".answer_one").html("Идет загрузка..");
                $("#submit").attr("disabled", true);
                $("#submit_no_stop").attr("disabled", true);
            },
            success: function(data){
                //$(".answer").html(data);

                data = JSON.parse(data);

                schet = data['schet'];
                max_schet = $('.max_schet').val();

                $(".answer_one").html("Завершена загрузка!");

                if(schet < max_schet) {
                    $(".answer").html('Спарсить ' + data['schet'] + ' страницу?'); // при успешном получении ответа от сервера, заносим полученные данные в элемент с классом answer
                    $("#submit").attr("disabled", false);
                    $("#submit_no_stop").attr("disabled", false);
                    $('.schet').val(data['schet']);

                    function sayHi() {
                        if(load_bez_ostanovki == "on"){
                            $("#submit_no_stop").attr("disabled", true);
                            $('#addForm').submit();   // эмитирует отправку формы
                        }
                    }

                    setTimeout(sayHi, 5000);


                }
                else {
                    $(".answer").html('<h3>Задание выполнено!</h3>'); // при успешном получении ответа от сервера, заносим полученные данные в элемент с классом answer
                    $('.schet').val(data['schet']);
                    $("#submit").attr("disabled", true);
                    $("#submit_no_stop").attr("disabled", true);
                    load_bez_ostanovki == "off"
                }


            },
            error: function(data){
                console.log(data); // выводим ошибку в консоль
            }
        });
        return false;
    }

    $('#addForm').submit(function(e){
        ajaxLoad(e);
    })

    $('#submit_no_stop').click(function(e){ // задаем функцию при нажатиии на элемент <button>
        e.preventDefault();

        if(load_bez_ostanovki == "off"){
            load_bez_ostanovki = "on";
            $("#submit_no_stop").text("ОСТАНОВИТЬ");
            ajaxLoad(e);
        }
        else{
            load_bez_ostanovki = "off";
            $("#submit_no_stop").text("БЕЗ ОСТАНОВКИ");

        }

        console.log(load_bez_ostanovki);
    });


</script>


