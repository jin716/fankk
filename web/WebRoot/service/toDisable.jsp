<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>无效订单</title>
  </head>
  <body>
    <form action="in.do" method="post">
    <table>
    	<tr><td colspan="2">${mess}</td></tr>
    	<tr><td>用户</td><td><input name="name" type="text"/></td></tr>
    	<tr><td>密码</td><td><input name="pass" type="password"/></td></tr>
    	<tr><td colspan="2"><input type="submit" value="提交"/></td></tr>
    </table>
    </form>
  </body>
</html>
