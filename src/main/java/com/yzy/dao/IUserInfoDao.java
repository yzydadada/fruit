package com.yzy.dao;

import com.yzy.bean.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserInfoDao {
    UserInfo getUserByName(String uid);
    List<UserInfo> getUserAll(@Param("uid") String uid);

    void AddUser(UserInfo userInfo);

    void DeleteUser(long id);

    UserInfo getUserone(long id);

    void UpdateUser(UserInfo userInfo);

    UserInfo getUseronebyName(String uid);

    List<UserInfo> getUsermebyName(String uid);

    void UpdateUserMm(UserInfo userInfo);
}

