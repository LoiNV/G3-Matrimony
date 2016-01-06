package com.example.phamt.matrimony;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.example.phamt.matrimony.Result.Detail;
import com.google.gson.Gson;
import com.squareup.picasso.Picasso;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;


/**
 * Created by phamt on 12/27/2015.
 */
public class Profile extends Activity {
    ImageView ivAvatar;
    TextView txtNameAndAge,txtGenderAndCity,txtDescription, txtId, txtPhoneNumber;
    String TAG = "Profile";
    Context context;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.profile);

        Intent intent = getIntent();
        UrlWebservice.ID_FIND = intent.getStringExtra("id");
        String url = UrlWebservice.URL + "findIdAndroid/" + UrlWebservice.ID_CLICK_SEARCH;
        Log.e(TAG, TAG+url);
        new LongOperation().execute(url);
    }

    @Override
    public void onBackPressed() {
        UrlWebservice.ID_CLICK_SEARCH = "";
        finish();
    }

    public void onClickClose(View v ){
        UrlWebservice.ID_CLICK_SEARCH = "";
        finish();
    }

    public void onClickProfile(View v){
        Intent intent = new Intent(this, Detail.class);
//        intent.putExtra("id", UrlWebservice.ID_CLICK_SEARCH);
        startActivity(intent);
    }

    public void onClickSendSms(View v){
        try {
            if (txtPhoneNumber.getText().toString().isEmpty()){
                Toast.makeText(this, "Người này chưa có số điện thoại !", Toast.LENGTH_LONG).show();
            }
            else {
                Uri uri = Uri.parse("smsto:"+txtPhoneNumber.getText().toString());
                // No permisison needed
                Intent smsIntent = new Intent(Intent.ACTION_SENDTO, uri);
                // Set the message to be sent
                smsIntent.putExtra("sms_body", "Xin Chào, Tôi Có Thể Làm Quen Bạn Chứ ?");
                startActivity(smsIntent);
            }
        } catch (Exception e) {
            Toast.makeText(this,
                    "SMS faild, please try again later!",
                    Toast.LENGTH_LONG).show();
            e.printStackTrace();
        }
    }

    private class LongOperation extends AsyncTask<String, Void, Void> {
        private final HttpClient Client = new DefaultHttpClient();
        private String Content;
        private String Error = null;
        private ProgressDialog Dialog = new ProgressDialog(Profile.this);
        String data = "";


        protected void onPreExecute() {
            Dialog.setMessage("Please wait..");
            Dialog.show();
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
                wr.close();
                reader.close();
            } catch (Exception ex) {
                Error = ex.getMessage();
            } finally {
                try {

                    reader.close();
                } catch (Exception ex) {
                }
            }
            return null;
        }

        protected void onPostExecute(Void unused) {
            Dialog.dismiss();
            ivAvatar = (ImageView) findViewById(R.id.ivAvatar);
            txtNameAndAge = (TextView) findViewById(R.id.txtNameAndAge);
            txtGenderAndCity = (TextView) findViewById(R.id.txtGenderAndCity);
            txtDescription = (TextView) findViewById(R.id.txtDescription);
            txtId = (TextView) findViewById(R.id.txtId);
            txtPhoneNumber = (TextView) findViewById(R.id.txtPhoneNumber);

            Gson g = new Gson();
            Users u = g.fromJson(Content, Users.class);
            txtNameAndAge.setText(u.getName() + "," + u.getAge());
            if(u.isGender()){
                txtGenderAndCity.setText("Man"+","+u.getCity());
            }
            else {
                txtGenderAndCity.setText("Woman"+","+u.getCity());
            }
            String des = u.getDescription();
            if(des==null){
                txtDescription.setText("");
            }
            else {
                txtDescription.setText(u.getDescription());
            }
            txtId.setText(u.getId()+"");
            String phone = u.getPhone();
            if(phone==null){
                txtPhoneNumber.setText("");
            }
            else {
                txtPhoneNumber.setText(u.getPhone().toString());
            }
            Picasso.with(context).load(u.getAvatar()).into(ivAvatar);

            Log.e(TAG, u.getName() + "," + u.getAvatar());
            Log.e(TAG, u.getName() + "," + u.getAge());
            Log.e(TAG, u.isGender()+","+u.getCity());
            Log.e(TAG, u.getDescription());
            Log.e(TAG, u.getId()+"");
            Log.e(TAG, "Phone"+txtPhoneNumber.getText().toString());
        }


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_profile, menu);
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
