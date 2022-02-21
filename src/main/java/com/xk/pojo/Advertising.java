package com.xk.pojo;

import java.util.Date;
/**
 * table name:  advertising
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Advertising{

	private Integer id;
	private String content;
	private String picture;
	private Integer state;
	private String createTime;
	private Integer categoriesId;
	private Integer classify;
	private String categoriesName;

	public String getCategoriesName() {
		return categoriesName;
	}

	public void setCategoriesName(String categoriesName) {
		this.categoriesName = categoriesName;
	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setContent(String content){
		this.content=content;
	}
	public String getContent(){
		return content;
	}
	public void setPicture(String picture){
		this.picture=picture;
	}
	public String getPicture(){
		return picture;
	}
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return state;
	}
	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}
	public String getCreateTime(){
		return createTime;
	}
	public void setCategoriesId(Integer categoriesId){
		this.categoriesId=categoriesId;
	}
	public Integer getCategoriesId(){
		return categoriesId;
	}
	public void setClassify(Integer classify){
		this.classify=classify;
	}
	public Integer getClassify(){
		return classify;
	}
}

