package com.example.phamt.matrimony.Json;

import android.util.Log;

import com.example.phamt.matrimony.Model.Users;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URL;

import ch.boye.httpclientandroidlib.HttpEntity;
import ch.boye.httpclientandroidlib.HttpResponse;
import ch.boye.httpclientandroidlib.HttpStatus;
import ch.boye.httpclientandroidlib.client.ClientProtocolException;
import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.client.methods.HttpGet;
import ch.boye.httpclientandroidlib.client.methods.HttpPost;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;

/**
 * Created by phamt on 12/23/2015.
 */
public class JsonUtil {

    // constructor
    public JsonUtil() {

    }

    public static InputStream getJSONData(String url){
        HttpClient httpClient = new DefaultHttpClient();// nó gạch thế này sao ,uk cai nay` cũ quá ròi
        URI uri;
        InputStream data = null;
        try {
            uri = new URI(url);
            HttpGet method = new HttpGet(uri);
            HttpResponse response = httpClient.execute(method);
            data = response.getEntity().getContent();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }

    static InputStream is = null;
    static JSONObject jobj = null;
    static String json = "";

    public JSONObject makeHttpRequest(String url){
        DefaultHttpClient httpclient = new DefaultHttpClient();
        HttpPost httppost = new HttpPost(url);//sua thanh httpget xem nhe
        try {
            HttpResponse httpresponse = httpclient.execute(httppost);
            HttpEntity httpentity = httpresponse.getEntity();
            is = httpentity.getContent();

        } catch (ClientProtocolException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(is,"iso-8859-1"),8);
            StringBuilder sb = new StringBuilder();
            String line = null;
            try {
                while((line = reader.readLine())!=null){
                    sb.append(line+"\n");

                }
                is.close();
                json = sb.toString();
                try {
                    jobj = new JSONObject(json);
                } catch (JSONException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return jobj;

    }

    public static JSONObject getJson(String url){

        InputStream is = null;
        String result = "";
        JSONObject jsonObject = null;

        // HTTP
        try {
            HttpClient httpclient = new DefaultHttpClient(); // for port 80 requests!
            HttpGet httppost = new HttpGet(url);//Gio sua het cho nay thanh HttpGet nhe uh
            HttpResponse response = httpclient.execute(httppost);
            HttpEntity entity = response.getEntity();
            is = entity.getContent();
        } catch(Exception e) {
            return null;
        }

        // Read response to string
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(is,"utf-8"),8);
            StringBuilder sb = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
            is.close();
            result = sb.toString();
        } catch(Exception e) {
            return null;
        }

        // Convert string to object
        try {
            jsonObject = new JSONObject(result);
        } catch(JSONException e) {
            return null;
        }

        return jsonObject;

    }

//    public InputStream retrieveStream(String url) {
//        DefaultHttpClient client = new DefaultHttpClient();
//        HttpGet getRequest = new HttpGet(url);
//
//        try {
//
//            HttpResponse getResponse = client.execute(getRequest);
//            final int statusCode = getResponse.getStatusLine().getStatusCode();
//
//            if (statusCode != HttpStatus.SC_OK) {
//                Log.w(getClass().getSimpleName(),
//                        "Error " + statusCode + " for URL " + url);
//                return null;
//            }
//            HttpEntity getResponseEntity = getResponse.getEntity();
//            return getResponseEntity.getContent();
//        }
//        catch (IOException e) {
//            getRequest.abort();
//            Log.w(getClass().getSimpleName(), "Error for URL " + url, e);
//        }
//        return null;
//    }
}
