package com.yzy.service;

import com.yzy.bean.goods;

import java.util.List;

public interface IgoodsService {
    goods getgoodsbyfname(String fname);
    List<goods> getgoodsAll(Integer page, Integer size,String fname);

    void Addgoods(goods goods);

    void Deletegoods(long fid);

    goods getgoodsone(long fid);

    void Updategoods(goods goods);

}
