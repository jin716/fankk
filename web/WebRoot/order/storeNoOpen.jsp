<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../js/selector-min.js"></script>
<script type="text/javascript" src="../js/event-delegate-min.js"></script>
<style type="text/css">
body{
	background:url(../image/shop/NoOpen.png) no-repeat;
}

.tips{
	float:left;
	margin-left:220px;
	margin-top:60px;

	font-size:14px;
	line-height:24px;

	__position:absolute;
	__padding:0px;
}

.shopname{
	font-size:18px;
	font-weight:bold;
}

.J_Phone{
	float:left;
	margin-left:220px;
	margin-top:16px;
	font-size:14px;
	__position:absolute;
	__padding:0px;
	__margin-top:150px;


}
</style>
</head>

<script type="text/javascript">
(function() {
	
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;
	
		var sendCodeBtn;
		var timer;
		var countDown = function () {
			var time = 10;
			timer = setInterval(function () {
				time--;
				if (time !== 0) {
					sendCodeBtn.innerHTML = " " + time + "秒 后显示该店家的订餐电话";
				} else {
					sendCodeBtn.innerHTML = "订餐电话：${tele}";
					clearTimeout(timer);					
				}
			}, 1000);
		};
		
		window.onload=function(){  
		sendCodeBtn = document.getElementById("J_Phone");

		countDown();
		}; 


})();

</script>
<body>
	<div style="width:454;height:300px;float:left;">
        <div class="tips">
            <span class="shopname">${name}</span><br />
            尚未开通网上订餐功能!<br />
            我们将提供此店家的电话给您：
        </div>
        <div class="clear"></div>
        <div id="J_Phone" class="J_Phone">
         10秒 后显示该店家的订餐电话
        </div>
    </div>
</body>
</html>
