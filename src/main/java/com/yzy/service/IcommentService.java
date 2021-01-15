package com.yzy.service;

import com.yzy.bean.goodscomment;

import java.util.List;

public interface IcommentService {
    goodscomment getcommentsbygid(long gid);
    List<goodscomment> getcommentsAll(Integer page, Integer size, String uid);

    void Addcomments(goodscomment comment);

    void Deletecomments(long gid);

    void Updatecomments(goodscomment comment);

}
