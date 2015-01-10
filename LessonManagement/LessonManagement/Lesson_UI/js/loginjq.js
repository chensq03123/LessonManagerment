$(document).ready(function () {
    $('#loginbtn').click(function () {
        $.ajax({
            type: 'POST',
            contentType: "application/json",
            url: "../WebService.asmx/HelloWorld",
            data: '{"name":"chensq","pwd":"78205"}',
            dataType: 'json',
            success: function (result) {
                $('#logcat').html(result.d);

            }
        });
    });
});