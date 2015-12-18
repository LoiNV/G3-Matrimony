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

    public static SocketIOServer server;

    public ChatServer() {
        Configuration config = new Configuration();
        config.setHostname("localhost");
        config.setPort(9999);

        server = new SocketIOServer(config);
        
    }

    public static void createNameSpace(String nameSpace) {
                
        if (server.getNamespace(nameSpace) == null) {
            
            server.addNamespace(nameSpace).addEventListener("message", ChatObject.class, new DataListener<ChatObject>() {

                @Override
                public void onData(SocketIOClient client, ChatObject data, AckRequest ackRequest) {
                    server.addNamespace(nameSpace).getBroadcastOperations().sendEvent("message", data);
                }
            });
        }
    }

    public static void removeNameSpace(String nameSpace) {
        server.removeNamespace(nameSpace);
    }

    public void startServer() {
        server.startAsync();            
    }

    public void stopServer() {
        server.stop();        
    }

//    public static void main(String[] args) {
//        ChatServer sv = new ChatServer();
//        sv.startServerChat();       
//
//    }
}
