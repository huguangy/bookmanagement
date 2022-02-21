package com.xk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public  String index(){
        return "login";
    }

    //用户管理
    @RequestMapping(value = "userList.html",method = RequestMethod.GET)
    public  String userlist(){
        return "users/userlist";
    }

    //订单管理
    @RequestMapping(value = "orderlist.html",method = RequestMethod.GET)
    public  String orderlist(){
        return "orders/orderlist";
    }

    //图书管理
    @RequestMapping(value = "booklist.html",method = RequestMethod.GET)
    public  String booklist(){
        return "books/booklist";
    }

    //出版社管理
    @RequestMapping(value = "publisherslist.html",method = RequestMethod.GET)
    public  String publisherslist(){
        return "publishers/publisherslist";
    }

    //分类管理
    @RequestMapping(value = "categorieslist.html",method = RequestMethod.GET)
    public  String categorieslist(){
        return "categories/categorieslist";
    }

    //广告管理
    @RequestMapping(value = "advertisinglist.html",method = RequestMethod.GET)
    public  String advertisinglist(){
        return "advertising/advertisinglist";
    }

    //密码修改
    @RequestMapping(value = "pwdmodify.html",method = RequestMethod.GET)
    public  String pwdmodify(){
        return "pwdmodify";
    }

    //添加用户
    @RequestMapping(value = "useradd.html",method = RequestMethod.GET)
    public  String useradd(){
        return "users/useradd";
    }

//    跳转页面到订单详情页面
    @RequestMapping(value = "orderDetailsList.html",method = RequestMethod.GET)
    public ModelAndView orderDetailsList(@RequestParam("orderId") int orderId){

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(orderId);
        modelAndView.setViewName("orders/orderDetailsList");

        return modelAndView;
    }
    //推出系统
    @RequestMapping(value = "userLoginOut",method = RequestMethod.GET)
    public String userLoginOut(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }

    @RequestMapping(value = "advertisingadd.html/{index}",method = RequestMethod.GET)
    public String advertisingadd(@PathVariable Integer index, Model model){
        model.addAttribute("index",index);
        return "advertising/advertisingadd";
    }

}
