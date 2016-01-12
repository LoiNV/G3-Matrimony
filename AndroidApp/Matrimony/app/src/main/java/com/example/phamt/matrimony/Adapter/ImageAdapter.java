package com.example.phamt.matrimony.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.phamt.matrimony.R;
import com.squareup.picasso.Picasso;

/**
 * Created by phamt on 1/4/2016.
 */
public class ImageAdapter extends BaseAdapter {
    private Context context;
    private String[] images;

    public ImageAdapter(Context c, String[] images) {
        context = c;
        this.images = images;
    }

    public int getCount() {
        return images.length;
    }

    public Object getItem(int position) {
        return images[position];
    }

    public long getItemId(int position) {
        return position;
    }

    // Create a new ImageView for each item referenced by the Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View gridView = convertView;
        if (convertView == null) {
            gridView = new View(context);
            gridView = inflater.inflate(R.layout.grid_view_album, null);

            ImageView grid_item_image = (ImageView) gridView.findViewById(R.id.grid_item_album);
            grid_item_image.setScaleType(ImageView.ScaleType.FIT_XY);
            grid_item_image.setPadding(4, 4, 4, 4);
            Picasso.with(context).load(images[position]).into(grid_item_image);

        } else {
            gridView = (View) convertView;
        }
        return gridView;
    }

    // References to our images in res > drawable

}
