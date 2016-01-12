package com.example.phamt.matrimony.KiemTraInternet;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/**
 * Created by phamt on 1/9/2016.
 */
public class KiemTraKetNoiInternet {

    private Context context;

    public KiemTraKetNoiInternet(Context context) {
        this.context = context;
    }

    public Boolean isOnline() {
        ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo ni = cm.getActiveNetworkInfo();
        if(ni != null && ni.isConnected()) {
            return true;
        }
        return false;
    }
}
