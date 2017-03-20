<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
String akey = request.getParameter("key"); 
if(akey!=null&&
   akey.trim().length()!=0)session.setAttribute("key",akey);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>饭快快用户注册--饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/register.css" rel="stylesheet" type="text/css" />
<link href="../css/tbsp.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.js"></script>
<script src="../js/tbra-widgets.js"></script>

<script type="text/javascript" src="../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../js/selector-min.js"></script>
<script type="text/javascript" src="../js/event-delegate-min.js"></script>
<script type="text/javascript" src="../js/yui-min.js"></script>
<script type="text/javascript" src="../js/yui-later.js"></script>
</head>
<script type="text/javascript">

jQuery.ajaxSetup({async:false});

		function onRegister(){
			if(document.getElementById("J_SubmitBtn").disabled) return false;
			var vcode = document.getElementById("J_Code").value;
			jQuery.get("checkVcode.do",{vcode:vcode},
				function(date){
					if(date == "true"){
						return true;
					}			
					else{
						onVcode();
						alert("验证码错误,请重新输入！");
						return fasle;
					}
			});
		}
		
		function onRegSubmit(){
			if(document.getElementById("J_SubmitBtn").disabled) return;
			var vcode = document.getElementById("J_Code").value;
			var date="";
			date=jQuery.ajax({
			   async:false,
			   type: "GET",
			   url: "checkVcode.do",
			   data: "vcode="+vcode
			}).responseText; 
			
			if(date == "true"){
				document.toRegister.submit();
				
			}			
			else{
				onVcode();
				alert("验证码错误,请重新输入！");
			}
		}
		
		function onVcode(){
			document.getElementById("vc_div").innerHTML = "<img width='130' src='../vCode.jpg?ram="+Math.random()+"'/>";
		}

(function() {
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;		

	function changeClass(){
		if (Dom.hasClass("J_SubmitBtn","disabled")){
			if (!Dom.hasClass("submit_div","disabled")){
				Dom.addClass("submit_div","disabled");
				document.getElementById("submit_div").innerHTML="<a href='javascript:onRegSubmit()'>同意以下协议，提交注册</a>";
			}
		}
		else{
			if (Dom.hasClass("submit_div","disabled")){
				Dom.removeClass("submit_div","disabled");
				document.getElementById("submit_div").innerHTML="<a href='javascript:onRegSubmit()'>同意以下协议，提交注册</a>";//###
			}
		}

	}
	
	var onLoad = function(){
		 YAHOO.lang.later(40,"submit_div",changeClass,1,true);
	}
	
	window.onload=function(){   
		onLoad();
	};     
	
})();

</script>



<style type="text/css">
#submit_div{background:transparent url(../image/register/ic_bg.png) no-repeat scroll 500px 500px;background-position:0 -114px;border:0 none;cursor:pointer;font-size:14px;font-weight:700;height:35px;line-height:35px;margin-right:13px;width:222px;text-align:center;

}
#submit_div a{
	text-decoration:none;color:#000;text-decoration:none;color:#000;display:block;height:35px;width:222px;
}

#submit_div.disabled{background-position:0 -186px;cursor:not-allowed;}
#submit_div.disabled a{
	color:#666;cursor:not-allowed;
}
</style>

<body>
<input type="hidden" id="tempInput"/>

<%@ include file="../library/stateBanner.jsp"%>
	<div id="wrapper">
		<%@ include file="../library/header.jsp"%>
        
        <div id="ibody">
        	
<div id="content"><!-- 页面content内容开始 -->

<div class="flow-steps">
	<ol class="num3">
		<li class="current"><strong class="first">1. 填写会员信息</strong></li>
		<li><span>2. 输入校验码</span></li>
		<li class="last"><span>3. 注册成功</span></li>
	</ol>
</div>

