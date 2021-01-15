package com.yzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.yzy.bean.UserInfo;
import com.yzy.bean.goods_order;
import com.yzy.bean.shoppingcart;
import com.yzy.service.IorderService;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(orderc.BASE_CONTROLLER)
public class orderc {
    public static final String BASE_CONTROLLER = "/order";
    @Autowired
    private IorderService orderService;
    @RequestMapping("/doorderl.do")
    public ModelAndView doorderl(@RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "5")Integer size,
                                    String fname,
                                    @RequestParam(defaultValue = "0") int type,
                                    HttpSession session) {
        if(type==1){
            session.setAttribute("searchName",fname);
        }else {
            fname=(String) session.getAttribute("searchName");
        }



        List<goods_order> order = this.orderService.getorderAll(page,size,fname);
        PageInfo<goods_order> pi=new PageInfo<>(order);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orderl",pi);
        modelAndView.setViewName("orderList");
        return modelAndView;
    }


    @InitBinder
    public void InitBinder(WebDataBinder binder){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @RequestMapping("addorder.do")
    @ResponseBody
    public String addorder(goods_order order, HttpSession session){
        JSONObject jsonObject=new JSONObject();
        UserInfo user=(UserInfo) session.getAttribute("user");
//        shoppingcart.setCreatedBy(user.getId());
//        shoppingcart.setCreationDate(new Date());
        this.orderService.Addorder(order);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("/doDeleteorder.do")
    public String doDeleteorder(long gid) {
        orderService.Deleteorder(gid);
        return "redirect:doorderl.do";
    }
    @RequestMapping("/doDeletemeorder.do")
    public String doDeletemeorder(long gid) {
        orderService.Deleteorder(gid);
        return "redirect:doordermel.do";
    }
    @RequestMapping("/doorderonel.do")
    public ModelAndView doorderonel(long gid) {
        goods_order shoppingcart=orderService.getorderone(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("orderView");
        modelAndView.addObject("order",shoppingcart);
        return modelAndView;
    }
    @RequestMapping("/doordermeonel.do")
    public ModelAndView doordermeonel(long gid) {
        goods_order shoppingcart=orderService.getorderone(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("ordermeView");
        modelAndView.addObject("order",shoppingcart);
        return modelAndView;
    }

    @RequestMapping("/doorderrevise.do")
    public ModelAndView doorderrevise(long gid) {
        goods_order shoppingcart=orderService.getorderone(gid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("orderUpdate");
        modelAndView.addObject("order",shoppingcart);
        return modelAndView;
    }
    @RequestMapping("Updateorder.do")
    @ResponseBody
    public String Updateorder(goods_order order, HttpSession session){
        JSONObject jsonObject = new JSONObject();
        UserInfo user = (UserInfo) session.getAttribute("user");
//        shoppingcart.setModifyBy(user.getId());
//        shoppingcart.setModifyDate(new Date());

        this.orderService.Updateorder(order);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }

    @RequestMapping("/doordermel.do")
    public ModelAndView doordermel(@RequestParam(defaultValue = "1") Integer page,
                                          @RequestParam(defaultValue = "5")Integer size,
                                          Integer uid,
                                          @RequestParam(defaultValue = "0") int type,
                                          HttpSession session) {
//        if(type==1){
//            session.setAttribute("searchName",fname);
//        }else {
//            fname=(String) session.getAttribute("searchName");
//        }

        List<goods_order> order = this.orderService.getordermeAll(page,size,uid);
        PageInfo<goods_order> pi=new PageInfo<>(order);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orderl",pi);
        modelAndView.setViewName("ordermeList");
        return modelAndView;
    }
}
