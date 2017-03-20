<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link href="css/pi.css" rel="stylesheet" type="text/css" />
<link href="css/pi_setup.css" rel="stylesheet" type="text/css" />	
<LINK rel=stylesheet type=text/css href="order_queue/tbsp.css">
<LINK rel=stylesheet type=text/css href="order_queue/common_v2.css">
<LINK rel=stylesheet type=text/css href="order_queue/common.css">
<LINK rel=stylesheet type=text/css href="order_queue/item_list_v2.1.css">
<script type="text/javascript" src="../../js/tools.js"></script>
<script type="text/javascript" src="../../js/time_.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<STYLE type=text/css>.item-list-col6 {
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
        
        <div class="h4title"><h4>${store.storeName}<span style="font-weight: normal;"></span></h4></div>
</div>
<DIV class=main-wrap style="margin-left:16px;">

<DIV id=main-content>

<DIV class=item-list>
<DIV class=item-list-hd>
	<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top: -12px; height: 27px;">
	  <LI class="current"><A href="welcome.do?action=storeEdit&store=${store.storeId}">店铺信息</A> </LI>
	  <LI><A href="welcome.do?action=itemList&store=${store.storeId}">商品管理</A> </LI>
	</UL>
</DIV>
<!-- 
<table width="500">
  			<tr><td><a href="store.do?store=${store.storeId}">店铺信息</a></td></tr>
  			<tr><td><a href="storeEdit.do?store=${store.storeId}">店铺信息管理</a></tr></tr>
  			<tr><td><a href="itemList.do?store=${store.storeId}">商品管理</a></td></tr>
  			<tr><td><a href="storeEdit.do?store=${store.storeId}">外送区域管理</a></td></tr>
  		</table>

 -->

<DIV class="item-list-bd" style="width:764px;">
      <div class="bcontentlist" style="z-index:2;">
  		<table width="600" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">
  			<c:forEach items="${stores}" var="store">
  			<TR class="order-item">
  				<a href="welcome.do?action=storeEdit&store=${store.storeId}">${store.storeName}</a>
			 </TR>
			</c:forEach>
  		</table>
  		</form>
  	
  	</div>
</DIV>
<BR style="LINE-HEIGHT: 10px">

</DIV></DIV></DIV>



</body>
</html>  
