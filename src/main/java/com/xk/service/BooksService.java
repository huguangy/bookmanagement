package com.xk.service;

import com.xk.pojo.Books;

import java.util.List;
import java.util.Map;

public interface BooksService {
    List<Books> queryBookList(Map map);

    int queryBookListcount(Map map);

    Books queryBook_id(int id);

    int modifyBook(Books books);

    int addBook(Books books);

}
