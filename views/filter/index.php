


<?php if($authentication === true){ ?>
    <form id="addForm" method="post" action="/filter/filter_products/">
        <p class="bold">Фильтруем товары и создаем подкатегории:</p>
        <p>
        <div class="boxer boxer_1">



            <div class="box-row">
                <div class="box">
                    Название категории
                </div>
                <div class="box">
                    <input type="text" size="67" name="name_category" value="" class="input_margin">
                </div>
                <div></div>
            </div>


            <div class="box-row">
                <div class="box">
                    Дочерняя категория
                </div>
                <div class="box">
                    <input type="text" size="67" name="children_category" value="" class="input_margin">
                </div>
                <div></div>
            </div>


            <div class="box-row">
                <div class="box">
                    Описание дочерней категории
                </div>
                <div class="box">
                    <div  class="input_margin">
                        <textarea rows="3" cols="70" name="children_category_description"></textarea>
                    </div>
                </div>
                <div></div>
            </div>



            <div class="box-row">
                <div class="box">
                    <div class="box filter_1">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>
                        <i class="fa fa-minus-square" aria-hidden="true"></i>
                    </div>
                </div>
            </div>



            <div class="box-row pole-1">
                <div class="box">
                    Атрибут - 1
                </div>
                <div class="box">
                    Название: <input type="text" size="25" name="attribute[name][]" value="">
                    Значение: <input type="text" size="25" name="attribute[value][]" value="">

                    LIKE&nbsp;:&nbsp;<input type="checkbox" name='attribute[like][]' value="1">
                    <input type="hidden" name="attribute[like][]" value="0">

                    <input type="hidden" name="attribute[ot][]" value="">
                    <input type="hidden" name="attribute[do][]" value="">
                </div>
            </div>
        </div>


        <div class="boxer boxer_2">
            <div class="box-row">
                <div class="box">
                    <div class="box filter_2">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>
                        <i class="fa fa-minus-square" aria-hidden="true"></i>
                    </div>
                </div>
            </div>



            <div class="box-row block block-1">
                <div class="box">
                    Диапазон - 1
                </div>
                <div class="box boxer">
                    <div class="info">

                        <div class="name">
                            Название: <input type="text" size="25" name="attribute[name][]" value="">
                        </div>

                        <div class="ot">
                            От: <input type="text" size="6" name="attribute[ot][]" value="">
                        </div>
                        <div class="do">
                            До: <input type="text" size="6" name="attribute[do][]" value="">
                        </div>

                        <input type="hidden" name="attribute[value][]" value="">
                        <input type="hidden" name="attribute[like][]" value="0">

                    </div>
                </div>
            </div>
        </div>

        </p>

        <p>
            <input type="submit" id="submit" value="Создать дамп базы">
        </p>
    </form>

    <div class="answer"></div>









    <script type="text/javascript">

        var name;

        function ajaxLoad(e) {

            var form = $('#addForm')[0];
            var formData = new FormData(form);

            console.log(formData);

            $.ajax({
                //async: false,
                beforeSend: function(){
                    console.log("ajax!!!!");
                    $(".answer").html("Создание дампа...");
                },
                url: '/filter/filter_products/',
                type: 'POST', // метод отправки
                dataType: 'json',
                data : formData,
                complete: function(){
                    $(".answer").html("<a target='_blank' href='/files/filter/dump.sql'>Скачать дамп базы.</a>");
                },
                cache: false,
                processData: false,
                contentType: false,
                timeout: 8000000
            });
            return false;
        }





        $('#addForm').submit(function(e){
            name = $(".input_margin").val();

            //$("#submit").attr("disabled", true);

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
















