package com.xk.mapper;

import com.xk.pojo.Users;

import java.util.List;
import java.util.Map;

public interface UsersMapper {

    /**
     * 通过登录账号查询 用户对象
     * @param loginId
     * @return
     */
    Users queryUser_loginId(String loginId);

    List<Users> queryAllUser(Map<String,Object> map);

    Users queryUser_id(int userId);

    int queryAllUserCount(Map<String,Object> map);

    int updateUser(Users users);

    int insertUser(Users users);
}
