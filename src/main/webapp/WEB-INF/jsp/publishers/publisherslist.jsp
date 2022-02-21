<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>出版社管理页面</span>
    </div>
    <div class="search">
        <span>编号：</span>
        <input name="id" id="id" class="input-text" type="text"/>
        <span>名称：</span>
        <input name="name" id="name" class="input-text" type="text"/>
        <input value="查 询" type="button" onclick="query(1)" id="searchbutton">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span >添加出版社：</span>
        <input name="publisherName" id="publisherName" class="input-text" type="text"/>
        <input value="添 加" type="button" id="addPublisher"  >
    </div>
    <table class="providerTable" cellpadding="0" cellspacing="0" id="publishersListTable">
        <tr class="firstTr">
            <th width="50%">编号</th>
            <th width="40%">名称</th>
            <th width="10%">操作</th>
        </tr>
    </table>

    <input type="hidden" id="pageNum" value="1"/>
    <input type="hidden" id="pageCount" value="1"/>

    <div class="page-bar" id="publishersPage">
    </div>
</div>
</section>

<%@include file="../common/foot.jsp" %>
<script type="text/javascript">
    $(function () {
        query(1);

        $("#addPublisher").click(function(){
            $.ajax({
                url: "${pageContext.request.contextPath }/publishers/insertPublishers",
                type: "post",
                data: {
                    name: $("#publisherName").val()
                },
                dataType: "text",
                success: function (data) {
                    if (data == '1') {
                        query(parseInt($("#pageCount").val()) +1);
                        alert("添加成功!");
                    }
                },
                error: function (e, n) {
                }
            });
        });
    });

    function query(pageNum) {

        if (pageNum<1){
            pageNum=1;
        }else if(pageNum>parseInt($("#pageCount").val())){
            pageNum=parseInt($("#pageCount").val());
        }

        var id = $("#id").val();
        var name = $("#name").val();
        if (id == '') {
            id = 0;
        }
        $.ajax({
            url: "${pageContext.request.contextPath }/publishers/queryPublishers",
            type: "post",
            data: {
                id: id, name: name, pageNum: pageNum
            },
            dataType: "JSON",
            success: function (data) {
                $(".publisherList").remove();
                $.each(data.list, function (index, value) {
                    var newhtml = "<tr class='publisherList'>" +
                        "<td><span>" + value.id + "</span></td>" +
                        "<td><span><input id='" + value.id + "'  type='text' value=" + value.name + " />" +
                        "<a class='modifyUser' onclick='update(" + value.id + ")' href='#'><img src='${pageContext.request.contextPath }/statics/images/xiugai.png' alt='修改' title='修改'/></a></span></td>" +
                        "<td><span></span>" +
                        "<span><a class='modifyUser' href='javascript:deletePublishers(" + value.id + ")'><img src='${pageContext.request.contextPath }/statics/images/schu.png' alt='删除' title='删除'/></a></span>" +
                        "</td></tr>";
                    // 填充页面
                    $("#publishersListTable").append(newhtml);
                });
                $("#publishersPage").html("");
                if (data.pageCount > 1) {
                    $("#pageCount").val(data.pageCount);
                    $("#pageNum").val(data.pageNum);

                    var pahehtml =
                        "<ul class='page-num-ul clearfix'>" +
                        "<li>共" + data.sumCount + "条记录&nbsp;&nbsp; " + data.pageNum + "/" + data.pageCount + "页</li>" +
                        "<a href='javascript:query(1);'>首页</a>" +
                        "<a href='javascript:query(" + (data.pageNum - 1) + ");'>上一页</a>" +
                        "<a href='javascript:query(" + (data.pageNum + 1) + ");'>下一页</a>" +
                        "<a href='javascript:query(" + data.pageCount + ");'>最后一页</a>" +
                        "</ul>";
                    $("#publishersPage").html(pahehtml);
                }
            },
            error: function (e, n) {
            }
        });
    }

    function update(id) {
        if (window.confirm("确定修改"+$("#"+id).val()+"吗？")){
        $.ajax({
            url: "${pageContext.request.contextPath }/publishers/updatePublishers",
            type: "post",
            data: {
                id: id, name: $("#"+id).val()
            },
            dataType: "text",
            success: function (data) {
                if (data == '1') {
                    alert("修改成功!");
                }
            },
            error: function (e, n) {
            }
        });
        }
    }
    function deletePublishers(id) {
        if (window.confirm("确定删除当前出版社吗？")){
        $.ajax({
            url: "${pageContext.request.contextPath }/publishers/deletePublishers",
            type: "post",
            data: {
                id: id
            },
            dataType: "text",
            success: function (data) {
                if (data == '1') {
                    query($("#pageNum").val());
                    alert("删除成功!");
                }else{
                    alert("请先删除子表数据!");
                }
            },
            error: function (e, n) {
            }
        });
        }
    }
</script>