package com.example.phamt.matrimony.Fragment;

import android.app.AlertDialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.example.phamt.matrimony.Home;
import com.example.phamt.matrimony.Model.UrlWebservice;
import com.example.phamt.matrimony.Model.Users;
import com.example.phamt.matrimony.R;
import com.example.phamt.matrimony.Result_FragmentHome;
import com.google.gson.Gson;
import com.squareup.picasso.Picasso;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
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
 * Created by phamt on 12/30/2015.
 */
public class ProfileFragment extends Fragment {
    public ProfileFragment() {
    }

    String TAG = "ProfileFragment";
    ImageView ivClickEditAvatar, ivAvatar;
    View rootView;
    Button btnSave, btnShow;

    RelativeLayout rlpHeader;
    EditText etEditDescription, etEditName,  etEditMarital, etEditPhone, etEditCity;
    TextView etEditBirthDay;

    Users u = new Users();

    String id = null;
    String url = null;

    String ppath = "";
    private ProgressDialog dialog = null;
    private int serverResponseCode = 0;
    private String upLoadServerUri = null;
    String fileName = null;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        rootView = inflater.inflate(R.layout.fragment_profile, container, false);
        setHasOptionsMenu(true);

//        btnSave = (Button) rootView.findViewById(R.id.btnSave);
        ivAvatar = (ImageView) rootView.findViewById(R.id.ivAvatar);


        etEditDescription = (EditText) rootView.findViewById(R.id.etEditDescription);
        etEditName = (EditText) rootView.findViewById(R.id.etEditName);
        etEditBirthDay = (TextView) rootView.findViewById(R.id.etEditBirthDay);
//        etEditBirthDay = (EditText) rootView.findViewById(R.id.etEditBirthDay);
        etEditMarital = (EditText) rootView.findViewById(R.id.etEditMarital);
        etEditPhone = (EditText) rootView.findViewById(R.id.etEditPhone);
        etEditCity = (EditText) rootView.findViewById(R.id.etEditCity);
//
//
        final DatePickerFragment datePickerFragment = new DatePickerFragment();
        datePickerFragment.et = etEditBirthDay;
        etEditBirthDay.setOnFocusChangeListener(new View.OnFocusChangeListener() {
                                                @Override
                                                public void onFocusChange(View v, boolean hasFocus) {

                                                    DialogFragment newFragment = datePickerFragment;
                                                    newFragment.show(getFragmentManager(), "datePicker");
                                                }
                                            }
        );
        etEditBirthDay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DialogFragment newFragment = datePickerFragment;
                newFragment.show(getFragmentManager(), "datePicker");
            }
        });

        ivAvatar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                clickEditAvatar();
            }
        });
//
        checkKeyboard();
//
        loadDataProfile();
//
        clickEditAvatar();

