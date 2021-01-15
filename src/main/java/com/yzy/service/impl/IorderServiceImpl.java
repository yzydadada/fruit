package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzy.bean.goods_order;
import com.yzy.bean.shoppingcart;
import com.yzy.dao.IOederDao;
import com.yzy.service.IorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IorderServiceImpl implements IorderService {
    @Autowired
    private IOederDao iorderDao;
    @Override
    public goods_order getorderbyfname(String fname) {
        return this.iorderDao.getorderbyfname(fname);
    }
    @Override
    public List<goods_order> getorderAll(Integer page, Integer size,String fname) {
        PageHelper.startPage(page,size);
        return this.iorderDao.getorderAll(fname);
    }

    @Override
    public void Addorder(goods_order order) {
        this.iorderDao.Addorder(order);
    }

    @Override
    public void Deleteorder(long gid) {
        this.iorderDao.Deleteorder(gid);
    }

    @Override
    public goods_order getorderone(long gid) {
        return this.iorderDao.getorderone(gid);
    }

    @Override
    public void Updateorder(goods_order goods_order) {
        this.iorderDao.Updateorder(goods_order);
    }

    @Override
    public List<goods_order> getordermeAll(Integer page, Integer size, Integer uid) {
        PageHelper.startPage(page,size);
        return this.iorderDao.getordermeAll(uid);
    }

}
