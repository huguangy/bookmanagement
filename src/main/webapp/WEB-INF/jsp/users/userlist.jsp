<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>用户管理页面</span>
    </div>
    <div class="search">
        <span>用户名：</span>
        <input name="userName" id="userName" class="input-text" type="text" value="${userName}"/>
        <span>账号：</span>
        <input name="loginId" id="loginId" class="input-text" type="text" value="${loginId}"/>
        <span>角色</span>
<%--         默认选中  ： selected="selected"--%>
        <select name="rolesId" id="rolesId">
        </select>
        <span>状态</span>
<%--         默认选中  ： selected="selected"--%>
        <select name="statesId" id="statesId">
        </select>
        <input value="查 询" type="button" onclick="query(1)" id="searchbutton">
        <a href="${pageContext.request.contextPath}/useradd.html">添加用户</a>
    </div>
    <!--用户-->
    <table class="providerTable" cellpadding="0" cellspacing="0" id="userListTable">
        <tr class="firstTr">
            <th width="5%">姓名</th>
            <th width="10%">账号</th>
            <th width="5%">状态</th>
            <th width="5%">角色</th>
            <%-- 管理员不展示 --%>
            <th width="5%">性别</th>
            <th width="20%">电话</th>
            <th width="20%">地址</th>
            <th width="20%">邮箱</th>
            <th width="20%">操作</th>
        </tr>

    </table>

    <input id="inputPageVal" type="hidden" value="${inputPageVal}"/>
    <input id="hidden_rolesId" type="hidden" value="${rolesId}"/>
    <input id="hidden_statesId" type="hidden" value="${statesId}"/>

    <div class="page-bar" id="userPage" align="centre">
    </div>
</div>
</section>

