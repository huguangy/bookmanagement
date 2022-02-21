package com.xk.service.impl;

import com.xk.mapper.UsersMapper;
import com.xk.pojo.Users;
import com.xk.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service // 用于 注解service实现类
@Transactional(propagation = Propagation.REQUIRED)
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersMapper usersMapper;

    /**
     * 通过登录账号查询 用户对象
     *
     * @param loginId
     * @param loginPwd
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Users userLogin(String loginId, String loginPwd) {
        Users users = usersMapper.queryUser_loginId(loginId);
        System.out.println("users:"+users);
        if (null != users && users.getLoginPwd().equals(loginPwd)) {
            return users;
        }
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Users> queryAllUser(Map<String, Object> map) {
         return usersMapper.queryAllUser(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int queryAllUserCount(Map<String, Object> map) {
        return usersMapper.queryAllUserCount(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Users queryUser_id(int userId) {
        return usersMapper.queryUser_id(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int updateUser(Users users) {
        return usersMapper.updateUser(users);
    }

    @Override
    public int insertUser(Users users) {
        return usersMapper.insertUser(users);
    }
}
