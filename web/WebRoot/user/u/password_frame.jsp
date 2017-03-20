<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/pi.css" rel="stylesheet" type="text/css" />
<link href="css/pi_setup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/tools.js"></script>
<script type="text/javascript">
		function onVcode(){
			document.getElementById("vc_div").innerHTML = "<img src='../../vCode.jpg?ram="+Math.random()+"'/>";
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

<div class="main" id="maindiv">
        
        <div class="h4title"><h4>我的信息<span style="font-weight: normal;"></span></h4></div>
        <div class="bcontentlist">
        <form name="pass" action="password.do" method="post">
	    <table border="0" cellpadding="0" cellspacing="0" width="500">
            <tbody>
            <tr errorclass="list_error exception">
              <th>旧密码:</th>
              <td><input type="password" name="old_p" id="old_p"/></td>              
            </tr>
            <tr errorclass="list_error exception">
              <th>新密码:</th>
              <td><input type="password" name="new_p" id="new_p"/></td>              
            </tr>
			<tr errorclass="list_error exception">
              <th>新密码确认:</th>
              <td><input type="password" name="new_2" id="new_2"/></td>              
            </tr>
            <tr errorclass="list_error exception">
              <th>验证码:</th>
              <td><input type="text" name="vcode" id="vcode"/></td>    
              <td><a href="javascript:onVcode()"><div id="vc_div"><img src="../../vCode.jpg"/></div>看不清，换一个</a></td>              
            </tr>
	    	<tr>
	    		<td></td><td><input type="button" onclick="onChange()" value="修改"/></td>
	    	</tr>
	    </table>
         </form>
  
        </div>

    </div>



</body>
</html>
