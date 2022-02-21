package com.xk.mapper;

import com.xk.pojo.Categories;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface CategoriesMapper {

    List<Categories> queryCategories(Map map);

    int queryCategoriescount(Map map);

    int addCategories(Map map);

    int updateCategories(Categories categories);

    int deleteCategories(Integer id);
}