<div class="reg-form">
  	<form action="register.do" name="toRegister" method="post" onsubmit="return false">
  	<c:if test="${key != null}"><input type="hidden" name="key" value="${key}"/></c:if>
		<ul>
			<li class="field" id="J_PhoneField">
				<div class="input">
					<label>手机号码：</label>
					<input maxlength="11" value="${c_user.userTele}" id="J_Phone"  name="userTele" name="userTele" class="J_Field" tabindex="1" type="text">
				</div>
				<div class="msg show-attention" id="J_Phone_msg">
					<p class="attention">请输入11位手机号码</p>
					<p class="error"  id="J_Phone_msg_error">
						
				  </p>
					<p class="ok naked">&nbsp;</p>
					<p class="tips">该手机已注册过支付宝。完成本次注册后，请您手动绑定饭快快和支付宝账号</p>
				</div>
			</li>			
			
			<li id="J_EmailField" class="field">
				<div class="input">
					<label>电子邮箱：</label><input value="${c_user.userEmail}" class="J_Field" name="userEmail" id="userEmail" tabindex="2" type="text">
				</div>
				<div class="msg show-attention"  id="J_Email_msg">
					<p class="attention">请输入您常用的邮箱，方便日后找回密码。<br>没有电子邮箱？推荐使用 <a 
href="http://mail.cn.yahoo.com/" id="J_YahooRegTrigger" target="_blank">雅虎邮箱</a>、<a href="http://reg.email.163.com/mailregAll/reg0.jsp" target="_blank">网易邮箱</a>。</p>
					<p class="error" id="J_Email_msg_error">
						
				  </p>
					<p class="ok naked">&nbsp;</p>
				</div>
			</li>
			
			
			<li class="field" id="J_UserNameField">
				<div class="input">
					<label>昵称：</label>
					<input value="${c_user.userLoginName}" id="userName"  name="userName" class="J_Field" tabindex="3" type="text">
					<div class="tools">
						<div style="display: none;" class="J_CharCounter"><span class="num"></span>个字符</div>
					</div>
				</div>
				<div class="msg" id="J_Username_msg">
					<p class="attention">4-20个字符，一个汉字为两个字符，推荐使用中文名。</p>
					<p class="error" id="J_Username_msg_error">
						
				  </p>
					<p class="ok naked">&nbsp;</p>
				</div>
			</li>
			<li class="extra" id="another-name">
				<div class="extra-content clearfix">
					<h4>推荐你使用：</h4>
					<ul></ul>
				</div>
			</li>
			<li class="field" id="J_PasswordField">
				<div class="input">
					<label>登录密码：</label><input value="${c_user.userPassword}" maxlength="16" id="J_Password" name="userPassword" class="J_Field" tabindex="4" type="password">
					<div class="tools">
						<div style="display: none;" id="J_PasswordStatus">
							<span class="trigger" id="J_StatusTipTrigger">密码强度：</span>
							<span class="status-bar"><span style="width: 20%;"> </span></span>
							<span class="status-result"></span>
							<input class="J_ResultValue"  id="userPassword" name="userPassword" value="" type="hidden"> 
						</div>
						<div style="display: none;" class="status-tip" id="J_StatusTip">
							<span>要想使你的密码更安全，可采取如下方法：</span>
							<ul>
								<li>- 使用字母和数字组合</li>
								<li>- 使用特殊字符（如@）</li>
								<li>- 混合使用大小写</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="msg show-attention">
					<p class="attention">6-16个字符，请使用字母加数字或符号的组合密码，不能单独使用字母、数字或符号。<b></b></p>
					<p class="error">
						
				  </p>
					<p class="ok naked">&nbsp;</p>
				</div>
			</li>
			<li class="field" id="J_RePasswordField">
				<div class="input">
					<label>确认密码：</label>
					<input value="${c_user.userPassword}" maxlength="16" id="J_RePassword"  name="userPasswrodAgain" class="J_Field" tabindex="5" type="password">
				</div>
				<div class="msg show-attention">
					<p class="attention">请再次输入密码。</p>
					<p class="error">
						
				  </p>
					<p class="ok naked">&nbsp;</p>
				</div>
			</li>
			<li class="field code-field" id="J_CodeField">
				<div class="input">
					
					<label>验证码：</label>
					<div style="float:left"><input class="J_Field code-input" maxlength="6" name="vcode" id="J_Code" tabindex="6" type="text"></div>
 					<div style="float:left" id="vc_div"><img width="130" src="../vCode.jpg"/></div>
 					<!-- <img id="J_CheckCode" class="code-img" src="../image/register/untitled.bmp" align="absmiddle"> -->
					<span><a href="javascript:onVcode()">换一个</a></span>
				</div>					
			</li>
			<!-- <li class="alipay-field">
				<div class="input">
								<input id="create-alipay" value="yes" name="_fmm.re._0.r" checked="checked" type="checkbox">
										<label for="create-alipay">用该手机创建支付宝账户</label>
				</div>
			</li>
			 -->
			</form>
			 
			<li class="submit-field">
				

				<div class="input">
					<button disabled="disabled" class="disabled" id="J_SubmitBtn"
 type="hidden" style="display:none;">同意以下协议，提交注册</button>
 					
 					<div id="submit_div" class="disabled"><a href="javascript:void(0)">同意以下协议，提交注册</a></div>
				</div>
			</li>
		</ul>
