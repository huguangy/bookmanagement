package com.xk.mapper;

import com.xk.pojo.Orders;

import java.util.List;
import java.util.Map;

public interface OrdersMapper {

    List<Orders> queryOrder(Map<String,Object> map);

    int queryOrderCount(Map<String,Object> map);

    Orders queryOrder_id(int id);

    int updateOrder(Orders orders);

}
