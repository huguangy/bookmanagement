package com.xk.service.impl;

import com.xk.mapper.BooksMapper;
import com.xk.mapper.CategoriesMapper;
import com.xk.pojo.Categories;
import com.xk.service.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoriesServiceImpl implements CategoriesService {

    @Autowired
    private CategoriesMapper categoriesMapper;

    @Autowired
    private BooksMapper booksMapper;

    @Override
    public List<Categories> queryCategories(Map map) {
        return categoriesMapper.queryCategories(map);
    }

    @Override
    public int queryCategoriescount(Map map) {
        return categoriesMapper.queryCategoriescount(map);
    }

    @Override
    public int addCategories(Map map) {
        return categoriesMapper.addCategories(map);
    }

    @Override
    public int updateCategories(Categories categories) {
        return categoriesMapper.updateCategories(categories);
    }

    @Override
    public int deleteCategories(Integer id) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("categoryId",id);
        if(booksMapper.queryBookListcount(map)==0){
            return categoriesMapper.deleteCategories(id);
        }
        return 0;

    }
}
