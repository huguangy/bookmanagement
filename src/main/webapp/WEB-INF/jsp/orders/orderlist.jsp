<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<style>
    .search input[type='text'] {
        width: 50px;
    }
</style>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>订单管理</span>
    </div>
    <div class="search">
        <span>订单号：</span>
        <input name="orderId" id="orderId" class="input-text" type="text"/>
        <span>订单时间：</span>
        <input name="startTime" style="width: 150px;" id="startTime" class="input-text" type="text"/>
        ~
        <input name="endTime" style="width: 150px;" id="endTime" class="input-text" type="text"/>
        <span>用户账号：</span>
        <input name="loginId" style="width: 150px;" id="loginId" class="input-text" type="text"/>
        <span>价格：</span>
        <input name="totalPriceA" id="totalPriceA" class="input-text" type="text"/>
        ~
        <input name="totalPriceB" id="totalPriceB" class="input-text" type="text"/>
        <span>状态</span>
        <%-- 默认选中  ： selected="selected"--%>
        <select name="state" id="state">
            <option value="0" selected>---请选择---</option>
            <option value="1">已付款</option>
            <option value="2">未付款</option>
            <option value="3">已发货</option>
            <option value="4">待收货</option>
            <option value="5">已收货</option>
            <option value="6">待退货</option>
            <option value="7">已退款</option>
            <option value="8">交易成功</option>
        </select>
        <input value="查 询" type="button" onclick="query()" id="searchbutton">
    </div>
    <!--用户-->
    <table class="providerTable" cellpadding="0" cellspacing="0" id="orderListTable">
        <tr class="firstTr">
            <th width="5%">订单号</th>
            <th width="20%">订单时间</th>
            <th width="20%">用户账号</th>
            <th width="10%">总价格</th>
            <%-- 管理员不展示 --%>
            <th width="10%">状态</th>
        </tr>
    </table>
    <input type="hidden" id="pageNum" value="1"/>
    <div class="page-bar" id="orderPage" align="centre">
    </div>
</div>
</section>

<%@include file="../common/foot.jsp" %>
<script type="text/javascript">
    $(function () {
        query(1);
    });

    function query(pageNum) {
        var orderId = $("#orderId").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        var totalPriceA = $("#totalPriceA").val();
        var totalPriceB = $("#totalPriceB").val();
        var state = $("#state").val();
        var loginId = $("#loginId").val();
       /* $("#pageNum").val(pageNum);*/
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/order/queryOrder",
            data: {
                pageNum:pageNum,
                orderId: orderId,
                startTime: startTime,
                endTime: endTime,
                totalPriceA: totalPriceA,
                totalPriceB: totalPriceB,
                state: state,
                loginId: loginId
            },
            dataType: "JSON",
            success: function (data) {
                $(".orderList").remove();
                $.each(data.list, function (index, value) {
                    var orderState = "";
                    switch (value.state) {
                        case 1:
                            orderState = "已付款";
                            break;
                        case 2:
                            orderState = "未付款";
                            break;
                        case 3:
                            orderState = "已发货";
                            break;
                        case 4:
                            orderState = "待收货";
                            break;
                        case 5:
                            orderState = "已收货";
                            break;
                        case 6:
                            orderState = "待退货";
                            break;
                        case 7:
                            orderState = "已退款";
                            break;
                        case 8:
                            orderState = "交易成功";
                            break;
                    }
                    var newhtml = "<tr class='orderList'>" +
                        "<td><span>" + value.id + "</span></td>" +
                        "<td><span>" + value.orderDate + "</span></td>" +
                        "<td><span>" + value.users.loginId + "</span></td>" +
                        "<td><span>" + value.totalPrice + "</span></td>" +
                        "<td><span>" + orderState + "</span></td>" +
                        "<td><span><a class='viewUser' href='${pageContext.request.contextPath }/orderDetailsList.html?orderId="+value.id+"'><img src='${pageContext.request.contextPath }/statics/images/read.png' alt='查看' title='查看'/></a></span>" +
                        "<span><a class='modifyUser' href='${pageContext.request.contextPath }/order/queryOrder_id/"+value.id+"'><img src='${pageContext.request.contextPath }/statics/images/xiugai.png' alt='修改' title='修改'/></a></span>" +
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
                $("#inputPageVal").val(data.pageNum);
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