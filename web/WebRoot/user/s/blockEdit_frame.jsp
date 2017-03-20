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
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	function showStep(val){
			document.getElementById("step_"+val).style.display = "";
	}
	function hideStep(val){
			document.getElementById("step_"+val).style.display = "none";
	}
	function step_0(){
		showStep(0);
		hideStep(1);
	}
	
	function step_1(){
		var str = document.getElementById("distance").value;
		if(!isNumber(str)){
			alert("请输入数字");
			return;
		}
		hideStep(0);
		showStep(1);
		
		//getMapAndBlockList(str);
	}
	
	function getMapAndBlockList(str){
		var storeId = document.getElementById("store_id").value;
		jQuery.get("getValue.do",{type:'nearStore',store:storeId,distance:str},
				function(data){
						alert(data);
						document.getElementById("J_Code").value = decodeURI(data);
					});
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
  <input type="hidden" value="${store.storeId}" id="store_id"/>
<div class="main" id="maindiv">
        
        <div class="h4title"><h4>${store.storeName}<span style="font-weight: normal;"></span></h4></div>
</div>
<DIV class=main-wrap style="margin-left:16px;">

<DIV id=main-content>

<DIV class=item-list>
<DIV class=item-list-hd>
	<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top:-12px;height:27px;">
	  <LI><A href="welcome.do?action=storeEdit&store=${store.storeId}">店铺信息</A> </LI>
	  <LI><A href="welcome.do?action=itemList&store=${store.storeId}">商品管理</A> </LI>
	  <LI class="current"><A href="welcome.do?action=blockEdit&store=${store.storeId}">外送区域管理</A> </LI>
	</UL>
</DIV>


<DIV class="item-list-bd" style="width:764px;">
      <div class="bcontentlist">
  	<table width="500" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">

  			<tr class="order-item">
  				<td class=order-hd width="130">店铺地图信息：</td>
  				<td>
  					<div id="map_div">
  						<!--地图代码-->
  						<iframe id="map_frame" frameborder="no" border="0" scrolling="no"  width="400" height="300" src="../../map.do?type=store&store=${store.storeId}&width=400&height=300"></iframe>
  						
  	
  					</div>
  				</td>
  				
  			</tr>
  			<tr class="order-item">	
  				<td class=order-hd>外送范围</td>
  				<td>
					${store.storeSendDistance}公里
					<br><button width="220"  onclick="step_0()">修改</button>
				</td>
  			</tr>
  			<form action="blockEditSubmit.do" method="get">
  			<input type="hidden" name="store" value="${store}"/>
  			<tr id="step_0" style="display:none"  class="order-item">	
  				<td class=order-hd>外送范围</td>
  				<td>
					<input style="width:150px;" type="type" name="distance" id="distance" value="${store.storeSendDistance}"/>公里
					<button width="150"  onclick="step_1()" style="width:120px;margin-left:20px;">提交</button>
				</td>
  			</tr>
  			</form>
  			<tr id="step_1" style="display:none"  class="order-item">	
  				<td class=order-hd>外送范围</td>
  				<td>
				</td>
  			</tr>
  		</table>

  	</div>
</DIV>
<BR style="LINE-HEIGHT: 10px">

</DIV></DIV></DIV>



</body>
</html>   
