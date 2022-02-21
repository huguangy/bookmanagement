package com.xk.pojo;

import java.util.Date;
/**
 * table name:  bookratings
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Bookratings{

	private Integer id;
	private Integer bookId;
	private Integer userId;
	private Integer rating;
	private String comment;

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
	public void setRating(Integer rating){
		this.rating=rating;
	}
	public Integer getRating(){
		return rating;
	}
	public void setComment(String comment){
		this.comment=comment;
	}
	public String getComment(){
		return comment;
	}
}

