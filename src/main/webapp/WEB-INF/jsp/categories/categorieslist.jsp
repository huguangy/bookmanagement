<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>分类管理页面</span>
    </div>
    <div class="search">
        <span>编号：</span>
        <input name="id" id="id" class="input-text" type="text"/>
        <span>名称：</span>
        <input name="name" id="name" class="input-text" type="text"/>
        <span>一级分类</span>
        <%-- 默认选中  ： selected="selected"--%>
        <select name="parentId" id="parentId" class="categoriesParent">
            <option value="-1" selected>---请选择---</option>
        </select>
        <input value="查 询" type="button" onclick="query(1)" id="searchbutton">


        <span>添加分类：</span>
        <input name="publisherName" id="publisherName" class="input-text" type="text"/>
        <span>一级分类</span>
        <%-- 默认选中  ： selected="selected"--%>
        <select name="parent_id" id="parent_id" class="categoriesParent">
        </select>
        <input value="添 加" type="button" id="addPublisher">
    </div>
    <table class="providerTable" cellpadding="0" cellspacing="0" id="categoriesListTable">
        <tr class="firstTr">
            <th width="10%">编号</th>
            <th width="40%">名称</th>
            <th width="40%">一级分类</th>
            <th width="10%">操作</th>
        </tr>
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
        query(1);
        $("#addPublisher").click(function () {
            $.ajax({
                url: "${pageContext.request.contextPath }/categories/addCategories",
                type: "post",
                data: {name: $("#publisherName").val(), parent: $("#parent_id").val()},
                dataType: "text",
                success: function (data) {
                    if (data == '1') {
                        query(parseInt($("#pageCount").val()) + 1);
                        alert("添加成功！");
                    }
                },
                error: function (e, n) {
                }
            });
        });
        $.ajax({
            url: "${pageContext.request.contextPath }/categories/queryCategoriesParent",
            type: "post",
            data: {},
            dataType: "JSON",
            async: false,
            success: function (data) {
                $.each(data, function (index, value) {
                    var newHTML = "<option id='" + value.id + "' value='" + value.id + "'>" + value.name + "</option>";
                    // 填充页面
                    $(".categoriesParent").append(newHTML);
                });
            },
            error: function (e, n) {
            }
        });
    });

    function updateCategories(id, pid) {
        $.ajax({
            url: "${pageContext.request.contextPath }/categories/updateCategories",
            type: "post",
            data: {id: id, name: $("#td" + id).val(), parent: pid},
            dataType: "text",
            success: function (data) {
                if (data == '1') {
                    alert("修改成功！");
                }
            },
            error: function (e, n) {
            }
        });
    }

    function deleteCategories(id) {
        if (window.confirm("请确认是否删除当前分类（确保分类无图书）!")) {

            $.ajax({
                url: "${pageContext.request.contextPath }/categories/deleteCategories",
                type: "post",
                data: {id: id},
                dataType: "text",
                success: function (data) {
                    if (data == '1') {
                        query($("#pageNum").val());
                        alert("删除成功！");
                    } else {
                        alert("删除失败，请先删除子表数据！");
                    }
                },
                error: function (e, n) {
                }
            });
        }
    }

    function categoriesParent(pid) {
        var newHTML = "<select>";
        $.ajax({
            url: "${pageContext.request.contextPath }/categories/queryCategoriesParent",
            type: "post",
            data: {},
            dataType: "JSON",
            async: false,
            success: function (data) {
                $.each(data, function (index, value) {
                    if (pid == 0) {
                        newHTML += "<option value='" + value.id + "'>暂无父级</option>";
                    } else {
                        newHTML += "<option ";
                        if (pid == value.id) {
                            newHTML += " selected ";
                        }
                        newHTML += " value='" + value.id + "'>" + value.name + "</option>";
                    }

                });
            },
            error: function (e, n) {
            }
        });
        return newHTML += "</select>";
    }


    function query(pageNum) {
        var id = $("#id").val();
        var name = $("#name").val();
        var parentId = $("#parentId").val();

        if (id == '') {
            id = 0;
        }
        $.ajax({
            url: "${pageContext.request.contextPath }/categories/queryCategories",
            type: "post",
            data: {
                id: id, name: name, parent: parentId, pageNum: pageNum
            },
            dataType: "JSON",
            success: function (data) {
                $(".categoriesList").remove();
                $.each(data.list, function (index, value) {
                    var newhtml = "<tr class='categoriesList'>" +
                        "<td><span>" + value.id + "</span></td>" +
                        "<td><input id='td" + value.id + "' type='text' value='" + value.name + "'/></span></td>" +
                        "<td><span>" + categoriesParent(value.parent) + "</span></td>" +
                        "<td><span><a class='modifyUser' href='javascript:updateCategories(" + value.id + "," + value.parent + ")'><img src='${pageContext.request.contextPath }/statics/images/xiugai.png' alt='修改' title='修改'/></a></span>" +
                        "<span><a class='modifyUser' href='javascript:deleteCategories(" + value.id + ")'><img src='${pageContext.request.contextPath }/statics/images/schu.png' alt='删除' title='删除'/></a></span>" +
                        "</td></tr>";
                    // 填充页面
                    $("#categoriesListTable").append(newhtml);
                });
                $("#categoriesPage").html("");
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
                    $("#categoriesPage").html(pahehtml);
                }
            },
            error: function (e, n) {
            }
        });
    }
</script>