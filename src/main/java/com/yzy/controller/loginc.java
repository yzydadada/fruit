package com.yzy.controller;

import com.yzy.bean.UserInfo;
import com.yzy.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(loginc.BASE_CONTROLLER)
public class loginc{
    public static final  String BASE_CONTROLLER = "/login";
    @Autowired
    private IUserInfoService userInfoService;

    @RequestMapping("/doLogin.do")
    public String doLogin(String uid, String upassword, HttpSession session, Model model) {

        UserInfo user = this.userInfoService.getUserByName(uid);


        if (user != null) {
            if (user.getUpassword().equals(upassword)) {
                session.setAttribute("user",user);
                return "welcome";
            } else {
                System.out.println("密码不正确");
                model.addAttribute("message","密码不正确");
                return "login";
            }
        } else {
            System.out.println("不存在");
            model.addAttribute("message","用户名不存在");
            return "login";
        }

    }

}
