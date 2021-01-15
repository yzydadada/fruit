package com.yzy.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.yzy.ImageUtils;
import com.yzy.bean.UserInfo;
import com.yzy.bean.goods;
import com.yzy.service.IgoodsService;
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
@RequestMapping(goodsc.BASE_CONTROLLER)
public class goodsc {
    public static final String BASE_CONTROLLER = "/goods";
    @Autowired
    private IgoodsService goodsService;

    @RequestMapping("/dogoodsl.do")
    public ModelAndView dogoodsl(@RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "5") Integer size,
                                 String fname,
                                 @RequestParam(defaultValue = "0") int type,
                                 HttpSession session) {
        if(type==1){
            session.setAttribute("searchName",fname);
        }else {
            fname=(String) session.getAttribute("searchName");
        }




        List<goods> goods = this.goodsService.getgoodsAll(page,size,fname);
        PageInfo<goods> pi = new PageInfo<>(goods);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("goodsl", pi);
        modelAndView.setViewName("goodsList");
        return modelAndView;
    }

    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @RequestMapping("addgoods.do")
    @ResponseBody
    public String addgoods(goods goods, HttpSession session, HttpServletRequest request, MultipartFile goodimg) {
        JSONObject jsonObject = new JSONObject();
        String imgPath;
        try {
            //ImageUtils为之前添加的工具类
            imgPath = ImageUtils.upload(request,goodimg);
            if (imgPath != null) {
                // 将上传图片的地址封装到实体类
                goods.setGoodsimg(imgPath);
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
        this.goodsService.Addgoods(goods);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }

    @RequestMapping("/doDeletegoods.do")
    public String doDeletegoods(long fid) {
        goodsService.Deletegoods(fid);
        return "redirect:dogoodsl.do";
    }

    @RequestMapping("/dogoodsonel.do")
    public ModelAndView dogoodsonel(long fid) {
        goods goods = goodsService.getgoodsone(fid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goodsView");
        modelAndView.addObject("goods", goods);
        return modelAndView;
    }

    @RequestMapping("/dogoodsrevise.do")
    public ModelAndView dogoodsrevise(long fid) {
        goods goods = goodsService.getgoodsone(fid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goodsUpdate");
        modelAndView.addObject("goods", goods);
        return modelAndView;
    }

    @RequestMapping("updategoods.do")
    @ResponseBody
    public String updategoods(goods goods, HttpSession session,HttpServletRequest request, MultipartFile goodimg) {
        JSONObject jsonObject = new JSONObject();
        String imgPath;
        try {
            //ImageUtils为之前添加的工具类
            imgPath = ImageUtils.upload(request,goodimg);//上服
            if (imgPath != null) {
                // 将上传图片的地址封装到实体类
                goods.setGoodsimg(imgPath);
                System.out.println("-----------------图片上传成功！");
            }else{
                System.out.println("-----------------图片上传失败！");
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("----------------图片上传失败！");
        }
        UserInfo user = (UserInfo) session.getAttribute("user");
//        goods.setModifyBy(user.getId());
//        goods.setModifyDate(new Date());
        this.goodsService.Updategoods(goods);
        jsonObject.put("result", "1");
        return jsonObject.toString();
    }
    @RequestMapping("/getgoodsbyfname.do")
    public ModelAndView getgoodsbyfname(String fname) {
        goods goods=goodsService.getgoodsbyfname(fname);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goodslist");
        modelAndView.addObject("goodsone",goods);
        return modelAndView;
    }
}
