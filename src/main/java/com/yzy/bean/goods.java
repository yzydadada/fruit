package com.yzy.bean;



public class goods {
    private Long fid;
    private String gid;
    private String fname;
    private String forigin;
    private String faddress;
    private String fdetails;
    private float price;
    private Long sales;
    private String goodsimg;

    public goods() {
    }

    @Override
    public String toString() {
        return "goods{" +
                "fid=" + fid +
                ", gid='" + gid + '\'' +
                ", fname='" + fname + '\'' +
                ", forigin='" + forigin + '\'' +
                ", faddress='" + faddress + '\'' +
                ", fdetails='" + fdetails + '\'' +
                ", price=" + price +
                ", sales=" + sales +
                ", goodsimg='" + goodsimg + '\'' +
                '}';
    }

    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getForigin() {
        return forigin;
    }

    public void setForigin(String forigin) {
        this.forigin = forigin;
    }

    public String getFaddress() {
        return faddress;
    }

    public void setFaddress(String faddress) {
        this.faddress = faddress;
    }

    public String getFdetails() {
        return fdetails;
    }

    public void setFdetails(String fdetails) {
        this.fdetails = fdetails;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Long getSales() {
        return sales;
    }

    public void setSales(Long sales) {
        this.sales = sales;
    }

    public String getGoodsimg() {
        return goodsimg;
    }

    public void setGoodsimg(String goodsimg) {
        this.goodsimg = goodsimg;
    }

    public goods(Long fid, String gid, String fname, String forigin, String faddress, String fdetails, float price, Long sales, String goodsimg) {
        this.fid = fid;
        this.gid = gid;
        this.fname = fname;
        this.forigin = forigin;
        this.faddress = faddress;
        this.fdetails = fdetails;
        this.price = price;
        this.sales = sales;
        this.goodsimg = goodsimg;
    }
}