</div>

<div class="agreements">
	<ul>
		<li>
			<h3>饭快快网服务协议</h3>
			<div class="content">

<p><strong>一、本服务协议双方为广东饭快快网络有限公司（下称“饭快快”）与饭快快网用户，本服务协议具有合同效力。</strong></p>
<p>本服务协议内容包括协议正文及所有饭快快已经发布的或将来可能发布的各类规则。所有规则为协议不可分割的一部分，与协议正文具有同等法律效力。 <br>

	
　　在本服务协议中没有以“规则”字样表示的链接文字所指示的文件不属于本服务协议的组成部分，而是其它内容的协议或有关参考数据，与本协议没有法律上的
直接关系。 <br>
	
　　用户在使用饭快快提供的各项服务的同时，承诺接受并遵守各项相关规则的规定。饭快快有权根据需要不时地制定、修改本协议或各类规则，如本协议有任何变更，
饭快快将在网站上刊载公告，通知予用户。如用户不同意相关变更，必须停止使用“服务”。经修订的协议一经在饭快快网公布后，立即自动生效。各类规则会在发布后
生效，亦成为本协议的一部分。登录或继续使用“服务”将表示用户接受经修订的协议。除另行明确声明外，任何使“服务”范围扩大或功能增强的新内容均受本协
议约束。 <br>
	　　用户确认本服务协议后，本服务协议即在用户和饭快快之间产生法律效力。请用户务必在注册之前认真阅读全部服务协议内容，如有任何疑问，可向饭快快咨询。
 
1)无论用户事实上是否在注册之前认真阅读了本服务协议，只要用户点击协议正本下方的“确认”按钮并按照饭快快注册程序成功注册为用户，用户的行为仍然表示
其同意并签署了本服务协议。 2)本协议不涉及用户与饭快快其它用户之间因网上交易而产生的法律关系及法律纠纷。 <br>
<br></p>
 <p><strong>二、 定义</strong></p>
<p>饭快快网上交易平台：有关饭快快网上交易平台上的术语或图示的含义，详见饭快快帮助。 <br>
	
　　用户及用户注册：用户必须是具备完全民事行为能力的自然人，或者是具有合法经营资格的实体组织。无民事行为能力人、限制民事行为能力人以及无经营或特
定经营资格的组织不当注册为饭快快用户或超过其民事权利或行为能力范围从事交易的，其与饭快快之间的服务协议自始无效，饭快快一经发现，有权立即注销该用户，并
追究其使用饭快快网“服务”的一切法律责任。用户注册是指用户登陆饭快快网，并按要求填写相关信息并确认同意履行相关用户协议的过程。用户因进行交易、获取有
偿服务或接触饭快快网服务器而发生的所有应纳税赋，以及一切硬件、软件、服务及其它方面的费用均由用户负责支付。饭快快网站仅作为交易地点。饭快快仅作为用户物
色交易对象，就货物和服务的交易进行协商，以及获取各类与贸易相关的服务的地点。饭快快不能控制交易所涉及的物品的质量、安全或合法性，商贸信息的真实性或
准确性，以及交易方履行其在贸易协议项下的各项义务的能力。饭快快并不作为买家或是卖家的身份参与买卖行为的本身。饭快快提醒用户应该通过自己的谨慎判断确定
登录物品及相关信息的真实性、合法性和有效性。 <br>

<br></p>
 <p><strong>三、 用户权利和义务：</strong></p>
