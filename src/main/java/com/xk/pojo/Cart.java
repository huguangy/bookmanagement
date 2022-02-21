package com.xk.pojo;

import java.util.Date;
/**
 * table name:  cart
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Cart{

	private Integer id;
	private Integer bookId;
	private Integer userId;
	private String createDate;
	private Integer count;
	private Integer state;

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
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	public Integer getUserId(){
		return userId;
	}
	public void setCreateDate(String createDate){
		this.createDate=createDate;
	}
	public String getCreateDate(){
		return createDate;
	}
	public void setCount(Integer count){
		this.count=count;
	}
	public Integer getCount(){
		return count;
	}
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return state;
	}
}

