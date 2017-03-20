<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>订单明细：编号${order.orderId}</title>
    <LINK rel=stylesheet type=text/css href="table.css">
    <script type="text/javascript">
    function illOrder(oid){
			document.getElementById("ill_table").style.display = "";
			//window.location.href="getOrderDetail.do?action=ill&order="+oid;
	}
	</script>
  </head>
  <body>
		<table class="admin_table" width="650" cellspacing="0">
				<tr><td colspan="2" class="title">菜名</td>
				<td  class="title"  width="150">数量</td>
				<td class="title" width="200">价钱</td></tr>
			<c:forEach items="${order.orderItemses}" var="oi">
				<tr><td  colspan="2" >${oi.itemName}</td><td>${oi.itemNum}份</td><td>${oi.itemTotalPrice}</td></tr>		 
			</c:forEach>
			</table>
		<table class="admin_table" width="650" cellspacing="0">
				<tr><td  class="title">订单编号</td><td>${order.orderId}</td><tr>
				<tr><td  class="title">店家</td><td colspan="3">${order.store.storeName} </td></tr>		
				<tr><td  class="title">店家描述</td><td colspan="3">${order.store.storeBrief} </td></tr>		
				<tr><td  class="title">店家地址</td><td colspan="3">${order.store.storeAddress} </td></tr>		
				<tr><td  class="title">外送范围</td><td colspan="3">${order.store.storeSendDistance}公里 </td></tr>		
				<tr><td  class="title">总费用</td><td colspan="3">${order.orderTotalPrice} 元（含外送费用：${order.orderSendPrice}）</td></tr>		 
				<tr>
				<td class="title">
					称呼
				</td>
				<td width="550">
					${order.name}
				</td>
			</tr>
			<tr>
				<td class="title">
					电话
				</td>
				<td>
					${order.orderTele}
				</td>
			</tr>
			<tr>
				<td class="title">
					地址
				</td>
				<td>
					${order.orderAddr}
				</td>
			</tr>
			<tr>
				<td class="title">
					备注
				</td>
				<td>
					${order.orderRemark}
				</td>
			</tr>
		</table>
		<c:if test="${order.orderState <= 1}"><c:if test="${order.orderState != 0}">
		<table class="admin_table" width="650" cellspacing="0">
			<tr>
				<td  class="title" colspan="5" >状态修改</td>
			</tr>
			<tr>
				<td colspan="2"><button onclick="getOrderProcess(${order.orderId})">审核通过</button></td>
				<td colspan="3"><button onclick="illOrder(${order.orderId})">无效订单</button></td>
			</tr>	
		</table>
		<form action="getOrderDetail.do" method="get">
		<input type="hidden" name="action" value="ill"/>
		<input type="hidden" name="order" value="${order.orderId}"/>
		<table class="admin_table" id="ill_table"  width="650">
			<tr>
				<td class="title">无效原因</td>
				<td><textarea cols="25" id="detail" name="detail"></textarea></td>
				<td><input type="submit" value="提交"/></td>
			</tr>
		</table>
		</form>
		</c:if></c:if>		
		<c:if test="${order.store.storeSendSMS == true}">
			<table class="admin_table" id="tel_store"  width="650">
			<tr>
				<td class="title" clospan="2">短信通知</td>
				<td><input type="submit" value="确定并发送短信"/></td>
			</tr>
		</table>
		</c:if>
		<c:if test="${order.store.storeSendSMS != true}">
			<table class="admin_table" id="tel_store"  width="650">
			<tr>
				<td class="title">电话通知</td>
				<td>请拨打商家电话:${store.storeMobile}</td>
				<td><input type="submit" value="电话通知已完成"/></td>
			</tr>
		</table>
		</c:if>
  </body>
</html>