<p>用户有权利拥有自己在饭快快网的用户名及交易密码，并有权利使用自己的用户名及 
密码随时登陆饭快快网交易平台。用户不得以任何形式擅自转让或授权他人使用自己的饭快快网用户名； <br>
	
　　用户有权根据本服务协议的规定以及饭快快网上发布的相关规则利用饭快快网上交易平台查询物品信息、发布交易信息、登录物品、参加网上物品竞买、与其它用户
订立物品买卖合同、评价其它用户的信用、参加饭快快的有关活动以及有权享受饭快快提供的其它的有关信息服务； <br>
	
　　用户在饭快快网上交易过程中如与其他用户因交易产生纠纷，可以请求饭快快从中予以协调。用户如发现其他用户有违法或违反本服务协议的行为，可以向饭快快进行
反映要求处理。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求饭快快提供相关资料； <br>
	
　　用户有义务在注册时提供自己的真实资料，并保证诸如电子邮件地址、联系电话、联系地址、邮政编码等内容的有效性及安全性，保证饭快快及其他用户可以通过
上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。用户保证不以他人资料在饭快快网进行注册或认证； <br>
	
　　用户应当保证在使用饭快快网网上交易平台进行交易过程中遵守诚实信用的原则，不在交易过程中采取不正当竞争行为，不扰乱网上交易的正常秩序，不从事与网
上交易无关的行为； <br>

	　　用户不应在饭快快网网上交易平台上恶意评价其他用户，或采取不正当手段提高自身的信用度或降低其他用户的信用度； <br>
	　　用户在饭快快网网上交易平台上不得发布各类违法或违规信息； <br>
	
　　用户在饭快快网网上交易平台上不得买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其它合法权益的物品，也不得买卖违背社会公共利益或
公共道德的、或是饭快快认为不适合在饭快快网上销售的物品。具体内容详见《禁止和限制销售物品规则》； <br>
	
　　用户承诺自己在使用饭快快网时实施的所有行为均遵守国家法律、法规和饭快快的相关规定以及各种社会公共利益或公共道德。如有违反导致任何法律后果的发生，
用户将以自己的名义独立承担所有相应的法律责任； <br>
	　　用户同意，不对饭快快网上任何数据作商业性利用，包括但不限于在未经饭快快事先书面批准的情况下，以复制、传播等方式使用在饭快快网站上展示的任何资料。<br>
<br></p>
 <p><strong>四、饭快快的权利和义务：</strong></p>

<p>饭快快有义务在现有技术上维护整个网上交易平台的正常运行，并努力提升和改进技术，使用户网上交易活动得以顺利进行； <br>
	　　对用户在注册使用饭快快网上交易平台中所遇到的与交易或注册有关的问题及反映的情况，饭快快应及时作出回复； <br>
	
　　对于用户在饭快快网网上交易平台上的不当行为或其它任何饭快快认为应当终止服务的情况，饭快快有权随时作出删除相关信息、终止服务提供等处理，而无须征得用
户的同意； <br>
	　　因网上交易平台的特殊性，饭快快没有义务对所有用户的注册数据、所有的交易行为以及与交易有关的其它事项进行事先审查，但如存在下列情况： <br></p>
<p>①用户或其它第三方通知饭快快，认为某个具体用户或具体交易事项可能存在重大问题；</p>
<p>②用户或其它第三方向饭快快告知交易平台上有违法或不当行为的，饭快快以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行
为具有违法或不当性质的；</p>
<p>饭快快有权根据不同情况选择保留或删除相关信息或继续、停止对该用户提供服务，并追究相关法律责任。</p>

<p>用户在饭快快网上交易过程中如与其它用户因交易产生纠纷，请求饭快快从中予以调处，经饭快快审核后，饭快快有权通过电子邮件联系向纠纷双方了解情况，并将所
了解的情况通过电子邮件互相通知对方； <br>
	　　用户因在饭快快网上交易与其它用户产生诉讼的，用户通过司法部门或行政部门依照法定程序要求饭快快提供相关数据，饭快快应积极配合并提供有关资料； <br>
	
　　饭快快有权对用户的注册数据及交易行为进行查阅，发现注册数据或交易行为中存在任何问题或怀疑，均有权向用户发出询问及要求改正的通知或者直接作出删除
等处理； <br>
	
