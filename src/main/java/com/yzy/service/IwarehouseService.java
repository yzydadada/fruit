package com.yzy.service;

import com.yzy.bean.goods_warehouse;

import java.util.List;

public interface IwarehouseService {
    goods_warehouse getwarehousesbywname(String wname);
    List<goods_warehouse> getwarehousesAll(Integer page, Integer size, String wname);

    void Addwarehouses(goods_warehouse warehouses);

    void Deletewarehouses(long wid);

    goods_warehouse getwarehousesone(long wid);

    void Updatewarehouses(goods_warehouse warehouses);

}
