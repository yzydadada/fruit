package com.yzy.service;

import com.yzy.bean.UserInfo;
import com.yzy.bean.shoppingcart;

import java.util.List;

public interface IShoppingcartService {
    List<shoppingcart> getShoppingcartAll(Integer page, Integer size, String proName);

    void AddShoppingcart(shoppingcart shoppingcart);

    void DeleteShoppingcart(long gid);

    shoppingcart getShoppingcartone(long gid);

    void UpdateShoppingcart(shoppingcart shoppingcart);

    List<shoppingcart> getUserShoppingcartbyName(Integer page, Integer size,Integer uid);

    shoppingcart selectById(Long id);
}
