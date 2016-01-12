package com.example.phamt.matrimony;

import android.app.Activity;
import android.app.DialogFragment;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import com.example.phamt.matrimony.Fragment.DatePickerFragment;
import com.example.phamt.matrimony.KiemTraInternet.KiemTraKetNoiInternet;
import com.example.phamt.matrimony.Md5.maHoaPassword;
import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import ch.boye.httpclientandroidlib.client.ClientProtocolException;
import ch.boye.httpclientandroidlib.client.HttpClient;
import ch.boye.httpclientandroidlib.client.methods.HttpPost;
import ch.boye.httpclientandroidlib.entity.StringEntity;
import ch.boye.httpclientandroidlib.impl.client.DefaultHttpClient;

/**
 * Created by phamt on 12/23/2015.
 */
public class Signup extends FragmentActivity {
    TextView etBirthDay;
    Button btnSignup;
    EditText etUsername, etPassword, etMail;
    RadioButton rbMan;

    KiemTraKetNoiInternet cd;
    boolean check;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.signup);
        cd = new KiemTraKetNoiInternet(getApplicationContext());
        final DatePickerFragment datePickerFragment = new DatePickerFragment();
        etBirthDay = (TextView) findViewById(R.id.etBirthDay);
        datePickerFragment.et = etBirthDay;
        final Boolean check = false;
        etBirthDay.setOnFocusChangeListener(new View.OnFocusChangeListener() {
                                                @Override
                                                public void onFocusChange(View v, boolean hasFocus) {
                                                    DialogFragment newFragment = datePickerFragment;
                                                    newFragment.show(getFragmentManager(), "datePicker");
                                                }
                                            }
        );
        etBirthDay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DialogFragment newFragment = datePickerFragment;
                newFragment.show(getFragmentManager(), "datePicker");
            }
        });
        etUsername = (EditText) findViewById(R.id.etUsername);
        etPassword = (EditText) findViewById(R.id.etPassword);
        etMail = (EditText) findViewById(R.id.etMail);
        rbMan = (RadioButton) findViewById(R.id.rbMan);
        btnSignup = (Button) findViewById(R.id.btnSignup);


        btnSignup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String url = UrlWebservice.URL+"createUser";
                boolean gender = false;
                String user = etUsername.getText().toString();
                String pass= maHoaPassword.encodePwd(etPassword.getText().toString());
                String mail = etMail.getText().toString();
                String birthday = etBirthDay.getText().toString();
                if(user.isEmpty()){
                    Toast.makeText(Signup.this," Username không được để trống !", Toast.LENGTH_LONG).show();
                }
                else {
                    if (etPassword.getText().toString().isEmpty()){
                        Toast.makeText(Signup.this," Password không được để trống !", Toast.LENGTH_LONG).show();
                    }
                    else {
                        if (mail.isEmpty()){
                            Toast.makeText(Signup.this," Mail không được để trống !", Toast.LENGTH_LONG).show();
                        }
                        else {
                            if (birthday.isEmpty()){
                                Toast.makeText(Signup.this," Birthday không được để trống !", Toast.LENGTH_LONG).show();
                            }
                            else {
                                String[] b = birthday.split("-");
                                int b1 = Integer.parseInt(b[b.length - 1]);
                                if((2016-b1)>18){
                                    int age = 0;
                                    try {
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");
                                        Date convertedDate = dateFormat.parse(birthday);
                                        long currentTime = System.currentTimeMillis();
                                        long time = currentTime - convertedDate.getTime();
                                        age = (int) (time / ((24 * 60 * 60 * 1000) + 1)) / 365;
                                    } catch (ParseException e) {
                                        e.printStackTrace();
                                    }

                                    String avatar = "https://cdn0.iconfinder.com/data/icons/people-groups/512/User_Female-512.png";
                                    if (rbMan.isChecked()) {
                                        gender = true;
                                        avatar = "http://s3.amazonaws.com/37assets/svn/765-default-avatar.png";
                                    }


                                    Users u = new Users(user, pass, mail, gender, birthday, age, avatar);

                                    AsyncTask<Users, Integer, Void> addUserAsyncTask = new AsyncTask<Users, Integer, Void>() {

                                        @Override
                                        protected Void doInBackground(Users... params) {

                                            addUser(url, params[0]);
                                            return null;
                                        }
                                    };
                                    addUserAsyncTask.execute(u);
                                    Toast.makeText(Signup.this," Đăng ký thành công !", Toast.LENGTH_LONG).show();
                                }
                                else{
                                    Toast.makeText(Signup.this,"Bạn chưa đủ 18 tuổi !", Toast.LENGTH_LONG).show();
                                    etBirthDay.requestFocus();
                                }
                            }
                        }
                    }
                }



            }
        });
    }


    private void addUser(String url, Users u) {
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
}