//        onBackPress();
//

        return rootView;
    }


    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.menu_profile, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_filter) {
            saveEditData();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }


    public void checkKeyboard() {
        rlpHeader = (RelativeLayout) rootView.findViewById(R.id.rlpHeadersss);
        etEditName.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (keyboardShown(etEditName.getRootView())) {
                    rlpHeader.setVisibility(View.GONE);
                } else {
                    Log.d("keyboard", "keyboard Down");
                    rlpHeader.setVisibility(View.VISIBLE);
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

    public void saveEditData() {

        String name = etEditName.getText().toString();
        String birthday = etEditBirthDay.getText().toString();
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

        String marital = etEditMarital.getText().toString();
        String phone = etEditPhone.getText().toString();
        String city = etEditCity.getText().toString();
        String description = etEditDescription.getText().toString();
        if (ppath.isEmpty()) {
            String avatar = u.getAvatar();
            final String url = UrlWebservice.URL + "editUserAndroid";
            Users u = new Users(UrlWebservice.IDDDD, name, birthday, marital, age, city, phone, avatar, description);//
//
            AsyncTask<Users, Integer, Void> addUserAsyncTask = new AsyncTask<Users, Integer, Void>() {

                @Override
                protected Void doInBackground(Users... params) {

                    editUser(url, params[0]);
                    return null;
                }
            };
            addUserAsyncTask.execute(u);
            Toast.makeText(rootView.getContext(), "Lưu thành công !", Toast.LENGTH_LONG).show();
        } else {
            System.out.println("path value..." + ppath + "TEST");

            dialog = ProgressDialog.show(rootView.getContext(), "", "Uploading file...", true);
            //messageText.setText("uploading started.....");
            new Thread(new Runnable() {
                public void run() {
                    int y = uploadFile(ppath);
                }
            }).start();

            final String url = UrlWebservice.URL + "editUserAndroid";

            String[] path = ppath.split("/");
            String pathTeam = path[path.length - 1];
            String avatar = UrlWebservice.PATH_UPLOAD + pathTeam;

            Users u = new Users(UrlWebservice.IDDDD, name, birthday, marital, age, city, phone, avatar, description);//

            AsyncTask<Users, Integer, Void> addUserAsyncTask = new AsyncTask<Users, Integer, Void>() {

                @Override
                protected Void doInBackground(Users... params) {

                    editUser(url, params[0]);
                    return null;
                }
            };
            addUserAsyncTask.execute(u);
            Toast.makeText(rootView.getContext(), "Lưu thành công !", Toast.LENGTH_LONG).show();
        }
    }

    public void clickEditAvatar() {
        upLoadServerUri = UrlWebservice.URL_UPLOAD;
        ivClickEditAvatar = (ImageView) rootView.findViewById(R.id.ivClickEditAvatar);
        ivClickEditAvatar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                selectImage();
            }
        });
    }

    public void loadDataProfile() {
            url = UrlWebservice.URL + "findIdAndroid/" + UrlWebservice.IDDDD;
            new findId().execute(url);
    }

    public void onBackPress() {
        rootView.setFocusableInTouchMode(true);
        rootView.requestFocus();
        rootView.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (keyCode == KeyEvent.KEYCODE_BACK) {
                    getFragmentManager().popBackStack(null, FragmentManager.POP_BACK_STACK_INCLUSIVE);
                    getActivity().getFragmentManager().beginTransaction().remove(ProfileFragment.this).commit();

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
                    getActivity().getFragmentManager().beginTransaction().remove(ProfileFragment.this).commit();

                    getActivity().finish();

                    return true;
                } else {
                    return false;
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


    private class findId extends AsyncTask<String, Void, Void> {
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
            if (u.getDescription() == null)
                etEditDescription.setText("Chưa có description.");
            else etEditDescription.setText(u.getDescription());

            if (u.getName() == null)
                etEditName.setText("");
            else etEditName.setText(u.getName());

            if (u.getBirthday() == null)
                etEditBirthDay.setText("");
            else etEditBirthDay.setText(u.getBirthday());

            if (u.getMaritalStatus() == null)
                etEditMarital.setText("");
            else etEditMarital.setText(u.getMaritalStatus());

            if (u.getPhone() == null)
                etEditPhone.setText("");
            else etEditPhone.setText(u.getPhone());

            if (u.getCity() == null)
                etEditCity.setText("");
            else etEditCity.setText(u.getCity());
            Picasso.with(rootView.getContext()).load(u.getAvatar()).into(ivAvatar);
        }
    }


    private void selectImage() {
        final CharSequence[] options = {"Take Photo", "Choose from Gallery", "Cancel"};

        AlertDialog.Builder builder = new AlertDialog.Builder(rootView.getContext());
        builder.setTitle("Add Photo!");
        builder.setItems(options, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int item) {
                if (options[item].equals("Take Photo")) {
                    Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                    File f = new File(android.os.Environment.getExternalStorageDirectory(), "temp.jpg");
                    intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(f));
                    startActivityForResult(intent, 1);
                } else if (options[item].equals("Choose from Gallery")) {

                    System.out.println("before call ...");
                    Intent intent = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);

                    startActivityForResult(intent, 2);

                } else if (options[item].equals("Cancel")) {
                    dialog.dismiss();
                }
            }
        });
        builder.show();
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

