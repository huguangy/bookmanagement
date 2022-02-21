package com.xk.service.impl;

import com.xk.mapper.BooksMapper;
import com.xk.mapper.PublishersMapper;
import com.xk.pojo.Publishers;
import com.xk.service.BooksService;
import com.xk.service.PublishersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("publishersServiceImpl")
@Transactional(propagation = Propagation.REQUIRED)
public class PublishersServiceImpl implements PublishersService {

    @Autowired
     private PublishersMapper publishersMapper;

    @Autowired
    private BooksMapper booksMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int insertPublishers(String name) {
        return publishersMapper.insertPublishers(name);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Publishers> queryPublishers(Map map) {
        return publishersMapper.queryPublishers(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int queryPublisherscount(Map map) {
        return publishersMapper.queryPublisherscount(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Publishers> queryPublishers_book() {
        return publishersMapper.queryPublishers_book();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int updatePublishers(Publishers publishers) {
        return publishersMapper.updatePublishers(publishers);
    }

    /**
     * 当前为分类表（主键表） 则分表与图书表存在主外键关系
     *  需要删除图书表，才能删处出版社表
     * @param id
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public int deletePublishers(Integer id) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("publisherId",id);
        if(booksMapper.queryBookListcount(map)==0){
           return publishersMapper.deletePublishers(id);
        }
        return 0;
    }
}
