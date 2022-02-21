package com.xk.pojo;

import java.util.Date;
/**
 * table name:  orders
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Orders{

	private Integer id;
	private String orderDate;
	private Integer userId;
	private double totalPrice;
	private Integer state;
	private Users users;

	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setOrderDate(String orderDate){
		this.orderDate=orderDate;
	}
	public String getOrderDate(){
		return orderDate;
	}
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	public Integer getUserId(){
		return userId;
	}
	public void setTotalPrice(double totalPrice){
		this.totalPrice=totalPrice;
	}
	public double getTotalPrice(){
		return totalPrice;
	}
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return state;
	}

	@Override
	public String toString() {
		return "Orders{" +
				"id=" + id +
				", orderDate='" + orderDate + '\'' +
				", userId=" + userId +
				", totalPrice=" + totalPrice +
				", state=" + state +
				", users=" + users +
				'}';
	}
}

