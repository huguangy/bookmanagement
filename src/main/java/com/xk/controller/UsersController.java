package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.pojo.Users;
import com.xk.service.UserRolesService;
import com.xk.service.UserStatesService;
import com.xk.service.UsersService;
import com.xk.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private UserStatesService userStatesService;

    @Autowired
    private UserRolesService userRolesService;

    @RequestMapping(value = "userLogin", method = RequestMethod.POST)
    public String userLogin(@RequestParam("userCode") String userCode,
                            @RequestParam("userPwd") String userPwd,
                            HttpServletRequest request,
                            Model model) {
        System.out.println("你好面试");

        Users users = usersService.userLogin(userCode, userPwd);
        if (null != users) {
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(60 * 60 * 2);
            session.setAttribute("SESSION_USER", users);
            return "users/userlist";
        } else {
            model.addAttribute("message", "账号或密码错误!");
            return "/login";
        }
    }

    @RequestMapping(value = "queryAllUsers",method = RequestMethod.POST)
    @ResponseBody
    public String queryAllUsers(@RequestParam(value = "userName",defaultValue = "") String userName,
                                      @RequestParam(value = "loginId",defaultValue = "") String loginId,
                                      @RequestParam(value = "rolesId",defaultValue = "0") int rolesId,
                                      @RequestParam(value = "statesId",defaultValue = "0") int statesId,
                                      @RequestParam(value = "pageNum",defaultValue = "1") int pageNum
                                      ){
        Map<String,Object> map=new HashMap<>();
        map.put("userName",userName);
        map.put("loginId",loginId);
        map.put("rolesId",rolesId);
        map.put("statesId",statesId);

        PageUtil<Users> usersPageUtil=new PageUtil<>();
        usersPageUtil.setUserName(userName);
        usersPageUtil.setLoginId(loginId);
        usersPageUtil.setRolesId(rolesId);
        usersPageUtil.setStatesId(statesId);
        usersPageUtil.setPageSize(5);
        usersPageUtil.setSumCount(usersService.queryAllUserCount(map));
        usersPageUtil.setPageNum(pageNum);

        map.put("pageNum",(usersPageUtil.getPageNum()-1)*usersPageUtil.getPageSize());
        map.put("pageSize",usersPageUtil.getPageSize());

        List<Users> list = usersService.queryAllUser(map);
        usersPageUtil.setList(list);
        System.out.println(JSON.toJSONString(usersPageUtil));
        return JSON.toJSONString(usersPageUtil);
    }

    @RequestMapping("queryUser")
    public ModelAndView queryUser_id(@RequestParam("userId") int userId){
        ModelAndView modelAndView = new ModelAndView();
        Users user=usersService.queryUser_id(userId);
        modelAndView.addObject("user",user);
        System.out.println(user);
        modelAndView.setViewName("users/userview");
        return modelAndView;
    }
    
    @RequestMapping(value = "queryUser_modify")
    public ModelAndView queryUser_modify(@RequestParam("userId") int userId,
                                         @RequestParam("inputPageVal") int inputPageVal,
                                         @RequestParam("userName") String userName,
                                         @RequestParam("loginId") String loginId,
                                         @RequestParam("rolesId") int rolesId,
                                         @RequestParam("statesId") int statesId){
        ModelAndView modelAndView = new ModelAndView();
        Users users = usersService.queryUser_id(userId);
        modelAndView.addObject("userRolesList",userRolesService.queryAllRoles());
        modelAndView.addObject("userStatesList",userStatesService.queryAllStates());
        modelAndView.addObject("users",users);
        modelAndView.addObject("inputPageVal",inputPageVal);
        modelAndView.addObject("userName",userName);
        modelAndView.addObject("loginId",loginId);
        modelAndView.addObject("rolesId",rolesId);
        modelAndView.addObject("statesId",statesId);

        modelAndView.setViewName("users/usermodify");
        System.out.println(modelAndView);

        return modelAndView;
    }
//    userName: userName, loginId: loginId, rolesId: rolesId, statesId: statesId, pageNum: pageNum
    @RequestMapping("updateUser")
    public ModelAndView updateUser(Users users,
                                   @RequestParam(value = "hidden_userName",defaultValue = "") String userName,
                                   @RequestParam(value = "hidden_loginId",defaultValue = "") String loginId,
                                   @RequestParam(value = "hidden_rolesId",defaultValue = "0") int rolesId,
                                   @RequestParam(value = "hidden_statesId",defaultValue = "0") int statesId,
                                   @RequestParam(value = "hidden_inputPageVal",defaultValue = "1") int pageNum
                           ){
        usersService.updateUser(users);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userName",userName);
        modelAndView.addObject("loginId",loginId);
        modelAndView.addObject("rolesId",rolesId);
        modelAndView.addObject("statesId",statesId);
        modelAndView.addObject("inputPageVal",pageNum);
        modelAndView.setViewName("users/userlist");

        return modelAndView;
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public String deleteUser(@RequestParam("userId") int userId){

        return JSON.toJSONString(usersService.updateUser(new Users(userId,2)));
    }

    @RequestMapping(value = "addUser",method = RequestMethod.POST)
    public String insertUser(@ModelAttribute Users users){
        usersService.insertUser(users);
        return "users/userlist";
    }

    @RequestMapping(value = "updateUserPwd" ,method = RequestMethod.POST)
    @ResponseBody
    public int updateUserPwd(@RequestParam("oldpassword") String oldpassword,
                                @RequestParam("newpassword") String newpassword,
                                HttpServletRequest request){
        Users users = (Users) request.getSession().getAttribute("SESSION_USER");
        if (users.getLoginPwd().equals(oldpassword)){
            Users users1 = new Users();
            users1.setId(users.getId());
            users1.setLoginPwd(newpassword);
            //设置session失效
            request.getSession().invalidate();
            return usersService.updateUser(users1);
        }else {
            return 2;
        }
    }
    
}
