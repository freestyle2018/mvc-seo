
<a href="/magazin/">Все магазины</a>
<form method="post" action="/magazin/add_magazin/">
    <p class="bold">Добавить магазин: </p>
    <p>
        <div class="boxer">
            <div class="box-row">
                <div class="box">Домен</div>
                <div class="box"><input type="text" size="120" name="domain_magazin" value="<?php echo $domain_magazin; ?>"><br></div>
            </div>
        </div>

    </p>
    <p><input type="submit">
    </p>
</form>