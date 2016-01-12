package com.example.phamt.matrimony.Md5;

import java.security.MessageDigest;

/**
 * Created by phamt on 1/7/2016.
 */
public class maHoaPassword {
    public static String encodePwd(String pass){

        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(pass.getBytes());
            byte byteData[] = md.digest();
            //convert the byte to hex format method 1
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            System.out.println(sb);
            return  sb.toString();
        } catch (Exception ex) {
            return "";
        }
    }
}
