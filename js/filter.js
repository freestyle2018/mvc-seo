


//$(".fa-plus-square").on("click", ".pole-" + number, function() {



$(document).ready(function() {

    number_1 = 1;

    $(".filter_1 .fa-plus-square").on("click", function() {
        number_1 = number_1 + 1;

        console.log(number_1);

        // создаем еще одно поле
        $(".pole-1").clone().appendTo(".boxer_1");

        // меняем class
        $('.pole-1').last().toggleClass('pole-1').toggleClass('pole-' + number_1);

        // меняем название на "Атрибут - "
        attribute = "Атрибут - " + number_1;
        $('.pole-' + number_1 + ' .box').filter( ':first' ).html(attribute);

        if(number_1 > 1) {
            $(".filter_1 .fa-minus-square").css("display", "block");
        }
    });




    $(".filter_1 .fa-minus-square").on("click", function() {
        // удаляем поле
        $(".pole-" + number_1).remove();

        number_1 = number_1 - 1;

        if(number_1 == 1) {
            $(".filter_1 .fa-minus-square").css("display", "none");
        }
    });







    number_2 = 1;

    $(".filter_2 .fa-plus-square").on("click", function() {
        number_2 = number_2 + 1;

        console.log(number_2);

        // создаем еще одно поле
        $(".block-1").clone().appendTo(".boxer_2");

        // меняем class
        $('.block-1').last().toggleClass('block-1').toggleClass('block-' + number_2);

        // меняем название на "Атрибут - "
        attribute_2 = "Диапазон - " + number_2;
        $('.block-' + number_2 + ' .box').filter( ':first' ).html(attribute_2);

        if(number_2 > 1) {
            $(".filter_2 .fa-minus-square").css("display", "block");
        }
    });




    $(".filter_2 .fa-minus-square").on("click", function() {
        // удаляем поле
        $(".block-" + number_2).remove();

        number_2 = number_2 - 1;

        if(number_2 == 1) {
            $(".filter_2 .fa-minus-square").css("display", "none");
        }
    });









    // ajax обработка формы запроса
    /*$("#addFilter").on('submit', function (e) {
        e.preventDefault();

        var form = $('#addFilter')[0];
        var formData = new FormData(form);

        console.log(formData);

        $.ajax({
            type: 'POST', // метод отправки
            processData: false,
            contentType: false,
            async: false,
            url: '/filter/filter_products/',
            data : formData,
            beforeSend: function(){
                console.log("ajax!!!!");
                $(".answer").html("Выполнение операции...");
            },
            success: function(data){

                data = JSON.parse(data);

                schet = data['schet'];

                $(".answer").html("Закончено! " + schet);
            },
            error: function(data){
                console.log(data); // выводим ошибку в консоль
            }
        });

        return false;
    });*/







});













