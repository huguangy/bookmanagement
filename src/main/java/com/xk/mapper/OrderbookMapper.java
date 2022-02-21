package com.xk.mapper;

import com.xk.pojo.Orderbook;

import java.util.List;
import java.util.Map;

public interface OrderbookMapper {

    List<Orderbook> queryOrderDetails(Map<String,Object> map);

    int queryOrderDetailsCount(Map<String,Object> map);

}
