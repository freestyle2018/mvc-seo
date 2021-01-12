
<?php if($authentication === true){ ?>


    <h3>Expired domains:</h3>


    <form id="addForm" method="get" action="/poddomain/operation/">


        <?php


        if(isset($domains)){
            $i = 0;
            while ($i < sizeof($domains)) {

                echo "<input type='checkbox' name='domains[]' value=".$domains[$i]["id"]."> - ";
                echo $domains[$i]["id"]." - ";
                echo "<a target='_blank' href='http://".$domains[$i]["name"]."'>".$domains[$i]["name"]."</a>";

                if($domains[$i]["load_site"] == "0"){
                    echo "<span id='pole".$domains[$i]["id"]."'> Идет загрузка...</span>";
                }
                else if($domains[$i]["load_site"] == "1"){
                    echo " <i class='fa fa-folder green'></i>";
                }
                else{
                    echo "<span id='pole".$domains[$i]["id"]."'></span>";
                }

                echo "<br>\r\n";

                $i++;
            }
        }



        ?>

        <div>Идет загрузка: <span id="content"></span> <span id="content2"></span> - <span id="stop">Остановить</span><span id="content2"></span></div>

        Выберите операцию:
        <select id="select_bar" name="operation">
            <option value="">(не выбрана)</option>
            <option value="delete">удалить</option>
            <option value="clear">очистить</option>
            <option value="load_out_webarchive">скачать из вебархива</option>
        </select>

        <button id="submit" type="submit" value="Выполнить">Выполнить</button>
        <?php echo "<div class='message'>".$message."</div>"; ?>

    </form>
    <div class="answer"></div>



    <script type="text/javascript">

        var count = 0;

        $('input[type=checkbox]').click(function() {
            if (this.checked) {
                count++;
            } else {
                count--;
            }
        });
        

        // ajax обработка формы запроса
        $("#addForm").on('submit', function (e) {
            e.preventDefault();

            if ($("input[name~='domains[]']").is(':checked')){
                var form = $('#addForm')[0];
                var formData = new FormData(form);
                var operation = $("#select_bar").val();


                //$("#select_bar").attr("disabled", true);
                //$("#submit").attr("disabled", true);

                console.log(formData);


                if(operation == "load_out_webarchive" && count > 1){
                    alert("Выбрано более 1-го значения!");
                }
                else{

                    $.ajax({
                        //async: false,
                        beforeSend: function(){
                            console.log("ajax!!!!");
                            $(".answer").html("Выполнение операции...");

                            if(operation == "load_out_webarchive"){
                                $("#content2").html("");
                            }
                            else if(operation == "delete" || operation == "clear"){
                                setInterval('location.reload();',2000);
                            }
                        },
                        url: '/expired/operation/',
                        type: 'POST', // метод отправки
                        dataType: 'json',
                        data : formData,
                        success: function(data){
                            value = data.value;

                            if(value == ""){
                                $(".answer").html("Закончено!");
                            }
                            else{
                                $(".answer").html(value);
                            }
                        },
                        complete: function(data){
                            value = data.value;

                            if(value == ""){
                                $(".answer").html("Закончено!");
                            }
                            else{
                                $(".answer").html(value);
                            }
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



        $('#stop').click(function() {
            $.ajax({
                url: "/expired/stop_loading_webarchive/",
                cache: false,
                dataType: 'json',
                success: function(data){
                    nomer = data.nomer;
                    //alert(nomer);
                    $("#pole" + nomer).html(" ");
                    $("#content2").html("Остановлено");
                }
            });
        });



        function show()
        {
            $.ajax({
                url: "/expired/percentage_of_readiness/",
                cache: false,
                dataType: 'json',
                success: function(data){
                    nomer = data.nomer;
                    value = data.value;

                    $('span[id^="pole"]').html("");
                    $("#pole" + nomer).html(" Идет загрузка...");

                    $("#content").html(value);
                }
            });
        }

        show();
        setInterval('show()',10000);














    </script>




<?php    }   ?>




















