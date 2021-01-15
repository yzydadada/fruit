package com.yzy.dao;

import com.yzy.bean.UserInfo;
import com.yzy.bean.shoppingcart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IShoppingcartDao {
    List<shoppingcart> getShoppingcartAll(@Param("fname") String fname);

    void AddShoppingcart(shoppingcart shoppingcart);

    void DeleteShoppingcart(long gid);

    shoppingcart getShoppingcartone(long gid);

    void UpdateShoppingcart(shoppingcart shoppingcart);

    List<shoppingcart>  getUserShoppingcartbyName(Integer uid);

    shoppingcart selectById(Long id);
}
