package com.yzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.yzy.ImageUtils;
import com.yzy.bean.UserInfo;
import com.yzy.bean.goods_warehouse;
import com.yzy.service.IwarehouseService;
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
@RequestMapping(warehousec.BASE_CONTROLLER)
public class warehousec {
    public static final String BASE_CONTROLLER = "/warehouse";
    @Autowired
    private IwarehouseService warehouseService;

    @RequestMapping("/dowarehousel.do")
    public ModelAndView dowarehousel(@RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "5")Integer size,
                                String wname,
                                @RequestParam(defaultValue = "0") int type,
                                HttpSession session) {
        if(type==1){
            session.setAttribute("searchName",wname);
        }else {
            wname=(String) session.getAttribute("searchName");
        }




        List<goods_warehouse> warehouses = this.warehouseService.getwarehousesAll(page,size,wname);
        PageInfo<goods_warehouse> pi=new PageInfo<>(warehouses);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("warehousel",pi);
        modelAndView.setViewName("warehouseList");
        return modelAndView;
    }
    @RequestMapping("/doWarehouseonel.do")
    public ModelAndView doWarehouseonel(long wid) {
        goods_warehouse warehouse=warehouseService.getwarehousesone(wid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("warehouseView");
        modelAndView.addObject("warehouseone",warehouse);
        return modelAndView;
    }
    @RequestMapping("/dorevise.do")
    public ModelAndView dorevise(long wid) {
        goods_warehouse warehouse=warehouseService.getwarehousesone(wid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("warehouseUpdate");
        modelAndView.addObject("warehouseone",warehouse);
        return modelAndView;
    }
    @RequestMapping("/doWarehouseonebyName.do")
    public ModelAndView doWarehouseonebyName(String wname) {
        goods_warehouse warehouse=warehouseService.getwarehousesbywname(wname);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("warehouseView");
        modelAndView.addObject("warehouseone",warehouse);
        return modelAndView;
    }
    @RequestMapping("/doDelete.do")
    public String doDelete(long wid) {
        warehouseService.Deletewarehouses(wid);
        return "redirect:dowarehousel.do";
    }
    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @RequestMapping("addwarehouse.do")
    @ResponseBody
    public String addwarehouse(goods_warehouse warehouse, HttpSession session , HttpServletRequest request, MultipartFile wimg){
        JSONObject jsonObject=new JSONObject();
        String imgPath;
        try {
            //ImageUtils为之前添加的工具类
            imgPath = ImageUtils.upload(request,wimg);
            if (imgPath != null) {
                // 将上传图片的地址封装到实体类
                warehouse.setWareimg(imgPath);
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
        this.warehouseService.Addwarehouses(warehouse);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("updatewarehouse.do")
    @ResponseBody
    public String updatewarehouse(goods_warehouse warehouses, HttpSession session){
        JSONObject jsonObject=new JSONObject();
        UserInfo user=(UserInfo) session.getAttribute("user");
//        userInfo.setModifyBy(user.getId());
//        userInfo.setModifyDate(new Date());
        this.warehouseService.Updatewarehouses(warehouses);
        jsonObject.put("result","1");
        return jsonObject.toString();
    }
}
