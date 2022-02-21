package com.xk.service.impl;

import com.xk.mapper.AdvertisingMapper;
import com.xk.pojo.Advertising;
import com.xk.service.AdvertisingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
@Service
@Transactional(propagation = Propagation.SUPPORTS ,readOnly = true)
public class AdvertisingServiceImpl implements AdvertisingService {

    @Autowired
    private AdvertisingMapper advertisingMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS ,readOnly = true)
    public List<Advertising> queryAdvertising(Map map) {
        return advertisingMapper.queryAdvertising(map);
    }

    @Override
    public int addAdvertising(Advertising advertising) {
        return advertisingMapper.addAdvertising(advertising);
    }

    @Override
    public int deleteAdvertising(Integer id) {
        return advertisingMapper.deleteAdvertising(id);
    }

    @Override
    public int updateAdvertising(Advertising advertising) {
        return advertisingMapper.updateAdvertising(advertising);
    }
}
