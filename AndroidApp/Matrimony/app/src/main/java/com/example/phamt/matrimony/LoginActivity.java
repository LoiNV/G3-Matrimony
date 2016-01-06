package com.example.phamt.matrimony;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.phamt.matrimony.Fragment.FindPeopleFragment;
import com.example.phamt.matrimony.Json.JsonUtil;
import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import junit.framework.Test;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.LinkedList;
import java.util.List;

import ch.boye.httpclientandroidlib.HttpResponse;
import ch.boye.httpclientandroidlib.client.ClientProtocolException;
import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.client.ResponseHandler;
import ch.boye.httpclientandroidlib.client.methods.HttpGet;
import ch.boye.httpclientandroidlib.client.methods.HttpPost;
import ch.boye.httpclientandroidlib.impl.client.BasicResponseHandler;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;
import ch.boye.httpclientandroidlib.util.EntityUtils;

public class LoginActivity extends Activity {
    EditText etMail, etPassword;
    String TAG = "LoginActivity";

    String ab;
    JSONObject jobj = null;
    JsonUtil jsonparser = new JsonUtil();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        etMail = (EditText) findViewById(R.id.etMail);
        etPassword = (EditText) findViewById(R.id.etPassword);
    }

    public void clickLogin(View v) throws Exception {
        String mail = etMail.getText().toString();
        String password = etPassword.getText().toString();
        String url = UrlWebservice.URL+"findEmailAndPassAndroid/" + mail + "/" + password;
        new LongOperation().execute(url);
    }

    public void clickSignup(View v) {
//        Intent intent = new Intent(LoginActivity.this, Signup.class);
//        startActivity(intent);
        Intent intent = new Intent(LoginActivity.this, TestUpload.class);
        startActivity(intent);
    }


    private class LongOperation extends AsyncTask<String, Void, Void> {
        private final HttpClient Client = new DefaultHttpClient();
        String data = "";
        private String Content = "";

        protected void onPreExecute() {

        }

        protected Void doInBackground(String... urls) {
            BufferedReader reader = null;
            try {
                URL url = new URL(urls[0]);
                URLConnection conn = url.openConnection();
                conn.setDoOutput(true);
                OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
                wr.write(data);
                wr.flush();

                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder sb = new StringBuilder();
                String line = null;

                while ((line = reader.readLine()) != null) {
                    sb.append(line + "");
                }

                Content = sb.toString();
            } catch (Exception ex) {
                ex.getMessage();
            } finally {
                try {

                    reader.close();
                } catch (Exception ex) {
                }
            }
            return null;
        }

        protected void onPostExecute(Void unused) {
            int i = Content.length();
            String mail = etMail.getText().toString();
            String password = etPassword.getText().toString();
            Log.e(TAG, Content);

            if (mail.isEmpty()) {
                Toast.makeText(LoginActivity.this, "Bạn chưa điền mail ! Xin vui lòng kiểm tra lại", Toast.LENGTH_LONG).show();
                etMail.requestFocus();
            }
            else {
                if (password.isEmpty()) {
                    Toast.makeText(LoginActivity.this, "Bạn chưa điền pass ! Xin vui lòng kiểm tra lại", Toast.LENGTH_LONG).show();
                    etPassword.requestFocus();
                }
                else {
                    if (i < 3) {
                        Toast.makeText(LoginActivity.this, "Sai Username Hoặc Password !", Toast.LENGTH_LONG).show();
                    } else {
                        finish();
                        List<Users> ls = new LinkedList<>();
                        Type collection = new TypeToken<List<Users>>() {}.getType();
                        Gson g = new Gson();
                        Class<String> res = String.class;
                        ls = g.fromJson(Content, collection);
                        Intent intent = new Intent(LoginActivity.this, Home.class);
                        intent.putExtra("id", ls.get(0).getId()+"");
                        UrlWebservice.IDDDD = ls.get(0).getId();
                        startActivity(intent);
                    }
                }
            }
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_login, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
