/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chat;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.DataListener;

/**
 *
 * @author Admin
 */
public class ChatServer {

    public static final String HOST = "localhost";
    public static final int PORT = 9999;
    private SocketIOServer server;
    private boolean start;

    public ChatServer() {

        Configuration config = new Configuration();
            config.setHostname(HOST);
            config.setPort(PORT);

            server = new SocketIOServer(config);

            server.addNamespace("/AddFriend").addEventListener("message", RequestAddFriend.class, new DataListener<RequestAddFriend>() {

                @Override
                public void onData(SocketIOClient client, RequestAddFriend data, AckRequest ackRequest) {
                    server.addNamespace("/AddFriend").getBroadcastOperations().sendEvent("message", data);
                }
            });

            server.startAsync();
            start = true;
        
    }

    public String createNameSpace(String nameSpace) {        
       
        if (server.getNamespace(nameSpace) == null) {

            server.addNamespace(nameSpace).addEventListener("message", ChatObject.class, new DataListener<ChatObject>() {

                @Override
                public void onData(SocketIOClient client, ChatObject data, AckRequest ackRequest) {
                    server.addNamespace(nameSpace).getBroadcastOperations().sendEvent("message", data);
                }
            });
            
        }
        return "http://" + HOST + ":" + PORT + nameSpace;
    }

    public void startServer() {
        if (!start) {
            server.startAsync();
            start = true;
        }
    }

    public void stopServer() {
        if (start) {
            server.stop();
            start = false;
        }
    }

    public boolean isStart() {
        return start;
    }

    public SocketIOServer getServer() {
        return server;
    }

    public String getHost() {
        return HOST;
    }

    public int getPort() {
        return PORT;
    }

}
