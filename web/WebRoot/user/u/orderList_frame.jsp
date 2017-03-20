<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page language="java" import="com.ymai.struts.Page"%>
<%@ page language="java" import="com.ymai.hibernate.*"%>
<%@ page language="java" import="com.ymai.policy.*"%>
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
</STYLE>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript">
		function showDetail(orderId){
			var tr_id=orderId+"_rate_tr";
			var iframe_id = orderId+"_rate";
			var a_id_show = orderId+"_a_show";
			var a_id_hide = orderId+"_a_hide";
			$("#"+tr_id).show();
			$("#"+iframe_id).show();
			$("#"+a_id_hide).show();
			$("#"+a_id_show).hide();
			document.getElementById(iframe_id).src = "evaluate.do?orderId="+orderId+"&t="+Math.random();
		}
		
		function hideDetail(orderId){
			var tr_id=orderId+"_rate_tr";
			var iframe_id = orderId+"_rate";
			var a_id_show = orderId+"_a_show";
			var a_id_hide = orderId+"_a_hide";
			$("#"+tr_id).hide();
			$("#"+iframe_id).hide();
			$("#"+a_id_hide).hide();
			$("#"+a_id_show).show();
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
								<A href="welcome.do?action=orderList">最新订单</A>
							</LI>
							<LI style="!margin-top:-12px;">
								<A href="welcome.do?action=orderListHistory">历史订单</A>
							</LI>
						</UL>
					</DIV>

					<DIV id="d_top" class="item-list-bd" style="width: 764px;">
						<FORM id=memoListForm method=post name=memoListForm action="">
							<TABLE id=J_ListTable>
								<COLGROUP>
									<COL class=item-list-col0>
									<COL class=item-list-col1>
									<COL class=item-list-col2>
									<COL class=item-list-col3>
									<COL class=item-list-col4>
									<COL class=item-list-col6>
									<COL class=item-list-col7>
									<COL class=item-list-col8>
									<COL class=item-list-col9>
								<THEAD>
									<TR>
										<TH></TH>
										<TH class=item>
											订单
										</TH>
										<TH class=price>
											单价(元)
										</TH>
										<TH class=num>
											数量
										</TH>
										<TH class=trouble>
											售后
										</TH>
										<TH class=contact>
											卖家
										</TH>
										<TH class=trade-status>
											交易状态
										</TH>
										<TH class=order-price>
											实付款(元)
										</TH>
										<TH class=remark>
											
										</TH>
									</TR>
								</THEAD>

								<%
									if (this_page != null) {
								%>
								<TBODY class="order success-order xcard">
									<%
										List list = this_page.getList();

											for (int i = 0 ; i <list.size(); ++i) {
												Order order = (Order) list.get(i);
												int html_size = order.getOrderItemses().size() + 1;
												Iterator iter = order.getOrderItemses().iterator();
												
									%>
									<TR class=sep-row>
										<TD colSpan=10></TD>
									</TR>
									<TR class=order-hd>
										<TD colSpan=10>

											<DIV class=basic-info>
												<SPAN sytle="margin-left:5px;" class="order-num"> <LABEL>
														&nbsp;&nbsp;&nbsp;&nbsp;订单编号：
													</LABEL> <%=order.getOrderId()%> </SPAN><SPAN class=deal-time>下单时间：
													<%=order.getOrderTimeString()%></SPAN>
												<SPAN class=order-shop>店铺：<A href="../../order/store.do?store=<%=order.getStore().getStoreId()%>" target=_blank><%=order.getStore().getStoreName()%></A>
												</SPAN>
											</DIV>
										</TD>
									</TR>

									<%
									OrderItems oi_1 = null;
									if(iter.hasNext()){oi_1 = (OrderItems) iter.next();}
									oi_1.getItem(); 
									String class_oi = "";
									if(html_size == 2)class_oi = "last";
									if(oi_1!=null){
									%>
									<TR class="order-item <%=class_oi %>">
										<TD class=item colSpan=2>
											<DIV class=txt-info>
												<DIV class=desc>
													<SPAN class=name><A href="javascript:void(0)" target=_blank><%=oi_1.getItem().getItemName()%></A>
													</SPAN>
												</DIV>
											</DIV>
										</TD>
										<TD class=price><%=oi_1.getItemTotalPrice()%></TD>
										<TD class=num><%=oi_1.getItemNum()%></TD>
										<TD class=trouble>
											-
										</TD>

										<TD class=contact rowSpan="<%=html_size-1%>"
											sumRows="<%=html_size-1%>">
											<SPAN class="name J_UserInfo" target="_blank"><a
												href="../../order/store.do?store=<%=order.getStore().getStoreId()%>" target="_blank"><%=order.getStore().getStoreName()%></a>
											</SPAN>
										</TD>
										<TD class=trade-status rowSpan="<%=html_size-1%>"
											sumRows="<%=html_size-1%>">
											<%if(order.getOrderState().equals(Order.STATE_NOT_PASS)) {%><STRONG class="J_TradeStatus status success">无效订单</STRONG><%} 
											if(order.getOrderState().equals(Order.STATE_TELLED_STORE)){%><a href="welcome.do?action=orderList&do=orderOk&order=<%=order.getOrderId()%>">
											<STRONG class="J_TradeStatus status success">确认已成功交易(+<font color="red"> <%=order.getUserJifen()%> </font>积分)</STRONG></a><%}
											if(order.getOrderState().equals(Order.STATE_OK)){ %>
											<A id="<%=order.getOrderId()%>_a_show" class=detail-link href="javascript:showDetail(<%=order.getOrderId()%>)" >评价(+<%=UserJifenPolicy.getPingjiaJifen()%>积分)</A>
											<A id="<%=order.getOrderId()%>_a_hide" class=detail-link href="javascript:hideDetail(<%=order.getOrderId()%>)" style="display:none;">关闭</A>
											<%} 
											else{%><STRONG class="J_TradeStatus status success"><%=order.getOrderStateString() %></STRONG><%}%>
											<DIV class=trade-actions></DIV>
										</TD>
										<TD colspan="2" class=order-price rowSpan="<%=html_size-1%>"
											sumRows="<%=html_size-1%>">
											<STRONG><%=order.getOrderTotalPrice()%></STRONG>
											<DIV class=post-info>
												(含
												<SPAN class=post-type>外送费用</SPAN>:<%=order.getOrderSendPrice()%>)
											</DIV>
										</TD>
										<TD class=remark rowSpan="<%=html_size-1%>"
											sumRows="<%=html_size-1%>">
											<!--<A class=J_HideOrder href="#">隐藏</A>
											<A href="#" target=_blank>备注</A>
											<SPAN class=remark-status>双方已评</SPAN>
											<A href="#" target=_blank>分享</A>
											  -->
										</TD>
									</TR>
								
									<%
									}		
												while (iter.hasNext()) {
													OrderItems oi = (OrderItems) iter.next();
									%>
									<TR class="order-item last">
										<TD class=item colSpan=2>
											<DIV class=txt-info>
												<DIV class=desc>
													<SPAN class=name><A href="javascript:void(0)" target=_blank><%=oi.getItem().getItemName()%></A>
													</SPAN>
												</DIV>
											</DIV>
										</TD>
										<TD class=price><%=oi.getItemTotalPrice()%></TD>
										<TD class=num><%=oi.getItemNum()%></TD>
										<TD class=trouble>
											-
										</TD>
									</TR>
									<%}%>
									<tr id="<%=order.getOrderId()%>_rate_tr" class="rate_tr">
										<td colspan="10">
											<iframe src="" frameborder="no" border="0" scrolling="no" width="700" class="rate_order" id="<%=order.getOrderId()%>_rate">
									
									
											</iframe>
										</td>
									</tr>
									<%} %>
								</TBODY>
								<TBODY class="act">
									<TR class="last-row">
										<TD colSpan="10">
											<DIV class="operations">

												<UL class="page-nav inline-block">

													<LI class="prev-page">
														<A class=selected href="welcome.do?action=orderList&page=<%=this_page.getPre()%>#d_top">上一页</A>
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
														<A class=selected href="#d_top"><%=num%></A>
													</LI>
													<%
														continue;
																}
																if (num != -1 && num != this_page.getCur()) {
													%><LI class="">
														<A class=selected href="welcome.do?action=orderList&page=<%=num%>#d_top"><%=num%></A>
													</LI>
													<%
														continue;
																}
															}
													%>
													<LI class="next-page">
														<A class=selected href="welcome.do?action=orderList&page=<%=this_page.getNext()%>#d_top">下一页</A>
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

