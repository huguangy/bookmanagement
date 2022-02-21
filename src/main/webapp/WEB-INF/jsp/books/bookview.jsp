<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>图书管理页面 >> 图书信息查看页面</span>
    </div>
    <div class="providerView">
        <p><strong>图书编号：</strong><span>${book.id }</span></p>
        <p><strong>封面：</strong><img src="${pageContext.request.contextPath }/statics/images/cover/${book.cover }"/></p>
        <p><strong>标题：</strong><span>${book.title }</span></p>
        <p><strong>作者：</strong><span>${book.author }</span></p>
        <p><strong>分类：</strong><span>${book.categories.name }</span></p>
        <p><strong>价格：</strong><span>${book.unitPrice }</span></p>
        <p><strong>折扣价格：</strong><span>${book.discountPrice }</span></p>
        <p><strong>点击数：</strong><span>${book.clicks }</span></p>
        <p><strong>出版社：</strong><span>${book.publishers.name }</span></p>
        <p><strong>出版时间：</strong><span>${book.publishDate }</span></p>
        <p><strong>ISBN：</strong><span>${book.ISBN }</span></p>
        <p><strong>字数：</strong><span>${book.wordsCount }</span></p>
        <p><strong>内容简介：</strong><span>${book.contentDescription}</span></p>
        <p><strong>作者简介：</strong><span>${book.aurhorDescription }</span></p>
        <p><strong>简介：</strong><span>${book.editorComment }</span></p>
        <p><strong>目录简介：</strong><span>${book.TOC }</span></p>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" value="返回">
        </div>
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