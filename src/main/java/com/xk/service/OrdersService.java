package com.xk.service;

import com.xk.mapper.OrdersMapper;
import com.xk.pojo.Orders;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface OrdersService {

    List<Orders> queryOrder(Map<String,Object> map);

    int queryOrderCount(Map<String,Object> map);

    Orders queryOrder_id(int id);

    int updateOrder(Orders orders);
}
