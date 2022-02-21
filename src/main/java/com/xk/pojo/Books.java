package com.xk.pojo;

import java.util.Date;
/**
 * table name:  books
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Books{

	private Integer id;
	private String title;
	private String author;
	private Integer categoryId;
	private double unitPrice;
	private Integer clicks;
	private Integer publisherId;
	private String publishDate;
	private String ISBN;
	private Integer wordsCount;
	private String contentDescription;
	private String aurhorDescription;
	private String editorComment;
	private String TOC;
	private String cover;
	private double discountPrice;
	private Integer bookstate;
	private Publishers publishers;
	private  Categories categories;

	public Books() {
	}

	public Books(Integer id, Integer bookstate) {
		this.id = id;
		this.bookstate = bookstate;
	}

	public Publishers getPublishers() {
		return publishers;
	}

	public void setPublishers(Publishers publishers) {
		this.publishers = publishers;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getTitle(){
		return title;
	}
	public void setAuthor(String author){
		this.author=author;
	}
	public String getAuthor(){
		return author;
	}
	public void setCategoryId(Integer categoryId){
		this.categoryId=categoryId;
	}
	public Integer getCategoryId(){
		return categoryId;
	}
	public void setUnitPrice(double unitPrice){
		this.unitPrice=unitPrice;
	}
	public double getUnitPrice(){
		return unitPrice;
	}
	public void setClicks(Integer clicks){
		this.clicks=clicks;
	}
	public Integer getClicks(){
		return clicks;
	}
	public void setPublisherId(Integer publisherId){
		this.publisherId=publisherId;
	}
	public Integer getPublisherId(){
		return publisherId;
	}
	public void setPublishDate(String publishDate){
		this.publishDate=publishDate;
	}
	public String getPublishDate(){
		return publishDate;
	}
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	public String getISBN(){
		return ISBN;
	}
	public void setWordsCount(Integer wordsCount){
		this.wordsCount=wordsCount;
	}
	public Integer getWordsCount(){
		return wordsCount;
	}
	public void setContentDescription(String contentDescription){
		this.contentDescription=contentDescription;
	}
	public String getContentDescription(){
		return contentDescription;
	}
	public void setAurhorDescription(String aurhorDescription){
		this.aurhorDescription=aurhorDescription;
	}
	public String getAurhorDescription(){
		return aurhorDescription;
	}
	public void setEditorComment(String editorComment){
		this.editorComment=editorComment;
	}
	public String getEditorComment(){
		return editorComment;
	}
	public void setTOC(String TOC){
		this.TOC=TOC;
	}
	public String getTOC(){
		return TOC;
	}
	public void setCover(String cover){
		this.cover=cover;
	}
	public String getCover(){
		return cover;
	}
	public void setDiscountPrice(double discountPrice){
		this.discountPrice=discountPrice;
	}
	public double getDiscountPrice(){
		return discountPrice;
	}
	public void setBookstate(Integer bookstate){
		this.bookstate=bookstate;
	}
	public Integer getBookstate(){
		return bookstate;
	}
}

