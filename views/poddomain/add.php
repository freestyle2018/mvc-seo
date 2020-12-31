<?php if($authentication === true){ ?>
    <a href="/poddomain">Поддомены</a>

    <form method="post" id="addForm" action="">
        <!-- <form action="/poddomain/add/" method="post" id="addForm" action=""> -->
        <p><b>Добавить поддомен:</b></p>
        <p>
            Name: <input type="text" name="name" id="name" value="<?php echo $name; ?>"><br>
        </p>
        <p>
            Url: <input type="text" name="name_url" value="<?php echo $name_url; ?>"><br>
        </p>
        <p>
            Name_rus: <input type="text" name="name_rus" value="<?php echo $name_rus; ?>"><br>
        </p>

        <p>
            SSL: <input type="checkbox" name="ssl" value="1"><br>
        </p>

        <input type="hidden" name="indikator" id="indikator" value="yes">

        <p>
            <button type="submit" name="submit" id="submit_save" value="Save">Сохранить</button>
            <button type="submit" name="submit" id="submit" value="Create">Создать и сохранить</button>
        <div class="answer"></div>
        </p>
        <p>
            <a href="/poddomain">вернуться назад</a>
        </p>
    </form>





    <script type="text/javascript">

        var name;

        function ajaxLoad(e) {

            var form = $('#addForm')[0];
            var formData = new FormData(form);

            if(name_submit == "Create"){
                formData.set('indikator', parseInt("1",10));
            }

            console.log(formData);

            $.ajax({
                //async: false,
                beforeSend: function(){
                    console.log("ajax!!!!");

                    if(name_submit == "Create"){
                        $(".answer").html("Создание поддомена...");
                    }

                    if(name_submit == "Save"){
                        $(".answer").html("Сохранение поддомена...");
                    }
                },
                url: '/poddomain/add/',
                type: 'POST', // метод отправки
                dataType: 'json',
                data : formData,
                complete: function(){
                    //alert("Выполнено!");

                    if(name_submit == "Create"){
                        $(".answer").html("Поддомен создан!");
                    }

                    if(name_submit == "Save"){
                        $(".answer").html("Поддомен сохранен!");
                    }
                },
                cache: false,
                processData: false,
                contentType: false,
                /*error: function(data){
                    console.log(data); // выводим ошибку в консоль
                },*/
                timeout: 8000000
            });
            return false;
        }


        $(':button').focus(function() {
            name_submit = $(this).val();
            console.log(name_submit);
        });




        $('#addForm').submit(function(e){
            name = $("#name").val();

            $("#submit").attr("disabled", true);
            $("#submit_save").attr("disabled", true);

            e.preventDefault();

            if(name == ""){
                alert("поле Name пустое!");
            }
            else {
                ajaxLoad(e);
            }


        })







    </script>
<?php    }   ?>



