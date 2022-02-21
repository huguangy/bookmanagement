package com.xk.pojo;

import java.util.Date;
/**
 * table name:  users
 * author name: mj
 * create time: 2021-11-06 09:19:56
 */ 
public class Users{

	public Users() {
	}

	public Users(Integer id, Integer userStateId) {
		this.id = id;
		this.userStateId = userStateId;
	}

	private Integer id;
	private String name;
	private String address;
	private String phone;
	private String mail;
	private Integer userStateId;
	private Integer isOnLine;
	private String loginId;
	private String loginPwd;
	private Integer userRoleId;
	private Integer gender;
	private Userroles userroles;
	private Userstates userstates;

	public Userroles getUserroles() {
		return userroles;
	}

	public void setUserroles(Userroles userroles) {
		this.userroles = userroles;
	}

	public Userstates getUserstates() {
		return userstates;
	}

	public void setUserstates(Userstates userstates) {
		this.userstates = userstates;
	}

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
	public void setAddress(String address){
		this.address=address;
	}
	public String getAddress(){
		return address;
	}
	public void setPhone(String phone){
		this.phone=phone;
	}
	public String getPhone(){
		return phone;
	}
	public void setMail(String mail){
		this.mail=mail;
	}
	public String getMail(){
		return mail;
	}
	public void setUserStateId(Integer userStateId){
		this.userStateId=userStateId;
	}
	public Integer getUserStateId(){
		return userStateId;
	}
	public void setIsOnLine(Integer isOnLine){
		this.isOnLine=isOnLine;
	}
	public Integer getIsOnLine(){
		return isOnLine;
	}
	public void setLoginId(String loginId){
		this.loginId=loginId;
	}
	public String getLoginId(){
		return loginId;
	}
	public void setLoginPwd(String loginPwd){
		this.loginPwd=loginPwd;
	}
	public String getLoginPwd(){
		return loginPwd;
	}
	public void setUserRoleId(Integer userRoleId){
		this.userRoleId=userRoleId;
	}
	public Integer getUserRoleId(){
		return userRoleId;
	}
	public void setGender(Integer gender){
		this.gender=gender;
	}
	public Integer getGender(){
		return gender;
	}

	@Override
	public String toString() {
		return "Users{" +
				"id=" + id +
				", name='" + name + '\'' +
				", address='" + address + '\'' +
				", phone='" + phone + '\'' +
				", mail='" + mail + '\'' +
				", userStateId=" + userStateId +
				", isOnLine=" + isOnLine +
				", loginId='" + loginId + '\'' +
				", loginPwd='" + loginPwd + '\'' +
				", userRoleId=" + userRoleId +
				", gender=" + gender +
				'}';
	}
}

