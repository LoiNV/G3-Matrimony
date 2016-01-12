package com.example.phamt.matrimony.Fragment;

import android.app.AlertDialog;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.phamt.matrimony.Home;
import com.example.phamt.matrimony.R;
import com.example.phamt.matrimony.Result_FragmentHome;

/**
 * Created by phamt on 12/24/2015.
 */
public class FindPeopleFragment extends Fragment {
    public FindPeopleFragment(){}
    Spinner spinnerGender, spinnerAge1, spinnerAge2;
    Button btnSearch;

    View rootView;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        rootView = inflater.inflate(R.layout.fragment_find, container, false);
//        onBackPress();
        getSpinnerGender(rootView);
        getSpinnerAge1(rootView);
        getSpinnerAge2(rootView);
        btnSearch = (Button) rootView.findViewById(R.id.btnSearch);
        btnSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                Toast.makeText(rootView.getContext(), spinnerGender.getSelectedItem().toString(), Toast.LENGTH_LONG).show();
                Intent intent = new Intent(rootView.getContext(), Result_FragmentHome.class);
                intent.putExtra("gender", spinnerGender.getSelectedItem().toString());
                intent.putExtra("age1", spinnerAge1.getSelectedItem().toString());
                intent.putExtra("age2", spinnerAge2.getSelectedItem().toString());
                startActivity(intent);
            }
        });

//        dispatchKeyEvent(KeyEvent event);

        return rootView;
    }

    public boolean dispatchKeyEvent(KeyEvent event) {
        if (event.getKeyCode() == KeyEvent.KEYCODE_BACK) {

        }
        return dispatchKeyEvent(event);
    }

    public void onBackPress() {
        rootView.setFocusableInTouchMode(true);
        rootView.requestFocus();
        rootView.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (keyCode == KeyEvent.KEYCODE_BACK) {
                    getFragmentManager().popBackStack(null, FragmentManager.POP_BACK_STACK_INCLUSIVE);
                    getActivity().getFragmentManager().beginTransaction().remove(FindPeopleFragment.this).commit();
                    getActivity().finish();
//                    Intent i = new Intent(rootView.getContext(), Home.class);
//                    startActivity(i);
                    return true;
                } else {
                    return false;
                }
            }
        });
    }

    public void getSpinnerGender(View v){
        spinnerGender = (Spinner) v.findViewById(R.id.spinnerGender);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(v.getContext(),
                R.array.spinner_gender, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerGender.setAdapter(adapter);
    }

    public void getSpinnerAge1(View v){
        spinnerAge1 = (Spinner) v.findViewById(R.id.spinnerAge1);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(v.getContext(),
                R.array.spinner_age1, R.layout.my_spinner);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerAge1.setAdapter(adapter);
    }

    public void getSpinnerAge2(View v){
        spinnerAge2 = (Spinner) v.findViewById(R.id.spinnerAge2);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(v.getContext(),
                R.array.spinner_age2, R.layout.my_spinner);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerAge2.setAdapter(adapter);
    }
}
