package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.pojo.Categories;
import com.xk.service.CategoriesService;
import com.xk.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller
@RequestMapping("categories")
public class CategoriesController {

    @Autowired
    private CategoriesService categoriesService;

    /**
     *  查询二级分类
     *  查询二级分类数量
     * @param categories
     * @param pageNum
     * @return
     */
    @RequestMapping("queryCategories")
    @ResponseBody
    public String queryCategories(@ModelAttribute Categories categories,
                                  @RequestParam("pageNum") Integer pageNum){

        HashMap<String, Object> map = new HashMap<>();

        map.put("categories",categories);

        PageUtil<Categories> categoriesPageUtil = new PageUtil<>();

        categoriesPageUtil.setPageSize(5);
        categoriesPageUtil.setSumCount(categoriesService.queryCategoriescount(map));
        categoriesPageUtil.setPageNum(pageNum);

        map.put("pageSize",categoriesPageUtil.getPageSize());
        map.put("pageNum",(pageNum-1)*categoriesPageUtil.getPageSize());

        categoriesPageUtil.setList(categoriesService.queryCategories(map));
        System.out.println(categoriesPageUtil.getList());

        return JSON.toJSONString(categoriesPageUtil);
    }

    @RequestMapping(value = "queryCategoriesParent" ,method = RequestMethod.POST)
    @ResponseBody
    public String queryCategoriesParent(){
        Categories categories = new Categories();
        categories.setParent(0);
        HashMap<String, Object> map = new HashMap<>();
        map.put("categories",categories);
        map.put("pageNum",null);
        return JSON.toJSONString(categoriesService.queryCategories(map));
    }

    @RequestMapping(value = "addCategories",method = RequestMethod.POST)
    @ResponseBody
    public String addCategories(@RequestParam(value = "name" ,defaultValue ="") String name,
                                @RequestParam(value = "parent") Integer parent){
        HashMap<String, Object> map = new HashMap<>();

        map.put("name",name);
        map.put("parent",parent);

        return JSON.toJSONString(categoriesService.addCategories(map));
    }

    @RequestMapping(value = "updateCategories" ,method = RequestMethod.POST)
    @ResponseBody
    public String updateCategories(@ModelAttribute Categories categories){

        return JSON.toJSONString(categoriesService.updateCategories(categories));
    }

    @RequestMapping(value = "deleteCategories",method = RequestMethod.POST)
    @ResponseBody
    public String deleteCategories(@RequestParam("id") Integer id){
        return JSON.toJSONString(categoriesService.deleteCategories(id));
    }
}
