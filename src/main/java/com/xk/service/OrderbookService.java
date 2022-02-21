package com.xk.service;

import com.xk.pojo.Orderbook;

import java.util.List;
import java.util.Map;

public interface OrderbookService {

    List<Orderbook> queryOrderDetails(Map<String,Object> map);

    int queryOrderDetailsCount(Map<String,Object> map);


}
