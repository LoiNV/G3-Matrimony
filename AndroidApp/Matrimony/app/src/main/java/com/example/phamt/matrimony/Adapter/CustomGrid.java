package com.example.phamt.matrimony.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.phamt.matrimony.R;
import com.squareup.picasso.Picasso;

/**
 * Created by phamt on 12/26/2015.
 */
public class CustomGrid extends BaseAdapter {
    private Context context;
    private String[] names;
    private String[] images;
    private int[] id;



    public CustomGrid(Context context,String[] names, String[] images, int[] id) {
        super();
        this.context = context;
        this.names = names;
        this.images = images;
        this.id = id;
    }

    @Override
    public int getCount() {

        return images.length;
    }

    @Override
    public Object getItem(int position) {

        return images[position];
    }

    @Override
    public long getItemId(int position) {
        // TODO Auto-generated method stub
        return position;

    }
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View gridView = convertView;
        if (convertView == null) {
            gridView = new View(context);
            gridView = inflater.inflate(R.layout.grid_single, null);
            TextView grid_item_name = (TextView) gridView.findViewById(R.id.grid_item_name);
            grid_item_name.setText(names[position]);

            ImageView grid_item_image = (ImageView) gridView.findViewById(R.id.grid_item_image);
            grid_item_image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            grid_item_image.setPadding(4, 4, 4, 4);
            Picasso.with(context).load(images[position]).into(grid_item_image);

        } else {
            gridView = (View) convertView;
        }
        return gridView;
    }


}
