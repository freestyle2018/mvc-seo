<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>Тег IFRAME</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>


<style>
    html,body {
        height: 100%;
    }

    .block {
        padding: 5px;
        border: 1px solid #ff0000;
        display: inline-block;
    }

</style>






<?php include ($contentPage); ?>


<script type="text/javascript">
    $('#checkbox').click(function(){

        var isChecked = $("input:checkbox").is(":checked") ? 1:0;
        var NameDomain = $("input.hidden").val();
        var TimeStamp = $("input.archive_timestamp").val();

        //alert(NameDomain);

        if(isChecked == 1){
            $.ajax({
                url: '/expired/cheked',
                type: 'POST',
                data: { domain:NameDomain, timestamp: TimeStamp }
            });
        }
        else{
            $.ajax({
                url: '/expired/delete',
                type: 'POST',
                data: { domain:NameDomain }
            });
        }
    });







</script>


</body>
</html>














