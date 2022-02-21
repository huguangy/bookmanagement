package com.xk.pojo;

import java.util.Date;
/**
 * table name:  categories
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Categories{

	private Integer id;
	private String name;
	private Integer parent;

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setParent(Integer parent){
		this.parent=parent;
	}
	public Integer getParent(){
		return parent;
	}
}

