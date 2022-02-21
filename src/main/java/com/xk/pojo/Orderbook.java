package com.xk.pojo;

import java.util.Date;
/**
 * table name:  orderbook
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Orderbook{

	private Integer id;
	private Integer orderID;
	private Integer bookID;
	private Integer quantity;
	private double unitPrice;
	private Books books;

	public Books getBooks() {
		return books;
	}

	public void setBooks(Books books) {
		this.books = books;
	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setOrderID(Integer orderID){
		this.orderID=orderID;
	}
	public Integer getOrderID(){
		return orderID;
	}
	public void setBookID(Integer bookID){
		this.bookID=bookID;
	}
	public Integer getBookID(){
		return bookID;
	}
	public void setQuantity(Integer quantity){
		this.quantity=quantity;
	}
	public Integer getQuantity(){
		return quantity;
	}
	public void setUnitPrice(double unitPrice){
		this.unitPrice=unitPrice;
	}
	public double getUnitPrice(){
		return unitPrice;
	}
}

