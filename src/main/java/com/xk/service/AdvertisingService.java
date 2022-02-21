package com.xk.service;

import com.xk.pojo.Advertising;

import java.util.List;
import java.util.Map;

public interface AdvertisingService {
    List<Advertising> queryAdvertising(Map map);
    int addAdvertising(Advertising advertising);

    int deleteAdvertising(Integer id);

    int updateAdvertising(Advertising advertising);
}
