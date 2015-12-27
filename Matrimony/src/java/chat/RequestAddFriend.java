/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chat;

/**
 *
 * @author Admin
 */
public class RequestAddFriend {
    private String fromId;
    private String fromName;
    private String toId;

    public RequestAddFriend() {
    }

    public RequestAddFriend(String fromId, String toId, String fromName) {
        super();
        this.fromId = fromId;
        this.toId = toId;
        this.fromName = fromName;
    }

    public String getFromId() {
        return fromId;
    }

    public void setFromId(String fromId) {
        this.fromId = fromId;
    }

    public String getToId() {
        return toId;
    }

    public void setToId(String toId) {
        this.toId = toId;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

        
}
