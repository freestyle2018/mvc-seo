
<?php

if (isset($elements)) {
    foreach ($elements as $element) {
        echo "<br/>[". $element->nodeName. "]";
        var_dump($element);
        echo "<br><br><br>\r\n\r\n\r\n";
    }
}

?>

<form method="post" action="/xpath/index">
    <p><b>Тестируем XPath:</b></p>
    <p>
    <div class="boxer">
        <div class="box-row">
            <div class="box">Url</div>
            <div class="box"><input type="text" size="120" name="url" value="<?php if(isset($url)) {echo $url;} ?>"><br></div>
        </div>
        <div class="box-row">
            <div class="box">Правило</div>
            <div class="box"><input type="text" size="120" name="pravilo" value="<?php if(isset($pravilo)) {echo htmlspecialchars($pravilo);} ?>"><br></div>
        </div>
    </div>

    </p>
    <p><input type="submit">
    </p>
</form>




