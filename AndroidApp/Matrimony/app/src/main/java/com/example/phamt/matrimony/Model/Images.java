package com.example.phamt.matrimony.Model;

import java.io.Serializable;

/**
 * Created by phamt on 1/4/2016.
 */
public class Images implements Serializable {
    private int id;
    private String imgLink;
    private int status;
    private Users userId;

    public Images() {
    }

    public Images(String imgLink, Users userId) {
        this.imgLink = imgLink;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }
}
