package com.yzy.bean;

import java.util.Date;

public class goods_order {
    private Long gid;
    private String uid;
    private String fname;
    private String fdetails;
    private Long number;
    private String address;
    private Long phone;
    private float allprice;
    private Long pay;
    private String goodsimg;

    public Long getGid() {
        return gid;
    }

    public void setGid(Long gid) {
        this.gid = gid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFdetails() {
        return fdetails;
    }

    public void setFdetails(String fdetails) {
        this.fdetails = fdetails;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public float getAllprice() {
        return allprice;
    }

    public void setAllprice(float allprice) {
        this.allprice = allprice;
    }

    public Long getPay() {
        return pay;
    }

    public void setPay(Long pay) {
        this.pay = pay;
    }

    public String getGoodsimg() {
        return goodsimg;
    }

    public void setGoodsimg(String goodsimg) {
        this.goodsimg = goodsimg;
    }

    @Override
    public String toString() {
        return "goods_order{" +
                "gid=" + gid +
                ", uid='" + uid + '\'' +
                ", fname='" + fname + '\'' +
                ", fdetails='" + fdetails + '\'' +
                ", number=" + number +
                ", address='" + address + '\'' +
                ", phone=" + phone +
                ", allprice=" + allprice +
                ", pay=" + pay +
                ", goodsimg='" + goodsimg + '\'' +
                '}';
    }

    public goods_order() {
    }

    public goods_order(Long gid, String uid, String fname, String fdetails, Long number, String address, Long phone, float allprice, Long pay, String goodsimg) {
        this.gid = gid;
        this.uid = uid;
        this.fname = fname;
        this.fdetails = fdetails;
        this.number = number;
        this.address = address;
        this.phone = phone;
        this.allprice = allprice;
        this.pay = pay;
        this.goodsimg = goodsimg;
    }
}
