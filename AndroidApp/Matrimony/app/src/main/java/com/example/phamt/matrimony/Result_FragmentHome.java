package com.example.phamt.matrimony;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.view.ContextMenu;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.phamt.matrimony.Adapter.CustomGrid;
import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Type;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;

/**
 * Created by phamt on 12/26/2015.
 */
public class Result_FragmentHome extends Activity {
    GridView grid;
    String TAG = "Result_FragmentHome";
    List<Users> ls = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.result_fragmenthome);
        Intent intent = getIntent();
        String gender = intent.getStringExtra("gender");
        boolean g = false;
        if (gender.equalsIgnoreCase("Man"))
            g = true;
        if (gender.equalsIgnoreCase("Woman"))
            g = false;
        String age1 = intent.getStringExtra("age1");
        String age2 = intent.getStringExtra("age2");
        String url = UrlWebservice.URL + "searchAndroid/" + g + "/" + age1 + "/" + age2;

        new LongOperation().execute(url);
    }

    @Override
    public void onBackPressed() {
        finish();
    }



    private class LongOperation extends AsyncTask<String, Void, Void> {
        private final HttpClient Client = new DefaultHttpClient();
        private String Content;
        private String Error = null;
        private ProgressDialog Dialog = new ProgressDialog(Result_FragmentHome.this);
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

            Gson g = new Gson();
            Type collection = new TypeToken<List<Users>>() {
            }.getType();
            ls = g.fromJson(Content, collection);
            List<String> nameTemp = new ArrayList<>();
            List<String> imageTemp = new ArrayList<>();
            List<Integer> idTemp = new ArrayList<>();
            for (Users u : ls) {
                nameTemp.add(u.getName()+"," +u.getAge());
                imageTemp.add(u.getAvatar());
                idTemp.add(u.getId());
            }

            String[] names = nameTemp.toArray(new String[]{});
            String[] images = imageTemp.toArray(new String[]{});
            Integer[] integerArray = idTemp.toArray(new Integer[0]);
            int[] ids = new int[idTemp.size()];
            for (int i = 0; i < idTemp.size(); i++) {
                ids[i] = idTemp.get(i);
            }

            Log.e(TAG, Arrays.deepToString(names));
            Log.e(TAG, Arrays.deepToString(images));
            Log.e(TAG, ids.toString());
            getDataGridView(names, images, ids);
            ls.clear();
        }

        public void getDataGridView(final String[] names, String[] images,final int[] ids) {
            grid = (GridView) findViewById(R.id.grid);
            CustomGrid adapder = new CustomGrid(getApplicationContext(), names, images, ids);
            grid.setAdapter(adapder);
            grid.setOnItemClickListener(new AdapterView.OnItemClickListener() {

                @Override
                public void onItemClick(AdapterView<?> parent, View view,
                                        int position, long id) {
//                    Toast.makeText(Result_FragmentHome.this, "You Clicked at " + ids[+position], Toast.LENGTH_SHORT).show();
                    String idExtra = ids[+position] + "";
                    UrlWebservice.ID_CLICK_SEARCH = ids[+position] + "";
                    Intent intent = new Intent(Result_FragmentHome.this, Profile.class);
                    intent.putExtra("id", idExtra);
                    startActivity(intent);
                }
            });


        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_home, menu);
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
