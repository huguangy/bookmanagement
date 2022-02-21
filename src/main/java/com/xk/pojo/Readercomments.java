package com.xk.pojo;

import java.util.Date;
/**
 * table name:  readercomments
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Readercomments{

	private Integer id;
	private Integer bookId;
	private String readerName;
	private String title;
	private String comment;
	private String date;

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setBookId(Integer bookId){
		this.bookId=bookId;
	}
	public Integer getBookId(){
		return bookId;
	}
	public void setReaderName(String readerName){
		this.readerName=readerName;
	}
	public String getReaderName(){
		return readerName;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getTitle(){
		return title;
	}
	public void setComment(String comment){
		this.comment=comment;
	}
	public String getComment(){
		return comment;
	}
	public void setDate(String date){
		this.date=date;
	}
	public String getDate(){
		return date;
	}
}

