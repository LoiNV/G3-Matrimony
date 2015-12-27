/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Friends {
    private int id;
    private Users userId1;
    private Users userId2;
    private String createdDate;
    private String namespace;
    private int status;

    public Friends() {
    }

    public Friends(Users userId1, Users userId2, String createdDate, String namespace) {
        this.userId1 = userId1;
        this.userId2 = userId2;
        this.createdDate = createdDate;
        this.namespace = namespace;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users getUserId1() {
        return userId1;
    }

    public void setUserId1(Users userId1) {
        this.userId1 = userId1;
    }

    public Users getUserId2() {
        return userId2;
    }

    public void setUserId2(Users userId2) {
        this.userId2 = userId2;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getNamespace() {
        return namespace;
    }

    public void setNamespace(String namespace) {
        this.namespace = namespace;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