　　经国家生效法律文书或行政处罚决定确认用户存在违法行为，或者饭快快有足够事实依据可以认定用户存在违法或违反服务协议行为的，饭快快有权在饭快快交易平台
及所在网站上以网络发布形式公布用户的违法行为； <br>
	
　　对于用户在饭快快交易平台发布的下列各类信息，饭快快有权在不通知用户的前提下进行删除或采取其它限制性措施，包括但不限于以规避费用为目的的信息；以炒
作信用为目的的信息；饭快快有理由相信存在欺诈等恶意或虚假内容的信息；饭快快有理由相信与网上交易无关或不是以交易为目的的信息；饭快快有理由相信存在恶意竞
价或其它试图扰乱正常交易秩序因素的信息；饭快快有理由相信该信息违反公共利益或可能严重损害饭快快和其它用户合法利益的； <br>
	　　许可使用权。 用户以此授予饭快快及其关联公司独家的、全球通用的、永久的、免费的许可使用权利 
(并有权在多个层面对该权利进行再授权)，使饭快快及其关联公司有权(全部或部份地) 
使用、复制、修订、改写、发布、翻译、分发、执行和展示用户的全部资料数据（包括但不限于注册资料、交易行为数据及全部展示于网站的各类信息）或制作其派
生作品，和/或以现在已知或日后开发的任何形式、媒体或技术，将上述信息纳入其它作品内； <br>

	　　饭快快会在用户的计算机上设定或取用饭快快cookies。 饭快快允许那些在饭快快网页上发布广告的公司到用户计算机上设定或取用 cookies 。 
在用户登录时获取数据，饭快快使用cookies可为用户用户提供个性化服务。 如果拒绝所有 
cookies，用户将不能使用需要登录的饭快快产品及服务内容。 <br>
	　　用户完成饭快快网注册后，将会获得一个支付宝账户。 <br></p>
 <p><strong>五、服务的中断和终止：</strong></p>
<p>用户同意，在饭快快未向用户收取服务费的情况下，饭快快可自行全权决定以任何理由 
(包括但不限于饭快快认为用户已违反本协议的字面意义和精神，或以不符合本协议的字面意义和精神的方式行事，或用户在超过90天的时间内未以用户的账号及密
码登录网站等) 终止用户的“服务”密码、账户 (或其任何部份) 
或用户对“服务”的使用，并删除（不再保存）用户在使用“服务”中提交的任何资料。同时饭快快可自行全权决定，在发出通知或不发出通知的情况下，随时停止提
供“服务”或其任何部份。账号终止后，饭快快没有义务为用户保留原账号中或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户或第三方。此外，用户
同意，饭快快不就终止用户接入“服务”而对用户或任何第三者承担任何责任； <br>
	
　　如用户向饭快快提出注销饭快快网注册用户身份时，经饭快快审核同意，由饭快快注销该注册用户，用户即解除与饭快快的服务协议关系。但注销该用户账号后，饭快快仍保
留下列权利： <br></p>
<p>①用户注销后，饭快快有权保留该用户的注册数据及以前的交易行为记录。</p>
<p>②用户注销后，如用户在注销前在饭快快交易平台上存在违法行为或违反合同的行为，饭快快仍可行使本服务协议所规定的权利；</p>

<p>在下列情况下，饭快快可以通过注销用户的方式终止服务： <br></p>
<p>①在用户违反本服务协议相关规定时，饭快快有权终止向该用户提供服务。饭快快将在中断服务时通知用户。但如该用户在被饭快快终止提供服务后，再一次直接或
间接或以他人名义注册为饭快快用户的，饭快快有权再次单方面终止向该用户提供服务；</p>
<p>②如饭快快通过用户提供的信息与用户联系时，发现用户在注册时填写的电子邮箱已不存在或无法接收电子邮件的，经饭快快以其它联系方式通知用户更改，而用
户在三个工作日内仍未能提供新的电子邮箱地址的，饭快快有权终止向该用户提供服务；</p>
<p>③一旦饭快快发现用户注册数据中主要内容是虚假的，饭快快有权随时终止向该用户提供服务；</p>
<p>④本服务协议终止或更新时，用户明示不愿接受新的服务协议的；</p>
<p>⑤其它饭快快认为需终止服务的情况。</p>
<p>服务中断、终止之前用户交易行为的处理因用户违反法律法规或者违反服务协议规定而致使饭快快中断、终止对用户服务的，对于服务中断、终止之前用户交易
行为依下列原则处理： <br>
</p><p>①服务中断、终止之前，用户已经上传至饭快快网的物品尚未交易或尚未交易完成的，饭快快有权在中断、终止服务的同时删除此项物品的相关信息；</p>
<p>②服务中断、终止之前，用户已经就其它用户出售的具体物品作出要约，但交易尚未结束，饭快快有权在中断或终止服务的同时删除该用户的相关要约；</p>

