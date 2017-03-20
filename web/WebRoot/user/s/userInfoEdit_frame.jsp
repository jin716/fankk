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
        <form action="userInfoSubmit.do" method="post">
        <table border="0" cellpadding="0" cellspacing="0" width="500">
            <tbody>
            <tr errorclass="list_error exception">
              <th>姓:</th>
              <td><input type="text" name="userLName" value="${c_user.userLName}"/></td>              
              <th>名：</th>
              <td><input type="text" name="userFName" value="${c_user.userFName}"/></td>              
            </tr>
             <tr errorclass="list_error exception">
              <th></th>
              <td><input type="submit"value="提交"/></td>              
            </tr>
          </tbody>
          </table>
         </form>
  
        </div>

    </div>



</body>
</html>
