var addSocket;

$(document).ready(function () {

    addSocket = io.connect('http://localhost:9999/AddFriend');

    addSocket.on('connect', connectFriendHandler());

    addSocket.on('message', messageFriendHandler());

    addSocket.on('disconnect', disconnectFriendHandler());

    $('.addFriend').click(function (evt) {
        var fromId = $('.username').attr('id');
        var fromName = $('.username').attr("name");
        var toId = $(evt.target).attr("id");
        console.log(toId);

        var jsonObject = {
            '@class': 'chat.RequestAddFriend',
            fromId: fromId,
            fromName: fromName,
            toId: toId
        };
        addSocket.json.send(jsonObject);

    });
});

function connectFriendHandler() {
    return function () {
    };
}

function messageFriendHandler() {
    return function (data) {
        if ($('.username').attr("id") === data.toId) {
            var answer = '';
            var ns = data.toId + '_' + data.fromId;
            if (confirm(data.fromName + " request add friend")) {
                answer = 'accept';
            }

            $.post('/Matrimony/AddFriend', {fromId: data.fromId, answer: answer}, function (msg) {

                if ((msg).indexOf('Accept') < 0) {
                    var div = '<div id="' + ns + '" class="user" ><span class="mnrChat"></span> ' + data.fromName + '</div>';
                    $('.chat_body').prepend(div);
                    var user = document.getElementById(ns);
                    createMessageBox(user);
                }

                var jsonObject = {
                    '@class': 'chat.RequestAddFriend',
                    fromId: data.fromId,
                    fromName: msg.toString(),
                    toId: ''
                };
                addSocket.json.send(jsonObject);

            });
        }

        if ($('.username').attr("id") === data.fromId && data.toId === '') {
            var name, namespace;
            if ((data.fromName).indexOf('Accept') < 0) {
                name = data.fromName.split('/')[0];
                namespace = data.fromName.split('/')[1];
                var div = '<div id="' + namespace + '" class="user" ><span class="mnrChat"></span> ' + name + '</div>';
                $('.chat_body').prepend(div);
                var user = document.getElementById(namespace);
                createMessageBox(user);
                alert(name + " Accepted");
            } else {
                alert(data.fromName);
            }
        }
    };
}

function disconnectFriendHandler() {
    return function () {
    };
}

