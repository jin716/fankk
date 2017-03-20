<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'storeList.jsp' starting page</title>
    
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
<LINK rel=stylesheet type=text/css href="order_queue/item_list_v2.1.css">
<script type="text/javascript" src="../../js/tools.js"></script>
<script type="text/javascript" src="../../js/time_.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	function onEdit(){
		var msg = "";
		var mobile = document.getElementById("storeMobile").value;
		var send = document.getElementById("storeSendCost").value;
		var cost = document.getElementById("storeLowCost").value;
		
		if(mobile == ""){
			msg+="请输入手机号码\n";
		}
		if(send != ""){
		    if(!isNumber(send))
				msg+="店铺外送费用应为数字\n";
		}
		if(cost != ""){
			if(!isNumber(cost))
					msg+="店铺起送价格应为数字\n";
		}
		if(msg!=""){
			alert(msg);
			return;
		}
		document.sEdit.submit();
	}
	

</script>
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
      
      	<form action="storeEditCommit.do" name="sEdit" method="post">
      	<input type="hidden" name="storeId" value="${store.storeId}"/>
  		<table width="600" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">
  			<TR class="order-item">
   		 		<TD class=order-hd>店铺名称:</td><td>${store.storeName}</TD>
   		 		<td class=order-hd>店铺余额：</td>
   		 		<td>
   		 			<c:if test="${store.storeAccount >= 100}">${store.storeAccount}</c:if>
   		 			<c:if test="${store.storeAccount < 100}"><font color="red">${store.storeAccount}</font></c:if>
   		 		</td>
			 </TR>
			 
			<!--
  			<tr class="order-item">
  				<td class=order-hd>店铺信息：</td><td colspan="3"><textarea <c:if test="${c_user.userIsAdmin != true }">readonly="readonly"</c:if>style="width:350px;height:200px;" name="storeBrief">${store.storeBrief}</textarea></td>
  			</tr>
  			-->
  			<tr class="order-item">	
  				<td class=order-hd>所在路段：</td><td>${store.block.blockName}</td>
  				<td class=order-hd>店铺地址：</td><td>${store.storeAddrName}</td>
  			</tr>
  			<tr class="order-item">	
  				  <td class=order-hd>联系电话：</td><td><input type="text" name="storeMobile" id="storeMobile" value="${store.storeMobile}"/></td>
  				  <td class=order-hd>订单短信通知：</td>
  				  <td>
  				  	<input type="radio" name="smsSend" id="storeSet" value="true" <c:if test="${store.storeSendSMS == true}">checked="checked"</c:if>/>是
  				  	<input type="radio" name="smsSend" id="storeSet" value="false" <c:if test="${store.storeSendSMS == false}">checked="checked"</c:if>/>否
  				  </td>
  			</tr>
  			<tr class="order-item">	
  				  <td class=order-hd>起送价格：</td><td><input type="text" name="storeLowCost" id="storeLowCost" value="${store.storeLowCost}"/></td>
  				  <td class=order-hd>外送费用：</td><td><input type="text" name="storeSendCost" id="storeSendCost" value="${store.storeSendCost}"/></td>
  			</tr>
  			<tr class="order-item">	
  				<td class=order-hd>营业开始时间：</td>
  				<td>
  					<script type="text/javascript">
  						_SetTime("${store.startTimeString}","s_hour","s_min");
  					</script>
				</td>
  				<td class=order-hd>营业结束时间：</td>
  				<td>
  					<script type="text/javascript">
  						_SetTime("${store.endTimeString}","e_hour","e_min");
  					</script>
  				</td>
  			</tr>
  			
  			<tr class="order-item">	
  				<td class=order-hd></td><td colspan="3"><input style="width:200px;" onclick="onEdit()" type="button" value="确定"/></td>
  			</tr>
  		</table>
  		</form>
  		
  		
  		<table width="600" style="margin-top:20px;border:1px solid #f3f3f3;" class="order success-order xcard">
  			<tr class="order-item">	
	  			<td class=order-hd rowspan="2" width="120">
					图片
				</td>
				<td>
					<iframe width="500" name='hidden_frame' id="hidden_frame" style='display:none'></iframe> 
					<span id="msg"><c:if test="${empty store.storeImgSrc}">暂无图片</c:if><c:if test="${not empty store.storeImgSrc}"><img height='250' src="../../${store.storeImgSrc}"></c:if></span>  
				</td>
			</tr>
			<tr>
				<td>
				    <html:form action="/user/s/storeImageUp" method="POST" enctype="multipart/form-data" target="hidden_frame">
				    	<html:file property="image"/>
				    	<html:hidden property="store" value="${store.storeId}"/>
				    	<html:submit value="上传"></html:submit>
					</html:form>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div id="mes"></div>
				</td>
			</tr>
  		</table>
  	</div>
</DIV>
<BR style="LINE-HEIGHT: 10px">

</DIV></DIV></DIV>



</body>
</html>
<script type="text/javascript">    
function callback(msg, url)    
{    
    //document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;    
    document.getElementById("msg").innerHTML = "<img height='250' src='../../"+url+"'/>";    
    document.getElementById("mes").innerHTML = msg;
}    
</script>   
