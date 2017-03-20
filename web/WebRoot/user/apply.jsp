<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>加盟饭快快，让你的外卖生意红红火火--饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/paipai_search.css" rel="stylesheet" type="text/css" />
<link href="../css/register.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
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

.reg-form li.field textarea{width:196px;height:60px;margin:0 5px;padding:2px;border:1px solid #a7a6aa;font-size:14px;overflow:hidden;}
.reg-form li.field textarea{background:white url(image/register/input.gif) no-repeat scroll 0 0;}

</style>
<script type="text/javascript">
		function onApply(){
			var name = document.getElementById("name").value;
			var telephone = document.getElementById("telephone").value;
			var address = document.getElementById("address").value;
			var storeName = document.getElementById("storeName").value;
			//var message = document.getElementById("message").value;
			if(name==""||telephone==""||address==""||storeName==""){
				alert("请输入完整的信息。");
				return ;
			}
			document.apply_form.submit();
		} 	
</script>

</head>


<body>

<%@ include file="../library/stateBanner.jsp"%>

<div id="wrapper">

  <%@ include file="../library/header.jsp"%>
  
  <div id="ibody">

	<%@ include file="../library/main_nav_join.jsp"%>

    <div style="width:100px;height:100px;float:left;"></div>
    <div id="join_us" style="width:350px;float:left">
    <div class="reg-form">
	<form method="post" action="apply.do" name="apply_form" onsubmit="return false;">
		
		<ul>
			<li class="field" id="J_PhoneField">
				<div class="input" >
					<label>您的姓名：</label><input name="name" id="name" class="J_Field" tabindex="1" type="text">
				</div>
			</li>	
            <li class="field" id="J_PhoneField">
				<div class="input">
					<label>店铺名称：</label><input  name="storeName" id="storeName" class="J_Field" tabindex="1" type="text">
				</div>
			</li>	
            <li class="field">
				<div class="input">
					<label>联系电话：</label><input  name="telephone" id="telephone" class="J_Field" tabindex="1" type="text">
				</div>
			</li>	
            <li class="field" id="J_PhoneField">
				<div class="input">
					<label>详细地址：</label><input id="address" name="address" class="J_Field" tabindex="1" type="text">
				</div>
			</li>	
            <li class="field" id="J_PhoneField" style="height:86px;">
				<div class="input">
					<label>其他留言：</label><textarea id="message" name="message"  id="" name="" class="J_Field" tabindex="1"></textarea>
				</div>
			</li>			

		  <li class="submit-field" style="margin-top:30px;">
		  		<div class="input" >
					<html:errors property="error"/>
				</div>
				<div class="input"style="margin-top:10px;">
				<button id="apply_btn" onclick="onApply()">提交我的加盟信息</button>
				</div>
			</li>
		</ul>
	</form>
	</div>
    </div>
    
    <div style="float:left;margin:8px 0px;width:428px;height:auto;border:#d4E8fc solid 1px;background-color:#f4fcf3;__position:fixed;__padding:0px;__margin-top:-320px;__margin-left:230px;">
    	<div style="margin:8px 16px 0px 0px;">
        	<span style="margin:16px 16px;font-size:16px;font-weight:bold;color:#333;">在饭快快开店，您可获得以下好处：</span>
        </div>
    	<div class="recommend" >
    	<ul>
        	<li class="highlight_li" style="">
            	<span>加盟<span class="highlight_span">零</span>风险，无需前期投入和广告推广费用</span>
            </li>
            <li>
            	<span>拥有便捷的网上展示平台，接收来自网络的外卖订单</span>
            </li>
            <li>
            	<span>网络订餐系统的电子信息化处理，避免人工差错</span>
            </li>
            <li>
            	<span>强大的后台信息管理系统，帮助商家建立客户资料库</span>
            </li>
            <li>
            	<span>提供经营分析报表，帮助商家有效应对餐饮市场变化</span>
            </li>

        </ul>
        </div>
    </div>

    <%@ include file="../library/footer.jsp"%>
	</div>
</div>

  

</body>
</html>
