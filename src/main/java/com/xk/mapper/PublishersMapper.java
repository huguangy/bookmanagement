package com.xk.mapper;

import com.xk.pojo.Publishers;

import java.util.List;
import java.util.Map;

public interface PublishersMapper {

    List<Publishers> queryPublishers(Map map);

    List<Publishers> queryPublishers_book();

    int queryPublisherscount(Map map);

    int insertPublishers(String name);

    int updatePublishers(Publishers publishers);

    int deletePublishers(Integer id);

}
