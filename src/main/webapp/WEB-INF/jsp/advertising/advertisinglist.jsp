<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>


<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>广告管理页面</span>
    </div>
    <div class="search">
        <span>分类</span>
        <select name="classify" id="classify" class="categoriesParent">
            <option value="1" selected>顶部推荐广告</option>
            <option value="2">中心部位的分类推荐广告</option>
            <option value="3">公告</option>
        </select>
        <span>状态</span>
        <select name="state" id="state" class="categoriesParent">
            <option value="1" selected>正常</option>
            <option value="2">禁用</option>
        </select>
        <input value="查 询" type="button" onclick="query()" id="searchbutton">

        <a href="${pageContext.request.contextPath}/advertisingadd.html/1">顶部广告</a>
        <a href="${pageContext.request.contextPath}/advertisingadd.html/2">中心广告</a>
        <a href="${pageContext.request.contextPath}/advertisingadd.html/3">添加公告</a>
    </div>
    <table class="providerTable" cellpadding="0" cellspacing="0" id="advertisingList">


    </table>

    <input type="hidden" id="pageNum" value="1"/>
    <input type="hidden" id="pageCount" value="1"/>

    <div class="page-bar" id="categoriesPage">
    </div>
</div>
</section>

<%@include file="../common/foot.jsp" %>
<script type="text/javascript">
    $(function () {
        query();
    });
    function delAdvertising(id){
        if (window.confirm("请确认是否删除当前广告吗？")) {
            $.ajax({
                url: "${pageContext.request.contextPath }/advertising/deleteAdvertising",
                type: "post",
                data: {id: id},
                dataType: "text",
                success: function (data) {
                    if (data == '1') {
                        query();
                        alert("删除成功！");
                    } else {
                        alert("删除失败！");
                    }
                },
                error: function (e, n) {
                }
            });
        }
    }

    function query() {
        var classify = $("#classify").val();
        var state = $("#state").val();

            $.ajax({
            url: "${pageContext.request.contextPath }/advertising/queryAdvertising",
            type: "post",
            data: {
                classify: classify, state: state
            },
            dataType: "JSON",
            success: function (data) {
                $("#advertisingList tr").remove();
                var html = "<tr class='firstTr'><th width='5%'>编号</th>";
                if (classify == '1') {
                    html += "<th width='30%'>内容</th>" +
                        "<th width='20%'>封面</th>";
                } else if (classify == '2') {
                    html += "<th width='40%'>分类名称</th>";
                } else if (classify == '3') {
                    html += "<th width='40%'>内容</th>";
                }
                html += "<th width='20%'>创建时间</th><th width='10%'>状态</th><th width='5%'>操作</th></tr>"
                $.each(data, function (index, value) {
                    html += "<tr class='book_tr'>";
                    html += "<td><span>" + (index+1) + "</span></td>" ;
                    if (classify == '1') {
                        html += "<td><span>" + value.content + "</span></td>" +
                            "<td><img style='width: 90px;height: 90px;' src='${pageContext.request.contextPath }/statics/images/cover/" + value.picture + "'/></td>";
                    } else if (classify == '2') {
                        html += "<td><span>" + value.categoriesName + "</span></td>";
                    } else if (classify == '3') {
                        html += "<td><span>" + value.content + "</span></td>";
                    }
                    html += "<td><span>" +value.createTime + "</span></td>" ;
                    html += "<td><span>" +(value.state==1?'正常':'禁用') + "</span></td>" ;
                    html += "<td><span><a class='modifyUser' href='${pageContext.request.contextPath }/'><img src='${pageContext.request.contextPath }/statics/images/xiugai.png' alt='修改' title='修改'/></a></span>" +
                        "<span><a class='deleteUser' href='javascript:delAdvertising(" + value.id + ")'><img src='${pageContext.request.contextPath }/statics/images/schu.png' alt='删除' title='删除'/></a></span>" +
                        "</td></tr>";
                });
                // 填充页面
                $("#advertisingList").append(html);
            },
            error: function (e, n) {
            }
        });
    }
</script>