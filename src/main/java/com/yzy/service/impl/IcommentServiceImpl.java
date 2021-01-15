package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzy.bean.goodscomment;
import com.yzy.dao.ICommentDao;
import com.yzy.service.IcommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IcommentServiceImpl implements IcommentService {
    @Autowired
    private ICommentDao ICommentDao;
    @Override
    public goodscomment getcommentsbygid(long gid) {
        return this.ICommentDao.getcommentsbygid(gid);
    }
    @Override
    public List<goodscomment> getcommentsAll(Integer page, Integer size,String uid) {
        PageHelper.startPage(page,size);
        return this.ICommentDao.getcommentsAll(uid);
    }

    @Override
    public void Addcomments(goodscomment comment) {
        this.ICommentDao.Addcomments(comment);
    }

    @Override
    public void Deletecomments(long gid) {
        this.ICommentDao.Deletecomments(gid);
    }

    @Override
    public void Updatecomments(goodscomment comment) {
        this.ICommentDao.Updatecomments(comment);
    }


}
