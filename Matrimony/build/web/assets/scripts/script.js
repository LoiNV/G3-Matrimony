var 
    userName,
    right = 0,
    chatSocket = [],
    notReadMsgChat = [],
    notReadMsgBox = [];

    $(document).ready(function () {

        $('.chat_head').click(function () {
            $('.chat_body').slideToggle('slow');
        });

        var user = document.getElementsByClassName('user');
        for (var i = 0, max = user.length; i < max; i++) {
            createMessageBox(user[i].id);
            closeBox(user[i].id);
            notReadMsgChat[user[i].id] = 0;
            notReadMsgBox[user[i].id] = 0;
        }

        $('.user').click(function (event) {

            var id = $(event.target).attr("id");
            $('#'+id+' .mnrChat').text('');
            notReadMsgChat[id] = 0;
            createMessageBox(id);
        });
    });

    function createMessageBox(id) {

        if ($('#box_' + id).length < 1) {

            userName = 'user_' + Math.floor((Math.random()*1000)+1);

            $.get('/Matrimony/createNamespace', {ns: id}, function (data) {

                if (chatSocket[id] === undefined) {

                    chatSocket[id] = io.connect('http://localhost:9999' + data);

                    chatSocket[id].on('connect', connectHandler(id));

                    chatSocket[id].on('message', messageHandler(id));

                    chatSocket[id].on('disconnect', disconnectHandler(id));
                }

            });

            right += 255;

            var msgBox = $('<div id ="box_' + id + '" class="msg_box" style="right: ' + right + 'px;"></div>');
            var msgHead = $('<div id="' + id + '" class="msg_head" onclick="hideBody(this.id);"><span class="mnrBox"></span>' + id + '<div id="' + id + '" onclick="closeBox(this.id);" class="close">x</div></div>');
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
        $('#'+id+' .mnrBox').text('');
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

                if (!($('#wrap_'+id).is(':visible'))) {

                    notReadMsgBox[id]++;
                    $('#'+id+' .mnrBox').text('('+notReadMsgBox[id]+')');
                }
                
                if (data.userName === userName) {
                    outputA('<span>' + data.userName + ':</span> <span class="send-msg"> ' + data.message +'</span>', id);
                }else
                    outputB('<span">' + data.userName + ':</span> <span class="send-msg">' + data.message +'</span>', id);

            } else { 

                notReadMsgChat[id]++;
                $('#'+id+' .mnrChat').text('('+notReadMsgChat[id]+')');
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
        $('#txt_' + id).val('');

        var jsonObject = {'@class': 'chat.ChatObject',
            userName: userName,
            message: message};
        chatSocket.json.send(jsonObject);

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
