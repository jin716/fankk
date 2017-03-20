<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>饭快快${area.areaName}区外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线,外卖搜索">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/shop_list.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../js/selector-min.js"></script>
<script type="text/javascript" src="../js/event-delegate-min.js"></script>



<link rel="stylesheet" type="text/css" href="../css/iwaimai/upbox.css">

<script type="text/javascript">
(function() {
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;
	
	var onMouseOverAbc = function (event, matchedEl, container) {
		if (!Dom.hasClass(matchedEl,'currentLetter'))
		Dom.addClass(matchedEl, 'hover');
	}
	
	var onMouseOutAbc = function (event, matchedEl, container) {
		Dom.removeClass(matchedEl, 'hover');
	}
	
	var onMouseOverAddlist = function (event, matchedEl, container) {
		if (!Dom.hasClass(matchedEl,'current'))
		Dom.addClass(matchedEl, 'hover');
	}
	
	var onMouseOutAddlist = function (event, matchedEl, container) {
		Dom.removeClass(matchedEl, 'hover');
	}
	
	var onMouseOverAdd_wall = function (event, matchedEl, container) {
		Dom.addClass(matchedEl, 'hover');
	}
	
	var onMouseOutAdd_wall = function (event, matchedEl, container) {
		Dom.removeClass(matchedEl, 'hover');
	}
	
	

	Event.delegate("list_abc", "mouseover", onMouseOverAbc, "li");
	Event.delegate("list_abc", "mouseout", onMouseOutAbc, "li");
	
	Event.delegate("addlist", "mouseover", onMouseOverAddlist, "li");
	Event.delegate("addlist", "mouseout", onMouseOutAddlist, "li");
	
	Event.delegate("add_wall", "mouseover", onMouseOverAdd_wall, "li");
	Event.delegate("add_wall", "mouseout", onMouseOutAdd_wall, "li");


})();
function search_ready(){
		var key = document.getElementById('KeyWord_1').value;
		if(key == ""){
			return false;
		}
		else{
			document.getElementById('key').value = encodeURI(key);
			return true;
		}
	}
function onSearch(){
		var key = document.getElementById('KeyWord_1').value;
		if(key == ""){
			return;
		}
		else{
			document.getElementById('key').value = encodeURI(key);
			document.uform.submit();
		}
	}
</script>

</head>


