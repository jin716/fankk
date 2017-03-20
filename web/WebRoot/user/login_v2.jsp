<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录饭快快--饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线"><link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
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
			document.login.submit();
		}
		function keyPress() {
        	var keyCode = event.keyCode;
	        if (keyCode == 13) {
            	onLogin()
        	}

		}
		function onVcode(){
			document.getElementById("vc_div").innerHTML = "<img width='130' height='28' src='../vCode.jpg?ram="+Math.random()+"'/>";
		}
	</script>
<style type="text/css">

#phone_validate_main{
	 margin:0 auto;width:454px;height:307px;background:url(../image/user/login_bg.png);
}

#phone_validate_main .content{
	width:230px;height:250px;margin-left:190px;float:left;
}

#phone_validate_main .content input{
	width:120px;height:20px;
}
#phone_validate_main .content span{
	font-size:13px;font-weight:600;
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
	width:150px;
}

#phone_validate_main button{
	margin-top:8px;
	margin-left:px;
	width:96px;
	height:40px;
	font-size:18px;
	text-align:center;
}

#phone_validate_main a{
	text-decoration:underline;
}

#phone_validate_main .button{
	height:50px;
	width:100px;
	float:left;
}

#phone_validate_main .button a{
	display:block;
	background:url(../image/user/login_btn_up.png) no-repeat;
	width:100px;
	height:39px;
}

#phone_validate_main .button a:hover{
	display:block;
	background:url(../image/user/login_btn_down.png) no-repeat;
	width:100px;
	height:39px;
}

</style>


</head>


<body>
	<%@ include file="/library/stateBanner.jsp"%>
	
	<div id="wrapper" style="width:454px;">

<div id="header" style="width:454px;">
        	
    <div id="logo">
        <img  title="歪麦001" height="80px" src="../image/logo.png"/>
        <img  title="歪麦001" height="80px"  style="margin-left:20px;" src="../image/slogan.png"/>
    </div>
            

</div><div class="clear"></div>
        
        <div id="s_ibody">
        	
            
       <div id="phone_validate_main">
             	
             	<div class="content">
             
               		<h3 style="margin-top:30px;"><img src="../image/user/yonghudenglu.png" width="113" height="27" alt="手机号码验证" style="margin-bottom:16px !important;"/> </h3>
                	<form action="login.do" method="post" name="login">
                	<table width="260">
                		<tr>
                			<td colspan="3"><c:if test="${mess!=null}"><div style="width:150px;padding-left:5px;border:1px solid red;color:red;font-size:12px;font-weight:600;">${mess }</div></c:if></td>
                		</tr>
             			<tr>
             				<td width="110"><span>Email/电话：</span></td>
             				<td><input type="text" name="user_login_name" id="user_login_name" value="${name}"/></td>
             			</tr>
                    	<tr>
                    		<td><span>密&nbsp;&nbsp;&nbsp;码：</span></td>
                    		<td><input type="password" name="user_password" id="user_password" value="${password}"/></td>
                    	</tr>
                		<tr>
                			<td><span>验证码：</span></td>
                			<td><input autocomplete="off" type="text" name="vcode" id="vcode" onkeypress="keyPress()"></td>
                		<tr>
                			<td>
                				<div style="height:13px;margin-top:5px;float:left;width:20px;">
                					<input type="checkbox" name="keep" value="true" style="width:20px;"/>
                				</div>
                				<span>保持登录</span>
                			</td>
                			<td>
                				<div id="vc_div" style=""><img width="130" height="28" alt="验证码" src="../vCode.jpg"/></div> 
                			</td>
                		</tr>
                		<tr>
                			<td></td><td><a style="margin-left:10px;" href="javascript:onVcode()">看不清？换一个</a></td>
                		</tr>
               		</table>
               		</form>
                <div class="button">
                	<a href="javascript:onLogin()"></a>
                </div>
                <div  style="margin-left:16px;float:left;height:50px;line-height:50px;vertical-align:bottom;color:#999;font-size:16px;">
                	<a href="register.jsp" style="color:#999;">免费注册</a>
                </div>
                    
                
                </div>
    
             
             </div>
            
            
            <div class="clear"></div>
        </div>
<div id="footer" style="width:454px;">
            
            <p class="cp">饭快快&#169;2010&nbsp;FanKK.com&nbsp;&nbsp;&nbsp;
                
            </p>
</div>

</div>
</body>
</html>
<%session.removeAttribute("mess"); %>




