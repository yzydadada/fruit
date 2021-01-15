package com.yzy.dao;

import com.yzy.bean.goods_warehouse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IWarehouseDao {
    goods_warehouse getwarehousesbywname(String wname);
    List<goods_warehouse> getwarehousesAll(@Param("wname") String wname);

    goods_warehouse getwarehousesone(long wid);

    void Addwarehouses(goods_warehouse warehouse);

    void Deletewarehouses(long wid);

    void Updatewarehouses(goods_warehouse warehouse);


}
