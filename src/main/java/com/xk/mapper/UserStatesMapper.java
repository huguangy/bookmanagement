package com.xk.mapper;

import com.xk.pojo.Userstates;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserStatesMapper {

    @Select("SELECT * FROM userstates")
    List<Userstates> queryAllStates();

}
