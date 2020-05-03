<?php //if($authentication === true){ ?>
<?php foreach($projects as $key=>$value) :?>
    <div class='quick-links'>

        <?php
        echo "<a style='font-size:26px; color:#000; text-decoration:underline;' href='/sape/show_project?id_project=".$value["id_razdel"]."'>".$value["name_razdel"]."</a>";
        echo " - <a href='/sape/edit_razdel?id_project=".$value["id_razdel"]."'>Редактировать</a>";
        echo " - <a href='/sape/delete_razdel?id_project=".$value["id_razdel"]."'>Удалить</a><br>\r\n";
        ?>

    </div>
<?php endforeach;?>
<?php //} ?>