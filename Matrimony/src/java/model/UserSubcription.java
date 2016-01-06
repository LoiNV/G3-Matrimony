/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class UserSubcription implements Serializable{
    private int id;
    private String chargedDate;
    private Subcription subId;
    private Users userId;

    public UserSubcription() {
    }

    public UserSubcription(String chargedDate, Subcription subId, Users userId) {
        this.chargedDate = chargedDate;
        this.subId = subId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getChargedDate() {
        return chargedDate;
    }

    public void setChargedDate(String chargedDate) {
        this.chargedDate = chargedDate;
    }

    public Subcription getSubId() {
        return subId;
    }

    public void setSubId(Subcription subId) {
        this.subId = subId;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }
    
}
