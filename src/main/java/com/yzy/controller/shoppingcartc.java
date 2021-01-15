package com.yzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.yzy.bean.shoppingcart;
import com.yzy.bean.UserInfo;
import com.yzy.bean.goods_order;
import com.yzy.service.IShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(shoppingcartc.BASE_CONTROLLER)
public class shoppingcartc {
    public static final String BASE_CONTROLLER = "/shoppingcart";
    @Autowired
    private IShoppingcartService shoppingcartService;
    @RequestMapping("/doshoppingcartl.do")
    public ModelAndView doshoppingcartl(@RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "5")Integer size,
                                    String fname,
                                    @RequestParam(defaultValue = "0") int type,
                                    HttpSession session) {
        if(type==1){
            session.setAttribute("searchName",fname);
        }else {
            fname=(String) session.getAttribute("searchName");
        }

        List<shoppingcart> shoppingcarts = this.shoppingcartService.getShoppingcartAll(page,size,fname);
        PageInfo<shoppingcart> pi=new PageInfo<>(shoppingcarts);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("shoppingcartl",pi);
        modelAndView.setViewName("shoppingcartList");
        return modelAndView;
    }


    @InitBinder
    public void InitBinder(WebDataBinder binder){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @RequestMapping("addshoppingcart.do")
    @ResponseBody
    public String addshoppingcart(shoppingcart shoppingcart, HttpSession session){
        JSONObject jsonObject=new JSONObject();
        UserInfo user=(UserInfo) session.getAttribute("user");
//        shoppingcart.setCreatedBy(user.getId());
//        shoppingcart.setCreationDate(new Date());
        this.shoppingcartService.AddShoppingcart(shoppingcart);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("/doDeleteShoppingcart.do")
    public String doDeleteShoppingcart(long gid) {
        shoppingcartService.DeleteShoppingcart(gid);
        return "redirect:doshoppingcartl.do";
    }
    @RequestMapping("/doDeleteShoppingcartme.do")
    public String doDeleteShoppingcartme(long gid) {
        shoppingcartService.DeleteShoppingcart(gid);
        return "redirect:doshoppingcartmel.do";
    }
    @RequestMapping("/doShoppingcartonel.do")
    public ModelAndView doShoppingcartonel(long gid) {
        shoppingcart shoppingcart=shoppingcartService.getShoppingcartone(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("shoppingcartView");
        modelAndView.addObject("shoppingcart",shoppingcart);
        return modelAndView;
    }
    @RequestMapping("/doShoppingcartonemel.do")
    public ModelAndView doShoppingcartonemel(long gid) {
        shoppingcart shoppingcart=shoppingcartService.getShoppingcartone(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("shoppingcartmeView");
        modelAndView.addObject("shoppingcart",shoppingcart);
        return modelAndView;
    }

    @RequestMapping("/doShoppingcartrevise.do")
    public ModelAndView doShoppingcartrevise(long gid) {
        shoppingcart shoppingcart=shoppingcartService.getShoppingcartone(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("shoppingcartUpdate");
        modelAndView.addObject("shoppingcart",shoppingcart);
        return modelAndView;
    }
    @RequestMapping("/doShoppingcartreviseme.do")
    public ModelAndView doShoppingcartreviseme(long gid) {
        shoppingcart shoppingcart=shoppingcartService.getShoppingcartone(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("shoppingcartmeUpdate");
        modelAndView.addObject("shoppingcart",shoppingcart);
        return modelAndView;
    }
    @RequestMapping("UpdateShoppingcart.do")
    @ResponseBody
    public String UpdateShoppingcart(shoppingcart shoppingcart, HttpSession session){
        JSONObject jsonObject = new JSONObject();
        UserInfo user = (UserInfo) session.getAttribute("user");
//        shoppingcart.setModifyBy(user.getId());
//        shoppingcart.setModifyDate(new Date());
        this.shoppingcartService.UpdateShoppingcart(shoppingcart);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("UpdatemeShoppingcart.do")
    @ResponseBody
    public String UpdatemeShoppingcart(shoppingcart shoppingcart, HttpSession session){
        JSONObject jsonObject = new JSONObject();
        UserInfo user = (UserInfo) session.getAttribute("user");
//        shoppingcart.setModifyBy(user.getId());
//        shoppingcart.setModifyDate(new Date());
        this.shoppingcartService.UpdateShoppingcart(shoppingcart);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("/doshoppingcartmel.do")
    public ModelAndView doshoppingcartmel(@RequestParam(defaultValue = "1") Integer page,
                                        @RequestParam(defaultValue = "5")Integer size,
                                        Integer uid,
                                        @RequestParam(defaultValue = "0") int type,
                                        HttpSession session) {
//        if(type==1){
//            session.setAttribute("searchName",fname);
//        }else {
//            fname=(String) session.getAttribute("searchName");
//        }

        List<shoppingcart> shoppingcarts = this.shoppingcartService.getUserShoppingcartbyName(page,size,uid);
        PageInfo<shoppingcart> pi=new PageInfo<>(shoppingcarts);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("shoppingcartl",pi);
        modelAndView.setViewName("shoppingcartmeList");
        return modelAndView;
    }

}
