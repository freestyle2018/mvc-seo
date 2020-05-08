
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Задание</title>

    <script src="/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>

<body>

    <div class="reg"><a href="/user/regist/">Регистрация</a></div>
    <div class="login"><a href="/user/login/">Авторизация</a></div>



    <?php
        if($authentication === true){
            echo "<div class=\"login\"><a href=\"/xpath/\">XPath</a></div>";
            echo "<div class=\"login\"><a href=\"/sape/\">SAPE</a></div>";
            echo "<div class=\"login\"><a href=\"/magazin/\">Загрузка товара</a></div>";
            echo "<div class=\"reg\"><a href=\"/user/out\">Выйти</a></div>";
        }
    ?>

    <div class="container-fluid">
        <div class="container">
            <?php
                include ($contentPage);
            ?>
        </div>
    </div>





</body>

<!-- Include all compiled plugins (below), or include individual files as needed -->

<script>


    function in_array(value, array) {
        for(var i=0; i<array.length; i++){
            if(value == array[i]) return true;
        }
        return false;
    }

    function getSomeValue() {
        var value = 0;

        // получаем AJAX запрос
        $.ajax({
            url: '/auth',
            dataType: 'json',
            async: false,
            success: function(data)
            {
                __requestComplete = true;
                value = data.auth;
            }
        });
        return value;
    }

    $(window).on('focus blur load', function() {
        var urls = ["/user/login/", "/user/login", "/user/regist/", "/user/activate", "/user/reset_password/", "/user/reset/", "/user/reset", "/"];
        var url = document.location.pathname;

        proverka = in_array(url, urls);
        auth = getSomeValue();

        if(proverka === true) {}
        else{
            if(auth == 0 && (proverka === false)) {
               //window.location.replace("/user/login/?error=go");
            }
        }
    });
</script>
</html>
