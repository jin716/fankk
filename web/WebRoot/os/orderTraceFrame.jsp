<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><LINK rel=stylesheet type=text/css href="table.css"><meta http-equiv="refresh" content="60;URL=getOrder.do?action=frame"></head>
<body style="margin:0px;padding:0px;">
  <table class="admin_table" width="450" cellspacing="0">
<tr><td class="title">步骤</td><td>状态(每分钟自动更新一次)</td></tr>
<tr><td class="title">提交订单</td>
<td>
	<c:if test="${user_order_now != null}"><img src="../image/greenpng_029.png" height="25"/>完成:[${user_order_now.orderTime}]</c:if>
<c:if test="${user_order_now == null}">未完成</c:if>
</td>
</tr>
<tr>
	<td class="title">审核订单</td>
	<td>
		<c:if test="${orderAudit != null}"><img src="../image/greenpng_029.png" height="25"/>完成:[${orderAudit}]</c:if>
<c:if test="${orderAudit == null}">未完成</c:if>
	</td>
</tr>	
<tr>
	<td class="title">店家接收订单</td>
	<td>
		<c:if test="${orderProcess != null}"><img src="../image/greenpng_029.png" height="25"/>完成:[${orderProcess}]</c:if>
<c:if test="${orderProcess == null}">未完成</c:if>
	</td>
</tr>
<c:if test="${orderFail != null}">
<tr>
	<td class="title">无效订单</td><td><font color="red">很抱歉，由于：${orderFail},订单无法送达<br>
请<a target="_blank" href="../order/store_${user_order_now.store.storeId}">重新订餐</a></font></td>
</tr>
</c:if>
<c:if test="${orderFail == null}"><c:if test="${orderProcess != null}">
<tr><td class="title">外卖送到</td><td><c:if test="${orderProcess != null}">超过45分钟未收到外卖-><button onclick="#">客服催单</button><br></c:if><c:if test="${orderProcess != null}">收到外卖时请点击-><button onclick="onfinish()">完成并获取积分</button></c:if></td></tr></c:if></c:if></table>
</body><script type="text/javascript">function onfinish(){window.location.href = "getOrder.do?action=ok";}</script>
</html>
