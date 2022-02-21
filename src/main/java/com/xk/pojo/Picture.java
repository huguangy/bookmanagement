package com.xk.pojo;

import java.util.Date;
/**
 * table name:  picture
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Picture{

	private Integer id;
	private Integer bookId;
	private Integer userId;
	private String pictureURL;
	private Integer order;

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
	public void setPictureURL(String pictureURL){
		this.pictureURL=pictureURL;
	}
	public String getPictureURL(){
		return pictureURL;
	}
	public void setOrder(Integer order){
		this.order=order;
	}
	public Integer getOrder(){
		return order;
	}
}

