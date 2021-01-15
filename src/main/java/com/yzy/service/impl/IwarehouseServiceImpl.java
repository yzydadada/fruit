package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzy.bean.goods_warehouse;
import com.yzy.dao.IWarehouseDao;
import com.yzy.service.IwarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IwarehouseServiceImpl implements IwarehouseService {
    @Autowired
    private IWarehouseDao IWarehouseDao;
    @Override
    public goods_warehouse getwarehousesbywname(String wname) {
        return this.IWarehouseDao.getwarehousesbywname(wname);
    }
    @Override
    public List<goods_warehouse> getwarehousesAll(Integer page, Integer size,String wname) {
        PageHelper.startPage(page,size);
        return this.IWarehouseDao.getwarehousesAll(wname);
    }

    @Override
    public void Addwarehouses(goods_warehouse warehouses) {
        this.IWarehouseDao.Addwarehouses(warehouses);
    }

    @Override
    public void Deletewarehouses(long wid) {
        this.IWarehouseDao.Deletewarehouses(wid);
    }

    @Override
    public goods_warehouse getwarehousesone(long wid) {
        return this.IWarehouseDao.getwarehousesone(wid);
    }

    @Override
    public void Updatewarehouses(goods_warehouse warehouses) {
        this.IWarehouseDao.Updatewarehouses(warehouses);
    }


}
