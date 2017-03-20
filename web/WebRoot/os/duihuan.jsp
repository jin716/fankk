<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ymai.hibernate.*"%>
<%@ page import="com.ymai.struts.CookieUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>饭快快积分兑换--叫外卖换礼品</title>
		<meta name ="keywords" content="广州外卖,快餐外卖,外卖美食,网上订餐,外卖电话">
		<meta name="description" content="外卖,外送,订餐,外卖电话,网上外卖,网上外送,网上订餐,饭快快：网上送餐,免费,快捷,不占线">
		<meta name="chinaz-site-verification" content="7db25af9-b504-4cea-803a-63f6cce3c2ab" />
		<link href="css/Ymai.css" rel="stylesheet" type="text/css" />
		<link href="css/index.css" rel="stylesheet" type="text/css" />
		<link href="css/taobao_nav.css" rel="stylesheet" type="text/css" />
		<link href="css/paipai_search.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.big_one{width:980px;height:1000px;}
			.big_one .left{width:400px;height:1000px;float:left;}
			.big_one .right{width:560px;height:1000px;float:left;margin-left:7px;}
			.user_d{width:560px;height:240px;border:1px dashed #fd8812;}
			.user_list{width:560px;height:120px;border:1px solid #fd8812;margin-top:5px;}
			.user_list .title{height:32px;background-color:#fd8812;line-height:32px;color:#ffffff;font-weight:600;font-size:15px;}
			.user_list ul{padding:0px;margin:0px;margin-top:5px;}
			.user_list li{margin-left:8px;height:28px;line-height:28px;}
			.gift{width:400px;height:1000px;border:1px solid #fd8812;}
			.gift .title{height:32px;background-color:#fd8812;line-height:32px;color:#ffffff;font-weight:600;font-size:15px;}
			.gift img{float:left;margin-left:20px;margin-top:12px;}
			.gift .in_table{width:400px;height:200px;margin-top:12px;margin-left:15px;float:left;}
			.gift .in_table table{font-size:15px;font-weight:600}
			.gift .in_table td{border-bottom:1px dashed #fd8812;}
			.tips {float:left;width:600px;height:40px;border:1px dashed #fd8812;margin:20px;padding:5px;background-color:#fffcec;}
			#dh_btn{background:url(image/duihuan.jpg);width:100px;height:28px;border:0px;line-height:28px;font-weight:600;font-size:15px;color:#ffffff;}
			.detail{width:600px;float:left;margin-left:28px;margin-top:15px;height:500px;}
			.detail h1{font-size:20px;}
			.detail h2{font-szie:16pxc}
		</style>
	</head>
	<body>
		<!-- #BeginLibraryItem "/Library/state_banner.lbi" -->
		<%@ include file="/library/stateBanner.jsp"%>
		<!-- #EndLibraryItem -->
		<div id="wrapper">
			<%@ include file="/library/header.jsp"%>
			<div id="ibody">
				<!-- #BeginLibraryItem "/Library/nav_bar_home.lbi" -->
				<%@ include file="/library/main_nav_jifen.jsp"%>
				<div class="big_one">
					<div class="left">
						<iframe id="mainFrame" name="mainFrame" class="user_d" frameborder="no" border="0" scrolling="no" src="getOrder.do?action=frame">
    					</iframe>
					<table class="user_list" width="550" cellspacing="0">
						<tr><td width="100" class="title">订单编号</td><td>${user_order_now.orderId}</td><tr>
						<tr><td  class="title">店家</td><td colspan="3">${user_order_now.store.storeName} </td></tr>		
						<tr><td  class="title">店家描述</td><td colspan="3">${user_order_now.store.storeBrief} </td></tr>		
						<tr><td  class="title">店家地址</td><td colspan="3">${user_order_now.store.storeAddrName} </td></tr>		
						<tr><td  class="title">外送范围</td><td colspan="3">${user_order_now.store.storeSendDistance}公里 </td></tr>		
						<tr><td  class="title">总费用</td><td colspan="3">${user_order_now.orderTotalPrice} 元（含外送费用：${user_order_now.orderSendPrice}）</td></tr>		 
						<tr>
						<td class="title">称呼</td><td width="300">${user_order_now.name}</td>
					</tr>
					<tr>
						<td class="title">
							电话
						</td>
						<td>
							${user_order_now.orderTele}
						</td>
					</tr>
					<tr>
						<td class="title">
							地址
						</td>
						<td>
							${user_order_now.orderAddr}
						</td>
					</tr>
					<tr>
						<td class="title">
							备注
						</td>
						<td>
							${user_order_now.orderRemark}
						</td>
					</tr>
				</table>
					</div>
					<div class="right">
						<div class="gift">
							<div class="title">
								<div style="margin-left:10px;">兑换奖品</div>
							</div>
							<div class="a_gift">
								<div class="tips"> 
									请认真填写您的兑换信息。如果您申请的是QQ币/手机充值卡/游戏卡等，请您在备注中填写您要充值的帐号我们将会在2个工作日内审核您的资料，您也可以到 <a href="user/u/welcome.do?url=jifen">我的奖品兑换</a> 查看审核情况。 
								</div>
								<img src="${gift.giftImage }" width="160"/>
								<div class="in_table">
								<form action="jifen.do" method="post">
								<input type="hidden" name="gift" value="${gift.giftId}"/>
									<table width="400" height="200">
										<tr>
											<td colspan="2"><font color="#fd8812">${gift.giftName }</font> <font style="font-size:12px;font-weight:400">(您当前有<font color="#fd8812"> ${c_user.userJifen} </font>积分,兑换一份${gift.giftName}需要<font color="#fd8812"> ${gift.giftJifen } </font>积分)</font></td>
										</tr>
										<tr>
											<td width="100">兑换数量</td>
											<td>
												<select name="num">
													<option value="1">1份</option>
													<option value="2">2份</option>
													<option value="3">3份</option>
													<option value="4">4份</option>
													<option value="5">5份</option>
													<option value="6">6份</option>
													<option value="7">7份</option>
													<option value="8">8份</option>
													<option value="9">9份</option>
													<option value="10">10份</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>备注信息</td>
											<td>
												<textarea name="detail" rows="5" cols="50"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2"><input type="submit" id="dh_btn" value="立即兑换"/></td>
										</tr>
									</table>
									</form>
								</div>
								<div class="tips" style="height:24px;font-size:17px;font-weight:600;color:#fd8812"> 
									奖品信息
 								</div>
 								<div class="detail">
 									${gift.giftDetail }
 								</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="/library/footer.jsp"%>
			</div>
		</div>
</body>
</html>
