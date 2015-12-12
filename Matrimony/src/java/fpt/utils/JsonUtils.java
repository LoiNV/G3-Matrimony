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
import model.Users;

/**
 *
 * @author phamt
 */
public class JsonUtils {

    public static List<Object> getListJson(String result) {
        List<Object> ls = new LinkedList<>();
        Gson g = new Gson();
        Class<String> res = String.class;
        Type collectionType = new TypeToken<List<Object>>() {}.getType();
        ls = g.fromJson(result, collectionType);
        return ls;
    }
}
