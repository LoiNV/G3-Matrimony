var addSocket, ns;

$(document).ready(function () {

    addSocket = io.connect('http://localhost:9999/AddFriend');

    addSocket.on('connect', connectFriendHandler());

    addSocket.on('message', messageFriendHandler());

    addSocket.on('disconnect', disconnectFriendHandler());

    $('.addFriend').click(function (evt) {
        
        var fromId = $('.username').attr('id');
        var fromName = $('.username').attr("name");
        var toId = this.id;

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
            ns = data.toId+'_'+data.fromId;            
            
            if (confirm(data.fromName + " request add friend")) {
                answer = 'accept';
                var div = '<div id="'+ns+'" class="user" ><span class="mnrChat"></span> '+data.fromName+'</div>';
                $('.chat_body').prepend(div);                
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
            var name='';
            if ((data.fromName).indexOf('Accepted') > -1) {
                name= data.fromName.replace('Accepted','');
            }
            var div = '<div id="'+ns+'" class="user" ><span class="mnrChat"></span> '+name+'</div>';
                $('.chat_body').prepend(div); 
            alert(data.fromName);
            
        }
    };
}

function disconnectFriendHandler() {
    return function () {
    };
}

