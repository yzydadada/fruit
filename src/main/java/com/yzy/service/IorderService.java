package com.yzy.service;

import com.yzy.bean.goods_order;
import com.yzy.bean.shoppingcart;

import java.util.List;

public interface IorderService {
    goods_order getorderbyfname(String fname);
    List<goods_order> getorderAll(Integer page, Integer size, String fname);

    void Addorder(goods_order order);

    void Deleteorder(long gid);

    goods_order getorderone(long gid);

    void Updateorder(goods_order order);
    List<goods_order> getordermeAll(Integer page, Integer size, Integer uid);
}
