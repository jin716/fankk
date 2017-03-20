<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>饭快快-订单状态跟踪</title>
    <LINK rel=stylesheet type=text/css href="table.css">
  </head>
  <body>
  <!-- #BeginLibraryItem "/Library/state_banner.lbi" -->
		<%@ include file="../library/stateBanner.jsp"%>
		<!-- #EndLibraryItem -->
		<div id="wrapper">
			<%@ include file="../library/header.jsp"%>
			<div id="ibody">
				<!-- #BeginLibraryItem "/Library/nav_bar_home.lbi" -->
				<%@ include file="../library/main_nav.jsp"%>
  	<div style="width:450px; height:700px;float:left;">
   	<iframe id="mainFrame" name="mainFrame" style="width:450px;height:240px;" frameborder="no" border="0" scrolling="no" src="getOrder.do?action=frame">
    </iframe>
	<table class="admin_table" width="450" cellspacing="0">
						<tr><td colspan="2" class="title">菜名</td>
						<td  class="title"  width="100">数量</td>
						<td class="title" width="200">价钱</td></tr>
					<c:forEach items="${user_order_now.orderItemses}" var="oi">
						<tr><td  colspan="2" >${oi.itemName}</td><td>${oi.itemNum}份</td><td>${oi.itemTotalPrice}</td></tr>		 
					</c:forEach>
					</table>
				<table class="admin_table" width="450" cellspacing="0">
						<tr><td  class="title">订单编号</td><td>${user_order_now.orderId}</td><tr>
						<tr><td  class="title">店家</td><td colspan="3">${user_order_now.store.storeName} </td></tr>		
						<tr><td  class="title">店家描述</td><td colspan="3">${user_order_now.store.storeBrief} </td></tr>		
						<tr><td  class="title">店家地址</td><td colspan="3">${user_order_now.store.storeAddrName} </td></tr>		
						<tr><td  class="title">外送范围</td><td colspan="3">${user_order_now.store.storeSendDistance}公里 </td></tr>		
						<tr><td  class="title">总费用</td><td colspan="3">${user_order_now.orderTotalPrice} 元（含外送费用：${user_order_now.orderSendPrice}）</td></tr>		 
						<tr><td class="title">称呼</td><td>${user_order_now.name}</td></tr>
						<tr><td class="title">电话</td><td>${user_order_now.orderTele}</td></tr>
						<tr><td class="title">地址</td><td>${user_order_now.orderAddr}</td></tr>
						<tr><td class="title">备注</td><td>${user_order_now.orderRemark}</td></tr>
				</table>
			</div>
			<div style="width:450px;height:500px;margin-left:10px;float:left;border:1px solid #e6e6e6">
				<div style="font-size:22px;margin-left:20px;margin-top:20px;color:#fe8b18"><h2>请勿关闭本页面</h2></div>
				<div style="margin-left:20px;margin-top:10px;font-weight:600;color:">
					为了让您能在第一时间了解您的订单状况，请保持本页面打开<br>
					如果订单出现任何状况，本页面会立刻告诉您！<br><br><br>
					如果订单成功，我们会显示如下结果：(示例)<br><br>
					<img src="../image/finish_r.jpg" width="350"/><br><br>
					如果订单失败，我们会显示如下结果：(示例)<br><br>
					<img src="../image/un_finish.jpg" width="350"/>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
