
<?php if($authentication === true){ ?>

    <?php


    $i = 0;
    while ($i <= sizeof($name)-1) {


        echo "<a href='/iframe/?url=https://web.archive.org/web/*/".$url[$i]."&domain=".$url[$i]."' target='_blank'>архив-iframe</a> - ";

        echo "<a href='https://web.archive.org/web/*/".$url[$i]."' target='_blank'>архив</a> - ";
        echo "<a href='http://".$url[$i]."' target='_blank'>".$name[$i]."</a><br>";

        $i++;
    }

    ?>



    <div class="expired_filter">
        <a href="/expired/domains" target="_blank">
            Expired domains
        </a>
    </div>


<?php    }   ?>




















