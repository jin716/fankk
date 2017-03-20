<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			.big_one .left{width:300px;height:1000px;float:left;}
			.big_one .right{width:660px;height:1000px;float:left;margin-left:7px;}
			.user_d{width:295px;height:120px;border:1px dashed #fd8812;}
			.user_list{width:295px;height:120px;border:1px solid #fd8812;margin-top:5px;}
			.user_list .title{width:295px;height:32px;background-color:#fd8812;line-height:32px;color:#ffffff;font-weight:600;font-size:15px;}
			.user_list ul{padding:0px;margin:0px;margin-top:5px;}
			.user_list li{margin-left:8px;height:28px;line-height:28px;}
			.gift{width:660px;height:1000px;border:1px solid #fd8812;}
			.gift .title{width:660px;height:32px;background-color:#fd8812;line-height:32px;color:#ffffff;font-weight:600;font-size:15px;}
			.a_gift{width:200px;height:250px;float:left;margin-top:20px;margin-left:10px;text-align:center;}
			.a_gift img{}
			.a_gift div{margin-left:5px;margin-top:4px;font-size:14px;font-weight:600;}
			.img_d {width:180px;height:160px;}
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
						<c:if test="${c_user != null}">
						<div class="user_d">
							<div style="font-size:18px;font-weight:600;margin-left:20px;margin-top:8px;">${c_user.userLoginName},您好!</div>
							<div style="font-size:14px;font-weight:500;margin-left:20px;margin-top:5px;">您现在有 <font style="color:#fd8812;font-weight:600">${c_user.userJifen}</font>&nbsp; 点积分.</div>
							<div style="font-size:14px;font-weight:500;margin-left:20px;margin-top:5px;"><a href="user/u/welcome.do?url=jifen">查看我的积分兑换记录</a></div>
						</div>
						</c:if>
						<div class="user_list">
							<div class="title">
								<div style="margin-left:10px;">如何获得积分？</div>
							</div>
							<ul>
								<li>1.成功订餐，即可获得积分。</li>
								<li>2.成功订餐后，对餐厅进行评价，获得积分。</li>
								<li><a href="#">更多>></a></li>
							</ul>
						</div>
					</div>
					<div class="right">
						<div class="gift">
							<div class="title">
								<div style="margin-left:10px;">兑换礼品</div>
							</div>
							<c:forEach items="${list}" var="gift">
							<div class="a_gift">
								<div class="img_d">
								<img src="${gift.giftImage}" width="160"/>
								</div>
								<div>${gift.giftName}</div>
								<div><font color="#fd8812">${gift.giftJifen} 积分</font></div>
								<div><button onclick="onDuihuan(${gift.giftId})">立即兑换</button></div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<%@ include file="/library/footer.jsp"%>
			</div>
		</div>
</body>
</html>
<script type="text/javascript">
	function onDuihuan(gid){
		window.location.href = "jifen.do?gift="+gid;
	}
</script>
