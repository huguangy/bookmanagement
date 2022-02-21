package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.pojo.Advertising;
import com.xk.service.AdvertisingService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

@Controller
@RequestMapping("advertising")
public class AdvertisingController {

    @Autowired
    private AdvertisingService advertisingService;

    @RequestMapping(value = "queryAdvertising" ,method = RequestMethod.POST)
    @ResponseBody
    public String queryAdvertising(@RequestParam(value = "classify",defaultValue = "0") Integer classify,
                                         @RequestParam(value = "state" ,defaultValue = "0") Integer state){

        HashMap<String, Object> map = new HashMap<>();
        map.put("classify",classify);
        map.put("state",state);

        return JSON.toJSONString(advertisingService.queryAdvertising(map));
    }

    @RequestMapping(value = "addAdvertising",method = RequestMethod.POST)
    public String addAdvertising(@ModelAttribute Advertising advertising,
                                 @RequestParam("file") MultipartFile file){
        String fileName = "";
        if(!file.isEmpty()){
            String extension = FilenameUtils.getExtension(file.getOriginalFilename());
            //获得项目的地址
            //System.out.println(request.getServletContext().getRealPath("/webapp/statics/images/cover"));
//            自定义地址
            String filePath="D:\\xk-work\\ssm-work\\bookmanagement\\src\\main\\webapp\\statics\\images\\cover\\";
            fileName= UUID.randomUUID().toString().replace("-","")+"."+extension;
            filePath= filePath+fileName;
            System.out.println(filePath);
            try {
                file.transferTo(new File(filePath));
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        advertising.setPicture(fileName);
        advertisingService.addAdvertising(advertising);
        return "advertising/advertisinglist";
    }

    @RequestMapping("deleteAdvertising")
    @ResponseBody
    public String deleteAdvertising(@RequestParam("id") Integer id){
        return JSON.toJSONString(advertisingService.deleteAdvertising(id));
    }
}
