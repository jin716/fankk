<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="../../js/tools.js"></script>
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
#near_by_block{
	width:490px;
}
#near_by_block li{
	margin-top:5px;
}
#near_by_block a{
	display:block;
	width:90%;
}
#near_by_block a:hover{
}
#mainFrame_tr_1{
	display:none;
}
#mainFrame_tr_2{
	display:none;
}
#mainFrame_tr_3{
	display:none;
}
#mainFrame{
	width:600px;height:300px;
}

</STYLE>
	<script type="text/javascript">
		function getAreaList(val,s_name){
			var selectTag = document.getElementById(s_name);
			for(i= selectTag.options.length - 1 ;i >= 0 ; --i){
				selectTag.remove(i);
			}
			if(val == ""){
				return;
			}
			selectTag.options.add(new Option("==请选择==",""));
			
			jQuery.get("getValue.do",{type:"areaListOfCity",city:val},
				function(date){
					if(json == ""){
						return;
					}
					var json = eval( "(" + date + ")" );
					for(i=0;i<json.length;++i){
						selectTag.options.add(new Option(json[i].areaName,json[i].areaId));
					}
			});
		}
		
		function getBlockList(letter,q_area,q_block){
			var selectTag = document.getElementById(q_block);
			var area = document.getElementById(q_area).value;
			for(i= selectTag.options.length - 1 ;i >= 0 ; --i){
				selectTag.remove(i);
			}
			selectTag.options.add(new Option("==请选择==",""));
			if(letter == ""||area==""){
				return;
			}
			jQuery.get("getValue.do",{type:"blocks",area:area,fl:letter},
				function(date){
					if(json == ""){
						return;
					}
					var json = eval( "(" + date + ")" );
					for(i=0;i<json.length;++i){
						selectTag.options.add(new Option(json[i].blockName,json[i].blockId));
					}
			});
		}
		
		function getMap(val){
			$("#mainFrame_tr_1").show();
			$("#mainFrame_tr_2").show();
			$("#mainFrame_tr_3").show();
			document.getElementById("blockId").value=val;
			document.getElementById("mainFrame").src="../../map.do?type=block&width=500&height=270&block="+val;
		}
	</script>
  </head>
  <body>
<div class="main" id="maindiv">
        <div class="h4title"><h4>店铺管理<span style="font-weight: normal;"></span></h4></div>
</div>
<DIV class=main-wrap style="margin-left:16px;">

<DIV id=main-content>

<DIV class=item-list>
<DIV class=item-list-hd>
	<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top:-12px;height:27px;">
	  <LI ><A href="welcome.do?action=storeList">查询管理</A> </LI>
	  <LI class="current"><A href="#">添加店铺</A></LI>
	</UL>
</DIV>

<DIV class="item-list-bd" style="width:764px;">
<div class="bcontentlist">
  	<form action="storeEditSubmit.do" method="post">
            <input type="hidden" value="${store.storeId}" name="storeId"/>
            <input type="hidden" value="${store.block.blockId}" name="blockId" id="blockId"/>

  	<table width="600" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">            
            <tr class="order-item">
            	<td class=order-hd>店名</td>
            	<td><input type="text" id="storeName" name="storeName" value="${store.storeName}"></td>
            	<td class=order-hd>用户ID</td>
            	<td><input id="userId" name="userId" type="text"/></td>
            </tr>	
			<tr class="order-item">
            	<td class=order-hd>详细地址</td>
				<td colspan="3">
					<textarea rows="3" cols="70" name="storeAddrName" id="storeAddrName" value="${store.storeAddrName}"></textarea>			
				</td>
			</tr>
			<tr>
            	<td class=order-hd>短信手机</td><td><input id="storeMobile" name="storeMobile" type="text" value="${store.storeAddrName}"/></td>
            	<td class=order-hd>外送距离</td><td><input id="storeSendDistance" name="storeSendDistance" type="text" value="${store.storeSendDistance}"/></td>
            </tr>
            <tr>
            	<td class=order-hd>起送价格</td>
				<td width="200">
					<input type="text" name="storeLowCost" value="${store.storeLowCost}">
				</td>
				<td class=order-hd>外送费用</td>
				<td width="200">
					<input type="text" name="storeSendCost" value="${store.storeSendCost}">
				</td>
			</tr>   
            <tr>
            	<td class=order-hd>所在城市</td>
				<td width="200">
					<select name="q_city" id="q_city" onchange="getAreaList(this.value,'q_area')">
						<option value="">==请选择==</option>
						<c:forEach items="${city_list}" var="city">
						<option value="${city.cityId}"  id="${city.cityPingYin}">${city.cityName}</option>
						</c:forEach>
					</select>
				</td>
				<td class=order-hd>所在区域</td>
				<td width="200">
				<select name="q_area" id="q_area">
					<option value="">==请选择==</option>
				</select>
				</td>
			</tr> 
			           
            <tr class="order-item">
            	<td class=order-hd>首字母</td>
				<td width="200">
					<select name="q_letter" id="q_letter" onchange="getBlockList(this.value,'q_area','block')">
						<option value="">=请选择=</option>
						<option value="a">a</option><option value="b">b</option>
						<option value="c">c</option><option value="d">d</option>
						<option value="e">e</option><option value="f">f</option>
						<option value="g">g</option><option value="h">h</option>
						<option value="i">i</option><option value="j">j</option>
						<option value="k">k</option><option value="l">l</option>
						<option value="m">m</option><option value="n">n</option>
						<option value="o">o</option><option value="p">p</option>
						<option value="q">q</option><option value="r">r</option>
						<option value="s">s</option><option value="t">t</option>
						<option value="u">u</option><option value="v">v</option>
						<option value="w">w</option><option value="x">x</option>
						<option value="y">y</option><option value="z">z</option>
						
					</select>
				</td>
				<td class=order-hd>所在街区</td>	
				<td>
					<select name="block" id="block" onchange="getMap(this.value)">
						<option value="">==请选择==</option>
					</select>
				</td>
			</tr>
            
			
            <tr id="mainFrame_tr_1" class="order-item">
            	<td class=order-hd>地图</td>
            	<td colspan="3">
					<iframe id="mainFrame" name="mainFrame" frameborder="no" border="0" scrolling="no" src=""></iframe>
				</td>
			</tr>
			<tr id="mainFrame_tr_2" class="order-item">
            	<td class=order-hd>经度</td><td><input id="longitude" name="longitude" type="text"/></td>
            	<td class=order-hd>纬度</td><td><input id="latidute" name="latidute" type="text"/></td>
			</tr>
            <tr id="mainFrame_tr_3">
            	<td colspan="4"><input type="submit" style="width:120px;height:30px;" value="提交"/></td>
            </tr>
    </table>
	</form>
  	</div>
</DIV>
</DIV></DIV></DIV>
</body>
</html>




