package com.example.phamt.matrimony.Result;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.FragmentManager;
import android.app.ProgressDialog;
import android.app.TabActivity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.TabHost;
import android.widget.TextView;

import com.example.phamt.matrimony.Fragment.TabFragmentAlbum;
import com.example.phamt.matrimony.Fragment.TabFragmentProfile;
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
 * Created by phamt on 12/28/2015.
 */
public class Detail extends TabActivity {
    TextView txtpName, txtpMail, txtpDescription, txtpFullName, txtpGender, txtpBirthDay, txtpMarital, txtpPhone, txtpCity, txtpCountry, txtpReligion, txtpCaste;
    String TAG = "Detail";
    Context context;
    ImageView ivpAvatar;
    String idP = "";
    View v;
    TabHost tabHost;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.detail);
//        onBackPress();
//        getView();
//        Intent intent = getIntent();
//        String id = intent.getStringExtra("id");
//        idP = intent.getStringExtra("id");
//        String url = UrlWebservice.URL + "findIdAndroid/" + id;
//        Log.e(TAG, url);
//        new LongOperation().execute(url);


        tabHost = getTabHost();

        // Tab for Photos
        TabHost.TabSpec tabprofile = tabHost.newTabSpec("Profile");
        // setting Title and Icon for the Tab
        tabprofile.setIndicator("Profile", getResources().getDrawable(R.drawable.icon_photos_tab));
        Intent photosIntent = new Intent(this, TabFragmentProfile.class);
//        photosIntent.putExtra("id", id);
        tabprofile.setContent(photosIntent);

        // Tab for Songs
        TabHost.TabSpec tabalbum = tabHost.newTabSpec("Album");
        tabalbum.setIndicator("Album", getResources().getDrawable(R.drawable.icon_songs_tab));
        Intent songsIntent = new Intent(this, TabFragmentAlbum.class);
//        songsIntent.putExtra("idP", idP);
        tabalbum.setContent(songsIntent);

        // Adding all TabSpec to TabHost
        tabHost.addTab(tabalbum); // Adding photos tab
        tabHost.addTab(tabprofile); // Adding songs tab
        tabHost.setBackgroundColor(getResources().getColor(R.color.textColorPrimary));
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event)
    {
        if (event.getKeyCode() == KeyEvent.KEYCODE_BACK)
        {
            tabHost.clearAllTabs();
            onPause();
        }
        return super.dispatchKeyEvent(event);
    }


    @Override
    protected void onPause() {
        // TODO Auto-generated method stub
        super.onPause();
        this.finish();
    }

//    public void getView() {
//        txtpName = (TextView) findViewById(R.id.txtpName);
//        txtpMail = (TextView) findViewById(R.id.txtpMail);
//        txtpDescription = (TextView) findViewById(R.id.txtpDescription);
//        txtpFullName = (TextView) findViewById(R.id.txtpFullName);
//        txtpGender = (TextView) findViewById(R.id.txtpGender);
//        txtpBirthDay = (TextView) findViewById(R.id.txtpBirthDay);
//        txtpMarital = (TextView) findViewById(R.id.txtpMarital);
//        txtpPhone = (TextView) findViewById(R.id.txtpPhone);
////        txtpCity = (TextView) findViewById(R.id.txtpCity);
////        txtpCountry = (TextView) findViewById(R.id.txtpCountry);
////        txtpReligion = (TextView) findViewById(R.id.txtpReligion);
////        txtpCaste = (TextView) findViewById(R.id.txtpCaste);
//
////        ivpAvatar = (ImageView) findViewById(R.id.ivpAvatar);
//    }
//
//    private class LongOperation extends AsyncTask<String, Void, Void> {
//        private final HttpClient Client = new DefaultHttpClient();
//        private String Content;
//        private String Error = null;
//        private ProgressDialog Dialog = new ProgressDialog(Detail.this);
//        String data = "";
//
//
//        protected void onPreExecute() {
//            Dialog.setMessage("Please wait..");
//            Dialog.show();
//        }
//
//        protected Void doInBackground(String... urls) {
//            BufferedReader reader = null;
//            try {
//                URL url = new URL(urls[0]);
//                URLConnection conn = url.openConnection();
//                conn.setDoOutput(true);
//                OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
//                wr.write(data);
//                wr.flush();
//
//                reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//                StringBuilder sb = new StringBuilder();
//                String line = null;
//
//                while ((line = reader.readLine()) != null) {
//                    sb.append(line + "");
//                }
//
//                Content = sb.toString();
//            } catch (Exception ex) {
//                Error = ex.getMessage();
//            } finally {
//                try {
//
//                    reader.close();
//                } catch (Exception ex) {
//                }
//            }
//            return null;
//        }
//
//        protected void onPostExecute(Void unused) {
//            Dialog.dismiss();
//            Gson g = new Gson();
//            Users u = g.fromJson(Content, Users.class);
//
////            txtpName.setText(u.getName());
////            txtpMail.setText(u.getEmail());
////            if (u.getDescription() == null) {
////                txtpDescription.setText("Không có giới thiệu nào để hiện thị");
////            } else txtpDescription.setText(u.getDescription());
////            String firstname;
////            if (u.getFirstName() == null) {
////                firstname = "";
////            } else firstname = u.getFirstName();
////            String lastname;
////            if (u.getLastName() == null) {
////                lastname = "";
////            } else lastname = u.getFirstName();
////            txtpFullName.setText(firstname + " " + lastname);
////            if (u.isGender()){
////                txtpGender.setText("Man");
////            }
////            else txtpGender.setText("Woman");
////            txtpBirthDay.setText(u.getBirthday());
////            if (u.getMaritalStatus()==null){
////                txtpMarital.setText("");
////            }
////            else txtpMarital.setText(u.getMaritalStatus());
////            if (u.getPhone()==null){
////                txtpPhone.setText("");
////            }
////            else txtpPhone.setText(u.getPhone());
////            if (u.getCity()==null){
////                txtpCity.setText("");
////            }
////            else txtpCity.setText(u.getCity());
////            if (u.getCountry()==null){
////                txtpCountry.setText("");
////            }
////            else txtpCountry.setText(u.getCountry());
////            if(u.getReligion()==null){
////                txtpReligion.setText("");
////            }
////            else txtpReligion.setText(u.getReligion());
////            if (u.getCaste()==null){
////                txtpCaste.setText("");
////            }
////            else txtpCaste.setText(u.getCaste());
//
////            Picasso.with(context).load(u.getAvatar()).into(ivpAvatar);
//
//
//        }
//
//
//    }
}
