

<?php //echo $error; ?>

<form method="post" action="/sape/add_razdel">
    <p><b>Добавить раздел:</b></p>
    <p>
        Name: <input type="text" name="name_project" value="<?php echo $name_project; ?>"><br>
        Количество urls: <input type="text" name="kolichestvo_urls" value="<?php echo $kolichestvo_urls; ?>"><br>
    </p>
    <p><input type="submit">
    </p>
</form>
