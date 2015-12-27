var addSocket;

$(document).ready(function () {

    addSocket = io.connect('http://localhost:9999/AddFriend');

    addSocket.on('connect', connectFriendHandler());

    addSocket.on('message', messageFriendHandler());

    addSocket.on('disconnect', disconnectFriendHandler());

    $('.addFriend').click(function (evt) {

        var fromId = $('.username').attr('id');
        var toId = $(evt.target).attr("id");
        var fromName = $('.username').attr("name");

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
            if (confirm(data.fromName + " Request Add Friend")) {
                answer = 'accept';
            }

            $.get('/Matrimony/AddFriend', {fromId: data.fromId, answer: answer}, function (msg) {
                var jsonObject = {
                    '@class': 'chat.RequestAddFriend',
                    fromId: data.fromId,
                    fromName: msg.toString(),
                    toId: ''
                };
                addSocket.json.send(jsonObject);
            });
        }
        
        if ($('.username').attr("id") === data.fromId && data.toId ==='') {
            alert(data.fromName);
        }
    };
}

function disconnectFriendHandler() {
    return function () {
    };
}

