package com.yzy.dao;

import com.yzy.bean.UserInfo;
import com.yzy.bean.goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IGoodsDao {
    goods getgoodsbyfname(String fname);
    List<goods> getgoodsAll(@Param("fname") String fname);

    goods getgoodsone(long fid);

    void Addgoods(goods goods);

    void Deletegoods(long fid);

    void Updategoods(goods goods);


}
