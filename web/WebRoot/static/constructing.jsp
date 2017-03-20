<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = null;
if(request.getServerPort()==80){
	basePath = request.getScheme()+"://"+request.getServerName()+path+"/";
}
else {
	basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线">
<link href="<%=basePath%>css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/taobao_nav.css" rel="stylesheet" type="text/css" />

<style type="text/css">

#phone_validate_main{
	 margin:0 auto;width:454px;height:277px;background:url(<%=basePath%>image/constructing.png);padding-top:30px
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
	background:url(<%=basePath%>image/user/login_btn_up.png) no-repeat;
	width:100px;
	height:39px;
}

#phone_validate_main .button a:hover{
	display:block;
	background:url(<%=basePath%>image/user/login_btn_down.png) no-repeat;
	width:100px;
	height:39px;
}

</style>


</head>


<body>
	<div id="wrapper" style="width:454px;">

<div id="header" style="width:454px;">
        	
    <div id="logo">
        <img  title="歪麦001" height="80px" src="<%=basePath%>image/logo.png"/>
        <img  title="歪麦001" height="80px"  style="margin-left:20px;" src="<%=basePath%>image/slogan.png"/>
    </div>
            

</div><div class="clear"></div>
        
        <div id="s_ibody">
        	
            
       		<div id="phone_validate_main">
            
            <div style="float:left;margin-top:150px;margin-left:260px;">
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
