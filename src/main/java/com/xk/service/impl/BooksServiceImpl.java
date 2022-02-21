package com.xk.service.impl;

import com.xk.mapper.BooksMapper;
import com.xk.pojo.Books;
import com.xk.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional(propagation = Propagation.SUPPORTS ,readOnly = true)
public class BooksServiceImpl implements BooksService {

    @Autowired
    private BooksMapper booksMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS ,readOnly = true)
    public List<Books> queryBookList(Map map) {
        return booksMapper.queryBookList(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS ,readOnly = true)
    public int queryBookListcount(Map map) {
        return booksMapper.queryBookListcount(map);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS ,readOnly = true)
    public Books queryBook_id(int id) {
        return booksMapper.queryBook_id(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS ,readOnly = true)
    public int modifyBook(Books books) {
        return booksMapper.modifyBook(books);
    }

    @Override
    public int addBook(Books books) {
        return booksMapper.addBook(books);
    }
}
