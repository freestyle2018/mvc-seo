<?php if($authentication === true){ ?>
    Все магазины: <a href="/magazin/add_magazin/">(добавить магазин)</a>
    <?php foreach($magazins as $key=>$value) :?>
        <div class='quick-links'>
            <?php
            echo "<a style='font-size:26px; color:#000; text-decoration:underline;' href='/magazin/show_magazin?id_magazin=".$value["id_magazin"]."'>".$value["domain_magazin"]."</a>";
            echo " - <a href='/magazin/edit_magazin?id_magazin=".$value["id_magazin"]."'>Редактировать</a>";
            echo " - <a href='/magazin/delete_magazin?id_magazin=".$value["id_magazin"]."'>Удалить</a><br>\r\n";
            ?>

        </div>
    <?php endforeach;?>
    <?php //} ?>
<?php    }   ?>



