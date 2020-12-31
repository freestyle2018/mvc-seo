
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Задание</title>

    <script src="/js/bootstrap.min.js"></script>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/js/filter.js"></script>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
</head>

<body>





    <?php if($authentication === true){ ?>

        <?php
            include ("./views/layouts/menu.php");
        ?>

    <?php    }   ?>








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
                console.log('value = '+value);
            },
            error: function(data){
                alert("Сбой соединения! Скоро все наладится!");
                value = 1;
            }
        });

        if(value == 1){
            return true;
        }
        else{
            return false;
        }


    }

    $(window).on('focus blur load', function() {
        var urls = ["/user/login/", "/user/login", "/user/regist/", "/user/activate", "/user/reset_password/", "/user/reset/", "/user/reset", "/user/out", , "/user/out/", "/"];
        var url = document.location.pathname;

        proverka = in_array(url, urls);
        auth = getSomeValue();

        console.log('proverka = '+proverka);
        console.log('auth = '+auth);

        if(proverka === true) {}
        else{
            if(auth === false && proverka === false) {
               window.location.replace("/user/login/?error=go");
            }
        }
    });
</script>
</html>
