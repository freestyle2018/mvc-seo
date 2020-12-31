<?php if($authentication === true){ ?>
    <form method="post" action="/poddomain/show/">
    <p class="bold">Редактировать поддомен:</p>
    <p>
    <div class="boxer">



        <div class="box-row">
            <div class="box">
                Название
            </div>
            <div class="box"><input type="text" size="120" name="name" value="<?php echo $domain["name"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Город
            </div>
            <div class="box"><input type="text" size="120" name="gorod" value="<?php echo $domain["gorod"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Rus
            </div>
            <div class="box"><input type="text" size="120" name="name_rus" value="<?php echo $domain["name_rus"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Url
            </div>
            <div class="box"><input type="text" size="120" name="name_url" value="<?php echo $domain["name_url"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Адрес
            </div>
            <div class="box"><input type="text" size="120" name="adress" value="<?php echo $domain["adress"]; ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">
                Расписание
            </div>
            <div class="box"><input type="text" size="120" name="paspisanie" value="<?php echo $domain["paspisanie"]; ?>"><br></div>
        </div>



        <div class="box-row">
            <div class="box">
                Адрес
            </div>
            <div class="box"><input type="checkbox" name="posted_address" value="1" <?php if($domain["posted_address"] == "1") echo "checked" ?>><br></div>
        </div>


        <div class="box-row">
            <div class="box">
                Индикатор
            </div>
            <div class="box"><input type="checkbox" name="indikator" value="1" <?php if($domain["indikator"] == "1") echo "checked" ?>><br></div>
        </div>


        <div class="box-row">
            <div class="box">
                SSL
            </div>
            <div class="box"><input type="checkbox" name="ssl_indikator" value="1" <?php if($domain["ssl_indikator"] == "1") echo "checked" ?>><br></div>
        </div>
    </div>



    <input type="hidden" name="id" value="<?php echo $domain["id"]; ?>">

    </p>
    <p>
        <input type="submit" value="Сохранить">
    </p>
    </form>
<?php    }   ?>






