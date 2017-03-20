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
</STYLE>
	</head>
	<body>
		<DIV class=main-wrap style="margin-left: 16px;">

			<DIV id=main-content>

				<DIV class=item-list>
					<DIV class=item-list-hd>

						<UL class="item-list-tabs item-list-tabs-flexible clearfix"
							style="margin-top: 10px; height: 27px;">
							<LI class="current" style="!margin-top:-12px;">
								<A href="welcome.do?action=orderList">积分兑换情况</A>
							</LI>
						</UL>
					</DIV>
					<DIV class="item-list-bd" style="width: 764px;">
							<TABLE id=J_ListTable>
									<TR>
										<TH width="90">
											兑换编号
										</TH>
										<TH width="150">
											提交时间
										</TH>
										<TH width="250">
											奖品
										</TH>
										<TH width="100">
											数量
										</TH>
										<TH width="50">
											所用积分
										</TH>
										<TH width="200">
											状态
										</TH>
									</TR>
									<c:forEach items="${list}" var="dh">
									<TR>
										<td>${dh.duihuanId}</td>
										<td>${dh.time}</td>
										<td><A href="../../jifen.do?gift=${dh.gift.giftId}" target=_blank>${dh.gift.giftName}</td>
										<td>${dh.num}</td>
										<td>${dh.jifen}</td>
										<td>${dh.state}</td>
									</TR>
									</c:forEach>
								</TBODY>
							</TABLE>
					</DIV>
					<BR style="LINE-HEIGHT: 10px">

				</DIV>
			</DIV>
		</DIV>



	</body>
</html>

