<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="3;url=../index.jsp">

<title>无标题文档</title>
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/register.css" rel="stylesheet" type="text/css" />
<link href="../css/tbsp.css" rel="stylesheet" type="text/css" />



</head>


<body>

<%@ include file="../library/stateBanner.jsp"%>
<div id="wrapper">

		<%@ include file="../library/header.jsp"%>
        
        <div id="ibody">
        <div class="clear"></div>
        	
            <div id="content"><!-- 页面content内容开始 -->
                <div class="flow-steps">
                    <ol class="num3">
                        <li class="done"><span class="first">1. 填写会员信息</span></li>
                        <li class="done current-prev"><span>2. 输入校验码</span></li>
                        <li class="last current"><strong>3. 注册成功</strong></li>
                    </ol>
                </div>
            
                <div class="msg24">
                    <p class="ok">
                        恭喜${c_user.userLoginName}，注册成功！<br>
                    </p>
                </div>
    	    </div>
	


        </div>
		<%@ include file="../library/footer.jsp"%>
        </div>
    


</body>
</html>

