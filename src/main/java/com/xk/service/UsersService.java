package com.xk.service;


import com.xk.pojo.Users;

import java.util.List;
import java.util.Map;

public interface UsersService {

    /**
     * 通过登录账号查询 用户对象
     * @param loginId
     * @return
     */
    Users userLogin(String loginId,String loginPwd);

    List<Users> queryAllUser(Map<String,Object> map);

    int queryAllUserCount(Map<String,Object> map);

    Users queryUser_id(int userId);

    int updateUser(Users users);

    int insertUser(Users users);

}