<body>
<%@ include file="../library/stateBanner.jsp"%>

	<div id="wrapper">
	
    	<%@ include file="../library/header.jsp"%>
        
        <div id="s_ibody" >
		<%@ include file="../library/main_nav.jsp"%>
		<div id="bread"  style="float:left;width:400px;">
            	您的位置: 
                <a href="../index.jsp">首页</a>
                 > 
                <a href="blockList_${area.areaId}">${area.areaName}</a>
                  > 
                <span class="current">${first_letter}开头的公车站,街道</span>
                
        </div>
        <form id="area_addr_all_uform" name="uform" method="get" onsubmit="return search_ready()" action="search.do">
		<div style="float:right;width:400px;">
			<font style="color:#666666;font-size:14px;font-weight:600">搜素地段：</font>
			<input autocomplete="off" name="searchType" type="hidden" value="0">
			<input autocomplete="off" id="key" name="KeyWord" type="hidden" class="gray" value="">
			<input style="width:150px;height:18px;" id="KeyWord_1" type="text">
			<button class="sobtn" style="color:#555555" onclick="onSearch()">搜索</button>
		</div> 
        </form>
        <div class="clear"></div>
             <div id="ss_main">
             
    <div id="TB_ajaxContent" class="TB_modal" style="width: 980px; height: auto;float:left;">
						<div id="pop_upbox"
							style="margin: 0pt auto; display: block; width: 980px; height: auto;float:left;">
							<div id="upbox_cont">
								<div class="addlist" id="addlist" style="">
									<ul>
                						<li <c:if test="${1 == area.areaId}"> class="current"</c:if>><a href="blockList_1">天河</a></li>
                						<li <c:if test="${2 == area.areaId}"> class="current"</c:if>><a href="blockList_2">越秀</a></li>
                						<li <c:if test="${5 == area.areaId}"> class="current"</c:if>><a href="blockList_5">海珠</a></li>
                						<li <c:if test="${6 == area.areaId}"> class="current"</c:if>><a href="blockList_6">荔湾</a></li> 
                						<li <c:if test="${7 == area.areaId}"> class="current"</c:if>><a href="blockList_7">白云</a></li>
                						<li <c:if test="${3 == area.areaId}"> class="current"</c:if>><a href="blockList_3">花都</a></li>
										<li <c:if test="${4 == area.areaId}"> class="current"</c:if>><a href="blockList_4">番禺</a></li>
										
									</ul>
									<br class="clear">
								</div>

								<div id="list_abc" class="so_abc">
									<ul>
										<li
											<c:if test="${first_letter == 'A'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_A">A</a>
										</li>
										<li
											<c:if test="${first_letter == 'B'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_B">B</a>
										</li>
										<li
											<c:if test="${first_letter == 'C'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_C">C</a>
										</li>
										<li
											<c:if test="${first_letter == 'D'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_D">D</a>
										</li>
										<li
											<c:if test="${first_letter == 'E'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_E">E</a>
										</li>
										<li
											<c:if test="${first_letter == 'F'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_F">F</a>
										</li>
										<li
											<c:if test="${first_letter == 'G'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_G">G</a>
										</li>
										<li
											<c:if test="${first_letter == 'H'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_H">H</a>
										</li>
										<li
											<c:if test="${first_letter == 'I'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_I">I</a>
										</li>
										<li
											<c:if test="${first_letter == 'J'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_J">J</a>
										</li>
										<li
											<c:if test="${first_letter == 'K'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_K">K</a>
										</li>
										<li
											<c:if test="${first_letter == 'L'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_L">L</a>
										</li>
										<li
											<c:if test="${first_letter == 'M'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_M">M</a>
										</li>
										<li
											<c:if test="${first_letter == 'N'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_N">N</a>
										</li>
										<li
											<c:if test="${first_letter == 'O'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_O">O</a>
										</li>
										<li
											<c:if test="${first_letter == 'P'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_P">P</a>
										</li>
										<li
											<c:if test="${first_letter == 'Q'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_Q">Q</a>
										</li>
										<li
											<c:if test="${first_letter == 'R'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_R">R</a>
										</li>
										<li
											<c:if test="${first_letter == 'S'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_S">S</a>
										</li>
										<li
											<c:if test="${first_letter == 'T'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_T">T</a>
										</li>
										<li
											<c:if test="${first_letter == 'U'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_U">U</a>
										</li>
										<li
											<c:if test="${first_letter == 'V'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_V">V</a>
										</li>
										<li
											<c:if test="${first_letter == 'W'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_W">W</a>
										</li>
										<li
											<c:if test="${first_letter == 'X'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_X">X</a>
										</li>
										<li
											<c:if test="${first_letter == 'Y'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_Y">Y</a>
										</li>
										<li
											<c:if test="${first_letter == 'Z'}">class="currentLetter"</c:if>>
											<a href="blockList_${area.areaId}_Z">Z</a>
										</li>
									</ul>
								</div>
								<br class="clear">
								
								<br class="clear">
								
								<div id="load_area_code" class="adds load_area_code">

									<div id="add_wall">
										<div style="float: left;">
											<h3 style="margin-left: 3px; width: 713px; display: block;">
												${first_letter}开头的<font color="#ff9933">公交车站</font>
											</h3>
											<ul>
												<c:forEach items="${block_list_bus}" var="block">
													<li>
														<a href="storeList_${block.blockId}">${block.blockName}<span class="num_res">${block.storeNum}家餐厅</span></a>
													</li>
												</c:forEach>
												<!--<a target="_parent" href="##"><span class="num_res">42家餐厅</span>洞庭湖畔</a> -->
											</ul>
										</div>
										
										<div style="float: left;margin-top:16px;">
											<h3 style="margin-left: 3px; width: 713px; display: block;">
												${first_letter}开头的<font color="#ff9933">街道</font>
											</h3>
											<ul>
												<c:forEach items="${block_list_street}" var="block">
													<li>
														<a href="storeList_${block.blockId}">${block.blockName}<span class="num_res">${block.storeNum}家餐厅</span></a>
													</li>
												</c:forEach>
												<!--<a target="_parent" href="##"><span class="num_res">42家餐厅</span>洞庭湖畔</a> -->
											</ul>
										</div>
										
									</div>

								</div>

							</div>

						</div>
					</div>
             </div>
            
            
            <div class="clear"></div>
        </div>
        <%@ include file="../library/footer.jsp"%>
        </div>
</body>
</html>
