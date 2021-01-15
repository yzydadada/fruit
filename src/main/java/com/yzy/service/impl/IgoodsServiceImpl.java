package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzy.bean.goods;
import com.yzy.dao.IGoodsDao;
import com.yzy.service.IgoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IgoodsServiceImpl  implements IgoodsService {
    @Autowired
    private IGoodsDao igoodsDao;
    @Override
    public goods getgoodsbyfname(String fname) {
        return this.igoodsDao.getgoodsbyfname(fname);
    }
    @Override
    public List<goods> getgoodsAll(Integer page, Integer size,String fname) {
        PageHelper.startPage(page,size);
        return this.igoodsDao.getgoodsAll(fname);
    }

    @Override
    public void Addgoods(goods goods) {
        this.igoodsDao.Addgoods(goods);
    }

    @Override
    public void Deletegoods(long fid) {
        this.igoodsDao.Deletegoods(fid);
    }

    @Override
    public goods getgoodsone(long fid) {
        return this.igoodsDao.getgoodsone(fid);
    }

    @Override
    public void Updategoods(goods goods) {
        this.igoodsDao.Updategoods(goods);
    }


}
