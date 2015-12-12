$(document).ready(function () {

    $('.msg_box').hide();
    
    
    $('.chat_head').click(function () {
        $('.chat_body').slideToggle('slow');
    });
    $('.msg_head').click(function () {
        $('.msg_wrap').slideToggle('slow');
    });

    $('.close').click(function () {
        $('.msg_box').hide();
    });

    $('.user').click(function () {

        $('.msg_wrap').show();
        $('.msg_box').show();
    });

    $('textarea').keypress(
            function (e) {
                if (e.keyCode === 13) {
                    sendMessage();
                }
            });

});




	