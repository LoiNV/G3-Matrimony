package com.example.phamt.matrimony.Adapter;

/**
 * Created by phamt on 1/4/2016.
 */
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

import com.example.phamt.matrimony.Fragment.TabFragmentAlbum;
import com.example.phamt.matrimony.Fragment.TabFragmentProfile;

public class TabsPagerAdapter extends FragmentPagerAdapter {

    public TabsPagerAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int index) {

        switch (index) {
            case 0:
                // Top Rated fragment activity
//                return new TabFragmentProfile();
            case 1:
                // Games fragment activity
//                return new TabFragmentAlbum();
        }

        return null;
    }

    @Override
    public int getCount() {
        // get item count - equal to number of tabs
        return 2;
    }

}