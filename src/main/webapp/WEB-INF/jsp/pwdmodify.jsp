<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>密码修改页面</span>
    </div>
    <div class="providerAdd">
        <input type="hidden" name="method" value="savepwd">
        <!--div的class 为error是验证错误，ok是验证成功-->
        <div class="info">${message}</div>
        <div class="">
            <label for="oldPassword">旧密码：</label>
            <input type="password" name="oldpassword" id="oldpassword" value="">
            <font color="red"></font>
        </div>
        <div>
            <label for="newPassword">新密码：</label>
            <input type="password" name="newpassword" id="newpassword" value="">
            <font color="red"></font>
        </div>
        <div>
            <label for="rnewpassword">确认新密码：</label>
            <input type="password" name="rnewpassword" id="rnewpassword" value="">
            <font color="red"></font>
        </div>
        <div class="providerAddBtn">
            <!--<a href="#">保存</a>-->
            <input type="button" onclick="updatePwd()" name="save" id="save" value="保存" class="input-button">
        </div>
    </div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript">
    function updatePwd() {
        var oldpassword = $("#oldpassword").val();
        var newpassword = $("#newpassword").val();
        var rnewpassword = $("#rnewpassword").val();


        if (oldpassword == '') {
            alert("旧密码不能为空");
        } else if (newpassword == '') {
            alert("新密码不能为空");
        } else if (newpassword.length < 6 || newpassword.length > 12) {
            alert("密码的长度必须在6~12位之间");
        } else if (newpassword != rnewpassword) {
            alert("两次密码必须一致！");
        } else {
            $.ajax({
                url: "${pageContext.request.contextPath }/user/updateUserPwd",
                type: "post",
                data: {
                    oldpassword: oldpassword, newpassword: newpassword
                },
                dataType: "text",
                success: function (data) {
                    if (data == '1') {
                        alert("修改成功!请重新登录！");
                        window.location = "${pageContext.request.contextPath }/";
                    } else if (data == '2') {
                        alert("旧密码错误，请确认后再试！");
                    }
                },
                error: function (e, n) {
                }
            });
        }
    }
</script>