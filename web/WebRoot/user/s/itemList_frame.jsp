<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page language="java" import="com.ymai.struts.Page"%>
<%
	Page this_page = (Page) request.getAttribute("page");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
</STYLE>
	</head>
	<body>
		<div class="main" id="maindiv">

			<div class="h4title">
				<h4>
					${store.storeName}
					<span style="font-weight: normal;"></span>
				</h4>
			</div>
		</div>
		<div class=main-wrap style="margin-left: 16px;">

			<div id=main-content>

				<DIV class=item-list>
<DIV class=item-list-hd>
	<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top: -12px; height: 27px;">
	  <LI><A href="welcome.do?action=storeEdit&store=${item.store.storeId}">店铺信息</A> </LI>
	  <LI class="current"><A href="welcome.do?action=itemList&store=${store.storeId}">商品管理</A> </LI>
	</UL>
</DIV>
<DIV class="item-list-bd" style="width:764px;">
						<FORM id=memoListForm method=post name=memoListForm action="">
							<div class="bcontentlist">
								<table width="750"
									style="margin-top: 20px; border: 1px solid #f3f3f3;"
									class="order success-order xcard">
									<tr class=order-hd>
										<td width="300" colspan="2">
											商品
										</td>
										<td width="100">
											价格
										</td>
										<td width="100">
											状态
										</td>
										<td width="100"></td>
									</tr>
									<c:forEach items="${page.list}" var="item">
										<tr class="order-item">
											<td height="100">
												<img src="../../${item.itemImgSrc}" height="80" />
											</td>
											<td>
												<a href="welcome.do?action=itemEdit&item=${item.itemId}">${item.itemName}</a>
											</td>
											<td>
												${item.itemPrice}
											</td>
											<td>
												${item.itemState}
											</td>
											<td>
												<a href="welcome.do?action=itemEdit&item=${item.itemId}">修改</a>
											</td>
										</tr>

									</c:forEach>
									<tr>
										<td colspan="5">
											<DIV class="operations">
												<span stype="margin-left:10px"><a
													style="font-weight: 600" href="welcome.do?action=itemEdit">添加商品</a>
												</span>
												<UL class="page-nav inline-block">

													<LI class="prev-page">
														<A class=selected style="font-size: 10px;"
															href="#<%=this_page.getPre()%>">上一页</A>
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
														break;
															}
															if (num == this_page.getCur()) {
													%><LI class="curr-page">
														<A class=selected href="##"><%=num%></A>
													</LI>
													<%
														break;
															}
															if (num != -1 && num != this_page.getCur()) {
													%><LI class="">
														<A class=selected href="##"><%=num%></A>
													</LI>
													<%
														break;
															}
														}
													%>
													<LI class="next-page">
														<A class=selected style="font-size: 10px;"
															href="#<%=this_page.getNext()%>">下一页</A>
													</LI>
													<LI>
														到第
														<INPUT id=pageNO tabIndex=200 size=2 name=pageNO
															maxlengh="4">
														页
														<INPUT id=viewit onClick="return gotoPage()" value="go"
															type=button name=Submit22>
													</LI>
												</UL>
											</DIV>
										</td>
									</tr>

								</table>

							</DIV>
							<BR style="LINE-HEIGHT: 10px">
                        </FORM>
					</div>
				</div>
			</div>
















		</div>
		
	</body>
</html>





