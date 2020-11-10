
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sape</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>

<body>

<div class="reg"><a href="/user/regist/">Регистрация</a></div>
<div class="login"><a href="/user/login/">Авторизация</a></div>
<div class="login"><a href="/user/info">Информация</a></div>

<?php
if($authentication == true){
    echo "<div class=\"reg\"><a href=\"/user/out\">Выйти</a></div>";
}
?>

<div class="container-fluid">
    <div class="container">
        <div><a href="/sape">Разделы</a> - <a href="/sape/add_razdel">(добавить раздел)</a></div>
        <?php
        include ($contentPage);
        ?>
    </div>
</div>





</body>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>




