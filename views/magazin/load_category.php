
<a href="/magazin/">Все магазины</a>: <a href="/magazin/add_magazin/">(добавить магазин)</a><br>
Магазин: <a class="title" href="/magazin/show_magazin/?id_magazin=<?php echo $magazin["id_magazin"]; ?>"><?php echo $magazin["domain_magazin"]; ?></a>
 -
Категория: <span class="title"><?php echo $category["name_category"]; ?></span><br><br>

<form method="post" id="addForm" action="">
    Страница: <input type="text" class="schet" name="schet" value="<?php echo $category["schet_category"]; ?>"><br><br>
    <input type="hidden" class="max_schet" name="max_schet" value="<?php echo $category["schet_max_category"]; ?>">
    <input type="hidden" name="id_category" value="<?php echo $category["id_category"]; ?>">
    <input type="hidden" name="id_magazin" value="<?php echo $category["id_magazin"]; ?>">
    <input type="hidden" name="url_skachivania_1_magazin" value="<?php echo $magazin["url_skachivania_1_magazin"]; ?>">
    <input type="hidden" name="name_product_magazin" value="<?php echo $magazin["name_product_magazin"]; ?>">
    <input type="submit" id="submit" value="ЗАПУСТИТЬ" />
</form>

<div class="answer"></div>


<script type="text/javascript">

    $('#addForm').submit(function(e){
        e.preventDefault();

        var form = $('#addForm')[0];
        var formData = new FormData(form);

        $.ajax({
            type: 'POST', // метод отправки
            processData: false,
            contentType: false,
            async: false,
            url: '/magazin/load_category_page/',
            data : formData,
            //dataType: 'JSON',
            beforeSend: function(){
                $(".answer").html("Идет загрузка..");
            },
            success: function(data){
                //$(".answer").html(data);

                data = JSON.parse(data);
                //data = JSON.parse('{"schet":3}');

                schet = data['schet'];
                max_schet = $('.max_schet').val();

                if(schet <= max_schet) {
                    $(".answer").html('Спарсить ' + data['schet'] + ' страницу?'); // при успешном получении ответа от сервера, заносим полученные данные в элемент с классом answer
                }
                else {
                    $(".answer").html('Задание выполнено!'); // при успешном получении ответа от сервера, заносим полученные данные в элемент с классом answer
                }

                $('.schet').val(data['schet']);
            },
            error: function(data){
                console.log(data); // выводим ошибку в консоль
            }
        });
        return false;
    })

</script>


