<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线,外卖搜索">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/shop_list.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/iwaimai/upbox.css">
</head>


<body>
<%@ include file="../library/stateBanner.jsp"%>

	<div id="wrapper">
	
		<%@ include file="../library/header.jsp"%>
        
        <div id="s_ibody">
        
        	<%@ include file="../library/main_nav.jsp"%>
		
            <div id="bread">
                    您的位置: 
                    <a href="../index.jsp">首页</a>
                     > 
                    <span class="current">请选择小区、大厦</span>
            </div>

        	
            
             <div id="ss_main" style="float:left;">
             
    <div id="TB_ajaxContent" class="TB_modal" style="width: 980px; height: auto;">
	<div id="pop_upbox" style="margin: 0pt auto; display: block; width: 980px; height:auto;">
							<div id="upbox_cont">
								
								<div class="soadd"
									style="background: none; border-bottom: #2e6ab1 solid 1px; width: 780px; padding-bottom: 10px;">
								
                   
									
									
									<form id="area_addr_all_uform" name="uform" method="get" onsubmit="return search_ready()" action="search.do">
										<div class="left">
											搜素地段：
										</div>
										<div class="left" style="padding-top: 2px;">
											<input autocomplete="off" name="searchType" type="hidden" value="0">
											<input autocomplete="off" id="key" name="KeyWord" type="hidden" class="gray" value="">
											<input autocomplete="off" id="KeyWord_1" type="text" value="${real_key}">
                    
										</div>
										<div class="left">
											<button class="sobtn" onclick="onSearch()">搜索</button>
										</div>
									</form>
								</div>

								<br class="clear">
								<br class="clear">
								<div id="load_area_code" class="adds load_area_code">

									<div id="add_wall">
										<div style="float: left">
											<h3 style="margin-left: 3px; width: 713px; display: block;">
												与“${real_key}”相关的公交站和街道
											</h3>
											<ul>
											<c:forEach items="${page.list}" var="block">
												<li>
													<a target="_parent" href="storeList_${block.blockId}">${block.blockName}<span class="num_res">${block.area.areaName}</span></a>
												</li>
											</c:forEach>
											</ul>
										</div>
										
									</div>
									
            	            
								</div>
								<form name="pageSearch" method="get">
								<input name="searchType" value="0" type="hidden"/>
								<input name="KeyWord" value="${key}" type="hidden"/>
								<input name="page" id="s_page" value="1" type="hidden"/>

								<div class="pagination" style="width:776px;margin-top:5px;">
						                <ul>
						                    <c:if test="${page.cur == 1}"><li class="disablepage">上一页</li></c:if>
						                	<c:if test="${page.cur != 1}"><li><a href="javascript:toPage('${page.pre}')">上一页</a></li></c:if>
						                <c:forEach items="${page.pageList}" var="number">
						                    <c:if test="${number == page.cur}"><li class="currentpage">${number}</li></c:if>
						                    <c:if test="${number != -1}"><c:if test="${number !=  page.cur}"><li><a href="javascript:toPage('${number}')">${number}</a></li></c:if></c:if>
						               		<c:if test="${number == -1}">...</c:if>
						               		
						                </c:forEach>
						                   <c:if test="${page.next == page.cur}"><li class="disablepage">下一页</li></c:if>
						                   <c:if test="${page.next != page.cur}"><li ><a href="javascript:toPage('${page.next}')">下一页</a></li></c:if>
						                	
						                </ul>
						        </div>
						        </form>
						        
							</div>
						</div></div>
             
             </div>
            
            
            <div class="clear"></div>
        </div>
        <%@ include file="../library/footer.jsp"%>
        </div>
</body>
</html>
<script type="text/javascript" src="../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../js/selector-min.js"></script>
<script type="text/javascript" src="../js/event-delegate-min.js"></script>
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
function toPage(pageNo){
		document.getElementById("s_page").value = pageNo;
		document.pageSearch.submit();
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
