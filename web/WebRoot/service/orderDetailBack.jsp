<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
    <script type="text/javascript">
    	alert("${admin}正在处理该订单.");
    	window.location.href="service.do?action=latestOrder";
    </script>
  </body>
</html>
