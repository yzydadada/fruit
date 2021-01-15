package com.yzy.dao;

import com.yzy.bean.goods_order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IOederDao {
    goods_order getorderbyfname(String fname);
    List<goods_order> getorderAll(@Param("fname") String fname);

    goods_order getorderone(long gid);

    void Addorder(goods_order order);

    void Deleteorder(long gid);

    void Updateorder(goods_order order);

    List<goods_order> getordermeAll(Integer uid);

}
