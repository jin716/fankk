<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.ymai.struts.action.user.UserValidate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = null;
if(request.getServerPort()==80){
	basePath = request.getScheme()+"://"+request.getServerName()+path+"/";
}
else {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
}
UserValidate.loginOK(request,response);
%>
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
<link href="<%=basePath%>css/Ymai.css" rel="stylesheet" type="text/css">
<div id="state_banner">
    	<div id="site-nav">
        	<div class="login-info" border="1px solid black">
        	  <ul>
              <c:if test="${not empty c_user}">
              	<li><span style="float:left;margin-right:5px;">欢迎回来！${c_user.userLoginName}</span></li>
              	<li><a href="<%=basePath%>index.jsp">首页</a></li>
              	<li><a href="<%=basePath%>user/my.do">我的饭快快</a></li>
              	<li><a href="<%=basePath%>user/exit.do">退出</a></li>
              </c:if>
             	
              <c:if test="${empty c_user}">
              	<li><a href="<%=basePath%>index.jsp">首页</a></li>
              	<li><a href="<%=basePath%>user/login.jsp">请登录</a> </li>
                <li><a href="<%=basePath%>user/register.jsp">免费注册</a></li>
              </c:if>
              <c:if test="${u_order_id != null}">
              <script type="text/javascript">
              function callBackOrderState(date){
					document.getElementById("user_orderState").innerHTML = date;
			  }
              function getOrderState(){
					var randon = Math.random();
					jQuery.get("<%=basePath%>os/getOrder.do",{action:"user",r:randon},callBackOrderState);
					setTimeout("getOrderState()",60000);   
				}
				getOrderState();   
			  </script>
              	<li style="float:right">[<span id="user_orderState"></span>]</li>
              	<li style="float:right"><span><a href="javascript:void" onclick="getOrderState()">刷新</a></span></li>
                <li style="float:right"><span><a href="<%=basePath%>os/getOrder.do?action=page">订单详情</a></span></li>
              </c:if>
              </ul>
            </div>
        </div>

</div><!-- #EndLibraryItem -->