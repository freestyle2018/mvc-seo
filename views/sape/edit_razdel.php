<?php //echo $error; ?>

<form method="post" action="/sape/edit_razdel">
    <p><b>Правим раздел:</b></p>
    <p>
        Name: <input type="text" name="name_project" value="<?php echo $name_project; ?>"><br>
        <input type="hidden" name="id_project" value="<?php echo $id_project; ?>">
    </p>
    <p><input type="submit">
    </p>
</form>