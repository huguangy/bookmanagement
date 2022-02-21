package com.xk.service.impl;

import com.xk.mapper.OrdersMapper;
import com.xk.pojo.Orders;
import com.xk.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Orders> queryOrder(Map<String, Object> map) {
        return  ordersMapper.queryOrder(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public int queryOrderCount(Map<String, Object> map) {
        return ordersMapper.queryOrderCount(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Orders queryOrder_id(int id) {
        return ordersMapper.queryOrder_id(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public int updateOrder(Orders orders) {
        return ordersMapper.updateOrder(orders);
    }
}
