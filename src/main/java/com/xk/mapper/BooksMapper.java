package com.xk.mapper;

import com.xk.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BooksMapper {

    List<Books> queryBookList(Map map);

    int queryBookListcount(Map map);

    Books queryBook_id(@Param("id") int id);

    int modifyBook(Books books);

    int addBook(Books books);

}
