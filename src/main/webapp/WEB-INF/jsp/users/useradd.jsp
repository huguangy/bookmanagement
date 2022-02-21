<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>用户管理页面 >> 用户添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/addUser">
            <!--div的class 为error是验证错误，ok是验证成功-->
            <div>
                <label for="loginId">用户账号：</label>
                <input type="text" name="loginId" id="loginId" value="">
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>
            <div>
                <label for="loginPwd">用户密码：</label>
                <input type="password" name="loginPwd" id="loginPwd" value="">
                <font color="red" id="error_loginPwd"></font>
            </div>
            <div>
                <label for="ruserPassword">确认密码：</label>
                <input type="password" name="ruserPassword" id="ruserPassword" value="">
                <font color="red" id="error_ruserPassword"></font>
            </div>
            <div>
                <label for="name">用户名称：</label>
                <input type="text" name="name" id="name" value="">
                <font color="red"></font>
            </div>
            <div>
                <label>用户角色：</label>
                <!-- 列出所有的角色分类 -->
                <select name="userRoleId" id="userRoleId">
                </select>
            </div>
            <div>
                <label>用户性别：</label>
                <select name="gender" id="gender">
                    <option value="1" selected="selected">男</option>
                    <option value="2">女</option>
                </select>
            </div>
            <div>
                <label for="phone">用户电话：</label>
                <input type="text" name="phone" id="phone" value="">
                <font color="red"></font>
            </div>
            <div>
                <label for="address">用户地址：</label>
                <input name="address" id="address" value="">
            </div>
            <div>
                <label for="address">用户邮箱：</label>
                <input name="mail" id="mail" value="">
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
<script type="text/javaScript">
    $(function () {
        $("#back").click(function (){
            window.history.go(-1);
        });
        // 为表单 绑定submit提交事件  true ：提交  false：不能提交  将错误消息显示在 提示标签中
        $("#userForm").submit(function () {
            var loginPwd = $("#loginPwd").val();
            var ruserPassword = $("#ruserPassword").val();
            if (loginPwd == '') {
                $("#error_loginPwd").html("密码不能为空！");
            } else if (loginPwd.length < 6 || loginPwd.length > 12) {
                $("#error_loginPwd").html("密码长度需要在6~12位！");
            } else if (loginPwd != ruserPassword) {
                $("#error_loginPwd").html("密码与确认密码必须一致!");
            }else{
                return true;
            }
            return false;
        });

        $.ajax({
            url: "${pageContext.request.contextPath }/userRoles/queryRoles",
            type: "POST",
            data: {},
            dataType: "JSON",
            success: function (data) {
                var newHtml = "";
                $.each(data, function (index, value) {
                    newHtml += "<option value='" + value.id + "'>" + value.name + "</option>";
                })
                $("#userRoleId").html(newHtml);
            },
            error: function (e, n) {
            }
        });
    });
</script>
