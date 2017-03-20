<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head></head><body>
<script type="text/javascript">
<c:if test="${c_user == null}">alert('感谢您的使用！');parent.window.location.href="../index.jsp";</c:if>
<c:if test="${c_user != null}">alert('对订单进行评价可获取积分！');parent.window.location.href="../user/u/welcome.do?url=orderList";</c:if>
</script>
</body></html>
