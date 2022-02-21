<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<footer class="footer">
    底部版权
</footer>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/time.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/common.js"></script>
<script language="javascript" type="text/javascript"
        src="${pageContext.request.contextPath }/statics/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    function loginOut() {
        if (window.confirm("确认退出当前系统吗？")) {
            window.location = "${pageContext.request.contextPath }/userLoginOut";
        }
    }
</script>
</body>
</html>