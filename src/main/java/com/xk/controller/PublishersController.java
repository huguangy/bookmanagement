package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.pojo.Publishers;
import com.xk.service.PublishersService;
import com.xk.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("publishers")
public class PublishersController {

    @Autowired
    private PublishersService publishersService;

    @RequestMapping("queryPublishers")
    @ResponseBody
    public String queryPublishers(@RequestParam(value = "id",defaultValue = "0") Integer id,
                                  @RequestParam(value = "name",defaultValue = "") String name,
                                  @RequestParam(value = "pageNum") Integer pageNum){

        HashMap<String, Object> map = new HashMap<>();


        map.put("id",id);

        map.put("name",name);


        PageUtil<Publishers> publishersPageUtil = new PageUtil<>();
        publishersPageUtil.setPageSize(5);
        publishersPageUtil.setSumCount(publishersService.queryPublisherscount(map));
        publishersPageUtil.setPageNum(pageNum);

        map.put("pageSize",publishersPageUtil.getPageSize());
        map.put("pageNum",(pageNum-1)*publishersPageUtil.getPageSize());

        publishersPageUtil.setList(publishersService.queryPublishers(map));

        return JSON.toJSONString(publishersPageUtil);
    }

    @RequestMapping("insertPublishers")
    @ResponseBody
    public String insertPublishers(@RequestParam("name") String name){
        return JSON.toJSONString(publishersService.insertPublishers(name));
    }

    @RequestMapping("updatePublishers")
    @ResponseBody
    public String updatePublishers(Publishers publishers){
        return JSON.toJSONString(publishersService.updatePublishers(publishers));
    }

    @RequestMapping("deletePublishers")
    @ResponseBody
    public String deletePublishers(@RequestParam("id") Integer id){
        return JSON.toJSONString(publishersService.deletePublishers(id));
    }
}
