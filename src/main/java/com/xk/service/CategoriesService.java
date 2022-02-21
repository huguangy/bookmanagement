package com.xk.service;

import com.xk.pojo.Categories;

import java.util.List;
import java.util.Map;

public interface CategoriesService {
    List<Categories> queryCategories(Map map);
    int queryCategoriescount(Map map);
    int addCategories(Map map);
    int updateCategories(Categories categories);
    int deleteCategories(Integer id);
}
