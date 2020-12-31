
<?php if($authentication === true){ ?>


    <h3>Expired domains:</h3>


    <form id="addForm" method="get" action="/poddomain/operation/">


        <?php


        if(isset($domains)){
            $i = 0;
            while ($i < sizeof($domains)) {

                echo "<input type='checkbox' name='domains[]' value=".$domains[$i]["id"]."> - ";
                echo $domains[$i]["id"]." - ";
                echo "<a target='_blank' href='http://".$domains[$i]["name"]."'>".$domains[$i]["name"]."</a><br>\r\n";

                $i++;
            }
        }



        ?>

        Выберите операцию:
        <select id="select_bar" name="operation">
            <option value="">(не выбрана)</option>
            <option value="delete">удалить</option>
        </select>

        <button id="submit" type="submit" value="Выполнить">Выполнить</button>
        <?php echo "<div class='message'>".$message."</div>"; ?>

    </form>
    <div class="answer"></div>



    <script type="text/javascript">



        // ajax обработка формы запроса
        $("#addForm").on('submit', function (e) {
            e.preventDefault();

            if ($("input[name~='domains[]']").is(':checked')){
                var form = $('#addForm')[0];
                var formData = new FormData(form);

                $("#select_bar").attr("disabled", true);
                $("#submit").attr("disabled", true);

                console.log(formData);

                if ($("input[name~='domains[]']").is(':checked')){
                    $.ajax({
                        //async: false,
                        beforeSend: function(){
                            console.log("ajax!!!!");
                            $(".answer").html("Выполнение операции...");
                        },
                        url: '/expired/operation/',
                        type: 'POST', // метод отправки
                        dataType: 'json',
                        data : formData,
                        success: function(data){
                            $(".answer").html("Закончено!");
                        },
                        complete: function(data){
                            $(".answer").html("Закончено!");
                        },
                        cache: false,
                        processData: false,
                        contentType: false,
                        error: function(data){
                            console.log(data); // выводим ошибку в консоль
                        },
                        timeout: 800000
                    });
                }
            }
            else {
                alert("Не выбраны значения!");
            }

            return false;
        });

    </script>




<?php    }   ?>




















