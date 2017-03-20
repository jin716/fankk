<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../../css/rating.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.rat_head{float:left;width: 100%;background-color:#f3f3f3;height:20px;border-bottom:1px solid #e6e6e6;margin-bottom:5px;}
			.rat_middle{float:left;width: 90%;margin:0px;}
			.title{background-color:#f3f3f3;}
			table{font-size:17px;}
			td{border:1px solid #f3f3f3;text-align:center;}
			button{width:110px;height:24px;}
		</style>
		<script type="text/javascript">
		function getOrderProcess(oid){
			window.location.href="getOrderDetail.do?action=process&order="+oid+"&r="+Math.random();
		}
		function illOrder(oid){
			document.getElementById("ill_table").style.display = "";
			//window.location.href="getOrderDetail.do?action=ill&order="+oid;
		}
		function getReFresh(){
			window.location.href="welcome.do?action=getOrder"+"&r="+Math.random();
		}
		</script>
	</head>

	<body>
		<!--
		<div class="rat_head">
		订单明细
			</div>
		-->
		<div class="rat_middle">
		<div id="con" class="con" style="width: 650px;;float:left;">

			<table width="650">
				<tr><td colspan="2" class="title">菜名</td>
				<td  class="title"  width="150">数量</td>
				<td class="title" width="200">价钱</td></tr>
			<c:forEach items="${order.orderItemses}" var="oi">
				<tr><td  colspan="2" >${oi.itemName}</td><td>${oi.itemNum}份</td><td>${oi.itemTotalPrice}</td></tr>		 
			</c:forEach>
			</table>
			<table width="650">
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
			<tr>
				<td class="title">
					状态
				</td>
				<td>
					${order.orderStateString}
				</td>
			</tr>
		</table>
		</div>
	</body>
</html>
