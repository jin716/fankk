<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'password.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="../js/tools.js"></script>
	<script type="text/javascript">
		function onVcode(){
			document.getElementById("vc_div").innerHTML = "<img src='../vCode.do?ram="+Math.random()+"'/>";
		}
		function keyPress() {
        	var keyCode = event.keyCode;
	        if (keyCode == 13) {
            	onChange();
        	}

		}

		function onChange(){
			
			var old = Trim(document.getElementById("old_p").value);
			var new_1 =  Trim(document.getElementById("new_p").value);
			var new_2 =  Trim(document.getElementById("new_2").value);
			var msg = "";
			if(old == ""){
				msg += "请输入旧密码\n";
			}
			if(new_1 == "" || new_2 == ""){
				msg += "请输入新密码\n";
			}
			if(new_1!=new_2){
				msg += "密码输入不一致，请重新输入\n";
			}

			if(msg!=""){
				alert(msg);
				return;
			}
			document.pass.submit();
		}
	</script>

  </head>
  
  <body>
    ${mess}
    <%session.removeAttribute("mess");%>
    <form action="password.do" name="pass" method="post">
    <table>
    	<tr>
    		<td>旧密码</td><td><input type="password" name="old_p" id="old_p"/></td>
    	</tr>
    	<tr>
    		<td>新密码</td><td><input type="password" name="new_p" id="new_p"/></td>
    	</tr>
    	<tr>
    		<td>新密码确认</td><td><input type="password" name="new_2" id="new_2"/></td>
    	</tr>
    	<tr>
    		<td>验证码</td><td><input type="text" name="vcode" id="vcode" onkeypress="keyPress()"></td>
    		<td><a href="javascript:onVcode()"><div id="vc_div"><img src="../vCode.do"/></div>看不清，换一个</a></td>
    	</tr>
    	<tr>
    		<td></td><td><input type="button" onclick="onChange()" value="修改"/></td>
    	</tr>
    </table>
    </form>
  </body>
</html>
