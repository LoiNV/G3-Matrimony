/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author nghiawin
 */
public class Users implements Serializable{
    private int id;
    private String name;
    private String password;
    private String email;
    private boolean gender;
    private String birthday;
    private String first_name;
    private String last_name;
    private String marital_status;
    private int height;
    private int age;
    private String country;
    private String city;
    private String phone;
    private String religion;
    private String caste;
    private int status;

    public Users() {
    }

    public Users(String name, String password, String email, boolean gender, String birthday, int age) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
        this.age = age;
    }

    public Users(int id, String name, String password, String email, boolean gender, String birthday, String first_name, String last_name, String marital_status, int height, int age, String country, String city, String phone, String religion, String caste, int status) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
        this.first_name = first_name;
        this.last_name = last_name;
        this.marital_status = marital_status;
        this.height = height;
        this.age = age;
        this.country = country;
        this.city = city;
        this.phone = phone;
        this.religion = religion;
        this.caste = caste;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getMarital_status() {
        return marital_status;
    }

    public void setMarital_status(String marital_status) {
        this.marital_status = marital_status;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
    
}
