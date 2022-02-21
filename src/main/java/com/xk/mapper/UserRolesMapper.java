package com.xk.mapper;

import com.xk.pojo.Userroles;
import com.xk.pojo.Users;
import com.xk.pojo.Userstates;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserRolesMapper {

    @Select("SELECT * FROM userroles")
    List<Userroles>  queryAllRoles();

}
