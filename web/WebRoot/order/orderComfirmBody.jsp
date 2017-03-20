<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../../pi/css/g.base.v51.css" rel="stylesheet" type="text/css" />
		<link href="../../pi/css/pi.css" rel="stylesheet" type="text/css" />
		<link href="../../css/rating.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.rat_head{float:left;width: 100%;background-color:#f3f3f3;height:20px;border-bottom:1px solid #e6e6e6;margin-bottom:5px;}
			.rat_middle{float:left;width: 90%;margin:0px;}
			.title{background-color:#f3f3f3;}
			table{font-size:17px;}
			td{border:1px solid #f3f3f3;text-align:center;}
			button{width:110px;height:24px;}
			.tele_ul{
			width:340px;margin-left:95px;margin-top:35px;
			font-weight:600;font-size:13px;
			}
			.tele_ul li{
			margin-top:28px;
			}
		</style>
		<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<style type="text/css">

#phone_validate_main{
	 margin:0 auto;width:454px;height:277px;background:url(../image/shop/validate.png);padding-top:30px
}

#phone_validate_main .content{
	width:230px;height:250px;margin-left:200px;
}

#phone_validate_main h3{
	font-size:27px;
}

#phone_validate_main span{
	line-height:32px;
	font-size:16px;
}

#phone_validate_main input{
	line-height:27px;
	font-size:14px;
	width:90px;
}

#phone_validate_main button{
	margin-left:8px;
}

#phone_validate_main a{
	text-decoration:underline;
}

</style>
		<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../js/selector-min.js"></script>
<script type="text/javascript" src="../js/event-delegate-min.js"></script>

	<script type="text/javascript">
			(function() {
		
		var Dom=YAHOO.util.Dom,
			Event=YAHOO.util.Event,
			CE=YAHOO.util.CustomEvent;
		
			var sendCodeBtn;
			var timer;
			var countDown = function () {
				sendCodeBtn.disabled = true;
				var time = 60;
				timer = setInterval(function () {
					time--;
					if (time !== 0) {
						sendCodeBtn.value = "\u5728" + time + "\u79d2\u540e\u70b9\u6b64\u91cd\u53d1";
					} else {
						sendCodeBtn.value = "\u91cd\u65b0\u53d1\u9001\u624b\u673a\u9a8c\u8bc1\u7801";
						sendCodeBtn.disabled = false;
						clearTimeout(timer);					
					}
				}, 1000);
			};
			
			window.onload=function(){  
			sendCodeBtn = document.getElementById("J_ReSendCode");
	
			countDown();
			}; 
	
	
	})();
		$(document).ready(function() { 
			$("#J_ReSendCode").bind("click", function(){
				send();
			});
			 
		}); 
		
		function send(){
			alert("aaa");
			jQuery.get("../user/activateCodeSend.do",{action:'noUser'},
				function(data){
						if(data!="-1")alert("验证码已发送！");
			});
		}
	
		function check_vcode(){
			var v_1_code = document.getElementById("J_Code").value;
			if(v_1_code == ""){
				alert("请输入发送到您手机上的验证码");
				return false;
			}
			return true;
		}
		function taSubmit(){
			if(check_vcode()){
				document.toActivate.submit();
			}
		}
		function taSubmit2(){
				document.toActivate.submit();
		}
</script>
	</head>
	<body>
		<!--
		<div class="rat_head">
		订单明细
			</div>
		-->
		<div class="rat_middle">
		<div id="con" class="con" style="width: 690px;;float:left;">

			<table width="690">
				<tr><td colspan="2" class="title">菜名</td>
				<td  class="title"  width="150">数量</td>
				<td class="title" width="200">价钱</td></tr>
			<c:forEach items="${c_order.orderItemses}" var="oi">
				<tr><td  colspan="2" >${oi.itemName}</td><td>${oi.itemNum}份</td><td>${oi.itemTotalPrice}</td></tr>		 
			</c:forEach>
			</table>
			<table width="690">
				<tr><td  class="title">总费用</td><td colspan="3">${c_order.orderTotalPrice} 元（含外送费用：${c_order.orderSendPrice}）</td></tr>		 
				<tr>
				<td class="title">
					称呼
				</td>
				<td width="550">
					${c_order.name}
				</td>
			</tr>
			<tr>
				<td class="title">
					电话
				</td>
				<td>
					${c_order.orderTele}
				</td>
			</tr>
			<tr>
				<td class="title">
					地址
				</td>
				<td>
					${c_order.orderAddr}
				</td>
			</tr>
			<tr>
				<td class="title">
					备注
				</td>
				<td>
					<c:if test="${c_order.orderRemark == null}">无</c:if>
					${c_order.orderRemark}
				</td>
			</tr>
			<form action="orderCommit.do" method="post" name="toActivate" onsubmit="return check_vcode()">
			<input type="hidden" value="${flag}" name="flag"/>
			<tr>
				<td colspan="2">
				<input type="button" onclick="taSubmit2()" style="width:200px;height:40px;font-weight:600;font-size:17px;" onclick="submitOrder()" value="确定并提交订单" />
				</td>
			</tr>
			</form>
			</table>
			
			
			
		</div>
	</body>
</html>
