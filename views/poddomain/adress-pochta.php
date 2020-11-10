

<form id="addForm" method="post" action="">
    <h2>Почта России</h2>
    Введите id сайтов для которых добавить адреса в базу данных:<br>
    <input type="text" name="first"> - <input type="text" name="last"><br><br>

    <button id="submit" type="submit" value="Выполнить">Добавить</button>
    <div class="answer"></div>
</form>

<script type="text/javascript">


    $("#addForm").on('submit', function (e) {
        e.preventDefault();

        var form = $('#addForm')[0];
        var formData = new FormData(form);

        //$("#submit").attr("disabled", true);

        console.log(formData);

        $.ajax({
            type: 'POST', // метод отправки
            processData: false,
            contentType: false,
            async: false,
            url: '/poddomain/adress_pochta/',
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


        return false;
    });

</script>