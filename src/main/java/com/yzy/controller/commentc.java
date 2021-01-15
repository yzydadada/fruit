package com.yzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.yzy.ImageUtils;
import com.yzy.bean.UserInfo;
import com.yzy.bean.goodscomment;
import com.yzy.service.IcommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(commentc.BASE_CONTROLLER)
public class commentc {
    public static final String BASE_CONTROLLER = "/comment";
    @Autowired
    private IcommentService commentService;

    @RequestMapping("/docommentl.do")
    public ModelAndView docommentl(@RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "5")Integer size,
                                String uid,
                                @RequestParam(defaultValue = "0") int type,
                                HttpSession session) {
        if(type==1){
            session.setAttribute("searchName",uid);
        }else {
            uid=(String) session.getAttribute("searchName");
        }




        List<goodscomment> comment = this.commentService.getcommentsAll(page,size,uid);
        PageInfo<goodscomment> pi=new PageInfo<>(comment);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("commentl",pi);
        modelAndView.setViewName("commentList");
        return modelAndView;
    }
    @RequestMapping("/docommentonel.do")
    public ModelAndView docommentonel(long gid) {
        goodscomment comment=commentService.getcommentsbygid(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("commentView");
        modelAndView.addObject("commentone",comment);
        return modelAndView;
    }
    @RequestMapping("/dorevise.do")
    public ModelAndView dorevise(long gid) {
        goodscomment comment=commentService.getcommentsbygid(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("commentUpdate");
        modelAndView.addObject("commentone",comment);
        return modelAndView;
    }
    @RequestMapping("/doDelete.do")
    public String doDelete(long gid) {
        commentService.Deletecomments(gid);
        return "redirect:docommentl.do";
    }
    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @RequestMapping("addcomment.do")
    @ResponseBody
    public String addcomment(goodscomment comment, HttpSession session , HttpServletRequest request, MultipartFile wimg){
        JSONObject jsonObject=new JSONObject();
//        String imgPath;
//        try {
//            //ImageUtils为之前添加的工具类
//            imgPath = ImageUtils.upload(request,wimg);
//            if (imgPath != null) {
//                // 将上传图片的地址封装到实体类
//                comment.setUserimg(imgPath);
//                System.out.println("-----------------图片上传成功！");
//            }else{
//                System.out.println("-----------------图片上传失败！");
//            }
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//            System.out.println("----------------图片上传失败！");
//        }
        UserInfo user=(UserInfo) session.getAttribute("user");
        this.commentService.Addcomments(comment);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("updatecomment.do")
    @ResponseBody
    public String updatecomment(goodscomment comment, HttpSession session){
        JSONObject jsonObject=new JSONObject();
        UserInfo user=(UserInfo) session.getAttribute("user");
//        userInfo.setModifyBy(user.getId());
//        userInfo.setModifyDate(new Date());
        this.commentService.Updatecomments(comment);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
}
