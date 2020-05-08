
<div><a href="/sape">Разделы</a> - <a href="/sape/add_razdel">(добавить раздел)</a></div>

<div >
    <?php echo "<a style=\"font-size:46px; float:left; padding-right: 7px;\" href='/sape/edit_razdel?id_project=".$project["id"]."'>" . $project["name"]."</a>"; ?>
</div>
<div style="font-size:16px; padding-top: 28px;">
    <?php echo  "- <a href='/sape/add_urls?id_project=".$project["id"]."'>(добавить urls списком)</a>"; ?>
</div>
<div style="clear:both;"></div>

<?php foreach($info as $key=>$value) :?>
    <div class='quick-links'>

        <?php
        echo "<span style='font-size:26px;'>".$value["url"]."</span>";
        echo " - <a href='/sape/delete_url?id_url=".$value["id"]."&id_project=".$value["project_id"]."'>Удалить</a><br>\r\n";
        ?>

    </div>
<?php endforeach;?>
