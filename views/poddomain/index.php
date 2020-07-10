<div><a href="/poddomain">Поддомены</a> - <a href="/poddomain/add/">(добавить поддомен)</a></div>

<?php if(isset($projects)) { ?>
    <?php foreach($projects as $key=>$value) :?>
        <div class='quick-links'>

            <?php
            echo "<a style='font-size:26px; color:#000; text-decoration:underline;' href='/poddomain/show?id=".$value["id"]."'>".$value["name"]."</a>";
            echo " - <a href='/poddomain/reload?id=".$value["id"]."'>Обновить</a>";
            echo " - <a href='/poddomain/delete?id=".$value["id"]."'>Удалить</a><br>\r\n";
            ?>

        </div>
    <?php endforeach;?>
<?php } ?>