var right = 0;

$(document).ready(function () {

    $('.chat_head').click(function () {
        $('.chat_body').slideToggle('slow');
    });

    $('.chat_body').click(function (event) {

        var id = $(event.target).attr("id");

        if ($('#box_' + id).length < 1) {
            right += 255;

            var msgBox = $('<div id ="box_' + id + '" class="msg_box" style="right: ' + right + 'px;"></div>');
            var msgHead = $('<div id="' + id + '" class="msg_head" onclick="hideBody(this.id);">' + id + '<div id="' + id + '" onclick="closeBox(this.id);" class="close">x</div></div>');
            var msgWrap = $('<div id="wrap_' + id + '" class="msg_wrap"></div>');
            var msgBody = $('<div class="msg_body"><div class="msg_push"></div></div>');
            var msgFooter = $('<div class="msg_footer"></div>');
            var textarea = $('<textarea class="msg_input msg" rows="2" placeholder="Messages..."></textarea>');

            msgBox.prepend(msgWrap);
            msgBox.prepend(msgHead);
            msgWrap.prepend(msgFooter);
            msgFooter.prepend(textarea);
            msgWrap.prepend(msgBody);
            msgBox.insertAfter('.chat_box');
            $('textarea').keypress(
                    function (e) {
                        if (e.keyCode === 13) {
                            sendMessage();
                        }
                    });
        }

    });

});


function hideBody(id) {
    $('#wrap_' + id).slideToggle('slow');

}

function closeBox(id) {

    var elem = document.getElementById('box_' + id);
    elem.parentNode.removeChild(elem);

    var msgBoxs = document.getElementsByClassName('msg_box');
    var j = msgBoxs.length - 1;
    for (var i = 0; i < msgBoxs.length; i++) {

        msgBoxs[j].style.right = ((i + 1) * 255) + 'px';
        j--;
    }
    right = msgBoxs.length * 255;

}


var userName1 = 'user1_' + Math.floor((Math.random() * 1000) + 1);

var chat1Socket = io.connect('http://localhost:9999/chat1');

function connectHandler(parentId) {
    return function () {
        output('<span class="connect-msg">Client has connected to the server!</span>', parentId);
    };
}

function messageHandler(parentId) {
    return function (data) {
        output('<span class="username-msg">' + data.userName + ':</span> ' + data.message, parentId);
    };
}

function disconnectHandler(parentId) {
    return function () {
        output('<span class="disconnect-msg">The client has disconnected!</span>', parentId);
    };
}

function sendMessageHandler(parentId, userName, chatSocket) {
    var message = $(parentId + ' .msg').val();
    $(parentId + ' .msg').val('');

    var jsonObject = {'@class': 'chat.ChatObject',
        userName: userName,
        message: message};
    chatSocket.json.send(jsonObject);
}


chat1Socket.on('connect', connectHandler('#chat'));

chat1Socket.on('message', messageHandler('#chat'));

chat1Socket.on('disconnect', disconnectHandler('#chat'));

function sendDisconnect() {
    chat1Socket.disconnect();
}

function sendMessage() {
    sendMessageHandler('#chat', userName1, chat1Socket);
}

function output(message, parentId) {
    var currentTime = "<span class='time'>" + moment().format('HH:mm') + "</span>";
    var element = $('<div class="msg_a">' + currentTime + ' ' + message + '</div>');
    element.insertBefore('.msg_push');
    if ($('.msg_body').length > 0) {
        $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
    }

//        $(parentId + ' .msg_body').prepend(element);
}




	