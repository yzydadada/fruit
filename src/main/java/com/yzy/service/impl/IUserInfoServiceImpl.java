package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzy.bean.UserInfo;
import com.yzy.dao.IUserInfoDao;
import com.yzy.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IUserInfoServiceImpl implements IUserInfoService {
    @Autowired
    private IUserInfoDao userinfoDao;
    @Override
    public UserInfo getUserByName(String uid) {
        return this.userinfoDao.getUserByName(uid);
    }

    @Override
    public List<UserInfo> getUserAll(Integer page,Integer size,String uid) {
        PageHelper.startPage(page,size);
        return this.userinfoDao.getUserAll(uid);
    }

    @Override
    public void AddUser(UserInfo userInfo) {
        this.userinfoDao.AddUser(userInfo);
    }

    @Override
    public void DeleteUser(long id) {
        this.userinfoDao.DeleteUser(id);
    }

    @Override
    public  UserInfo getUserone(long id) {
        return this.userinfoDao.getUserone(id);
    }

    @Override
    public void UpdateUser(UserInfo userInfo) {
        this.userinfoDao.UpdateUser(userInfo);
    }

    @Override
    public UserInfo getUseronebyName(String uid) {
        return this.userinfoDao.getUseronebyName(uid);
    }

    @Override
    public void UpdateUserMm(UserInfo userInfo) {
        this.userinfoDao.UpdateUserMm(userInfo);
    }

    @Override
    public List<UserInfo> getUserme(Integer page,Integer size,String uid) {
        PageHelper.startPage(page,size);
        return this.userinfoDao.getUsermebyName(uid);
    }
}
