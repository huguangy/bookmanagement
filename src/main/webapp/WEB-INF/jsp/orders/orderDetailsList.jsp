<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>订单详情</span>
    </div>
    <div class="search">
        <span>图书编号：</span>
        <input name="bookId" id="bookId" class="input-text" type="text"/>
        <span>图书价格：</span>
        <input name="unitPriceA" id="unitPriceA" class="input-text" type="text"/>
        ~
        <input name="unitPriceB" id="unitPriceB" class="input-text" type="text"/>
        <span>图书名称：</span>
        <input name="title" id="title" class="input-text" type="text"/>
        <input value="查 询" type="button" onclick="query(1)" id="searchbutton">
    </div>
    <table class="providerTable" cellpadding="0" cellspacing="0" id="orderListTable">
        <tr class="firstTr">
            <th width="5%">图书编号</th>
            <th width="10%">图书名称</th>
            <th width="5%">数量</th>
            <th width="5%">单价</th>
            <th width="5%">总价格</th>
        </tr>
    </table>
    <input type="hidden" id="orderId" value="${orderId}"/>
    <div class="page-bar" id="orderPage" >
    </div>
</div>
</section>
<%@include file="../common/foot.jsp" %>
<script type="text/javascript">
    $(function () {
        query(1);
    });

    function query(pageNum) {
        var bookId = $("#bookId").val();
        var unitPriceA = $("#unitPriceA").val();
        var unitPriceB = $("#unitPriceB").val();
        var title = $("#title").val();
        var orderId = $("#orderId").val();
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/order/queryOrderDetails",
            data: {
                bookId: bookId,
                title: title,
                orderId: orderId,
                unitPriceA: unitPriceA,
                unitPriceB: unitPriceB,
                pageNum: pageNum
            },
            dataType: "JSON",
            success: function (data) {
                $(".orderList").remove();
                $.each(data.list, function (index, value) {
                    var newhtml = "<tr class='orderList'>" +
                        "<td><span>" + value.bookID + "</span></td>" +
                        "<td><span>" + value.books.title + "</span></td>" +
                        "<td><span>" + value.quantity + "</span></td>" +
                        "<td><span>" + value.unitPrice + "</span></td>" +
                        "<td><span>" + (value.quantity * value.unitPrice) + "</span></td>" +
                        "</td></tr>";
                    // 填充页面
                    $("#orderListTable").append(newhtml);
                });
                $("#orderPage").html("");
                if (data.pageCount > 1) {
                    var pahehtml =
                        "<ul class='page-num-ul clearfix'>" +
                        "<li>共" + data.sumCount + "条记录&nbsp;&nbsp; " + data.pageNum + "/" + data.pageCount + "页</li>" +
                        "<a href='javascript:query(1);'>首页</a>" +
                        "<a href='javascript:query(" + (data.pageNum - 1) + ");'>上一页</a>" +
                        "<a href='javascript:query(" + (data.pageNum + 1) + ");'>下一页</a>" +
                        "<a href='javascript:query(" + data.pageCount + ");'>最后一页</a>" +
                        "</ul>";
                    $("#orderPage").html(pahehtml);
                }
/*
                $("#inputPageVal").val(data.pageNum);
*/
                /*+
                    "<span class='page-go-form'><label>跳转至</label>"+
                "<input type='text' value='"+ $("#inputPageVal").val()+"' name='inputPage' id='inputPage' class='page-key'/>页"+
                "<button type='button' onclick='goPage()' class='page-btn'>GO</button>"+
                "</span>"*/
            },
            error: function (e, n) {
            }
        });
    }
</script>