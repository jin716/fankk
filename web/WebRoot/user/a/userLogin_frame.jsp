<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/pi.css" rel="stylesheet" type="text/css" />
<link href="css/pi_setup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			initButton();				
			getList(1);
		});
		
		function toPage(page){
			getList(page);
		}
		
		//"查询"按钮的初始化
		function initButton(){
			$("#loginBut").bind("click", function(){
				onLogin();
			}); 			
		}

		
		function onLogin(){
			var name = document.getElementById('user_login_name').value;
			var pass = document.getElementById('user_password').value;
			var vcode = document.getElementById('vcode').value;
			var msg = "";
			if(name==""){
				msg+= "请输入用户名。\n";
			}
			if(pass==""){
				msg+= "请输入密码。\n";
			}
			if(vcode==""){
				msg+= "请输入验证码。\n";
			}
			if(msg!=""){
				alert(msg);
				return;
			}

		 	jQuery.get("login.do",{username:name, password:pass ,vcode:vcode},
				function(date){
					if(date == "true"){
						parent.window.location.href="welcome.do";
					}			
					else{
						document.getElementById("showMess").innerHTML = decodeURI(date);
					}
			});
		}
		
		function keyPress() {
        	var keyCode = event.keyCode;
	        if (keyCode == 13) {
            	onLogin()
        	}

		}
		function onVcode(){
			document.getElementById("vc_div").innerHTML = "<img src='../../vCode.jpg?ram="+Math.random()+"'/>";
		}
	</script>
</head>

<body>
<div class="main" id="maindiv">
	<div class="h4title"><h4>请登录<span style="font-weight: normal;"></span></h4></div>
	<table style="margin-left:20px;">
    	<tr>
    		<td><div id="showMess">${mess}</div></td>
    	</tr>
    </table>
    <table style="margin-left:20px;">
    	<tr>
    		<td height="60">用户名/Email/手机号</td><td><input type="text" name="user_login_name" id="user_login_name" value="${name}"/></td>
    	</tr>
    	<tr>
    		<td>密码</td><td><input type="password" name="user_password" id="user_password" value="${password}"/></td>
    	</tr>
    	<tr>
    		<td>验证码</td><td><input type="text" name="vcode" id="vcode" onkeypress="keyPress()"/></td>
    		<td><a href="javascript:onVcode()"><div id="vc_div"><img src="../../vCode.jpg"/></div>看不清，换一个</a></td>
    	</tr>
    	<tr>
    		<td colspan="2"><input type="button" id="loginBut" value="登录"/></td>
    	</tr>
    </table>

</div>
</body>
</html>
<%session.removeAttribute("mess"); %>
