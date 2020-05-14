<a href="/magazin/">Все магазины</a>: <a href="/magazin/add_magazin/">(добавить магазин)</a><br>
Магазин: <span class="title"><?php echo $magazin["domain_magazin"]; ?></span>
<a href="/magazin/add_category/?id_magazin=<?php echo $magazin["id_magazin"]; ?>">(добавить категорию)</a><br>

<?php if (isset($categories)) { ?>
    <?php foreach($categories as $key=>$value) :?>
        <div class='quick-links'>
            <?php
            echo "<span class='title'>".$value["name_category"]."</span>";
            echo " - <a href='/magazin/edit_category?id_category=".$value["id_category"]."&id_magazin=".$magazin["id_magazin"]."'>Редактировать</a>";
            echo " - <a href='/magazin/clone_category?id_category=".$value["id_category"]."&id_magazin=".$magazin["id_magazin"]."'>Клонировать</a>";
            echo " - <a href='/magazin/delete_category?id_category=".$value["id_category"]."&id_magazin=".$magazin["id_magazin"]."'>Удалить</a>";
            echo " - <a target='_blank' href='/magazin/load_category?id_category=".$value["id_category"]."&id_magazin=".$magazin["id_magazin"]."'>ЗАГРУЗИТЬ</a><br>\r\n";
            ?>

        </div>
    <?php endforeach;?>
<?php } else { ?>
    <br>(пока нет категорий в магазине)
<?php } ?>