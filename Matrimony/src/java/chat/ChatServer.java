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
    final SocketIOServer server;
    private boolean isStart;
    
    public ChatServer() {
        Configuration config = new Configuration();
        config.setHostname("localhost");
        config.setPort(9999);
        
        server = new SocketIOServer(config);
        isStart = false;
    }
    
    public void createNameSpace(String nameSpace){

        server.addNamespace(nameSpace).addEventListener("message", ChatObject.class, new DataListener<ChatObject>() {
            @Override
            public void onData(SocketIOClient client, ChatObject data, AckRequest ackRequest) {
                // broadcast messages to all clients
                server.addNamespace(nameSpace).getBroadcastOperations().sendEvent("message", data);
            }
        });
    }

    public void startServerChat(){          
        server.startAsync();
        isStart = true;
    }
    
    public void stopServerChat(){
        server.stop();
        isStart = false;
    }

    public SocketIOServer getServer() {
        return server;
    }

    public boolean isStart() {
        return isStart;
    }
    
    
}
