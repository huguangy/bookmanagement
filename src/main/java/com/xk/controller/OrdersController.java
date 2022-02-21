package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.pojo.Orderbook;
import com.xk.pojo.Orders;
import com.xk.service.OrderbookService;
import com.xk.service.OrdersService;
import com.xk.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("order")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    @Autowired
    private OrderbookService orderbookService;

    @RequestMapping("queryOrder")
    @ResponseBody
    public String queryOrder(@RequestParam(value = "pageNum",defaultValue ="1") Integer pageNum,
                             @RequestParam(value = "orderId",defaultValue = "0") Integer orderId,
                             @RequestParam(value = "startTime",defaultValue ="" ) String startTime,
                             @RequestParam(value = "endTime",defaultValue ="" ) String endTime,
                             @RequestParam(value = "totalPriceA",defaultValue ="0" ) Integer totalPriceA,
                             @RequestParam(value = "totalPriceB",defaultValue = "0") Integer totalPriceB,
                             @RequestParam(value = "state",defaultValue = "0") Integer state,
                             @RequestParam(value = "loginId",defaultValue ="" ) String loginId
                             ){
        HashMap<String, Object> map = new HashMap<>();

        map.put("orderId",orderId);
        map.put("startTime",startTime);
        map.put("endTime",endTime);
        map.put("totalPriceA",totalPriceA);
        map.put("totalPriceB",totalPriceB);
        map.put("state",state);
        map.put("loginId",loginId);

        PageUtil<Orders> ordersPageUtil = new PageUtil<>();
        ordersPageUtil.setPageSize(5);
        ordersPageUtil.setSumCount(ordersService.queryOrderCount(map));
        ordersPageUtil.setPageNum(pageNum);


        map.put("pageSize",ordersPageUtil.getPageSize());
        map.put("pageNum",(pageNum-1)*ordersPageUtil.getPageSize());

        ordersPageUtil.setList(ordersService.queryOrder(map));

        return JSON.toJSONString(ordersPageUtil);
    }

    @RequestMapping("queryOrderDetails")
    @ResponseBody
    public String queryOrderDetails(@RequestParam(value = "bookId",defaultValue = "0") Integer bookId,
                                    @RequestParam(value = "title",defaultValue = "") String title,
                                    @RequestParam(value = "orderId",defaultValue = "0") Integer orderId,
                                    @RequestParam(value = "unitPriceA",defaultValue = "0") Integer unitPriceA,
                                    @RequestParam(value = "unitPriceB",defaultValue = "0") Integer unitPriceB,
                                    @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum
                                    ){

        HashMap<String, Object> map = new HashMap<>();

        map.put("bookId" ,bookId);
        map.put("title" ,title);
        map.put("orderId" ,orderId);
        map.put("unitPriceA" ,unitPriceA);
        map.put("unitPriceB" ,unitPriceB);
        PageUtil<Orderbook> orderbookPageUtil = new PageUtil<>();

        orderbookPageUtil.setPageSize(5);
        orderbookPageUtil.setSumCount(orderbookService.queryOrderDetailsCount(map));
        orderbookPageUtil.setPageNum(pageNum);

        map.put("pageSize",orderbookPageUtil.getPageSize());
        map.put("pageNum" ,(pageNum-1)*orderbookPageUtil.getPageSize());

        orderbookPageUtil.setList(orderbookService.queryOrderDetails(map));

        return JSON.toJSONString(orderbookPageUtil);
    }

    @RequestMapping("queryOrder_id/{id}")
    public ModelAndView queryOrder_id(@PathVariable Integer id){

        Orders orders = ordersService.queryOrder_id(id);

        System.out.println(orders);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("orders",orders);

        modelAndView.setViewName("orders/ordermodify");

        return modelAndView;
    }

    @RequestMapping("updateOrder")
    public String updateOrder(Orders orders){
        ordersService.updateOrder(orders);
        return "orders/orderlist";
    }
}
