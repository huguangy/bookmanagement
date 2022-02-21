package com.xk.service.impl;

import com.xk.mapper.UserRolesMapper;
import com.xk.pojo.Userroles;
import com.xk.service.UserRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserRolesServiceImpl implements UserRolesService {

    @Autowired
    UserRolesMapper userRolesMapper;

    @Override
    public List<Userroles> queryAllRoles() {
        return userRolesMapper.queryAllRoles();
    }
}
