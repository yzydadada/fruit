package com.yzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.yzy.bean.UserInfo;
import com.yzy.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(updateMm.BASE_CONTROLLER)
public class updateMm{
    public static final String BASE_CONTROLLER = "/userUpdateMm";
    @Autowired
    private IUserInfoService userInfoService;
    @RequestMapping("douserMm.do")
    @ResponseBody
    public ModelAndView douserMm(UserInfo userInfo,HttpSession session) {
        UserInfo user=(UserInfo) session.getAttribute("user");
        userInfo.setId(user.getId());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("password");
        modelAndView.addObject("useroneone",userInfo);
        return modelAndView;
    }
    @RequestMapping("doupdateuserMm.do")
    @ResponseBody
    public String doupdateuserMm(UserInfo userInfo){
        JSONObject jsonObject=new JSONObject();
        this.userInfoService.UpdateUserMm(userInfo);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }

}