//        if (resultCode == RESULT_OK) {
        if (requestCode == 1) {
            File f = new File(Environment.getExternalStorageDirectory().toString());
            for (File temp : f.listFiles()) {
                if (temp.getName().equals("temp.jpg")) {
                    f = temp;
                    break;
                }
            }
            try {
                Bitmap bitmap;
                BitmapFactory.Options bitmapOptions = new BitmapFactory.Options();

                bitmap = BitmapFactory.decodeFile(f.getAbsolutePath(),
                        bitmapOptions);

                ivAvatar.setImageBitmap(bitmap);


                String path = android.os.Environment
                        .getExternalStorageDirectory()
                        + File.separator + "temp.jpg";
                //  + "Phoenix" + File.separator + "default";

                System.out.println("image path..." + path);

                ppath = path;

                //uploadFile(ppath);

                //  f.delete();
                OutputStream outFile = null;
                File file = new File(path, String.valueOf(System.currentTimeMillis()) + ".jpg");
                try {
                    outFile = new FileOutputStream(file);
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 85, outFile);
                    outFile.flush();
                    outFile.close();
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (requestCode == 2) {

            Uri selectedImage = data.getData();
            String[] filePath = {MediaStore.Images.Media.DATA};
            Cursor c = getActivity().getContentResolver().query(selectedImage, filePath, null, null, null);
            c.moveToFirst();
            int columnIndex = c.getColumnIndex(filePath[0]);
            String picturePath = c.getString(columnIndex);
            c.close();
            Bitmap thumbnail = (BitmapFactory.decodeFile(picturePath));
//                Log.w("path of image from gallery......******************.........", picturePath+"");

            String selectedImagePath;
            selectedImagePath = getPath(selectedImage);

            System.out.println("before set image...");
            ivAvatar.setImageBitmap(thumbnail);
            // uploadFile(ppath);
            System.out.println("image path from gallery..." + selectedImagePath);

            ppath = selectedImagePath;
        }
//        }
    }

    public int uploadFile(String ppath2) {

        fileName = ppath2;

        HttpURLConnection conn = null;
        DataOutputStream dos = null;
        String lineEnd = "\r\n";
        String twoHyphens = "--";
        String boundary = "*****";
        int bytesRead, bytesAvailable, bufferSize;
        byte[] buffer;
        int maxBufferSize = 1 * 1024 * 1024;
        File sourceFile = new File(ppath2);

        if (!sourceFile.isFile()) {

            dialog.dismiss();

            Log.e("uploadFile", "Source File not exist :" + ppath);

            getActivity().runOnUiThread(new Runnable() {
                public void run() {
                    //  messageText.setText("Source File not exist :"+ ppath);
                }
            });
            return 0;

        } else {
            try {

                // open a URL connection to the Servlet
                FileInputStream fileInputStream = new FileInputStream(sourceFile);
                URL url = new URL(upLoadServerUri);

                // Open a HTTP  connection to  the URL
                conn = (HttpURLConnection) url.openConnection();
                conn.setDoInput(true); // Allow Inputs
                conn.setDoOutput(true); // Allow Outputs
                conn.setUseCaches(false); // Don't use a Cached Copy
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Connection", "Keep-Alive");
                conn.setRequestProperty("ENCTYPE", "multipart/form-data");
                conn.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
                conn.setRequestProperty("uploaded_file", fileName);

                dos = new DataOutputStream(conn.getOutputStream());

                dos.writeBytes(twoHyphens + boundary + lineEnd);
                dos.writeBytes("Content-Disposition: form-data; name=\"uploaded_file\";filename=\""
                        + fileName + "\"" + lineEnd);


                dos.writeBytes(lineEnd);


                // create a buffer of  maximum size
                bytesAvailable = fileInputStream.available();

                bufferSize = Math.min(bytesAvailable, maxBufferSize);
                buffer = new byte[bufferSize];

                // read file and write it into form...
                bytesRead = fileInputStream.read(buffer, 0, bufferSize);

                while (bytesRead > 0) {

                    dos.write(buffer, 0, bufferSize);
                    bytesAvailable = fileInputStream.available();
                    bufferSize = Math.min(bytesAvailable, maxBufferSize);
                    bytesRead = fileInputStream.read(buffer, 0, bufferSize);

                }

                // send multipart form data necesssary after file data...
                dos.writeBytes(lineEnd);
                dos.writeBytes(twoHyphens + boundary + twoHyphens + lineEnd);

                // Responses from the server (code and message)
                serverResponseCode = conn.getResponseCode();

                String serverResponseMessage = conn.getResponseMessage();

                Log.i("uploadFile", "HTTP Response is : "
                        + serverResponseMessage + ": " + serverResponseCode);

                final HttpURLConnection cc = conn;


                if (serverResponseCode == 200) {

                    getActivity().runOnUiThread(new Runnable() {
                        public void run() {
                            String msg = "File Upload Completed.\n\n See uploaded file here : \n\n"
                                    + " E:/";
                            //messageText.setText(msg);
                            Toast.makeText(rootView.getContext(), "File Upload Complete.", Toast.LENGTH_SHORT).show();
                        }
                    });
                }

                //close the streams //
                fileInputStream.close();
                dos.flush();
                dos.close();

            } catch (MalformedURLException ex) {

                dialog.dismiss();
                ex.printStackTrace();

                getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        //messageText.setText("MalformedURLException Exception : check script url.");
                        Toast.makeText(rootView.getContext(), "MalformedURLException", Toast.LENGTH_SHORT).show();
                    }
                });

                Log.e("Upload file to server", "error: " + ex.getMessage(), ex);
            } catch (Exception e) {

                dialog.dismiss();
                e.printStackTrace();

                getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        //messageText.setText("Got Exception : see logcat ");
                        Toast.makeText(rootView.getContext(), "Got Exception : see logcat ", Toast.LENGTH_SHORT).show();
                    }
                });
//                Log.e("Upload file to server Exception", "Exception : "  + e.getMessage(), e);
            }
            dialog.dismiss();

            return serverResponseCode;

        } // End else block
    }


    private String getPath(Uri uri) {
        // TODO Auto-generated method stub

        if (uri == null) {
            // TODO perform some logging or show user feedback
            return null;
        }
        // try to retrieve the image from the media store first
        // this will only work for images selected from gallery
        String[] projection = {MediaStore.Images.Media.DATA};
        Cursor cursor = getActivity().managedQuery(uri, projection, null, null, null);
        if (cursor != null) {
            int column_index = cursor
                    .getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
            cursor.moveToFirst();
            return cursor.getString(column_index);
        }
        // this is our fallback here
        return uri.getPath();

    }
}
