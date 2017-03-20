<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<LINK rel=stylesheet type=text/css href="order_queue/tbsp.css">
		<LINK rel=stylesheet type=text/css href="order_queue/common_v2.css">
		<LINK rel=stylesheet type=text/css href="order_queue/common.css">
		<LINK rel=stylesheet type=text/css href="order_queue/item_list_v2.1.css">
		<STYLE type=text/css>
.item-list-col6 {
	WIDTH: 128px
}

.item-list-bd TABLE {
	WIDTH: auto !important
}

.item-list-col1 {
	WIDTH: 200px
}
.rate_order{
	height:300px;
	width:100%;
	display:none;
	padding:0px;
}
.rate_tr{
	border:1px solid #e6e6e6;
	border-top:0px;
	//display:none;
}
.rate_tr td{
	padding:0px;
	margin:0px;
	border:1px solid #e6e6e6;
	border-top:0px;
	//display:none;
}
.unread {
font-weight:600;
color:#00000;
}
.hui td{
background-color:#f3f3f3;
border-bottom:1px dotted #e6e6e6;
}
</STYLE>
<script type="text/javascript">
		function onDetail(){
			var ord = document.getElementById("order").value;
			if(ord == ""){
				alert("请输入ID");
				return false;
			}
		}
</script>
<LINK rel=stylesheet type=text/css href="table.css">
	</head>
	<body>
		<DIV class=main-wrap style="margin-left: 16px;">
			<DIV id=main-content>
				<DIV class=item-list>
					<DIV class=item-list-hd>
						<UL class="item-list-tabs item-list-tabs-flexible clearfix"
							style="margin-top: 10px; height: 27px;">
							<LI class="current" style="!margin-top:-12px;">
								<A href="#">订单查询</A>
							</LI>
						</UL>
					</DIV>
					<DIV class="item-list-bd" style="width: 764px;">
						<FORM name="orderSearch" method="post" action="service.do">
						<input name="action" type="hidden" value="idOrder"/>
						<TABLE id=J_ListTable >
							<tbody>
						           <tr>
						   			<td>订单ID：</td>
						   			<td><input type="text" name="order" id="order" value="${order.orderId}"/> </td>
						   			<td><input type="submit" value="搜索"/></td>
						  			</tr>
						    </tbody>
						</TABLE>
						</FORM>
					</DIV>
					<c:if test="${order != null}">
					
					<table class="admin_table" width="650" cellspacing="0">
						<tr><td colspan="2" class="title">菜名</td>
						<td  class="title"  width="150">数量</td>
						<td class="title" width="200">价钱</td></tr>
					<c:forEach items="${order.orderItemses}" var="oi">
						<tr><td  colspan="2" >${oi.itemName}</td><td>${oi.itemNum}份</td><td>${oi.itemTotalPrice}</td></tr>		 
					</c:forEach>
					</table>
				<table class="admin_table" width="650" cellspacing="0">
						<tr><td class="title">操作</td><td><a href="service.do?action=orderDetail&order=${order.orderId}">修改处理结果</a></tr>
						<tr><td  class="title">订单编号</td><td>${order.orderId}</td><tr>
						<tr><td  class="title">店家</td><td colspan="3">${order.store.storeName} </td></tr>		
						<tr><td  class="title">店家描述</td><td colspan="3">${order.store.storeBrief} </td></tr>		
						<tr><td  class="title">店家地址</td><td colspan="3">${order.store.storeAddrName} </td></tr>		
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
			</c:if>
					<BR style="LINE-HEIGHT: 10px">
	
				</DIV>
			</DIV>
		</DIV>



	</body>
</html>

