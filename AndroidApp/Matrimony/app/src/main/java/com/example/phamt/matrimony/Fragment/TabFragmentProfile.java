package com.example.phamt.matrimony.Fragment;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v4.app.Fragment;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.example.phamt.matrimony.R;
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
 * Created by phamt on 1/3/2016.
 */
public class TabFragmentProfile extends Activity {
    TextView txtpName, txtpMail, txtpDescription, cityAndCountry, txtpFullName, txtpGender, txtpBirthDay, txtpMarital, txtpPhone, txtpCity, txtpCountry, txtpReligion, txtpCaste;
    String TAG = "TabFragmentProfile";
    Context context;
    ImageView ivpAvatar;
    String id = "";

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tab_fragment_1_profile);

        getView();
        Intent intent = getIntent();
        id = intent.getStringExtra("idP");
        String url = UrlWebservice.URL + "findIdAndroid/" + UrlWebservice.ID_CLICK_SEARCH;
        Log.e(TAG, TAG+url+"\n"+UrlWebservice.ID_FIND);
        new LongOperation().execute(url);
    }

    @Override
    public void onBackPressed() {
//        UrlWebservice.ID_CLICK_SEARCH = "";
//        finish();
    }


    public void getView() {
        txtpName = (TextView) findViewById(R.id.txtpName);
        cityAndCountry = (TextView) findViewById(R.id.cityAndCountry);
        txtpDescription = (TextView) findViewById(R.id.txtpDescription);
        txtpMail = (TextView) findViewById(R.id.txtpMail);
        txtpFullName = (TextView) findViewById(R.id.txtpFullName);
        txtpBirthDay = (TextView) findViewById(R.id.txtpBirthDay);
        txtpMarital = (TextView) findViewById(R.id.txtpMarital);
        txtpPhone = (TextView) findViewById(R.id.txtpPhone);

        ivpAvatar = (ImageView) findViewById(R.id.ivpAvatar);
    }

    private class LongOperation extends AsyncTask<String, Void, Void> {
        private final HttpClient Client = new DefaultHttpClient();
        private String Content;
        private String Error = null;
        private ProgressDialog Dialog = new ProgressDialog(TabFragmentProfile.this);
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
            Gson g = new Gson();
//            Toast.makeText(TabFragmentProfile.this, Content, Toast.LENGTH_LONG).show();
            if (Content.length() > 3) {
                Users u = g.fromJson(Content, Users.class);
                txtpName.setText(u.getName() + ", " + u.getAge());
                txtpMail.setText(u.getEmail());
                if (u.getDescription() == null) {
                    txtpDescription.setText("Không có giới thiệu nào để hiện thị");
                } else txtpDescription.setText(u.getDescription());
                String firstname;
                if (u.getFirstName() == null) {
                    firstname = "";
                } else firstname = u.getFirstName();
                String lastname;
                if (u.getLastName() == null) {
                    lastname = "";
                } else lastname = u.getFirstName();
                txtpFullName.setText(firstname + " " + lastname);
                txtpBirthDay.setText(u.getBirthday());
                if (u.getMaritalStatus() == null) {
                    txtpMarital.setText("");
                } else txtpMarital.setText(u.getMaritalStatus());
                if (u.getPhone() == null) {
                    txtpPhone.setText("");
                } else txtpPhone.setText(u.getPhone());
                String city = "";
                if (u.getCity() != null) {
                    city = u.getCity();
                }
                String country = "";
                if (u.getCountry() != null) {
                    country = u.getCountry();
                }
                cityAndCountry.setText(city + ", " + country);
                Picasso.with(context).load(u.getAvatar()).into(ivpAvatar);
            } else {
                Toast.makeText(TabFragmentProfile.this, "AAAAA", Toast.LENGTH_LONG).show();
            }


        }


    }
}