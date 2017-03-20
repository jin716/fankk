<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的饭快快</title>
<link href="../../css/admin_page.css" rel="stylesheet" type="text/css" />
<link href="../../css/admin_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../../js/selector-min.js"></script>
<script type="text/javascript" src="../../js/event-delegate-min.js"></script>

<script type="text/javascript">
(function() {
	var last_current;  
	
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;
	
	var onClick = function (event, matchedEl, container) {
		Dom.removeClass(last_current, 'current');
		Dom.addClass(matchedEl, 'current');
		last_current=matchedEl;

	}

	Event.delegate("menu_001", "click", onClick, "li");



})();
</script>

<script type="text/javascript">

function reinitIframe(){

var iframe = document.getElementById("mainFrame");

try{

var bHeight = iframe.contentWindow.document.body.scrollHeight;

var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;

var height = Math.max(bHeight, dHeight);

iframe.height =  height;

}catch (ex){}

}


window.setInterval("reinitIframe()", 200);

</script>

</head>


<body>
<%@ include file="../../library/stateBanner.jsp"%>
<div id="wrapper"><!-- #BeginLibraryItem "/Library/header.lbi" -->
<link href="css/Ymai.css" rel="stylesheet" type="text/css">
			<%@ include file="../..//library/header.jsp"%>
<!-- #EndLibraryItem -->
	<link rel="stylesheet" href="../../css/topnav/common_v2.css">
	<div id="topnav">
        <ul class="guid">
            <li class="selected"><a href="../s/welcome.do"><span>我是商家</span></a></li>
        </ul>

        
    </div>
  <div id="ibody">
                    
                    
<div id="sidebar_left">
            	<span style="font-weight:bold;background-image:url(../../images/admin_bg_statebar.png);background-repeat:repeat-x;display:block;margin:0;padding-top:4px;text-align:center;height:26px;font-size:14px;">我的饭快快</span>
                
                <div class="system_menu1" id="menu_001">
                    <ul class="" style="">
                    	<li class="">       
							<a href="welcome.do?action=getOrder" target="mainFrame">最新订单</a>
						 </li>
                        <li class="">       
							<a href="welcome.do?action=storeList" target="mainFrame">店铺管理</a>
						 </li>
                        <li class="">         
                            <a href="welcome.do?action=password" target="mainFrame">修改密码</a>
                        </li>
						
                    </ul>
                </div>
            </div>
            
            <div id="main_ad">
                <iframe id="mainFrame" name="mainFrame" frameborder="no" border="0" scrolling="no" src="welcome.do?action=${url}">
                </iframe>
            </div>
 
            
            <div class="clear"></div>
        </div><!-- #BeginLibraryItem "/Library/footer.lbi" -->
        <%@ include file="../..//library/footer.jsp"%>
        
<!-- #EndLibraryItem --></div>
</body>
</html>