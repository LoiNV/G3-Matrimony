package com.example.phamt.matrimony.Fragment;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.Toast;

import com.example.phamt.matrimony.Adapter.ImageAdapter;
import com.example.phamt.matrimony.ImageViewPager;
import com.example.phamt.matrimony.Model.Images;
import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.example.phamt.matrimony.R;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Type;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;

/**
 * Created by phamt on 1/3/2016.
 */
public class TabFragmentAlbum extends Activity {
    String TAG = "TabFragmentAlbum";
    GridView gridview;
    String ids;

    List<Images> ls = new ArrayList<>();

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tab_fragment_2_album);
//        getView();
        Intent intent = getIntent();
        UrlWebservice.ID_FIND_ALBUM = intent.getStringExtra("id");
        String url = UrlWebservice.FIND_BY_USER_ANDROID + UrlWebservice.ID_FIND;
        Log.e(TAG, url);
        new LongOperation().execute(url);
    }

    @Override
    public void onBackPressed() {
//        UrlWebservice.ID_CLICK_SEARCH = "";
//        finish();
    }

    private class LongOperation extends AsyncTask<String, Void, Void> {
        private final HttpClient Client = new DefaultHttpClient();
        private String Content;
        private String Error = null;
        private ProgressDialog Dialog = new ProgressDialog(TabFragmentAlbum.this);
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
//            Toast.makeText(TabFragmentAlbum.this, Content, Toast.LENGTH_LONG).show();
            Gson g = new Gson();
            Type collection = new TypeToken<List<Images>>() {
            }.getType();


//            Toast.makeText(TabFragmentAlbum.this, ls.size()+"", Toast.LENGTH_LONG).show();
            if (Content.length()>3){
                ls = g.fromJson(Content, collection);
                List<String> imageTemp = new ArrayList<>();

                for (Images i : ls) {
                    imageTemp.add(i.getImgLink());
                }
                final String[] images = imageTemp.toArray(new String[]{});

                gridview = (GridView) findViewById(R.id.gridviewss);
//            String[] images = {"http://digipraim.com/data_images/out/2/582649-beautiful-girl-with-big-brown-eyes-wallpapers.jpg",
//                    "http://img2.news.zing.vn/2013/06/18/hot4-2.jpg"};
                gridview.setAdapter(new ImageAdapter(TabFragmentAlbum.this, images));

                // Listening to GridView item click
                gridview.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    public void onItemClick(AdapterView<?> parent, View v, int position, long id) {

                        // Launch ImageViewPager.java on selecting GridView Item
                        Intent i = new Intent(getApplicationContext(), ImageViewPager.class);

                        // Show a simple toast message for the item position
//                        Toast.makeText(TabFragmentAlbum.this, "" + position, Toast.LENGTH_SHORT).show();
                        // Send the click position to ImageViewPager.java using intent
                        i.putExtra("id", UrlWebservice.ID_FIND_ALBUM);

                        // Start ImageViewPager
                        startActivity(i);
                    }
                });
            }
        }
    }
}