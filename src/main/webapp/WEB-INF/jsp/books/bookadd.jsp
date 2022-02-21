<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>图书管理页面 >> 图书添加页面</span>
    </div>
    <div class="providerAdd">
        <form method="post" action="${pageContext.request.contextPath }/book/addBook" enctype="multipart/form-data">
            <div>
                <label for="title">图书标题：</label>
                <input type="text" name="title" id="title"/>
                <font color="red"></font>
            </div>
            <div>
                <label for="author">作者：</label>
                <input type="text" name="author" id="author" />
                <font color="red"></font>
            </div>
            <div>
                <label for="unitPrice">价格：</label>
                <input type="text" name="unitPrice" id="unitPrice" />
                <font color="red"></font>
            </div>
            <div>
                <label for="discountPrice">折扣价格：</label>
                <input type="text" name="discountPrice" id="discountPrice" />
                <font color="red"></font>
            </div>
            <div>
                <label for="clicks">点击量：</label>
                <input type="text" name="clicks" id="clicks" />
                <font color="red"></font>
            </div>
            <div>
                <label>图书分类：</label>
                <select name="categoryId" id="categoryId">
                    <c:forEach items="${categoriesList}" var="categorie">
                        <option
                                <c:if test="${categorie.id eq book.categoryId}">selected</c:if>
                                value="${categorie.id}">${categorie.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label>图书出版社：</label>
                <select name="publisherId" id="publisherId">
                    <c:forEach items="${publishersList}" var="publisher">
                        <option
                                <c:if test="${publisher.id eq book.publisherId}">selected</c:if>
                                value="${publisher.id}">${publisher.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label for="file">修改封面：</label>
                <input type="file" name="file" id="file"/>
                <font color="red"></font>
            </div>
            <div>
                <label for="publishDate">出版时间：</label>
                <input class="Wdate" type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                       name="publishDate" id="publishDate"/>
                <font color="red"></font>
            </div>
            <div>
                <label for="ISBN">ISBN：</label>
                <input type="text" name="ISBN" id="ISBN" />
                <font color="red"></font>
            </div>
            <div>
                <label for="wordsCount">字数：</label>
                <input type="text" name="wordsCount" id="wordsCount" />
                <font color="red"></font>
            </div>
            <div>
                <label for="contentDescription">内容简介：</label>
                <textarea name="contentDescription" id="contentDescription" rows="10" cols="60"></textarea>
                <font color="red"></font>
            </div>
            <div>
                <label for="aurhorDescription">作者简介：</label>
                <textarea name="aurhorDescription" id="aurhorDescription" rows="10" cols="60"></textarea>
                <font color="red"></font>
            </div>
            <div>
                <label for="editorComment">简介：</label>
                <textarea name="editorComment" id="editorComment" rows="10" cols="60"></textarea>
                <font color="red"></font>
            </div>
            <div>
                <label for="TOC">目录：</label>
                <textarea name="TOC" id="TOC" rows="10" cols="60"></textarea>
                <font color="red"></font>
            </div>
            <div class="providerAddBtn">
                <input type="submit" name="add" id="add" value="保存">
                <input type="button" id="back" name="back" value="返回">
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="../common/foot.jsp" %>