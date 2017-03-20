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

#near_by_block {
	width: 490px;
}

#near_by_block li {
	margin-top: 5px;
}

#near_by_block a {
	display: block;
	width: 90%;
}

#near_by_block a:hover {
	
}
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
		<script type="text/javascript">
		function onEdit(){
			document.blockEdit.submit();
		}
		
		function showStep(val){
			document.getElementById("step_"+val).style.display = "";
		}
		
		function getAreaList(val,s_name){
			var selectTag = document.getElementById(s_name);
			for(i= selectTag.options.length - 1 ;i >= 0 ; --i){
				selectTag.remove(i);
			}
			selectTag.options.add(new Option("==请选择==",""));
			if(val == ""){
				return;
			}
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
		
		function getMap(){
			showStep(1);
			var op = document.getElementById("city").options;
			var valu = document.getElementById("city").value;
			
			for(i=0;i<op.length;++i){
				if(op[i].value == valu){
					getBlockListInArea();
				}
				
			}
		}
		
		
		
		
		function setPoint(poi){
			showStep(2);
			showStep(3);
			showStep(4);
			document.getElementById("latitude").value = poi.getLatitude();
			document.getElementById("longitude").value = poi.getLongitude();
		}
		
		function getBlockListInArea(){
			var area = document.getElementById("area").value;
			document.getElementById("myMap").innerHTML = "<img src='../../image/loading50.gif'/>"
			jQuery.get("getValue.do",{type:"blockListInArea",area:area},
				function(date){
					if(date == "" || date == "null"){
						getBlocksOnMap(date);
						return ;
					}
					var json = eval("("+date+")");
					getBlocksOnMap(json);
			});
		}
		
		
		
		function getBlocksOnMap(blocks){
			var op = document.getElementById("city").options;
			var valu = document.getElementById("city").value;
			for(i=0;i<op.length;++i){
				if(op[i].value == valu){
					var maps = new LTMaps("myMap");
					maps.cityNameAndZoom( op[i].id , 2);
					var control1 = new LTMarkControl();
					function getPoi(){
						var poi = control1.getMarkControlPoint();
						setPoint(poi);
					}
					LTEvent.addListener(control1 , "mouseup" , getPoi);
					var control2 = new LTScaleControl();
					var control3 = new LTSmallMapControl();
					maps.addControl(control1);
					maps.addControl(control2);
					maps.addControl(control3);
					
					if(blocks!=""&&blocks.length>0){
						var points = new Array();
						for(var j=0;j<blocks.length;++j){
							points.push(new LTPoint( blocks[j].NTULongitude , blocks[j].NTULatitude ) );
						}//for
						
						maps.getBestMap( points );
						for(var k=0 ; k<points.length ; k++)
						{
							var marker = new LTMarker(points[k]);
							marker.setIconImage("../../image/location.png");
							maps.addOverLay( marker );
							var text = new LTMapText( points[k] );
							text.setLabel("&nbsp;&nbsp;&nbsp;&nbsp;"+blocks[k].blockName+"&nbsp;&nbsp;&nbsp;&nbsp;"); 
							text.setFontSize(14);
							maps.addOverLay( text ); 
						}
					}//if
					return;
				}//if
			}//for
		}//function
		
		function setLL(longitude,latitude){
			document.getElementById("latitude").value = latitude;
			document.getElementById("longitude").value = longitude;
		}
		
		function checkName(val){
			if(val != "")document.getElementById("b_button").disabled = "";
			else document.getElementById("b_button").disabled = "disabled";
		}
	</script>
	</head>
	<body>
		<div class="main" id="maindiv">
			<div class="h4title">
				<h4>
					小区管理
					<span style="font-weight: normal;"></span>
				</h4>
			</div>
		</div>
		<DIV class=main-wrap style="margin-left: 16px;">

			<DIV id=main-content>

				<DIV class=item-list>
					<DIV class=item-list-hd>
						<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top:-12px;height:27px;">
						  <LI class="current"><A href="welcome.do?action=blockAdd">添加小区</A> </LI>
						  <LI><A href="welcome.do?action=blockEdit">修改小区</A> </LI>
						</UL>
					</DIV>



					<DIV class="item-list-bd" style="width: 764px;">
						<div class="bcontentlist">
							<script language='javascript'
								src='http://api.51ditu.com/js/maps.js'></script>
							<form name="blockEdit" action="blockEditSubmit.do" method="POST">
								<input type="hidden" value="${BE_uitlValue}" name="uitlName" />
								<table width="600"
									style="margin-top: 20px; border-right: 1px solid #f3f3f3; border-top: 1px solid #f3f3f3"
									class="order success-order xcard">
									<tr class="order-item">
										<td width="100" class=order-hd>
											城市
										</td>
										<td width="200">
											<select name="city" id="city"
												onchange="getAreaList(this.value,'area')">
												<option value="">
													==请选择==
												</option>
												<c:forEach items="${city_list}" var="city">
													<option value="${city.cityId}" id="${city.cityPingYin}">
														${city.cityName}
													</option>
												</c:forEach>
											</select>
										</td>
										<td width="100" class=order-hd>
											大区
										</td>
										<td width="200">
											<select name="area" id="area" onchange="getMap()">
												<option value="">
													==请选择==
												</option>
											</select>
										</td>
									</tr>
									<tr id="step_1" class="order-item" style="display: none">
										<td width="100" class=order-hd>
											地图
										</td>
										<td colspan="3">
											<div id="myMap"
												style="position: relative; width: 580px; height: 500px;"></div>
										</td>
									</tr>
									<tr id="step_2" class="order-item" style="display: none">
										<td class=order-hd>
											经度
										</td>
										<td>
											<input type="text" id="longitude" name="longitude" />
										</td>
										<td class=order-hd>
											纬度
										</td>
										<td>
											<input type="text" id="latitude" name="latitude" />
										</td>
									</tr>
									<tr id="step_3" class="order-item" style="display: none">
										<td class=order-hd>
											小区名
										</td>
										<td>
											<input type="text" id="blockName" name="blockName"
												onkeyup="checkName(this.value)" />
										</td>
										<td class=order-hd>属性</td>
										<td>
											
											<select name="isBuilding" id="isBuilding">
													<option value="false">小区</option>
													<option value="true">楼宇</option>
											</select>
										</td>
									</tr>
									<tr id="step_4" class="order-item" style="display: none">
										<td class=order-hd></td>
										<td colspan="3">
											<input id="b_button" disabled="disabled"
												style="width: 400px;" type="button" value="确定"
												onclick="onEdit()" />
										</td>
									</tr>
									<c:if test="${not empty BlockEditSubmit_Mess}">
										<tr class="order-item">
											<td class=order-hd></td>
											<td colspan="3">
												<font color="red">${BlockEditSubmit_Mess}</font>
											</td>
										</tr>
									</c:if>
								</table>
							</form>
						</div>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
	</body>
</html>


