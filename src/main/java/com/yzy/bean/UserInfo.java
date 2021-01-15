package com.yzy.bean;

import java.util.Date;


public class UserInfo {
    private Long id;
    private String uid;
    private String upassword;
    private String userimg;

    private Long gender;
    private String phone;
    private Date birthday;
    private String address;
    private Long authority;

    public UserInfo() {
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", uid='" + uid + '\'' +
                ", upassword='" + upassword + '\'' +
                ", userimg='" + userimg + '\'' +
                ", gender=" + gender +
                ", phone='" + phone + '\'' +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", authority=" + authority +
                '}';
    }

    public UserInfo(Long id, String uid, String upassword, String userimg, Long gender, String phone, Date birthday, String address, Long authority) {
        this.id = id;
        this.uid = uid;
        this.upassword = upassword;
        this.userimg = userimg;
        this.gender = gender;
        this.phone = phone;
        this.birthday = birthday;
        this.address = address;
        this.authority = authority;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUserimg() {
        return userimg;
    }

    public void setUserimg(String userimg) {
        this.userimg = userimg;
    }

    public Long getGender() {
        return gender;
    }

    public void setGender(Long gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getAuthority() {
        return authority;
    }

    public void setAuthority(Long authority) {
        this.authority = authority;
    }
}
