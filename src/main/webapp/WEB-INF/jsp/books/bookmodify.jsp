<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>图书管理页面 >> 图书信息修改页面</span>
    </div>
    <%----%>
    <div class="providerAdd">
        <%----%>
        <form method="post" action="${pageContext.request.contextPath }/book/modifyBook" enctype="multipart/form-data">
            <%-- 隐藏域  保存用户主键  用于 用户信息修改 --%>
            <input type="hidden" name="id" value="${book.id }"/>
            <div>
                <label for="title">图书状态：</label>
                <select name="bookstate" id="bookstate">
                        <option <c:if test="${book.bookstate eq 1}">selected</c:if> value="1">正常</option>
                    <option <c:if test="${book.bookstate eq 2}">selected</c:if> value="2">下架</option>
                </select>
                <font color="red"></font>
            </div>
            <div>
                <label for="title">图书标题：</label>
                <input type="text" name="title" id="title" value="${book.title }">
                <font color="red"></font>
            </div>
            <div>
                <label for="author">作者：</label>
                <input type="text" name="author" id="author" value="${book.author }">
                <font color="red"></font>
            </div>
            <div>
                <label for="unitPrice">价格：</label>
                <input type="text" name="unitPrice" id="unitPrice" value="${book.unitPrice }">
                <font color="red"></font>
            </div>
            <div>
                <label for="discountPrice">折扣价格：</label>
                <input type="text" name="discountPrice" id="discountPrice" value="${book.discountPrice }">
                <font color="red"></font>
            </div>
            <div>
                <label for="clicks">点击量：</label>
                <input type="text" name="clicks" id="clicks" value="${book.clicks }">
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
                <label for="cover">图书封面：</label>
                <img name="cover" id="cover"
                     src="${pageContext.request.contextPath }/statics/images/cover/${book.cover}">
            </div>
            <div>
                <label for="cover">修改封面：</label>
                <input type="file" name="file"/>
                <font color="red"></font>
            </div>
            <div>
                <label for="publishDate">出版时间：</label>
                <input type="text" name="publishDate" id="publishDate" value="${book.publishDate }">
                <font color="red"></font>
            </div>
            <div>
                <label for="ISBN">ISBN：</label>
                <input type="text" name="ISBN" id="ISBN" value="${book.ISBN }">
                <font color="red"></font>
            </div>
            <div>
                <label for="wordsCount">字数：</label>
                <input type="text" name="wordsCount" id="wordsCount" value="${book.wordsCount }">
                <font color="red"></font>
            </div>
            <div>
                <label for="contentDescription">内容简介：</label>
                <textarea name="contentDescription" id="contentDescription" rows="10" cols="60">
                    ${book.contentDescription}
                </textarea>
                <font color="red"></font>
            </div>
            <div>
                <label for="aurhorDescription">作者简介：</label>
                <textarea name="aurhorDescription" id="aurhorDescription" rows="10" cols="60">
                    ${book.aurhorDescription}
                </textarea>
                <font color="red"></font>
            </div>
            <div>
                <label for="editorComment">简介：</label>
                <textarea name="editorComment" id="editorComment" rows="10" cols="60">
                    ${book.editorComment}
                </textarea>
                <font color="red"></font>
            </div>
            <div>
                <label for="TOC">目录：</label>
                <textarea name="TOC" id="TOC" rows="10" cols="60">
                    ${book.TOC}
                </textarea>
                <font color="red"></font>
            </div>
            <div class="providerAddBtn">
                <input type="submit" name="save" id="save" value="保存"/>
                <input type="button" id="back" name="back" value="返回"/>
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="../common/foot.jsp" %>
<script type="text/javascript">
    var backBtn = null;
    $(function () {
        backBtn = $("#back");
        backBtn.on("click", function () {
            history.back(-1);
        });
    });
</script>