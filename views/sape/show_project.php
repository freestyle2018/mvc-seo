



<?php //if($authentication === true){ ?>

<div style="font-size:46px; float:left; padding-right: 7px;">
    <?php echo $project["name"]; ?>
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
<?php //} ?>