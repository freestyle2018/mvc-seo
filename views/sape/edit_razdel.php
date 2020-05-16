<div><a href="/sape">Разделы</a> - <a href="/sape/add_razdel">(добавить раздел)</a></div>

<form method="post" action="/sape/edit_razdel">
    <p><b>Правим раздел:</b></p>
    <p>
        Name: <input type="text" name="name_project" value="<?php echo $name_project; ?>"><br>
        Запуск: <input type="checkbox" name="zapusk" value="on" <?php if($info_db["zapusk"] == "on"){echo "checked";} ?>><br>
        Дата_next: <input type="text" name="date_next" value="<?php echo $info_db["date_next"]; ?>"><br>
        Шаг времени: <input type="text" name="shag_time" value="<?php echo $info_db["shag_time"]; ?>"><br>
        Количество urls: <input type="text" name="kolichestvo_urls" value="<?php echo $info_db["kolichestvo_urls"]; ?>"><br>
        Номер: <input type="text" name="nomer" value="<?php echo $info_db["nomer"]; ?>"><br>
        Дата_index: <input type="text" name="date_index" value="<?php echo $info_db["date_index"]; ?>"><br>
        <input type="hidden" name="id_project" value="<?php echo $id_project; ?>">
    </p>
    <p><input type="submit">
    </p>
</form>