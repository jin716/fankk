<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/pi.css" rel="stylesheet" type="text/css" />
<link href="css/pi_setup.css" rel="stylesheet" type="text/css" />

</head>

<body>

<div class="main" id="maindiv">
        
        <div class="h4title"><h4>我的信息<span style="font-weight: normal;"></span></h4></div>
        <div class="bcontentlist">
        <table border="0" cellpadding="0" cellspacing="0" width="500">
            <tbody>
            <tr errorclass="list_error exception">
              <th><span class="fontOrange" cp="canchangespan" 
style="display: none;">*</span>登录ID：</th>
              <td>${c_user.userLoginName}</td>              
            </tr>
            <tr errorclass="list_error exception">
              <th><span class="fontOrange" cp="canchangespan" 
style="display: none;">*</span>邮件地址：</th>
              <td>${c_user.userEmail}</td>              
            </tr>
            <tr errorclass="list_error exception">
              <th><span class="fontOrange" cp="canchangespan" 
style="display: none;">*</span>真实姓名：</th>
              <td>
              	${c_user.userLName}&nbsp;${c_user.userFName} 
              	<c:if test="${c_user.userGender == '男'}">
              		先生
              	</c:if>
              	<c:if test="${c_user.userGender == '女'}">
              		女士
              	</c:if>
              </td>              
            </tr>
            <tr>
              <th>手机号码：</th>
              <td>${c_user.userTele}
                </td>              
            </tr>
          </tbody>
          </table>
        </div>

    </div>



</body>
</html>