<p>③服务中断、终止之前，用户已经与另一用户就具体交易达成一致，饭快快可以不删除该项交易，但饭快快有权在中断、终止服务的同时将用户被中断或终止服务
的情况通知用户的交易对方。 </p>
<p> <br>
</p><p><strong>六、责任范围：</strong></p>
<p>用户明确理解和同意，饭快快不对因下述任一情况而导致的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其它无形损失的损害
赔偿 (无论饭快快是否已被告知该等损害赔偿的可能性)： <br>
	　　使用或未能使用“服务；</p>
<p>第三方未经批准的接入或第三方更改用户的传输数据或数据；</p>
<p>第三方对“服务”的声明或关于“服务”的行为；或非因饭快快的原因而引起的与“服务”有关的任何其它事宜，包括疏忽。</p>
<p>用户明确理解并同意，如因其违反有关法律或者本协议之规定，使饭快快遭受任何损失，受到任何第三方的索赔，或任何行政管理部门的处罚，用户应对饭快快提
供补偿，包括合理的律师费用。 <br></p>

 <p><strong>七、隐私权政策：</strong></p>
<p>适用范围： </p>
<p>①在用户注册饭快快账户或者支付宝账户时，用户根据饭快快要求提供的个人注册信息；</p>
<p>②在用户使用饭快快服务，参加饭快快活动，或访问饭快快网页时，饭快快自动接收并记录的用户浏览器上的服务器数值，包括但不限于IP地址等数据及用户要求取
用的网页记录；</p>
<p>③饭快快收集到的用户在饭快快进行交易的有关数据，包括但不限于出价、购买、物品登录、信用评价及违规记录；</p>
<p>④饭快快通过合法途径从商业伙伴处取得的用户个人数据。</p>
<p>信息使用： </p>
 <p>①饭快快不会向任何人出售或出借用户的个人信息，除非事先得到用户得许可。</p>

<p>②饭快快亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播用户的个人信息。任何用户如从事上述活动，一经发现，饭快快有权立即终止与该用户的
服务协议，查封其账号。 </p>
<p>③为服务用户的目的，饭快快可能通过使用用户的个人信息，向用户提供服务，包括但不限于向用户发出产品和服务信息，或者与饭快快合作伙伴共享信息以便他
们向用户发送有关其产品和服务的信息（后者需要用户的事先同意）。</p>
<p>信息披露：</p>
 <p>用户的个人信息将在下述情况下部分或全部被披露：</p>
<p>①经用户同意，向第三方披露； </p>
<p>②如用户是合资格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；</p>
<p>③根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露；</p>
<p>④如果用户出现违反中国有关法律或者网站政策的情况，需要向第三方披露；</p>

<p>⑤为提供你所要求的产品和服务，而必须和第三方分享用户的个人信息；</p>
<p>⑥其它饭快快根据法律或者网站政策认为合适的披露；</p>
<p>⑦在饭快快网上创建的某一交易中，如交易任何一方履行或部分履行了交易义务并提出信息披露请求的， 
饭快快有全权可以决定向该用户提供其交易对方的联络方式等必要信息，以促成交易的完成或纠纷的解决。</p>
<p>信息安全： </p>
 <p>①饭快快及支付宝账户均有安全保护功能，请妥善保管用户的账户及密码信息； </p>
