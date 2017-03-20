<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page language="java" import="com.ymai.struts.Page"%>
<%@ page language="java" import="com.ymai.hibernate.*"%>
<%
	Page this_page = (Page) request.getAttribute("page");
%>
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
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript">
		function onSearch(pag){
			var sd = document.getElementById("start").value;
			var ed = document.getElementById("end").value;
			if(sd == "" || ed == ""){
				alert("请输入日期");
				return;
			}
			document.orderSearch.action="service.do?action=historyOrder&page="+pag;
			document.orderSearch.submit();
		}
</script>
	</head>

	<body>

		<DIV class=main-wrap style="margin-left: 16px;">

			<DIV id=main-content>

				<DIV class=item-list>
					<DIV class=item-list-hd>

						<UL class="item-list-tabs item-list-tabs-flexible clearfix"
							style="margin-top: 10px; height: 27px;">
							<LI class="current" style="!margin-top:-12px;">
								<A href="#">历史订单</A>
							</LI>
						</UL>
					</DIV>

					<DIV class="item-list-bd" style="width: 764px;">
						<FORM name="orderSearch" method="post" action="">
						<TABLE id=J_ListTable >
							<tbody>
						           <tr>
						   			<td>下单时间：</td>
						   			<td>从<input type="text" name="start" id="start" onclick="new Calendar().show(this);" value="${start}" size="10" maxlength="10" readonly="readonly"/> </td>
						   			<td>到<input type="text" name="end" id="end" onclick="new Calendar().show(this);" value="${end}" size="10" maxlength="10" readonly="readonly"/></td>
						   			<td><input type="button" value="搜索" onclick="onSearch(1)"/></td>
						  			</tr>
						    </tbody>
						</TABLE>
						</FORM>
						<%
							if (this_page != null) {
						%>
						<FORM id=memoListForm method=post name=memoListForm action="">
							<TABLE id=J_ListTable>
								<TBODY class="act">
									<TR class="last-row">
										<TD colSpan="7">
											<DIV class="operations">

												<UL class="page-nav inline-block">

													<LI class="prev-page">
														<A class=selected href="javascript:onSearch(<%=this_page.getPre()%>)">上一页</A>
													</LI>
													<%
														List pageList = this_page.getPageList();
															for (int i = 0; i < pageList.size(); ++i) {
																Integer num = (Integer) pageList.get(i);
																if (num == -1) {
													%><li>
														...
													</li>
													<%
														continue;
																}
																if (num == this_page.getCur()) {
													%><LI class="curr-page">
														<A class=selected href="#"><%=num%></A>
													</LI>
													<%
														continue;
																}
																if (num != -1 && num != this_page.getCur()) {
													%><LI class="">
														<A class=selected href="javascript:onSearch(<%=num%>)"><%=num%></A>
													</LI>
													<%
														continue;
																}
															}
													%>
													<LI class="next-page">
														<A class=selected href="javascript:onSearch(<%=this_page.getNext()%>)">下一页</A>
													</LI>
												</UL>
											</DIV>
										</TD>
									</TR>
								</TBODY>
								<THEAD >
									<TR>	
										<TH  width="50">
											id
										</TH>
										<TH width="120">
											状态
										</TH>
										<TH  width="130">
											时间
										</TH>
										<TH width="100">
											电话
										</TH>
										<TH width="100">
											称呼
										</TH>
										<TH width="130">
											店家
										</TH>
										<TH width="130">
											操作
										</TH>
									</TR>
								</THEAD>
								<TBODY class="order success-order xcard">
									<%
										List list = this_page.getList();

											for (int i = 0 ; i < list.size(); ++i) {
												Order order = (Order) list.get(i);
												int html_size = order.getOrderItemses().size() + 1;
												Iterator iter = order.getOrderItemses().iterator();
												String clazz = "";
												if(order.getOrderId()%2 == 0){clazz += " hui";}
												if(order.getOrderState().equals(Order.STATE_UN_READ)||order.getOrderState().equals(Order.STATE_AUDITING)){ clazz += " unread";}
									%>
									<TR class="<%=clazz%>">
										<TD>  
											<%=order.getOrderId()%> 
										</TD>
										<TD> 
											<%=order.getOrderStateString()%>
										</TD>
										<TD> 
											<%=order.getOrderTimeString()%> 
										</TD>
										<TD> 
											<%=order.getOrderTele()%> 
										</TD>
										<TD> 
											<%=order.getName()%> 
										</TD>
										<TD> 
											<%=order.getStore().getStoreName()%> 
										</TD>
										<TD> 
											<%if(order.getOrderState().equals(Order.STATE_UN_READ)||order.getOrderState().equals(Order.STATE_AUDITING)){%>
											<a href="service.do?action=orderDetail&order=<%=order.getOrderId()%>">审核</a><br><%}
											else{ %>
											<a href="service.do?action=orderDetail&order=<%=order.getOrderId()%>">修改处理结果</a><br>
											<%}%>
										</TD>
									</TR>
									<%} %>
								</TBODY>
								<TBODY class="act">
									<TR class="last-row">
										<TD colSpan="7">
											<DIV class="operations">

												<UL class="page-nav inline-block">

													<LI class="prev-page">
														<A class=selected href="javascript:onSearch(<%=this_page.getPre()%>)">上一页</A>
													</LI>
													<%
														pageList = this_page.getPageList();
															for (int i = 0; i < pageList.size(); ++i) {
																Integer num = (Integer) pageList.get(i);
																if (num == -1) {
													%><li>
														...
													</li>
													<%
														continue;
																}
																if (num == this_page.getCur()) {
													%><LI class="curr-page">
														<A class=selected href="#"><%=num%></A>
													</LI>
													<%
														continue;
																}
																if (num != -1 && num != this_page.getCur()) {
													%><LI class="">
														<A class=selected href="javascript:onSearch(<%=num%>)"><%=num%></A>
													</LI>
													<%
														continue;
																}
															}
													%>
													<LI class="next-page">
														<A class=selected href="javascript:onSearch(<%=this_page.getNext()%>)">下一页</A>
													</LI>
												</UL>
											</DIV>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<%
								}
							%>
						</FORM>
					</DIV>
					<BR style="LINE-HEIGHT: 10px">

				</DIV>
			</DIV>
		</DIV>



	</body>
</html>

