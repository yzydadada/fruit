package com.yzy.dao;

import com.yzy.bean.goodscomment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICommentDao {
    goodscomment getcommentsbygid(long gid);
    List<goodscomment> getcommentsAll(@Param("uid") String uid);

    void Addcomments(goodscomment comment);

    void Deletecomments(long gid);

    void Updatecomments(goodscomment comment);


}
