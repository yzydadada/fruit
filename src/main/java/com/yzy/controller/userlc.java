package com.yzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.yzy.ImageUtils;
import com.yzy.bean.UserInfo;
import com.yzy.service.IUserInfoService;
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
@RequestMapping(userlc.BASE_CONTROLLER)
public class userlc {
    public static final String BASE_CONTROLLER = "/user";
    @Autowired
    private IUserInfoService userInfoService;

    @RequestMapping("/doUserl.do")
    public ModelAndView doUserl(@RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "5")Integer size,
                                String uid,
                                @RequestParam(defaultValue = "0") int type,
                                HttpSession session) {
        if(type==1){
            session.setAttribute("searchName",uid);
        }else {
            uid=(String) session.getAttribute("searchName");
        }




        List<UserInfo> userInfos = this.userInfoService.getUserAll(page,size,uid);
        PageInfo<UserInfo> pi=new PageInfo<>(userInfos);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userl",pi);
        modelAndView.setViewName("userList");
        return modelAndView;
    }
    @RequestMapping("/doUseronel.do")
    public ModelAndView doUseronel(long id) {
        UserInfo userInfo=userInfoService.getUserone(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userView");
        modelAndView.addObject("userone",userInfo);
        return modelAndView;
    }
    @RequestMapping("/doUsermeonel.do")
    public ModelAndView doUsermeonel(long id) {
        UserInfo userInfo=userInfoService.getUserone(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("usermeView");
        modelAndView.addObject("userone",userInfo);
        return modelAndView;
    }
    @RequestMapping("/dorevise.do")
    public ModelAndView dorevise(long id) {
        UserInfo userInfo=userInfoService.getUserone(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userUpdate");
        modelAndView.addObject("userone",userInfo);
        return modelAndView;
    }

    @RequestMapping("/domerevise.do")
    public ModelAndView domerevise(long id) {
        UserInfo userInfo=userInfoService.getUserone(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userUpdateme");
        modelAndView.addObject("userone",userInfo);
        return modelAndView;
    }
    @RequestMapping("/doUseronebyName.do")
    public ModelAndView doUseronebyName(String userName) {
        UserInfo userInfo=userInfoService.getUseronebyName(userName);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userView");
        modelAndView.addObject("userone",userInfo);
        return modelAndView;
    }
    @RequestMapping("/doDelete.do")
    public String doDelete(long id) {
        userInfoService.DeleteUser(id);
        return "redirect:doUserl.do";
    }
    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @RequestMapping("adduser.do")
    @ResponseBody
    public String adduser(UserInfo userInfo, HttpSession session, HttpServletRequest request, MultipartFile uimg){
        JSONObject jsonObject=new JSONObject();
        String imgPath;
        try {
            //ImageUtils为之前添加的工具类
            imgPath = ImageUtils.upload(request,uimg);
            if (imgPath != null) {
                // 将上传图片的地址封装到实体类
                userInfo.setUserimg(imgPath);
                System.out.println("-----------------图片上传成功！");
            }else{
                System.out.println("-----------------图片上传失败！");
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("----------------图片上传失败！");
        }
        UserInfo user=(UserInfo) session.getAttribute("user");
        this.userInfoService.AddUser(userInfo);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("addmeuser.do")
    @ResponseBody
    public String addmeuser(UserInfo userInfo, HttpSession session){
        JSONObject jsonObject=new JSONObject();
        UserInfo user=(UserInfo) session.getAttribute("user");
        this.userInfoService.AddUser(userInfo);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("updateuser.do")
    @ResponseBody
    public String updateuser(UserInfo userInfo, HttpSession session,HttpServletRequest request, MultipartFile uimg){
        JSONObject jsonObject=new JSONObject();
        String imgPath;
        try {
            //ImageUtils为之前添加的工具类
            imgPath = ImageUtils.upload(request,uimg);
            if (imgPath != null) {
                // 将上传图片的地址封装到实体类
                userInfo.setUserimg(imgPath);
                System.out.println("-----------------图片上传成功！");
            }else{
                System.out.println("-----------------图片上传失败！");
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("----------------图片上传失败！");
        }
        UserInfo user=(UserInfo) session.getAttribute("user");
//        userInfo.setModifyBy(user.getId());
//        userInfo.setModifyDate(new Date());
        this.userInfoService.UpdateUser(userInfo);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("updatemeuser.do")
    @ResponseBody
    public String updatemeuser(UserInfo userInfo, HttpSession session,HttpServletRequest request, MultipartFile uimg){
        JSONObject jsonObject=new JSONObject();
        String imgPath;
        try {
            //ImageUtils为之前添加的工具类
            imgPath = ImageUtils.upload(request,uimg);
            if (imgPath != null) {
                // 将上传图片的地址封装到实体类
                userInfo.setUserimg(imgPath);
                System.out.println("-----------------图片上传成功！");
            }else{
                System.out.println("-----------------图片上传失败！");
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("----------------图片上传失败！");
        }
        UserInfo user=(UserInfo) session.getAttribute("user");
//        userInfo.setModifyBy(user.getId());
//        userInfo.setModifyDate(new Date());
        this.userInfoService.UpdateUser(userInfo);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
}
