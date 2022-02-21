<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>

<style>
    .search input[type='number'] {
        width: 90px;
        height: 30px;
        outline: none;
        padding-left: 10px;
        border: 1px solid #8ab2d5;
        border-radius: 4px;
    }

    .search {
        height: 100px;
        line-height: 50px;
        background: #f6fafd;
        padding-left: 24px;
        color: #000;
    }
</style>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>图书管理页面</span>
    </div>
    <div class="search">
        <span>图书编号：</span>
        <input name="id" id="id" class="input-text" type="text"/>
        <span>图书标题：</span>
        <input name="title" id="title" class="input-text" type="text"/>
        <span>图书作者：</span>
        <input name="author" id="author" class="input-text" type="text"/>
        <span>出版时间：</span>
        <input class="Wdate" type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
               id="publishDateA" name="publishDateA"/>
        ~
        <input class="Wdate" type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
               id="publishDateB" name="publishDateB"/>
        <br/>
        <span>图书价格：</span>
        <input name="unitPriceA" id="unitPriceA" class="input-text" type="number"/>
        ~
        <input name="unitPriceB" id="unitPriceB" class="input-text" type="number"/>
        <span>图书分类</span>
        <select name="categoryId" id="categoryId"></select>
        <span>出版社</span>
        <select name="publisherId" id="publisherId" style=" width: 170px;"></select>
        <input value="查 询" type="button" onclick="query(1)" id="searchbutton">
        <a href="${pageContext.request.contextPath}/book/bookadd.html">添加图书</a>
    </div>
    <table class="providerTable" cellpadding="0" cellspacing="0" id="booksListTable">
        <tr class="firstTr">
            <th width="10%">图书编号</th>
            <th width="10%">标题</th>
            <th width="5%">状态</th>
            <th width="10%">作者</th>
            <th width="10%">价格</th>
            <th width="10%">折扣价</th>
            <th width="5%">点击量</th>
            <th width="10%">分类</th>
            <th width="10%">出版社</th>
            <th width="10%">出版时间</th>
            <th width="10%">操作</th>
        </tr>
    </table>
    <div class="page-bar" id="bookPage" align="centre"></div>
</div>
</section>
<%@include file="../common/foot.jsp" %>

<script type="text/javascript">
    $(function () {
        query(1);
        $.ajax({
            url: "${pageContext.request.contextPath }/categories/queryCategories",
            type: "post",
            data: {
                id: 0,
                name: '',
                parent: -2,
                pageNum: -1
            },
            dataType: "JSON",
            success: function (data) {
                $("#categoryId").append("<option value='0'>请选择</option>");
                $.each(data.list, function (index, value) {
                    $("#categoryId").append("<option value='" + value.id + "'>" + value.name + "</option>");
                });
            },
            error: function (e, n) {
            }
        });
        $.ajax({
            url: "${pageContext.request.contextPath }/publishers/queryPublishers",
            type: "post",
            data: {
                id: 0,
                name: '',
                pageNum: -1
            },
            dataType: "JSON",
            success: function (data) {
                $("#publisherId").append("<option value='0'>请选择</option>");
                $.each(data.list, function (index, value) {
                    $("#publisherId").append("<option  value='" + value.id + "'>" + value.name + "</option>");
                });
            },
            error: function (e, n) {
            }
        });
    });

    function query(pageNum) {
        var id = $("#id").val();
        var title = $("#title").val();
        var author = $("#author").val();
        var publishDateA = $("#publishDateA").val();
        var publishDateB = $("#publishDateB").val();
        var unitPriceA = $("#unitPriceA").val();
        var unitPriceB = $("#unitPriceB").val();
        var categoryId = $("#categoryId").val();
        var publisherId = $("#publisherId").val();
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/book/queryBookList",
            data: {
                id: id,
                title: title,
                author: author,
                publishDateA: publishDateA,
                publishDateB: publishDateB,
                unitPriceA: unitPriceA,
                unitPriceB: unitPriceB,
                categoryId: categoryId,
                publisherId: publisherId,
                pageNum: pageNum
            },
            dataType: "JSON",
            success: function (data) {
                $(".book_tr").remove();
                $.each(data.list, function (index, value) {
                    var newhtml = "<tr class='book_tr'>" +
                        "<td><span>" + value.id + "</span></td>" +
                        "<td><span>" + value.title + "</span></td>" +
                        "<td><span>" + (value.bookstate==1?"正常":"下架") + "</span></td>" +
                        "<td><span>" + value.author + "</span></td>" +
                        "<td><span>￥" + value.unitPrice + "</span></td>" +
                        "<td><span>" +(value.discountPrice==0?'暂无折扣':'￥'+value.discountPrice) + "</span></td>" +
                        "<td><span>" + value.clicks + "</span></td>" +
                        "<td><span>" + value.categories.name + "</span></td>" +
                        "<td><span>" + value.publishers.name + "</span></td>" +
                        "<td><span>" + (value.publishDate.substring(0,value.publishDate.indexOf(' ')) )+ "</span></td>" +
                        "<td><span><a class='viewUser' href='${pageContext.request.contextPath }/book/bookview.html?bookId="+value.id+"'><img src='${pageContext.request.contextPath }/statics/images/read.png' alt='查看' title='查看'/></a></span>" +
                        "<span><a class='modifyUser' href='${pageContext.request.contextPath }/book/bookmodify.html?bookId="+value.id+"'><img src='${pageContext.request.contextPath }/statics/images/xiugai.png' alt='修改' title='修改'/></a></span>" +
                        "<span><a class='deleteUser' href='javascript:delBook("+value.id+")'><img src='${pageContext.request.contextPath }/statics/images/schu.png' alt='下架' title='下架'/></a></span>" +
                        "</td></tr>";
                    // 填充页面
                    $("#booksListTable").append(newhtml);
                });
                $("#bookPage").html("");

                if (data.pageCount > 1) {
                    var pahehtml =
                        "<ul class='page-num-ul clearfix'>" +
                        "<li>共" + data.sumCount + "条记录&nbsp;&nbsp; " + data.pageNum + "/" + data.pageCount + "页</li>" +
                        "<a href='javascript:query(1);'>首页</a>" +
                        "<a href='javascript:query(" + (data.pageNum - 1) + ");'>上一页</a>" +
                        "<a href='javascript:query(" + (data.pageNum + 1) + ");'>下一页</a>" +
                        "<a href='javascript:query(" + data.pageCount + ");'>最后一页</a>" +
                        "</ul>";
                    $("#bookPage").html(pahehtml);
                }
            },
            error: function (e, n) {
            }
        });
    }

    function delBook(bookId) {
        if (confirm("你确定要下架图书吗？")) {
            $.ajax({
                url: "${pageContext.request.contextPath }/book/deleteBook",
                type: "post",
                data: {bookId: bookId},
                dataType: "text",
                success: function (data) {
                    if (data == '1') {
                        query(1);
                        alert("下架成功");
                    }
                },
                error: function (e, n) {
                }
            });
        }
    }
</script>


