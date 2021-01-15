package com.yzy.bean;



public class shoppingcart {
    private Long gid;
    private String uid;
    private String fdetails;
    private String fname;
    private float price;
    private Long fnumber;
    private String address;
    private String phone;
    private String goodsimg;

    public shoppingcart() {
    }

    @Override
    public String toString() {
        return "shoppingcart{" +
                "gid=" + gid +
                ", uid='" + uid + '\'' +
                ", fdetails='" + fdetails + '\'' +
                ", fname='" + fname + '\'' +
                ", price=" + price +
                ", fnumber=" + fnumber +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", goodsimg='" + goodsimg + '\'' +
                '}';
    }

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

    public String getFdetails() {
        return fdetails;
    }

    public void setFdetails(String fdetails) {
        this.fdetails = fdetails;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Long getFnumber() {
        return fnumber;
    }

    public void setFnumber(Long fnumber) {
        this.fnumber = fnumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGoodsimg() {
        return goodsimg;
    }

    public void setGoodsimg(String goodsimg) {
        this.goodsimg = goodsimg;
    }

    public shoppingcart(Long gid, String uid, String fdetails, String fname, float price, Long fnumber, String address, String phone, String goodsimg) {
        this.gid = gid;
        this.uid = uid;
        this.fdetails = fdetails;
        this.fname = fname;
        this.price = price;
        this.fnumber = fnumber;
        this.address = address;
        this.phone = phone;
        this.goodsimg = goodsimg;
    }
}
