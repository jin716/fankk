<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="nl.captcha.Captcha"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>给饭快快建议--饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/paipai_search.css" rel="stylesheet" type="text/css" />
<link href="../css/register.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.reg-form li.field {
border:none;
height:46px;
padding:8px 14px 4px;
}


.recommend{
	font-size:16px;font-weight:400;
	color:#666;
}

.recommend ul{
	margin:0px 16px;
}

.recommend li{
	background:url(../image/redtriangle2.png) no-repeat 0 8px;
	margin-bottom:8px;
}

.recommend .highlight_li{
	background:url(../image/redtriangle2.png) no-repeat 0 17px;
	margin-bottom:8px;
	
}


.recommend span{
	margin-left:16px;
}

.recommend span .highlight_span{
	color:#FF090F;font-size:24px;font-weight:bold;margin:0;
}

#submit_div{background:transparent url(../image/register/ic_bg.png) no-repeat scroll 500px 500px;background-position:0 -114px;border:0 none;cursor:pointer;font-size:14px;font-weight:700;height:35px;line-height:35px;margin-right:13px;width:222px;text-align:center;

}
#submit_div a{
	text-decoration:none;color:#000;text-decoration:none;color:#000;display:block;height:35px;width:222px;
}

#submit_div.disabled{background-position:0 -186px;cursor:not-allowed;}
#submit_div.disabled a{
	color:#666;cursor:not-allowed;
}

.reg-form li.field textarea{width:196px;height:100px;margin:0 5px;padding:2px;border:1px solid #a7a6aa;font-size:14px;overflow:hidden;}
.reg-form li.field textarea{background:white url(../image/register/input.gif) no-repeat scroll 0 0;}
</style>

<script type="text/javascript">
	function onAdvise(){
		var content = document.getElementById("adviseContent").value;
		if(content==""){
			alert("请提交您的建议。");
			return;
		}
		document.advise_form.submit();
	}
</script>
</head>


<body>
<%@ include file="../../library/stateBanner.jsp"%>
<div id="wrapper">
<%@ include file="../../library/header.jsp"%>  
  <div id="ibody">


    <%@ include file="../../library/main_nav.jsp"%>

    <div style="width:100px;height:100px;float:left;"></div>
    <div id="join_us" style="width:350px;float:left">
    <div class="reg-form">
	<form method="post" action="../advise.do" name="advise_form" id="advise_form" onsubmit="return false;">
		
		<ul>
			<li class="field" id="">
				<div class="input">
					<label>您的称呼：</label><input id="adviseName" name="adviseName" class="J_Field" tabindex="1" type="text">
				</div>
			</li>	
            <li class="field" id="" style="height:126px;">
				<div class="input">
					<label>您的建议：</label><textarea id="adviseContent" name="adviseContent" class="J_Field" tabindex="2"></textarea>
				</div>
			</li>			

		  <li class="submit-field">
				<div class="input">
                    <div id="submit_div" class=""><a href="javascript:void(0)" onclick="onAdvise()">提交我的建议</a></div>
				</div>
			</li>
		</ul>
	</form>
	</div>
    </div>
    
    <div style="float:left;margin:8px 0px;width:428px;height:auto;border:#d4E8fc solid 1px;background-color:#f4fcf3;__position:fixed;__padding:0px;__margin-top:-220px;__margin-left:230px;">
    	<div style="margin:8px 16px 0px 0px;">
        	<span style="margin:16px 16px;font-size:16px;font-weight:bold;color:#333;">饭快快非常开能心得到您的建议：</span>
        </div>
    	<div class="recommend" >
    	<ul>
        	<br style="height:2px;line-height:10px;"/>
        	<li class="" style="">
            	<span>在您的支持下，我们将做的更好！</span>
            </li>
            <li>
            	<span>希望您继续支持饭快快！</span>
            </li>
        </ul>
        </div>
    </div>

    <%@ include file="../../library/footer.jsp"%>
    </div>
</div>

  

</body>
</html>
