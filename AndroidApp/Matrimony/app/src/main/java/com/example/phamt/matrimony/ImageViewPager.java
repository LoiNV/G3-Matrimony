package com.example.phamt.matrimony;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Type;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.phamt.matrimony.Adapter.ImageAdapter;
import com.example.phamt.matrimony.Adapter.ImagePagerAdapter;
import com.example.phamt.matrimony.Model.Images;
import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Result.Detail;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.squareup.picasso.Picasso;

import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;

/**
 * Created by phamt on 1/4/2016.
 */
public class ImageViewPager extends Activity {
    // Declare Variable
    Context context;
    int id;
    String TAG = "ImageViewPager";
    List<Images> ls = new ArrayList<>();

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Set title for the ViewPager
        // Get the view from view_pager.xml
        setContentView(R.layout.view_pager);

        // Retrieve data from MainActivity on item click event
        Intent p = getIntent();
//        id = p.getExtras().getInt("id");
        String url = UrlWebservice.FIND_BY_USER_ANDROID + UrlWebservice.ID_CLICK_SEARCH;
        Log.e(TAG, url);
        new LongOperation().execute(url);

    }

    @Override
    public void onBackPressed() {
        finish();
        Intent intent = new Intent(this, Detail.class);
//        intent.putExtra("id", UrlWebservice.ID_CLICK_SEARCH);
        startActivity(intent);
    }

    private class LongOperation extends AsyncTask<String, Void, Void> {
        private final HttpClient Client = new DefaultHttpClient();
        private String Content;
        private String Error = null;
        private ProgressDialog Dialog = new ProgressDialog(ImageViewPager.this);
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
            ls = g.fromJson(Content, collection);

//            Toast.makeText(TabFragmentAlbum.this, ls.size(), Toast.LENGTH_LONG).show();
            List<String> imageTemp = new ArrayList<>();

            for (Images i : ls) {
                imageTemp.add(i.getImgLink());
            }
            final String[] images = imageTemp.toArray(new String[]{});

            ViewPager viewPager = (ViewPager) findViewById(R.id.view_pager);
            ImagePagerAdapter adapter = new ImagePagerAdapter(ImageViewPager.this, images);
            viewPager.setAdapter(adapter);
        }
    }
}
