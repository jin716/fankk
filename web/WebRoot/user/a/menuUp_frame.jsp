<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
<link href="css/pi.css" rel="stylesheet" type="text/css" />
<link href="css/pi_setup.css" rel="stylesheet" type="text/css" />	
<LINK rel=stylesheet type=text/css href="order_queue/tbsp.css">
<LINK rel=stylesheet type=text/css href="order_queue/common_v2.css">
<LINK rel=stylesheet type=text/css href="order_queue/common.css">
<LINK rel=stylesheet type=text/css href="order_queue/item_list_v2.1.css">
<style type="text/css">
	input{width:120px;height:23px;line-height:23px}
</style>
  </head>
  <body>
<div class="main" id="maindiv">
        <div class="h4title"><h4>${store.storeName }<span style="font-weight: normal;"></span></h4></div>
</div>
<DIV class=main-wrap style="margin-left:16px;">

<DIV id=main-content>

<DIV class=item-list>
<DIV class=item-list-hd>
	<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top:-12px;height:27px;">
	  <LI class = "current"><A href="#">修改店铺</A> </LI>
	</UL>
</DIV>

<DIV class="item-list-bd" style="width:764px;">
<div class="bcontentlist">
	<html:form action="/user/a/menuUp" enctype="multipart/form-data">
	<html:hidden property="storeId" value="${store.storeId}"/>
	<table width="400" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">
		<tr>
			<td  class="order-hd" width="120">修改菜单</td>
			<td width="300"><html:file property="excel"/></td>
			<td><html:submit value="上传菜单"/></td>
		</tr>
  		</table>
	</html:form>
	<html:form action="/user/a/imageUp" enctype="multipart/form-data">
	<html:hidden property="storeId" value="${store.storeId}"/>
	<table width="400" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">
		<tr>
			<td  class="order-hd" width="120">修改图片</td>
			<td width="300"><html:file property="excel"/></td>
			<td><html:submit value="上传图片"/></td>
		</tr>
		<c:if test="${store.storeImgSrc != null}" >
		<tr>
			<td  class="order-hd" width="120">原图片</td>
			<td  colspan="2"><img width="200" src="../..${store.storeImgSrc}"/></td>
		</tr>
		</c:if>
  		</table>
	</html:form>
	
	<form action="distanceSubmit.do" method="post">
	<input type="hidden" name="storeId" value="${store.storeId}"/>
	<table width="400" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">
		<tr>
			<td  class="order-hd" width="120">外送距离</td>
			<td width="300"><input type="text" name="distance" value="${store.storeSendDistance }"/>公里</td>
			<td><input type="submit" value="提交"/></td>
		</tr>
		<tr>
			<td  class="order-hd" width="120">外送范围</td>
			<td  colspan="2">
				<iframe style="width:420px;height:320px;" frameborder="no" border="0" scrolling="no" src="../../map.do?type=storeAndBlocks&store=${store.storeId}&width=400&height=300">
                </iframe>
            </td>
		</tr>
  		</table>
	</form>
	
  	</div>
</DIV>
</DIV></DIV></DIV>
</body>
</html>


