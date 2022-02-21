package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.service.UserStatesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("userStates")
public class UserStatesController {

    @Autowired
    UserStatesService userStatesService;

    @RequestMapping(value = "queryStates",method = RequestMethod.POST)
    @ResponseBody
    public String queryAllStates(){

        return JSON.toJSONString(userStatesService.queryAllStates());

    };
}
