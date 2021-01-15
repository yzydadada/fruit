package com.yzy.service;

import com.yzy.bean.UserInfo;

import java.util.List;

public interface IUserInfoService {
    UserInfo getUserByName(String uid);
    List<UserInfo> getUserAll(Integer page, Integer size, String uid);

    public void AddUser(UserInfo userInfo);

    void DeleteUser(long id);

    UserInfo getUserone(long id);

    void UpdateUser(UserInfo userInfo);

    UserInfo getUseronebyName(String uid);

    List<UserInfo> getUserme(Integer page, Integer size, String uid);

    void UpdateUserMm(UserInfo userInfo);
}
