<script>
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
        $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
//        $(parentId + ' .msg_body').prepend(element);
    }

    
</script>


<div class="chat_box">
    <div class="chat_head"> Chat Box</div>
    <div class="chat_body"> 
        <div class="user"> Krishna Teja</div>
        <div class="user"> Krishna Teja 2</div>
    </div>
</div>

<div id ="chat" class="msg_box">
    <div class="msg_head">Krishna Teja
        <div class="close">x</div>
    </div>
    <div class="msg_wrap">
        <div class="msg_body">
            <div class="msg_push"></div>
        </div>
        <div class="msg_footer">
            <textarea class="msg_input msg" rows="2" placeholder="Messages..."></textarea>
        </div>
    </div>

</div>