<p>②在使用饭快快服务进行网上交易时，用户不可避免的要向交易对方或潜在的交易对方提供自己的个人信息，如联络方式或者邮政地址。请用户妥善保护自己的
个人信息，仅在必要的情形下向他人提供；</p>
<p>③如果用户发现自己的个人信息泄密，尤其是饭快快账户或支付宝账户及密码发生泄露，请用户立即联络饭快快客服，以便饭快快采取相应措施。</p>
<p>Cookie的使用： </p>

<p>①通过饭快快所设Cookie所取得的有关信息，将适用本政策；</p>
<p>②在饭快快上发布广告的公司通过广告在用户计算机上设定的Cookies，将按其自己的隐私权政策使用。</p>
<p>编辑和删除个人信息的权限： 用户可以点击我的饭快快对用户的个人信息进行编辑和删除，除非饭快快另有规定。 <br>
</p><p>政策修改：饭快快保留对本政策作出不时修改的权利。 </p>
<p>管辖：</p>
<p>本服务条款之解释与适用，以及与本服务条款有关的争议，均应依照中华人民共和国法律予以处理，并以广东省广州市天河区人民法院为第一审管辖法院。</p>

			</div>
		</li>
		
	</ul>
</div>

<script type="text/javascript" src="../js/register.js"></script>

<script type="text/javascript">
	TB.app.reg.CONSTANTS = {
		ERROR_MISS_NICK_NAME: "请填写昵称",
		ERROR_MISS_PASSWORD: "请填写密码",
		ERROR_MISS_PASSWORD_CONFIRM: "请重新填写一遍密码",
		ERROR_MALFORM_NICK_NAME_TOO_SHORT: "昵称在4-20个字符内",
		ERROR_MALFORM_NICK_NAME_TOO_LONG: "昵称在4-20个字符内",
		ERROR_DUP_NICK_NAME: "该昵称已被使用。请重新输昵称",
		ERROR_MALFORM_PASSWORD: "密码格式不正确，不能单独使用字母、数字或符号",
		ERROR_PASSWORD_NOT_MATCH: "密码不匹配",
		ERROR_MALFORM_PASSWORD_TOO_SHORT: "密码太短，建议您的密码大于6个字符",
		ERROR_MALFORM_PASSWORD_TOO_LONG: "密码太长，建议您的密码小于16个字符",
		ERROR_MALFORM_MOBILE: "该手机号码不存在",
		ERROR_CELLPHONE_EXISTED: "该手机号码已注册，请换用其他手机号码注册或用该手机号码<a href='login.jsp' target='_blank'>登录</a>",
		ERROR_UNDERLINE: "昵称首位和末位不能是下划线&#039;_&#039;",
		ERROR_MALFORM_NICK_NAME: "昵称不能全为数字，或包含非法字符",
		ERROR_PASSWORD_LIKE_NICK: "您的登录密码与昵称过于相似，为了您的安全建议您更换密码",
		ERROR_MISS_EMAIL: "请输入电子邮箱",
		ERROR_MALFORM_EMAIL: "请输入正确格式的电子邮箱，如：yourname@163.com",
		ERROR_MALFORM_EMAIL_TOO_SHORT: "邮件地址太短",
		ERROR_FORBIDDEN_EMAIL: "您输入电子邮箱的邮件服务商不能正常收取饭快快的系统邮件,推荐使用<a href='http://mail.cn.yahoo.com/' target='_blank'>雅虎邮箱</a>",
		ERROR_DUP_EMAIL: "该电子邮箱已注册，请换用其他电子邮箱注册或用该电子邮箱<a href='login.jsp' target='_blank'>登录</a>",
		ERROR_BANNED_WORDS: "昵称包含非法字符",
		ERROR_ILLEGAL_EMAIL:"电子邮箱包含非法字符"
	};

	TB.app.reg.PhoneRegPage.initialize({
					validateOnInit: true,
						alipay: true
		});
	
	(function() {
		var D = YAHOO.util.Dom, E = YAHOO.util.Event;
		E.on('J_RegForm', 'submit', function() {
			D.get('J_Tips').value = !!(D.getElementsByClassName('show-tips', 'div', 'J_PhoneField')[0]);
			D.get('J_Disable').value = D.get('create-alipay').disabled;
		});
		
	})();
</script>


</div>
	


        </div>
        </div>
    


<%@ include file="../library/footer.jsp"%>
</body>
</html>
