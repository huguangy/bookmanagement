<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/public.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>图书管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${sessionScope.SESSION_USER.name }</span> , 欢迎你！</p>
        <a href="#" onclick="loginOut()">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="${pageContext.request.contextPath }/userList.html">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath }/orderlist.html">订单管理</a></li>
                <li><a href="${pageContext.request.contextPath }/booklist.html">图书管理</a></li>
                <li><a href="${pageContext.request.contextPath }/publisherslist.html">出版社管理 </a></li>
                <li><a href="${pageContext.request.contextPath }/categorieslist.html">分类管理 </a></li>
                <li><a href="${pageContext.request.contextPath }/advertisinglist.html">广告管理 </a></li>
                <li><a href="${pageContext.request.contextPath }/pwdmodify.html">密码修改</a></li>
                <li><a href="#" onclick="loginOut()">退出系统</a></li>
            </ul>
        </nav>
    </div>
