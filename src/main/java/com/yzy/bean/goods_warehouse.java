package com.yzy.bean;



public class goods_warehouse {
    private Long wid;
    private String wname;
    private Long wphone;
    private String waddress;
    private String wprincipal;
    private String wareimg;

    public goods_warehouse() {
    }

    public Long getWid() {
        return wid;
    }

    public void setWid(Long wid) {
        this.wid = wid;
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public Long getWphone() {
        return wphone;
    }

    public void setWphone(Long wphone) {
        this.wphone = wphone;
    }

    public String getWaddress() {
        return waddress;
    }

    public void setWaddress(String waddress) {
        this.waddress = waddress;
    }

    public String getWprincipal() {
        return wprincipal;
    }

    public void setWprincipal(String wprincipal) {
        this.wprincipal = wprincipal;
    }

    public String getWareimg() {
        return wareimg;
    }

    public void setWareimg(String wareimg) {
        this.wareimg = wareimg;
    }

    @Override
    public String toString() {
        return "goods_warehouse{" +
                "wid=" + wid +
                ", wname='" + wname + '\'' +
                ", wphone=" + wphone +
                ", waddress='" + waddress + '\'' +
                ", wprincipal='" + wprincipal + '\'' +
                ", wareimg='" + wareimg + '\'' +
                '}';
    }

    public goods_warehouse(Long wid, String wname, Long wphone, String waddress, String wprincipal, String wareimg) {
        this.wid = wid;
        this.wname = wname;
        this.wphone = wphone;
        this.waddress = waddress;
        this.wprincipal = wprincipal;
        this.wareimg = wareimg;
    }
}
