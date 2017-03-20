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
<script type="text/javascript">
		function getReady(){
			var input_box = document.getElementById("otherType");
			var item_type_value = document.getElementById("itemType").value;
			if(item_type_value=="-1"){
				input_box.style.display='';
				}
		}

		function otherInput(val){
			var inputBox = document.getElementById("otherType");
			if(val=="-1"){
				inputBox.style.display='';
			}
			else {
				inputBox.style.display = 'none';
			}
		}
	
		function onEdit(){
			
			var price = document.getElementById("itemPrice").value;
			var item_Type = document.getElementById("itemType").value;
			//var item_Dsct = document.getElementById("itemDsct").value;
			var type = document.getElementById("otherType").value;
			var name =  document.getElementById("itemName").value;
			
			if(item_Type == "-1"){
				document.getElementById("ot_option").value = type;
			}
			
			var msg = "";
			if(name == ""){
				msg += "请输入商品名\n";
			}
			if(item_Type == "-1" && type==""){
				msg += "请输入类型，如“小炒类”\n";
			}
			if(!isMoney(price)){
				msg += "请输入正确的金额\n";
			}
			//if(!isDsct(item_Dsct)){
			//	msg += "请输入正确的折扣数（ 0.00-1.00 ）\n";
			//}
			if(msg!=""){
				alert(msg);
				return;
			}
			document.itemEdit.submit();
		}
		
		function isMoney(numStr){
			if(numStr=="")return false;
			if(!isNumber(numStr)) return false;
			var arr = numStr.split('.');
			if(arr.length > 2) {return false;}
			if(arr.length = 1){return true;}
			if(arr[1].length>2){return false;}
			return true;
		}
		
		function isNumber(numStr){     
			if(!isNaN(numStr)){ 
				return true;
			}else{ 
				return false;
			}  
		}   
		
		function isDsct(dsct){
			if(dsct == "")return false;
			if(!isNumber(dsct)){return false;}
			var arr = dsct.split('.');
			if(arr.length > 2) { return false;}
			if(arr[1].length>2){return false;}
			if(arr[0]!='1' && arr[0]!='0'){return false;}
			if(arr[0]=='1'){
				if(arr[1]!='0' && arr[1]!='00'){
					return false;
				}
			}
			return true;
		}
	</script>

  </head>
  <body onload="getReady()">
<div class="main" id="maindiv">
        
        <div class="h4title"><h4>${item.store.storeName}<span style="font-weight: normal;"></span></h4></div>
</div>
<DIV class=main-wrap style="margin-left:16px;">

<DIV id=main-content>

<DIV class=item-list>
<DIV class=item-list-hd>
	<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top: -12px; height: 27px;">
	  <LI><A href="welcome.do?action=storeEdit&store=${item.store.storeId}">店铺信息</A> </LI>
	  <LI class="current"><A href="welcome.do?action=itemList&store=${store.storeId}">商品管理</A> </LI>
	  <!-- <LI><A href="welcome.do?action=blockEdit&store=${store.storeId}">外送区域管理</A> </LI>
	   -->
	</UL>
</DIV>
<DIV class="item-list-bd" style="width:764px;">
<div class="bcontentlist">
<form name="itemEdit" action="itemEditCommit.do" method="POST">
	<input type="hidden" name="storeId" value="${store.storeId}"/>
	<c:if test="${not empty item}"><input type="hidden" name="itemId" value="${item.itemId}"/></c:if>
	<table width="600" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">
  		<tr class="order-item">
			<td width="120" class=order-hd>店铺</td><td width="480"><a href="welcome.do?action=itemList&store=${store.storeId}">${store.storeName}</a></td>
		</tr>
		<tr class="order-item">
			<td class=order-hd>菜名</td><td><input style="width:350px;" type="text" name="itemName" id="itemName" value="${item.itemName}" <c:if test='${not empty item}'>readonly='readonly'</c:if>/></td>
		</tr>
		<!--
		<tr class="order-item">
			<td class=order-hd>详细说明</td><td><textarea style="width:350px;height:200px;"  name="itemDetail" id="itemDetail">${item.itemDetail}</textarea></td>
		</tr>
		  -->
		<tr class="order-item">
			<td class=order-hd>价格（圆）</td><td><input style="width:350px;" type="text" id="itemPrice" name="itemPrice" value="${item.itemPrice}"/></td>
		</tr>
		
		 <!--
		<tr class="order-item">
			<td class=order-hd>折扣(输入0.85即为85折)</td><td><input style="width:350px;" type="text" name="itemDsct" id="itemDsct" value="${item.itemDsct}"/></td>
		</tr>
		-->
		<tr class="order-item">
			<td class=order-hd>类型</td>
			<td>
				<select style="width:200px;" id="itemType" name="itemType" onchange="otherInput(this.value)">
					<c:forEach items="${type_list}" var="c_type">
						<c:if test="${item.itemType eq c_type}"><option value="${c_type}" selected="selected">${c_type}</option></c:if> 
						<c:if test="${item.itemType ne c_type}"><option value="${c_type}">${c_type}</option></c:if> 
					</c:forEach> 
						<option id="ot_option" value="-1">新输入类别</option>
				</select>
				<input type="text" id="otherType" name="otherType" style="display:none"/>
			</td>
		</tr>
		<tr class="order-item">
			<td class=order-hd>状态</td>
			<td>
				<select name="itemState">
					 <option value="上架" <c:if test="${item.itemState eq '上架'}">selected='selected'</c:if>>上架</option>
					 <option value="下架" <c:if test="${item.itemState eq '下架'}">selected='selected'</c:if>>下架</option>
				</select>
			</td>
		</tr>
		<tr class="order-item">
			<td class=order-hd></td>
			<td>
				<input style="width:200px;" type="button" value="确定" onclick="onEdit()"/>
			</td>
  		</table>
	</form>
	
	<c:if test="${not empty item}">
	<table width="600" style="margin-top:20px;border:1px solid #f3f3f3;" class="order success-order xcard">
  			<tr class="order-item">	
	  			<td class=order-hd width="120">
					图片
				</td>
			    <td width="480">
				    <html:form action="/user/s/itemImageUp" method="POST" enctype="multipart/form-data" target="hidden_frame">
			    	<html:file property="image"/>
			    	<html:hidden property="itemId" value="${item.itemId}"/>
			    	<html:submit value="上传"></html:submit>
					</html:form>
				</td>
			</tr>
			<tr>
				<td colspan="2">
								<iframe width="500" name='hidden_frame' id="hidden_frame" style='display:none'></iframe> 
				<span id="msg"><c:if test="${empty item.itemImgSrc}">暂无图片</c:if><c:if test="${not empty item.itemImgSrc}"><img height='250' src="../../${item.itemImgSrc}"></c:if></span>  
				</td>
			</tr>
  		</table>
	</c:if>
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
}    
</script>   


