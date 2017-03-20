<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link href="../../pi/css/g.base.v51.css" rel="stylesheet" type="text/css" />
		<link href="../../pi/css/pi.css" rel="stylesheet" type="text/css" />
		<link href="../../css/rating.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.rat_head{float:left;width: 100%;background-color:#f3f3f3;height:20px;border-bottom:1px solid #e6e6e6;margin-bottom:10px;}
			.rat_middle{float:left;width: 90%;margin:10px;}
			.rat_close{background-image:url("../../image/user/u/1.png");width:18px;float:right;display:block;height:18px;margin-right:10px;}
			.rat_close:hover{background-image:url("../../image/user/u/2.png");}
			
		</style>
	</head>

	<body>
		<div class="rat_head">
				<a class="rat_close" href="javascript:parent.hideDetail('${order_evaluate.orderId}')"></a>
			</div>
		<div class="rat_middle">
		<div id="con" class="con" style="width: 560px;float:left;">
			<div id="$review_overall_3642082" class="rating">
				<label>
					总体评价：
			  </label>
				<div id="wp" style="display:inline;">
					<c:if test="${order_evaluate.orderStars == 5}"><span class="sstar50" title="5星"></span></c:if>
                    <c:if test="${order_evaluate.orderStars == 4}"><span class="sstar40" title="4星"></span></c:if>
                    <c:if test="${order_evaluate.orderStars == 3}"><span class="sstar30" title="3星"></span></c:if>
                    <c:if test="${order_evaluate.orderStars == 2}"><span class="sstar20" title="2星"></span></c:if>
                    <c:if test="${order_evaluate.orderStars == 1}"><span class="sstar10" title="1星"></span></c:if>
                    <c:if test="${order_evaluate.orderStars == 0}"><span class="sstar00" title="0星"></span></c:if>
                    
				</div>
			</div>

			<div id="detail_star" style="margin-top:0;line-height:14px;">
				<span>味道：</span>
            	<c:if test="${order_evaluate.orderTaste == 5}"><span class="msstar50";></span></c:if>
            	<c:if test="${order_evaluate.orderTaste == 4}"><span class="msstar40";></span></c:if>
            	<c:if test="${order_evaluate.orderTaste == 3}"><span class="msstar30";></span></c:if>
            	<c:if test="${order_evaluate.orderTaste == 2}"><span class="msstar20";></span></c:if>
            	<c:if test="${order_evaluate.orderTaste == 1}"><span class="msstar10";></span></c:if>
            	<c:if test="${order_evaluate.orderTaste == 0}"><span class="msstar00";></span></c:if>
                <span style="margin-left:4px;">速度：</span>
                <c:if test="${order_evaluate.orderSpeed == 5}"><span class="msstar50";></span></c:if>
            	<c:if test="${order_evaluate.orderSpeed == 4}"><span class="msstar40";></span></c:if>
            	<c:if test="${order_evaluate.orderSpeed == 3}"><span class="msstar30";></span></c:if>
            	<c:if test="${order_evaluate.orderSpeed == 2}"><span class="msstar20";></span></c:if>
            	<c:if test="${order_evaluate.orderSpeed == 1}"><span class="msstar10";></span></c:if>
            	<c:if test="${order_evaluate.orderSpeed == 0}"><span class="msstar00";></span></c:if>
                <span style="margin-left:4px;">健康：</span>
                <c:if test="${order_evaluate.orderHealth == 5}"><span class="msstar50";></span></c:if>
            	<c:if test="${order_evaluate.orderHealth == 4}"><span class="msstar40";></span></c:if>
            	<c:if test="${order_evaluate.orderHealth == 3}"><span class="msstar30";></span></c:if>
            	<c:if test="${order_evaluate.orderHealth == 2}"><span class="msstar20";></span></c:if>
            	<c:if test="${order_evaluate.orderHealth == 1}"><span class="msstar10";></span></c:if>
            	<c:if test="${order_evaluate.orderHealth == 0}"><span class="msstar00";></span></c:if>
				

			</div>

			<div class="text_comment">
            	
                <div class="words" style="width:400px;">
				评价：<br>
				<span>${order_evaluate.orderDetail}</span>
                </div>
                
                <div class="favorite" style="width:400px;">
					喜欢的菜：
                    <span>${order_evaluate.favorite}</span>
                </div>

			</div>
		</div>
	</body>
</html>
