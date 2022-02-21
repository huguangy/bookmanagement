<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>订单管理页面 >>订单修改页面</span>
    </div>
    <div class="providerAdd">
        <form method="post" action="${pageContext.request.contextPath }/order/updateOrder">
            <div>
                <label for="ordersId">订单编号：</label>
                <input type="text" readonly name="id" id="ordersId" value="${orders.id }">
            </div>
            <div>
                <label for="orderDate">创建时间：</label>
                <input type="text" readonly  id="orderDate" value="${orders.orderDate }">
            </div>
            <div>
                <label for="loginId">用户账号：</label>
                <input type="text" readonly  id="loginId" value="${orders.users.loginId }">
            </div>
            <div>
                <label for="totalPrice">订单总金额：</label>
                <input type="text" readonly  id="totalPrice" value="${orders.totalPrice }">
            </div>
            <div>
                <label>状态：</label>
                <select name="state" id="state">
                   <option <c:if test="${orders.state eq 1}"> selected </c:if> value="1">已付款</option>
                   <option <c:if test="${orders.state eq 2}"> selected </c:if> value="2">未付款</option>
                   <option <c:if test="${orders.state eq 3}"> selected </c:if> value="3">已发货</option>
                   <option <c:if test="${orders.state eq 4}"> selected </c:if> value="4">待收货</option>
                   <option <c:if test="${orders.state eq 5}"> selected </c:if> value="5">已收货</option>
                   <option <c:if test="${orders.state eq 6}"> selected </c:if> value="6">待退货</option>
                   <option <c:if test="${orders.state eq 7}"> selected </c:if> value="7">已退款</option>
                   <option <c:if test="${orders.state eq 8}"> selected </c:if> value="8">交易成功</option>
                </select>
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
    $("#back").click(function (){
        window.history.go(-1);
    })
</script>