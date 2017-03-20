<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>

		<link href="../../pi/css/g.base.v51.css" rel="stylesheet" type="text/css" />
		<link href="../../pi/css/pi.css" rel="stylesheet" type="text/css" />
		<link href="../../css/rating.css" rel="stylesheet" type="text/css" />


		<script type="text/javascript" src="../../pi/js/yahoo-dom-event.js"></script>
		<script type="text/javascript" src="../../pi/js/selector-min.js"></script>
		<script type="text/javascript" src="../../pi/js/event-delegate-min.js"></script>

<script type="text/javascript">
(function() {
	var last;  
	
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;
	
	var onClick = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info"){
			var current_id;
			current_id=Dom.generateId(matchedEl);
			Dom.removeClass(last, Dom.generateId(last)+'-on');
			Dom.addClass(matchedEl, current_id+'-on');
			last=matchedEl;
			
			var temp=document.getElementById("review_form_star");
			temp.value=document.getElementById(current_id).value;
			
			temp=document.getElementById("star_info");
			Dom.addClass("star_info", "hover");
			temp.innerHTML=document.getElementById(current_id).title;
		}
	}
	
	var onMouseOver = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info"){
			Dom.removeClass(last, Dom.generateId(last)+'-on');
			var temp=document.getElementById("star_info");
			temp.innerHTML=document.getElementById(Dom.generateId(matchedEl)).title;
		}
	}
	
	var onMouseOut = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info"){
			Dom.addClass(last, Dom.generateId(last)+'-on');
			var temp=document.getElementById("star_info");
			if (last==null){
				temp.innerHTML="点击星星为商户打分";
			}
			else{
				temp.innerHTML=document.getElementById(Dom.generateId(last)).title;
			}
		}
	}

	Event.delegate("wp", "click", onClick, "li");
	Event.delegate("wp", "mouseover", onMouseOver, "li");
	Event.delegate("wp", "mouseout", onMouseOut, "li");
	
	var last_kw;  
	
	var onClick_kw = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_kw"){
			var current_id;
			current_id=Dom.generateId(matchedEl);
			last_id=Dom.generateId(last_kw);
			Dom.removeClass(last_kw, last_id.substring(0,2)+'-on');
			Dom.addClass(matchedEl, current_id.substring(0,2)+'-on');
			last_kw=matchedEl;
			
			var temp=document.getElementById("review_form_star_kw");
			temp.value=document.getElementById(current_id).value;
			
			temp=document.getElementById("star_info_kw");
			Dom.addClass("star_info_kw", "hover");
			temp.innerHTML=document.getElementById(current_id).title;
		}
	}
	
	var onMouseOver_kw = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_kw"){
			Dom.removeClass(last_kw, Dom.generateId(last_kw).substring(0,2)+'-on');
			var temp=document.getElementById("star_info_kw");
			temp.innerHTML=document.getElementById(Dom.generateId(matchedEl)).title;
		}
	}
	
	var onMouseOut_kw = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_kw"){
			Dom.addClass(last_kw, Dom.generateId(last_kw).substring(0,2)+'-on');
			var temp=document.getElementById("star_info_kw");
			if (last_kw==null){
				temp.innerHTML="";
			}
			else{
				temp.innerHTML=document.getElementById(Dom.generateId(last_kw)).title;
			}
		}
	}

	Event.delegate("wp_kw", "click", onClick_kw, "li");
	Event.delegate("wp_kw", "mouseover", onMouseOver_kw, "li");
	Event.delegate("wp_kw", "mouseout", onMouseOut_kw, "li");
	
	var last_sd;  
	
	var onClick_sd = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_sd"){
			var current_id;
			current_id=Dom.generateId(matchedEl);
			last_id=Dom.generateId(last_sd);
			Dom.removeClass(last_sd, last_id.substring(0,2)+'-on');
			Dom.addClass(matchedEl, current_id.substring(0,2)+'-on');
			last_sd=matchedEl;
			
			var temp=document.getElementById("review_form_star_sd");
			temp.value=document.getElementById(current_id).value;
			
			temp=document.getElementById("star_info_sd");
			Dom.addClass("star_info_sd", "hover");
			temp.innerHTML=document.getElementById(current_id).title;
		}
	}
	
	var onMouseOver_sd = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_sd"){
			Dom.removeClass(last_sd, Dom.generateId(last_sd).substring(0,2)+'-on');
			var temp=document.getElementById("star_info_sd");
			temp.innerHTML=document.getElementById(Dom.generateId(matchedEl)).title;
		}
	}
	
	var onMouseOut_sd = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_sd"){
			Dom.addClass(last_sd, Dom.generateId(last_sd).substring(0,2)+'-on');
			var temp=document.getElementById("star_info_sd");
			if (last_sd==null){
				temp.innerHTML="";
			}
			else{
				temp.innerHTML=document.getElementById(Dom.generateId(last_sd)).title;
			}
		}
	}

	Event.delegate("wp_sd", "click", onClick_sd, "li");
	Event.delegate("wp_sd", "mouseover", onMouseOver_sd, "li");
	Event.delegate("wp_sd", "mouseout", onMouseOut_sd, "li");
	
	var last_fw;  
	
	var onClick_fw = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_fw"){
			var current_id;
			current_id=Dom.generateId(matchedEl);
			last_id=Dom.generateId(last_fw);
			Dom.removeClass(last_fw, last_id.substring(0,2)+'-on');
			Dom.addClass(matchedEl, current_id.substring(0,2)+'-on');
			last_fw=matchedEl;
			
			var temp=document.getElementById("review_form_star_fw");
			temp.value=document.getElementById(current_id).value;
			
			temp=document.getElementById("star_info_fw");
			Dom.addClass("star_info_fw", "hover");
			temp.innerHTML=document.getElementById(current_id).title;
		}
	}
	
	var onMouseOver_fw = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_fw"){
			Dom.removeClass(last_fw, Dom.generateId(last_fw).substring(0,2)+'-on');
			var temp=document.getElementById("star_info_fw");
			temp.innerHTML=document.getElementById(Dom.generateId(matchedEl)).title;
		}
	}
	
	var onMouseOut_fw = function (event, matchedEl, container) {
		if (Dom.generateId(matchedEl)!="star_info_fw"){
			Dom.addClass(last_fw, Dom.generateId(last_fw).substring(0,2)+'-on');
			var temp=document.getElementById("star_info_fw");
			if (last_fw==null){
				temp.innerHTML="";
			}
			else{
				temp.innerHTML=document.getElementById(Dom.generateId(last_fw)).title;
			}
		}
	}

	Event.delegate("wp_fw", "click", onClick_fw, "li");
	Event.delegate("wp_fw", "mouseover", onMouseOver_fw, "li");
	Event.delegate("wp_fw", "mouseout", onMouseOut_fw, "li");
})();

