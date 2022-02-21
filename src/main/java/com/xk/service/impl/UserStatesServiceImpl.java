package com.xk.service.impl;

import com.xk.mapper.UserStatesMapper;
import com.xk.pojo.Userstates;
import com.xk.service.UserStatesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserStatesServiceImpl implements UserStatesService {

    @Autowired
    UserStatesMapper userStatesMapper;

    @Override
    public List<Userstates> queryAllStates() {
        return userStatesMapper.queryAllStates();
    }
}
