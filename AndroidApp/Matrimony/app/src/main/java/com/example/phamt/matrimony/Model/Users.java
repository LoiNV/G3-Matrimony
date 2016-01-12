package com.example.phamt.matrimony.Model;

import java.io.Serializable;

/**
 * Created by phamt on 12/23/2015.
 */
public class Users implements Serializable {
    private int id;
    private String name;
    private String password;
    private String email;
    private boolean gender;
    private String birthday;
    private String firstName;
    private String lastName;
    private String maritalStatus;
    private int height;
    private int age;
    private String country;
    private String city;
    private String phone;
    private String religion;
    private String caste;
    private int status;
    private String avatar;
    private String description;
    private int longtitude;
    private int latitude;


    public Users() {
    }

    public Users(int id, String password) {
        this.id = id;
        this.password = password;
    }

    public Users(int id,String name, String birthday, String maritalStatus, int age, String city, String phone, String avatar, String description) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.maritalStatus = maritalStatus;
        this.age = age;
        this.city = city;
        this.phone = phone;
        this.avatar = avatar;
        this.description = description;
    }

    public Users(String name, String password, String email, boolean gender, String birthday, int age, String avatar) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
        this.age = age;
        this.avatar = avatar;
    }

    public Users(int id, String name, String password, String email, boolean gender, String birthday, String firstName, String lastName, String maritalStatus, int height, int age, String country, String city, String phone, String religion, String caste, int status, String avatar,String description, int longtitude, int latitude) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthday = birthday;
        this.firstName = firstName;
        this.lastName = lastName;
        this.maritalStatus = maritalStatus;
        this.height = height;
        this.age = age;
        this.country = country;
        this.city = city;
        this.phone = phone;
        this.religion = religion;
        this.caste = caste;
        this.status = status;
        this.avatar = avatar;
        this.description = description;
        this.longtitude = longtitude;
        this.latitude = latitude;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getLongtitude() {
        return longtitude;
    }

    public void setLongtitude(int longtitude) {
        this.longtitude = longtitude;
    }

    public int getLatitude() {
        return latitude;
    }

    public void setLatitude(int latitude) {
        this.latitude = latitude;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