function comment_submit(){
	if (document.getElementById("review_form_star").value==0){
		alert('本次评价，尚未给出总体评价');
		return false;
	}
	if (document.getElementById("review_form_star_kw").value==0){
		alert('本次评价，尚未给出口味评价');
		return false;
	}
	if (document.getElementById("review_form_star_sd").value==0){
		alert('本次评价，尚未给出速度评价');
		return false;
	}
	if (document.getElementById("review_form_star_fw").value==0){
		alert('本次评价，尚未给出健康评价');
		return false;
	}
	if (document.getElementById("review_form_star_fw").value==0){
		alert('本次评价，尚未给出健康评价');
		return false;
	}
	if (document.getElementById("review_form_body").value==""){
		alert('请给店家留下评价');
		return false;
	}
	document.rateForm.submit();
}


</script>
<style type="text/css">
	.rat_head{float:left;width: 100%;background-color:#f3f3f3;height:20px;border-bottom:1px solid #e6e6e6;margin-bottom:10px;}
	.rat_middle{float:left;width: 90%;margin:10px;}
	.rat_close{background-image:url("../../image/user/u/1.png");width:18px;float:right;display:block;height:18px;margin-right:10px;}
	.rat_close:hover{background-image:url("../../image/user/u/2.png");}
	
</style>
	</head>

	<body>
			<div class="rat_head">
				<a class="rat_close" href="javascript:parent.hideDetail(${order_id})"></a>
			</div>
			<div class="rat_middle">
			<form name="rateForm" action="evaluateCommit.do" method="post">
			<input type="hidden" value="${order_id}" name="orderId"/>
			<div id="con" class="con" style="width: 560px;float:left;">
			  <div id="$review_overall_3642082" class="rating">
				<label>
						<span class="Star">*</span>:总体评价
			    </label>
				  <div id="wp" class="wp">
					  <ul id="box_starRating" class="box starRating">
						  <li id="s1" class="s1" alt="很差" title="很差" value="10">
							  1星
						  </li>
						  <li id="s2" class="s2" alt="差" title="差" value="20">
							  2星
						  </li>
						  <li id="s3" class="s3" alt="还行" title="还行" value="30">
							  3星
						  </li>
						  <li id="s4" class="s4" alt="好" title="好" value="40">
							  4星
						  </li>
						  <li id="s5" class="s5" alt="很好" title="很好" value="50">
							  5星
						  </li>
						  <li id="star_info" class="info ">
							  点击星星为商户打分
						  </li>
						  <li class="data">
							  <input id="review_form_star" name="stars" type="hidden" value="0"
									autocomplete="off" />
						  </li>
					  </ul>
				  </div>
				</div>
	
				<div id="detail_star">
					<span class="Star">*</span>
					<span>口味</span>
					<span>:</span>
					<div id="wp_kw" class="wp">
						<ul id="box_starRating_kw" class="box starRating">
							<li id="s1_kw" class="s1" alt="很差" title="很差" value="10">
								1星
							</li>
							<li id="s2_kw" class="s2" alt="差" title="差" value="20">
								2星
							</li>
							<li id="s3_kw" class="s3" alt="还行" title="还行" value="30">
								3星
							</li>
							<li id="s4_kw" class="s4" alt="好" title="好" value="40">
								4星
							</li>
							<li id="s5_kw" class="s5" alt="很好" title="很好" value="50">
								5星
							</li>
							<li id="star_info_kw" class="info">
	
							</li>
							<li class="data">
								<input id="review_form_star_kw" name="taste" type="hidden" value="0"
									autocomplete="off" />
							</li>
						</ul>
					</div>
					<span class="Star">*</span>
					<span>速度</span>
					<span>:</span>
					<div id="wp_sd" class="wp">
						<ul id="box_starRating_sd" class="box starRating">
							<li id="s1_sd" class="s1" alt="很差" title="很差" value="10">
								1星
							</li>
							<li id="s2_sd" class="s2" alt="差" title="差" value="20">
								2星
							</li>
							<li id="s3_sd" class="s3" alt="还行" title="还行" value="30">
								3星
							</li>
							<li id="s4_sd" class="s4" alt="好" title="好" value="40">
								4星
							</li>
							<li id="s5_sd" class="s5" alt="很好" title="很好" value="50">
								5星
							</li>
							<li id="star_info_sd" class="info">
	
							</li>
							<li class="data">
								<input id="review_form_star_sd" name="speed" type="hidden" value="0"
									autocomplete="off" />
							</li>
						</ul>
					</div>
	
	
					<span class="Star">*</span>
					<span>健康</span>
					<span>:</span>
					<div id="wp_fw" class="wp">
						<ul id="box_starRating_fw" class="box starRating">
							<li id="s1_fw" class="s1" alt="很差" title="很差" value="10">
								1星
							</li>
							<li id="s2_fw" class="s2" alt="差" title="差" value="20">
								2星
							</li>
							<li id="s3_fw" class="s3" alt="还行" title="还行" value="30">
								3星
							</li>
							<li id="s4_fw" class="s4" alt="好" title="好" value="40">
								4星
							</li>
							<li id="s5_fw" class="s5" alt="很好" title="很好" value="50">
								5星
							</li>
							<li id="star_info_fw" class="info">
	
							</li>
							<li class="data">
								<input id="review_form_star_fw" name="health" type="hidden" value="0"
									autocomplete="off" />
							</li>
						</ul>
					</div>
				</div>
	
				<div class="text_comment">
	            	
	                <div class="words">
	                <span class="Star">*</span>评价:
					<span class="tip">(1-200个字)</span>
					<textarea id="review_form_body" name="text"
						style="width: 550px; height: 100px;margin-top:8px;"></textarea>
	                </div>
	                
	                <div class="favorite">
						喜欢的菜:
	                    <input type="text" name="favorite" id="review_form_dtag" autocomplete="off"
	                        size="60" maxlength="100" value="" />
	                    <span class="tip">多个菜请用空格分开</span>
	                </div>
	                
	                <div class="btn">
	
					<input type="button" id="review_form_submit"
						onclick="comment_submit()" value="提交点评" />
	
	                </div>
				</div>
			</div>
	        </form>
		</div>
	</body>
</html>
