
<a href="/magazin/">Все магазины</a>: <a href="/magazin/add_magazin/">(добавить магазин)</a><br>
<form method="post" action="/magazin/add_category/?id_magazin=<?php echo $magazin["id_magazin"]; ?>">
    <p class="bold">Добавить категорию в магазин <a href="/magazin/show_magazin/?id_magazin=<?php echo $magazin["id_magazin"]; ?>" class="title"><?php echo $magazin["domain_magazin"]; ?></a></p>
    <p>
    <div class="boxer">
        <div class="box-row">
            <div class="box">
                Главная категория<br>
                <span class="small">(Пример: Аксессуары)</span>
            </div>
            <div class="box"><input type="text" size="120" name="glav_category" value="<?php echo $category["glav_category"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Название<br>
                <span class="small">(Пример: Держатели)</span>
            </div>
            <div class="box"><input type="text" size="120" name="name_category" value="<?php echo $category["name_category"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Группа атрибутов
            </div>
            <div class="box"><input type="text" size="120" name="attribute_group_category" value="<?php echo $category["attribute_group_category"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">Url</div>
            <div class="box"><input type="text" size="120" name="url_category" value="<?php echo $category["url_category"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Каталог папки<br>
                <span class="small">(Пример: akessyaru)</span>
            </div>
            <div class="box"><input type="text" size="120" name="catalog_category" value="<?php echo $category["catalog_category"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Название папки<br>
                <span class="small">(Пример: derjateli)</span>
            </div>
            <div class="box"><input type="text" size="120" name="nazvanie_papki_category" value="<?php echo $category["nazvanie_papki_category"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Счет
            </div>
            <div class="box"><input type="text" size="120" name="schet_category" value="<?php echo $category["schet_category"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Счет max
            </div>
            <div class="box"><input type="text" size="120" name="schet_max_category" value="<?php echo $category["schet_max_category"]; ?>"><br></div>
        </div>
    </div>
    <input type="hidden" name="id_magazin" value="<?php echo $category["id_magazin"]; ?>">

    </p>
    <p><input type="submit">
    </p>
</form>
