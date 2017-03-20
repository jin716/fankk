<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="css/pi.css" rel="stylesheet" type="text/css" />
		<link href="css/pi_setup.css" rel="stylesheet" type="text/css" />
		<LINK rel=stylesheet type=text/css href="order_queue/tbsp.css">
		<LINK rel=stylesheet type=text/css href="order_queue/common_v2.css">
		<LINK rel=stylesheet type=text/css href="order_queue/common.css">
		<LINK rel=stylesheet type=text/css
			href="order_queue/item_list_v2.1.css">
		<script type="text/javascript" src="../../js/tools.js"></script>
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
.rate_tr{
	border:1px solid #e6e6e6;
	border-top:0px;
	/*display:none;*/
}
.rate_order{
	height:250px;
	width:100%;
	padding:0px;
	display:none;
	
}
.rate_tr td{
	padding:0px;
	margin:0px;
	border:1px solid #e6e6e6;
	border-top:0px;
	/*display:none;*/

}
.unRead{
	color:#fffff;
	font-weight:600;
}
</STYLE>
<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript">
		function onSearch(){
			var sd = document.getElementById("s_date").value;
			var ed = document.getElementById("e_date").value;
			if(sd == "" || ed == ""){
				alert("请输入日期");
				return;
			}
			document.orderSearch.action="welcome.do?action=getOrder&mode=byInterval";
			document.orderSearch.submit();
		}
	</script>
	</head>
	<body>
		<div class="main" id="maindiv">

			<div class="h4title">
				<h4>
					订单查看
					<span style="font-weight: normal;"></span>
				</h4>
			</div>
		</div>
		<DIV class=main-wrap style="margin-left: 16px;">

			<DIV id=main-content>

				<DIV class=item-list>
					<DIV class=item-list-hd>
						<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top: -12px; height: 27px;">
						    <LI><A href="welcome.do?action=getOrder">最新订单</A> </LI>
						    <LI class="current"><A href="welcome.do?action=getOrder&mode=byInterval">历史订单</A> </LI>
						</UL>
					</DIV>
					<DIV class="item-list-bd" style="width: 764px;">
						<DIV class="item-list-bd" style="width:764px;">
						<FORM name="orderSearch" method="post" action="">
						<TABLE id=J_ListTable >
							<tbody>
						           <tr>
						   			<td>下单时间：</td>
						   			<td>从<input type="text" name="s_date" id="s_date" onclick="new Calendar().show(this);" value="${s_date}" size="10" maxlength="10" readonly="readonly"/> </td>
						   			<td>到<input type="text" name="e_date" id="e_date" onclick="new Calendar().show(this);" value="${e_date}" size="10" maxlength="10" readonly="readonly"/></td>
						   			<td><input type="button" value="搜索" onclick="onSearch()"/></td>
						  			</tr>
						    </tbody>
						</TABLE>
						</FORM>
							<div class="bcontentlist">
								<table width="750"
									style="margin-top: 20px; border: 1px solid #f3f3f3;"
									class="order success-order xcard">
									<tr class=order-hd>
										<td width="60">
										</td>
										<td width="170">
											状态
										</td>
										<td width="300">
											地址
										</td>
										<td width="150">
											电话
										</td>
										<td width="100">
											详情
										</td>
									</tr>
									<c:forEach items="${page.list}" var="order">
										<tr  class="order-item <c:if test="${order.orderState == 0}">unRead</c:if>">
											<td>
												${order.orderNum }
											</td>
											<td>
												${order.orderStateString }
											</td>
											<td>
												${order.orderAddr}
											</td>
											<td>
												${order.orderTele}
											</td>
											<td>
												<A id="${order.orderId}_a_show" target="_blank" class=detail-link href="getOrderDetail.do?order=${order.orderId}" >查看</A>
											
											</td>
										</tr>
										<tr id="{order.orderId}_detail" class="rate_tr">
										<td colspan="5">
											<iframe src="" frameborder="no" border="0" width="700" class="rate_order" id="${order.orderId}_rate">
									
									
											</iframe>
										</td>
									</tr>     
									</c:forEach>
										<tr>
											<td colspan="5">
												<DIV class="operations">
													<UL class="page-nav inline-block">
														<LI class="prev-page" >
															<A class=selected style="font-size:10px;display:block;width:20px;" href="welcome.do?action=getOrder&page=${page.pre}">上一页</A>
														</LI>
														<c:forEach items="${page.pageList}" var="num">
														<c:if test="${num == -1}">
														<li>
															...
														</li>
														</c:if>
														<c:if test="${num == page.cur}">
														<LI class="curr-page">
															<A class=selected href="#">${num}</A>
														</LI>
														</c:if>
														<c:if test="${num != -1}"><c:if test="${num != page.cur}">
														<LI class="">
															<A class=selected href="welcome.do?action=getOrder&page=${num}">${num}</A>
														</LI>
														</c:if></c:if>
													</c:forEach>
														<LI class="next-page">
															<A class=selected style="font-size:10px;" href="welcome.do?action=getOrder&page=${page.next}">下一页</A>
														</LI>
													</UL>
												</DIV>
												</td>
										</tr>

								</table>
								
							</DIV>
							<BR style="LINE-HEIGHT: 10px">
					</DIV>
				</DIV>
			</DIV>
		</div>
		<BR style="LINE-HEIGHT: 10px">




	</body>
</html>





