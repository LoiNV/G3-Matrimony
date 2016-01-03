var
        userName,
        right = 0,
        chatSocket = [],
        notReadMsgChat = [],
        notReadMsgBox = [],
        messages = [];

$(document).ready(function () {

    $('.chat_body').slideToggle('slow');
    
    $('.chat_head').click(function () {
        $('.chat_body').slideToggle('slow');
    });

    var user = document.getElementsByClassName('user');
    
    if (user.lenght===0 || user.lenght === undefined) {        
        $.get('/Matrimony/createNamespace', {ns: "AddFriend"}, function (data) {});
    }
    
    for (var i = 0, max = user.length; i < max; i++) {
        createMessageBox(user[i]);
        closeBox(user[i].id);
        notReadMsgChat[user[i].id] = 0;
        notReadMsgBox[user[i].id] = 0;
        messages[user[i].id] = [];
    }

    $('.user').click(function (event) {
        
        var user = $(event.target);
        
        var id = $(user).attr("id");
        
        $('#' + id + ' .mnrChat').text('');
        notReadMsgChat[id] = 0;
        
        createMessageBox(user);
        
        if (messages[id].length) {
            for (var i = 0, max = messages[id].length; i < max; i++) {
                var name = messages[id][i].split(':')[0];
                var msg = messages[id][i].split(':')[1];
                outputB('<span">' + name + ':</span> <span class="send-msg">' + msg + '</span>', id);
            }
        }
    });    
    
});

function createMessageBox(user) {

    var id = $(user).attr("id");
    
    if ($('#box_' + id).length < 1) {

        userName = $('.username').attr('name');

        $.get('/Matrimony/createNamespace', {ns: id}, function (data) {

            if (chatSocket[id] === undefined) {
                
                chatSocket[id] = io.connect(data);

                chatSocket[id].on('connect', connectHandler(id));

                chatSocket[id].on('message', messageHandler(id));

                chatSocket[id].on('disconnect', disconnectHandler(id));
            }

        });

        right += 255;

        var msgBox = $('<div id ="box_' + id + '" class="msg_box" style="right: ' + right + 'px;"></div>');
        var msgHead = $('<div id="' + id + '" class="msg_head" onclick="hideBody(this.id);">\
                            <span style="color: red; font-weight: bold;" class="'+id+'_mnrBox"></span>' + $(user).html() + '\
                            <div id="' + id + '" onclick="closeBox(this.id);" class="close">X</div></div>');
        var msgWrap = $('<div id="wrap_' + id + '" class="msg_wrap"></div>');
        var msgBody = $('<div class="msg_body"><div class="push_' + id + '"></div></div>');
        var msgFooter = $('<div class="msg_footer"></div>');
        var textarea = $('<textarea id="txt_' + id + '" class="msg_input" rows="2" placeholder="Messages..."></textarea>');

        msgBox.prepend(msgWrap);
        msgBox.prepend(msgHead);
        msgWrap.prepend(msgFooter);
        msgFooter.prepend(textarea);
        msgWrap.prepend(msgBody);
        msgBox.insertAfter('.chat_box');

    }

    $('#txt_' + id).keypress(
            function (e) {
                if (e.keyCode === 13) {
                    sendMessageHandler(id, userName, chatSocket[id]);
                }
            });
}

function hideBody(id) {
    $('#wrap_' + id).slideToggle('slow');
    notReadMsgBox[id] = 0;
    $('.' + id + '_mnrBox').text('');
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

function connectHandler(id) {
    return function () {
        outputA('<span class="connect-msg">Connected to the server!</span>', id);
    };
}

function messageHandler(id) {

    return function (data) {
        if ($('#box_' + id).length) {
            
            if (!($('#wrap_' + id).is(':visible'))) {                
                notReadMsgBox[id]++;
                $('.' + id + '_mnrBox').text('(' + notReadMsgBox[id] + ')');
                console.log(notReadMsgBox[id]+'');
            }

            if (data.userName === userName) {
                outputA('<span>' + data.userName + ':</span> <span class="send-msg"> ' + data.message + '</span>', id);
            } else
                outputB('<span">' + data.userName + ':</span> <span class="send-msg">' + data.message + '</span>', id);

        } else {
            messages[id][notReadMsgChat[id]] = data.userName + ":" + data.message;
            notReadMsgChat[id]++;
            $('#' + id + ' .mnrChat').text('(' + notReadMsgChat[id] + ')');
        }

    };
}

function disconnectHandler(id) {
    return function () {
        outputA('<span class="disconnect-msg">The client has disconnected!</span>', id);
    };
}

function sendMessageHandler(id, userName, chatSocket) {
    var message = $('#txt_' + id).val();
    
    if (message.trim() !== '') {
        $('#txt_' + id).val('');

        var jsonObject = {'@class': 'chat.ChatObject',
            userName: userName,
            message: message};
        chatSocket.json.send(jsonObject);
    }


}

function outputA(message, id) {

    var currentTime = "<span class='time'>" + moment().format('HH:mm') + "</span>";
    var element = $('<div class="msg_a">' + currentTime + ' ' + message + '</div>');
    element.insertBefore('.push_' + id);

    if ($('.msg_body').length > 0) {
        $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
    }

}

function outputB(message, id) {

    var currentTime = "<span class='time'>" + moment().format('HH:mm') + "</span>";
    var element = $('<div class="msg_b">' + currentTime + ' ' + message + '</div>');
    element.insertBefore('.push_' + id);

    if ($('.msg_body').length > 0) {
        $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
    }

}

//    function sendDisconnect() {
//        chat1Socket.disconnect();
//    }
