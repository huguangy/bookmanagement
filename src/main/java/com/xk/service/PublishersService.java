package com.xk.service;

import com.xk.pojo.Publishers;

import java.util.List;
import java.util.Map;

public interface PublishersService {

    List<Publishers> queryPublishers(Map map);

    List<Publishers> queryPublishers_book();

    int queryPublisherscount(Map map);

    int insertPublishers(String name);

    int updatePublishers(Publishers publishers);

    /**
     * 当前为分类表（主键表） 则分表与图书表存在主外键关系
     *  需要删除图书表，才能删处出版社表
     * @param id
     * @return
     */
    int deletePublishers(Integer id);

}
