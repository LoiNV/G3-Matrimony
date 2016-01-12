package com.example.phamt.matrimony.Fragment;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.Toast;

import com.example.phamt.matrimony.Home;
import com.example.phamt.matrimony.Md5.maHoaPassword;
import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.example.phamt.matrimony.R;
import com.example.phamt.matrimony.Result_FragmentHome;
import com.google.gson.Gson;
import com.squareup.picasso.Picasso;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;

import ch.boye.httpclientandroidlib.client.ClientProtocolException;
import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.client.methods.HttpPost;
import ch.boye.httpclientandroidlib.entity.StringEntity;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;

/**
 * Created by phamt on 12/30/2015.
 */
public class PasswordFragment extends Fragment {
    public PasswordFragment(){}
    View rootView;

    String url = null;
    Users u = new Users();
    String passUser = "";
    int idTemp;

    EditText etPassCurrent, etPassword, etPasswordConfirm;
    Button btnChangePass;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        rootView = inflater.inflate(R.layout.fragment_password, container, false);

        etPassCurrent = (EditText) rootView.findViewById(R.id.etPassCurrent);
        etPassword = (EditText) rootView.findViewById(R.id.etPassword);
        etPasswordConfirm = (EditText) rootView.findViewById(R.id.etPasswordConfirm);
        btnChangePass = (Button) rootView.findViewById(R.id.btnChangePass);

        changePasss();
        checkKeyboard();

        return rootView;
    }

    public void changePasss(){

        btnChangePass.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String currentP = etPassCurrent.getText().toString();
                String pass = etPassword.getText().toString();
                String passConfirm = etPasswordConfirm.getText().toString();

                String pUser = passUser;
                int id = idTemp;
                if (currentP.trim().equals("")) {
                    Toast.makeText(rootView.getContext(), "Current Password không được để trống !", Toast.LENGTH_LONG).show();
                    etPassCurrent.requestFocus();
                } else {
                    if (pass.trim().equals("")) {
                        Toast.makeText(rootView.getContext(), "Password không được để trống !", Toast.LENGTH_LONG).show();
                    } else {
                        if (passConfirm.trim().equals("")) {
                            Toast.makeText(rootView.getContext(), "Password Confirm không được để trống !", Toast.LENGTH_LONG).show();
                        } else {

                                url = UrlWebservice.URL + "findIdAndroid/" + UrlWebservice.IDDDD;
                                new findId().execute(url);
//                                Toast.makeText(rootView.getContext(), "TTTTTTT:::" + pUser, Toast.LENGTH_LONG).show();

                        }
                    }
                }
            }
        });
    }

    private void editUser(String url, Users u) {
        try {
            Gson g = new Gson();
            String result = g.toJson(u);

            HttpClient client = new DefaultHttpClient();
            HttpPost request = new HttpPost(url);

            request.setEntity(new StringEntity(result));
            client.execute(request);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public class findId extends AsyncTask<String, Void, Void> {
        private final HttpClient Client = new DefaultHttpClient();
        private String Content;
        private String Error = null;
        private ProgressDialog Dialog = new ProgressDialog(rootView.getContext());
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
            u = g.fromJson(Content, Users.class);
            passUser = u.getPassword();
            idTemp = u.getId();
//            Toast.makeText(rootView.getContext(), "TTTTTTT:::" + passUser, Toast.LENGTH_LONG).show();
            String currentP = maHoaPassword.encodePwd(etPassCurrent.getText().toString());
            String pass = etPassword.getText().toString();
            String passConfirm = etPasswordConfirm.getText().toString();

            if (currentP.equalsIgnoreCase(passUser)) {
                if (pass.equalsIgnoreCase(passConfirm)) {
                    final String url = UrlWebservice.URL + "editPassWordAndroid";
                    String p = maHoaPassword.encodePwd(pass);
                    Users u = new Users(idTemp, p);//
//
                    AsyncTask<Users, Integer, Void> addUserAsyncTask = new AsyncTask<Users, Integer, Void>() {

                        @Override
                        protected Void doInBackground(Users... params) {

                            editUser(url, params[0]);
                            return null;
                        }
                    };
                    addUserAsyncTask.execute(u);
                    Toast.makeText(rootView.getContext(), "Change Password Success!" +"\n", Toast.LENGTH_LONG).show();
                }
                else {
                    Toast.makeText(rootView.getContext(), "Password Confirm không giống!", Toast.LENGTH_LONG).show();
                }
            } else {
                Toast.makeText(rootView.getContext(), "Password Current không đúng !", Toast.LENGTH_LONG).show();
            }
        }
    }

    public void checkKeyboard() {
        etPassCurrent.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (keyboardShown(etPassCurrent.getRootView())) {
                    Log.d("keyboard", "keyboard Up");
                } else {
                    Log.d("keyboard", "keyboard Down");
                    onBackPress();
                }
            }
        });
    }

    private boolean keyboardShown(View rootView) {
        final int softKeyboardHeight = 100;
        Rect r = new Rect();
        rootView.getWindowVisibleDisplayFrame(r);
        DisplayMetrics dm = rootView.getResources().getDisplayMetrics();
        int heightDiff = rootView.getBottom() - r.bottom;
        return heightDiff > softKeyboardHeight * dm.density;
    }

    public void onBackPress(){
        rootView.setFocusableInTouchMode(true);
        rootView.requestFocus();
        rootView.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if( keyCode == KeyEvent.KEYCODE_BACK ) {
                    getFragmentManager().popBackStack(null, FragmentManager.POP_BACK_STACK_INCLUSIVE);
                    getActivity().getFragmentManager().beginTransaction().remove(PasswordFragment.this).commit();

                    getActivity().finish();
                    Intent i = new Intent(rootView.getContext(), Home.class);
                    startActivity(i);
                    return true;
                } else {
                    return false;
                }
            }
        });
    }

    public void onBackPresstwo() {
        rootView.setFocusableInTouchMode(true);
        rootView.requestFocus();
        rootView.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (keyCode == KeyEvent.KEYCODE_BACK) {
                    getFragmentManager().popBackStack(null, FragmentManager.POP_BACK_STACK_INCLUSIVE);
                    getActivity().getFragmentManager().beginTransaction().remove(PasswordFragment.this).commit();

                    getActivity().finish();

                    return true;
                } else {
                    return false;
                }
            }
        });
    }
}
