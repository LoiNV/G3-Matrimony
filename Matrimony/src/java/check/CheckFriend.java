/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package check;

import fpt.utils.JsonUtils;
import fpt.ws.FriendsWS;
import java.util.LinkedList;
import java.util.List;
import model.Friends;

/**
 *
 * @author Admin
 */
public class CheckFriend {
    
    static FriendsWS fws = new FriendsWS();
    
    public static List<Friends> getUserFriend(int id){
        
        List<Friends> list = new LinkedList<>();        
        List<Friends> listF = JsonUtils.getListFriends(fws.findAll(String.class));
        
        for (Friends f : listF) {
            if (f.getUserId1().getId() == id || f.getUserId2().getId() == id) {
                list.add(f);
            }
        }
        return list;
    }   
    
    public static boolean checkExistFriend(int id1, int id2){
        
        String namespace1 = id1+"_"+id2;
        String namespace2 = id2+"_"+id1;
        
        String friends = fws.findAll(String.class);
        List<Friends> listF = JsonUtils.getListFriends(friends);
        for (Friends f : listF) {
            if (f.getNamespace().equals(namespace1) || f.getNamespace().equals(namespace2)) {
                return true;
            }
        }
        return false;
    }
}
