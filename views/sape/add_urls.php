<div><a href="/sape">Разделы</a> - <a href="/sape/add_razdel">(добавить раздел)</a></div>

<?php
    echo "<a style='font-size:26px; color:#000; text-decoration:underline;' href='/sape/show_project?id_project=".$project["id"]."'>".$project["name"]."</a>";
?>

<form method="post" action="/sape/add_urls?id_project=<?php echo $project["id"]; ?>">
    <p><b>Добавляем ссылки списком:</b></p>
    <p>
        Список: <textarea rows="10" cols="45" name="urls"><?php echo $urls; ?></textarea><br>
        <input type="hidden" name="id_project" value="<?php echo $project["id"]; ?>">
    </p>
    <p><input type="submit"> (Не нажимайте дважды!)
    </p>
</form>