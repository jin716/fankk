<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>激活用户--饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线"><link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/register.css" rel="stylesheet" type="text/css" />
<link href="../css/tbsp.css" rel="stylesheet" type="text/css" />
<script src="../js/tbra-widgets.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
		
		$(document).ready(function() { 
			$("#J_ReSendCode").bind("click", function(){
				jQuery.get("activateCodeSend.do",{},
				function(data){
						if(data!="-1")alert("验证码已发送！");
					});
			});
			 
		}); 
					
		function check_vcode(){
			var v_1_code = document.getElementById("J_Code").value;
			if(v_1_code == ""){
				alert("请输入发送到您手机上的验证码");
				return false;
			}
			return true;
		}
		function taSubmit(){
			if(check_vcode()){
				document.toActivate.submit();
			}
		}
</script>
</head>

<%@ include file="../library/stateBanner.jsp"%>

<body class="masked">
<%@ include file="../library/header.jsp"%>
<div id="content"><!-- 页面content内容开始 -->

		<div class="flow-steps" >
			<ol class="num3">
				<li class="done current-prev"><span class="first">1. 填写会员信息</span></li>
				<li class="current"><strong>2. 输入校验码</strong></li>
				<li class="last"><span>3. 注册成功</span></li>
			</ol>
		</div>

		<div class="reg-form reg-code">
				<form name="toActivate" action="activate.do" method="get">
				<div class="msg head-tips">
					<p class="tips">淘宝已经向您的手机发送免费的校验码短信，请查看短信。</p>
				</div>
				<ul>
					<li class="field">
						<div class="input">
							<label>手机号码：</label><span class="phone">${u_user.userTele}</span>
							<span class="change-phone">
								<a href="register.do?action=changeTele">更换号码</a>
							</span>
						</div>
					</li>
					<li class="field hover" id="J_CodeFiled">
						<div class="input">
							<label>校验码：</label><input id="J_Code" maxlength="6" name="J_Code"
class="J_Field" type="text">
						</div>				
						<div class="msg show-attention">					
							<p class="attention">
																	请输入您手机中的6位数字校验码
						  </p>
						</div>
					</li>		
							
					
					<li class="field resend-field">				
						<div class="input">					
							<span>如果您在1分钟内没有收到校验码，请：</span><button type="button" disabled="disabled" id="J_ReSendCode">"在60秒后点此重发"</button>	
						</div>
					</li>			
					<li class="submit-field">				
						<div class="input">					
							<button onclick="taSubmit()" id="J_SubmitBtn">下一步</button>				
						</div>			
					</li>	
				</ul>
                </form>
					
		</div>
		<!--dialog-->
		<div style="display: none;" class="dialog" id="J_ChangePhoneDialog">
			<input type="hidden" id="tete_user" value ="${user.userTele }"/>
			<div class="bd">
			  <div class="tr pad8">您目前收注册的手机号码为:<span>${user.userTele }</span></div>
				<div class="form-change-email">
					<form accept-charset="utf-8" method="post" action="">
						<input name="_tb_token_" value="e893f7109b69" type="hidden">
						<div class="tr">输入新的手机号码：</div>
						<div class="tr pad8" id="J_ChangePhoneField">
							<input maxlength="11" name="phone" class="J_Field" 
id="J_PhoneNumber" type="text">
							<button type="submit" id="J_ChangePhoneBtn">保存更改</button>
							<button type="button" id="J_DialogCancel">取消</button>
							<div class="msg">
    
    						<p class="error">
    							    								
    						  </p>
					</div>
						</div>
						<div class="tr">
							
						</div>
					</form>
				</div>
		  </div>
  </div>
  <script type="text/javascript" src="../js/register.js"></script>
<script type="text/javascript">
	TB.app.reg.CONSTANTS = {
		ERROR_MALFORM_MOBILE: "该手机号码不存在",
		ERROR_CELLPHONE_EXISTED: "该手机号码已注册，请换用其他手机号码",
		ERROR_MISS_USER_ID: "您的帐户已超过激活期限",
		ERROR_SMS_ACK_MAX_TIMES: "您已发送了5次验证码，请在24小时后重发",
		ERROR_MISS_NICK_NAME: "该会员名不存在",
		USER_STATE_ERROR: "用户状态错误",
		ERROR_SMS_ACK_USER_TIMES: "您的当前帐户发送校验码的次数已经超过上线(20次)，请更换其他账号",
		ERROR_SMS_NOT_APPLY: "激活验证短信发送时间间隔过短，不能发送",
		ERROR_SMS_SEND_SMS: "激活验证短信发送失败，请稍后重试",
		USER_NOT_FOUND_REGISTER: "该用户不存在"
	};
	
	TB.app.reg.CheckPhonePage.initialize({
	//需要nick和用户id
	enableCountDown: true,
	activationUrl: "http://member1." + TB.bom.pickDocumentDomain() + "/member/sendActivateMobile.do",
	phoneValidateUrl: "http://member1." + TB.bom.pickDocumentDomain() + "/member/checkCellphone.do"
	});
</script>
</div>

<%@ include file="../library/footer.jsp"%>
</body>
</html>

