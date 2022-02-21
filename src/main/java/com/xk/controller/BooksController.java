package com.xk.controller;

import com.alibaba.fastjson.JSON;
import com.xk.pojo.Books;
import com.xk.pojo.Categories;
import com.xk.pojo.Publishers;
import com.xk.service.BooksService;
import com.xk.service.CategoriesService;
import com.xk.service.PublishersService;
import com.xk.utils.PageUtil;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("book")
public class BooksController {

    @Autowired
    private BooksService booksService;

    @Autowired
    private CategoriesService categoriesService;

    @Autowired
    private PublishersService publishersService;

    @RequestMapping("queryBookList")
    @ResponseBody
    public String queryBookList(@RequestParam(value="id" ,defaultValue="0") Integer id,
                                @RequestParam(value="title" ,defaultValue="") String title,
                                @RequestParam(value="author" ,defaultValue="") String author,
                                @RequestParam(value="publishDateA" ,defaultValue="") String publishDateA,
                                @RequestParam(value="publishDateB" ,defaultValue="") String publishDateB,
                                @RequestParam(value="unitPriceA" ,defaultValue="0") Integer unitPriceA,
                                @RequestParam(value="unitPriceB" ,defaultValue="0") Integer unitPriceB,
                                @RequestParam(value="categoryId" ,defaultValue="0") Integer categoryId,
                                @RequestParam(value="publisherId" ,defaultValue="0") Integer publisherId,
                                @RequestParam(value="pageNum" ,defaultValue="1") Integer pageNum){
        HashMap<String, Object> map = new HashMap<>();

        map.put("id",id);
        map.put("title",title);
        map.put("author",author);
        map.put("publishDateA",publishDateA);
        map.put("publishDateB",publishDateB);
        map.put("unitPriceA",unitPriceA);
        map.put("unitPriceB",unitPriceB);
        map.put("categoryId",categoryId);
        map.put("publisherId",publisherId);

        PageUtil<Books> booksPageUtil = new PageUtil<>();

        booksPageUtil.setPageSize(5);
        booksPageUtil.setSumCount(booksService.queryBookListcount(map));
        booksPageUtil.setPageNum(pageNum);

        map.put("pageSize",booksPageUtil.getPageSize());
        map.put("pageNum",(pageNum-1)*booksPageUtil.getPageSize());

        booksPageUtil.setList(booksService.queryBookList(map));

        return JSON.toJSONString(booksPageUtil);
    }

    @RequestMapping("bookview.html")
    public ModelAndView bookview(@RequestParam("bookId") Integer id){
        ModelAndView modelAndView = new ModelAndView();
        Books books = booksService.queryBook_id(id);
        modelAndView.addObject("book",books);
        modelAndView.setViewName("books/bookview");
        return modelAndView;
    }

    @RequestMapping("bookmodify.html")
    public ModelAndView bookmodify(@RequestParam("bookId") Integer id){
        ModelAndView modelAndView = new ModelAndView();
        Books books = booksService.queryBook_id(id);
        HashMap<String, Object> map = new HashMap<>();
        Categories categories1 = new Categories();
        categories1.setParent(-2);
        map.put("categories",categories1);
        map.put("pageNum",null);
        List<Categories> categories = categoriesService.queryCategories(map);
        List<Publishers> publishers = publishersService.queryPublishers_book();
        modelAndView.addObject("publishersList",publishers);
        modelAndView.addObject("categoriesList",categories);
        modelAndView.addObject("book",books);

        modelAndView.setViewName("books/bookmodify");
        return modelAndView;
    }

    @RequestMapping(value = "modifyBook",method = RequestMethod.POST)
    public String modifyBook(@ModelAttribute Books books, @RequestParam("file") MultipartFile file, HttpServletRequest request){
        String fileName = "";
        if(!file.isEmpty()){
            String extension = FilenameUtils.getExtension(file.getOriginalFilename());
            //获得项目的地址
            //System.out.println(request.getServletContext().getRealPath("/webapp/statics/images/cover"));
//            自定义地址
            String filePath="D:\\xk-work\\ssm-work\\bookmanagement\\src\\main\\webapp\\statics\\images\\cover\\";
            fileName=UUID.randomUUID().toString().replace("-","")+"."+extension;
            filePath= filePath+fileName;
            System.out.println(filePath);
            try {
                file.transferTo(new File(filePath));
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        books.setCover(fileName);
        booksService.modifyBook(books);
        return "books/booklist";
    }

    @RequestMapping("deleteBook")
    @ResponseBody
    public String deleteBook(@RequestParam("bookId") Integer id){
        return JSON.toJSONString(booksService.modifyBook(new Books(id,2)));
    }

    @RequestMapping(value = "bookadd.html" ,method = RequestMethod.GET)
    public ModelAndView bookadd(){
        ModelAndView modelAndView = new ModelAndView();
        HashMap<String, Object> map = new HashMap<>();
        Categories categories = new Categories();
        categories.setParent(-2);
        map.put("categories",categories);
        map.put("pageNum",null);
        modelAndView.addObject("categoriesList",categoriesService.queryCategories(map));
        modelAndView.addObject("publishersList",publishersService.queryPublishers_book());
        modelAndView.setViewName("books/bookadd");
        return modelAndView;
    }

    @RequestMapping(value = "addBook",method = RequestMethod.POST)
    public String addBook(@ModelAttribute Books books,@RequestParam("file") MultipartFile file,HttpServletRequest request){
        String fileName="";
        if(!file.isEmpty()){
            String extension = FilenameUtils.getExtension(file.getOriginalFilename());
            String filePath="D:\\xk-work\\ssm-work\\bookmanagement\\src\\main\\webapp\\statics\\images\\cover\\";
            fileName= UUID.randomUUID().toString().replace("-", "") + "." + extension;
            filePath=filePath+fileName;
            try {
                file.transferTo(new File(filePath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        books.setCover(fileName);
        booksService.addBook(books);

        return "/books/booklist";
    }

}
