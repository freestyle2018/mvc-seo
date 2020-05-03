
<a href="/magazin/">Все магазины</a>
<form method="post" action="/magazin/edit_magazin">
    <p class="bold">Правим магазин: <span class="title"><?php echo $magazin["domain_magazin"]; ?></span></p>
    <p>
        <div class="boxer">
            <div class="box-row">
                <div class="box">Домен</div>
                <div class="box"><input type="text" size="120" name="domain_magazin" value="<?php echo $magazin["domain_magazin"]; ?>"><br></div>
            </div>
            <div class="box-row">
                <div class="box">Url продуктов в категории</div>
                <div class="box"><input type="text" size="120" name="url_skachivania_1_magazin" value="<?php echo $magazin["url_skachivania_1_magazin"]; ?>"><br></div>
            </div>
            <div class="box-row">
                <div class="box">Url продуктов в подкатегории</div>
                <div class="box"><input type="text" size="120" name="url_skachivania_2_magazin" value="<?php echo $magazin["url_skachivania_2_magazin"]; ?>"><br></div>
            </div>
            <div class="box-row">
                <div class="box">Название продукта</div>
                <div class="box"><input type="text" size="120" name="name_product_magazin" value="<?php echo $magazin["name_product_magazin"]; ?>"><br></div>
            </div>
            <div class="box-row">
                <div class="box">Цена продукта</div>
                <div class="box"><input type="text" size="120" name="cena_product_magazin" value="<?php echo $magazin["cena_product_magazin"]; ?>"><br></div>
            </div>
            <div class="box-row">
                <div class="box">Изображение продукта</div>
                <div class="box"><input type="text" size="120" name="url_image_product_magazin" value="<?php echo $magazin["url_image_product_magazin"]; ?>"><br></div>
            </div>
            <div class="box-row">
                <div class="box">Атрибуты продукта - ключ</div>
                <div class="box"><input type="text" size="120" name="atribute_key_product_magazin" value="<?php echo $magazin["atribute_key_product_magazin"]; ?>"><br></div>
            </div>

            <div class="box-row">
                <div class="box">Атрибуты продукта - значение</div>
                <div class="box"><input type="text" size="120" name="atribute_value_product_magazin" value="<?php echo $magazin["atribute_value_product_magazin"]; ?>"><br></div>
            </div>
        </div>
        <input type="hidden" name="id_magazin" value="<?php echo $magazin["id_magazin"]; ?>">

    </p>
    <p><input type="submit">
    </p>
</form>