<input type="hidden" id="pageCount">

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗1111？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="../common/foot.jsp" %>
<script type="text/javascript">
    $(function () {
        var inputPageVal = $("#inputPageVal").val();
        if (inputPageVal == '') {
            inputPageVal = 1;
        }
        // 加载页面的数据
        query(inputPageVal);


        $.ajax({
            url: "${pageContext.request.contextPath }/userStates/queryStates",
            type: "POST",
            data: {},
            dataType: "JSON",
            success: function (data) {
                var hidden_statesId = $("#hidden_statesId").val();
                var newHtml = "<option ";
                if (hidden_statesId == '') {
                    newHtml += " selected ";
                }
                newHtml += "value='0'>--请选择--</option>";
                $.each(data, function (index, value) {
                    newHtml += "<option";
                    if (hidden_statesId == value.id) {
                        newHtml += " selected ";
                    }
                    newHtml += " value='" + value.id + "'>" + value.name + "</option>";
                });
                $("#statesId").html(newHtml);
            },
            error: function (e, n) {
            }
        });


        $.ajax({
            url: "${pageContext.request.contextPath }/userRoles/queryRoles",
            type: "POST",
            data: {},
            dataType: "JSON",
            success: function (data) {
                var hidden_rolesId = $("#hidden_rolesId").val();
                var newHtml = "<option";
                if (hidden_rolesId == '') {
                    newHtml += " selected ";
                }
                newHtml += " value='0'>--请选择--</option>";
                $.each(data, function (index, value) {
                    newHtml += "<option ";
                    if (hidden_rolesId == value.id) {
                        newHtml += " selected ";
                    }
                    newHtml += "value='" + value.id + "'>" + value.name + "</option>";
                })
                $("#rolesId").html(newHtml);
            },
            error: function (e, n) {
            }
        });
        //调用查询函数
        // query(1);
    });

    function query(pageNum) {
        if (pageNum<1){
         alert("已经是第一页了")
            pageNum=1;
        }else if (pageNum>parseInt($("#pageCount").val())){
            alert("已经是最后一页了")
            pageNum=parseInt($("#pageCount").val());
        }else {
            var userName = $("#userName").val();
            var loginId = $("#loginId").val();
            var rolesId = $("#rolesId").val();
            var statesId = $("#statesId").val();

            var hidden_rolesId = $("#hidden_rolesId").val();
            var hidden_statesId = $("#hidden_statesId").val();
            if(rolesId!=0 && hidden_rolesId!=''){
                rolesId = hidden_rolesId;
            }
            if(statesId!=0 && hidden_statesId!=''){
                statesId = hidden_statesId;
            }
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath }/user/queryAllUsers",
                data: {
                    userName: userName, loginId: loginId, rolesId: rolesId, statesId: statesId, pageNum: pageNum
                },
                dataType: "JSON",
                success: function (data) {
                    $(".userList").remove();
                    $.each(data.list, function (index, value) {
                        var sex = '男';
                        if (value.gender == 1) {
                            sex = '女';
                        }
                        var newhtml = "<tr class='userList'>" +
                            "<td><span>" + value.name + "</span></td>" +
                            "<td><span>" + value.loginId + "</span></td>" +
                            "<td><span>" + value.userstates.name + "</span></td>" +
                            "<td><span>" + value.userroles.name + "</span></td>" +
                            "<td><span>" + sex + "</span></td>" +
                            "<td><span>" + value.phone + "</span></td>" +
                            "<td><span>" + value.address + "</span></td>" +
                            "<td><span>" + value.mail + "</span></td>" +
                            "<td><span><a class='viewUser' href='${pageContext.request.contextPath }/user/queryUser?userId=" + value.id + "'><img src='${pageContext.request.contextPath }/statics/images/read.png' alt='查看' title='查看'/></a></span>" +
                            "<span><a class='modifyUser' href='${pageContext.request.contextPath }/user/queryUser_modify?userId=" + value.id + "&inputPageVal=" + pageNum + "&userName=" + data.userName + "&loginId=" + data.loginId + "&rolesId=" + data.rolesId + "&statesId=" + data.statesId + "'><img src='${pageContext.request.contextPath }/statics/images/xiugai.png' alt='修改' title='修改'/></a></span>" +
                            "<span><a class='deleteUser' href='javascript:delUser(" + value.id + ")'><img src='${pageContext.request.contextPath }/statics/images/schu.png' alt='删除' title='删除'/></a></span>" +
                            "</td></tr>";
                        // 填充页面
                        $("#userListTable").append(newhtml);
                    });
                    $("#userPage").html("");

                    if (data.pageCount > 1) {
                        var pahehtml =
                            "<ul class='page-num-ul clearfix'>" +
                            "<li>共" + data.sumCount + "条记录&nbsp;&nbsp; " + data.pageNum + "/" + data.pageCount + "页</li>" +
                            "<a href='javascript:query(1);'>首页</a>" +
                            "<a href='javascript:query(" + (data.pageNum - 1) + ");'>上一页</a>" +
                            "<a href='javascript:query(" + (data.pageNum + 1) + ");'>下一页</a>" +
                            "<a href='javascript:query(" + data.pageCount + ");'>最后一页</a>" +
                            "</ul>";
                        $("#userPage").html(pahehtml);
                    }
                    $("#inputPageVal").val(data.pageNum);
                    $("#hidden_rolesId").val('');
                    $("#hidden_statesId").val('');
                    if (data.pageCount==0){
                        $("#pageCount").val(1);
                    }else {
                        $("#pageCount").val(data.pageCount);
                    }
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

    }

    function goPage() {
        var inputPage = $("#inputPage").val();
        $("#inputPageVal").val(inputPage);
        query(inputPage);
    }

    function delUser(userId) {
        if (confirm("你确定要删除用户吗？2222222")) {
            $.ajax({
                url: "${pageContext.request.contextPath }/user/deleteUser",
                type: "get",
                data: {userId: userId},
                dataType: "text",
                success: function (data) {
                    if (data == '1') {
                        query($("#inputPageVal").val());
                        alert("删除成功");
                    }
                },
                error: function (e, n) {
                }
            });
        }
    }


</script>