package com.yzy.bean;




public class goodscomment {
    private Long gid;
    private String comment;
    private String uid;
    private String userimg;

    public goodscomment() {
    }

    public Long getGid() {
        return gid;
    }

    public void setGid(Long gid) {
        this.gid = gid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUserimg() {
        return userimg;
    }

    public void setUserimg(String userimg) {
        this.userimg = userimg;
    }

    @Override
    public String toString() {
        return "goodscomment{" +
                "gid=" + gid +
                ", comment='" + comment + '\'' +
                ", uid='" + uid + '\'' +
                ", userimg='" + userimg + '\'' +
                '}';
    }

    public goodscomment(Long gid, String comment, String uid, String userimg) {
        this.gid = gid;
        this.comment = comment;
        this.uid = uid;
        this.userimg = userimg;
    }
}
