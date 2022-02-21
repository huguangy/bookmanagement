package com.xk.service.impl;

import com.xk.mapper.OrderbookMapper;
import com.xk.pojo.Orderbook;
import com.xk.service.OrderbookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderbookServiceImpl implements OrderbookService {

   @Autowired
    private OrderbookMapper orderbookMapper;

    @Override
    public List<Orderbook> queryOrderDetails(Map<String, Object> map) {
        return orderbookMapper.queryOrderDetails(map);
    }

    @Override
    public int queryOrderDetailsCount(Map<String, Object> map) {
        return orderbookMapper.queryOrderDetailsCount(map);
    }
}
