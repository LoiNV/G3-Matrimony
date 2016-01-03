/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpt.utils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.LinkedList;
import java.util.List;
import model.Advertisement;
import model.Friends;
import model.Images;
import model.Subcription;
import model.Users;

/**
 *
 * @author phamt
 */
public class JsonUtils {
    static Gson g = new Gson();
    
    public static List<Users> getListUser(String json) {
        List<Users> ls = new LinkedList<>();
        Type collectionType = new TypeToken<List<Users>>() {}.getType();
        ls = g.fromJson(json, collectionType);
        return ls;
    }
    
    public static Users getUser(String json){
        Users u = g.fromJson(json, Users.class);
        return u;
    }
    
    public static List<Friends> getListFriends(String json) {
        List<Friends> ls = new LinkedList<>();        
        Type collectionType = new TypeToken<List<Friends>>() {}.getType();
        ls = g.fromJson(json, collectionType);
        return ls;
    }
    
    public static List<Images> getListImages(String json){
        List<Images> list = new LinkedList<>();
        Type collectionType = new TypeToken<List<Images>>() {}.getType();
        list = g.fromJson(json, collectionType);
        return list;
    }
    
    public static List<Subcription> getListSubcriptions(String json){
        List<Subcription> list = new LinkedList<>();
        Type collectionType = new TypeToken<List<Subcription>>() {}.getType();
        list = g.fromJson(json, collectionType);
        return list;
    }
    
    public static List<Advertisement> getListAdv(String json){
        List<Advertisement> list = new LinkedList<>();
        Type collectionType = new TypeToken<List<Advertisement>>() {}.getType();
        list = g.fromJson(json, collectionType);
        return list;
    }
}
