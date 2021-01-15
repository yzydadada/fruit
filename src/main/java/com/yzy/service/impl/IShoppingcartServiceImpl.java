package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzy.bean.UserInfo;
import com.yzy.bean.shoppingcart;
import com.yzy.dao.IShoppingcartDao;
import com.yzy.service.IShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class IShoppingcartServiceImpl implements IShoppingcartService {
    @Autowired
    private IShoppingcartDao IShoppingcartDao;

    @Override
    public List<shoppingcart> getShoppingcartAll(Integer page, Integer size,String proName) {
        PageHelper.startPage(page,size);
        return this.IShoppingcartDao.getShoppingcartAll(proName);
    }

    @Override
    public shoppingcart selectById(Long id) {
        return this.IShoppingcartDao.selectById(id);
    }

    @Override
    public void AddShoppingcart(shoppingcart providerInfo) {
        this.IShoppingcartDao.AddShoppingcart(providerInfo);
    }

    @Override
    public void DeleteShoppingcart(long gid) {
        this.IShoppingcartDao.DeleteShoppingcart(gid);
    }

    @Override
    public shoppingcart getShoppingcartone(long gid) {
        return this.IShoppingcartDao.getShoppingcartone(gid);
    }

    @Override
    public void UpdateShoppingcart(shoppingcart shoppingcart) {
        this.IShoppingcartDao.UpdateShoppingcart(shoppingcart);
    }

    @Override
    public List<shoppingcart> getUserShoppingcartbyName(Integer page, Integer size,Integer uid) {
        PageHelper.startPage(page,size);
        return this.IShoppingcartDao.getUserShoppingcartbyName(uid);
    }
}
