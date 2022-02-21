package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.service.UserRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("userRoles")
public class UserRolesController {

    @Autowired
    UserRolesService userRolesService;

    @RequestMapping(value = "queryRoles",method = RequestMethod.POST)
    @ResponseBody
    public String queryAllRoles(){

        return JSON.toJSONString(userRolesService.queryAllRoles());
    }
}
