<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>广告管理页面 >> 广告添加页面</span>
    </div>
    <div class="providerAdd">
        <form method="post" action="${pageContext.request.contextPath }/advertising/addAdvertising" enctype="multipart/form-data">
            <input type="hidden" id="classify" name="classify" value="${index}"/>
            <!--div的class 为error是验证错误，ok是验证成功-->
            <div class="advertisingadd_A">
                <label for="content">内容：</label>
                <input type="text" name="content" id="content" value="">
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>
            <div class="advertisingadd_B">
                <label for="file">封面：</label>
                <input type="file" name="file" id="file" value="">
                <font color="red" id="error_loginPwd"></font>
            </div>

            <div class="advertisingadd_C">
                <label for="categoriesId">分类名称：</label>
                <!-- 列出所有的角色分类 -->
                <select name="categoriesId" id="categoriesId">
                </select>
            </div>
            <div>
                <label for="state">状态：</label>
                <!-- 列出所有的角色分类 -->
                <select name="state" id="state">
                    <option value="1">正常</option>
                    <option value="2">禁用</option>
                </select>
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
<script type="text/javascript">
    $(function () {

        var classify = $("#classify").val();
        if (classify == '1') {
            $(".advertisingadd_A").show();
            $(".advertisingadd_B").show();
            $(".advertisingadd_C").hide();
        }else if(classify == '2'){
            $(".advertisingadd_A").hide();
            $(".advertisingadd_B").hide();
            $(".advertisingadd_C").show();
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
                        $("#categoriesId").append("<option value='" + value.id + "'>" + value.name + "</option>");
                    });
                },
                error: function (e, n) {
                }
            });
        }else{
            $(".advertisingadd_A").show();
            $(".advertisingadd_B").hide();
            $(".advertisingadd_C").hide();
        }
    })
</script>
<script type="text/javascript">
    var backBtn = null;
    $(function () {
        backBtn = $("#back");
        backBtn.on("click", function () {
            history.back(-1);
        });
    });
</script>
