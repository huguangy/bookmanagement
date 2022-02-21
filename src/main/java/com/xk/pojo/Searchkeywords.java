package com.xk.pojo;

import java.util.Date;
/**
 * table name:  searchkeywords
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Searchkeywords{

	private Integer id;
	private String keyword;
	private Integer searchCount;

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setKeyword(String keyword){
		this.keyword=keyword;
	}
	public String getKeyword(){
		return keyword;
	}
	public void setSearchCount(Integer searchCount){
		this.searchCount=searchCount;
	}
	public Integer getSearchCount(){
		return searchCount;
	}
}

