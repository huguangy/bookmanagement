<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>用户管理页面 >> 用户修改页面</span>
    </div>
    <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/updateUser">
            <%-- 隐藏域  保存用户主键  用于 用户信息修改 --%>
            <input type="hidden" name="id" value="${users.id }"/>

            <input type="hidden" name="hidden_userName" value="${userName}"/>
            <input type="hidden" name="hidden_inputPageVal" value="${inputPageVal}"/>
            <input type="hidden" name="hidden_loginId" value="${loginId}"/>
            <input type="hidden" name="hidden_rolesId" value="${rolesId}"/>
            <input type="hidden" name="hidden_statesId" value="${statesId}"/>

            <div>
                <label for="name">用户名称：</label>
                <input type="text" name="name" id="name" value="${users.name }">
                <font color="red"></font>
            </div>
            <div>
                <label>用户性别：</label>
                <select name="gender" id="gender">
                    <option value="0"
                            <c:if test="${users.gender == 0}">selected</c:if> >男
                    </option>
                    <option value="1"
                            <c:if test="${users.gender == 1}">selected</c:if> >女
                    </option>
                </select>
            </div>
            <div>
                <label>状态：</label>
                <select name="userStateId" id="userStateId">
                    <c:if test="${not empty userStatesList}">
                        <c:forEach items="${userStatesList}" var="userStates">
                            <option value="${userStates.id}"
                                    <c:if test="${userStates.id eq users.userStateId}">selected</c:if> >${userStates.name}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div>
                <label>角色：</label>
                <select name="userRoleId" id="userRoleId">
                    <c:if test="${not empty userRolesList}">
                        <c:forEach items="${userRolesList}" var="userRoles">
                            <option value="${userRoles.id}"
                                    <c:if test="${userRoles.id eq users.userRoleId}">selected</c:if> >${userRoles.name}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div>
                <label for="phone">用户电话：</label>
                <input type="text" name="phone" id="phone" value="${users.phone }">
                <font color="red"></font>
            </div>
            <div>
                <label for="address">用户地址：</label>
                <input type="text" name="address" id="address" value="${users.address }">
            </div>
            <div>
                <label for="address">用户邮箱：</label>
                <input type="text" name="mail" id="mail" value="${users.mail }">
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
    $(function (){
        $("#back").click(function (){
            window.history.go(-1);
        })
    })
</script>
