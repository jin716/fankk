<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
<link href="../css/shop_comment.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../js/selector-min.js"></script>
<script type="text/javascript" src="../js/event-delegate-min.js"></script>
<script type="text/javascript" src="../js/ymPrompt4/ymPrompt.js"></script>
<link rel="stylesheet" id='skin' type="text/css" href="../js/ymPrompt4/skin/simple/ymPrompt.css" />
<script type="text/javascript">
(function() {
	var last_current="init_current_a";  
	
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;
	
	var onClick = function (event, matchedEl, container) {
		Dom.removeClass(last_current, 'on');
		Dom.addClass(matchedEl, 'on');
		last_current=matchedEl;

	}

	Event.delegate("left_comment_title", "click", onClick, "a");



})();
</script>


<script type="text/javascript">

function reinitIframe(){

var iframe = document.getElementById("mainFrame");

try{

var bHeight = iframe.contentWindow.document.body.scrollHeight;

var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;

var height = Math.max(bHeight, dHeight);


iframe.height =  height;

}catch (ex){}

}


window.setInterval("reinitIframe()", 200);

function onVcode(){
			document.getElementById("vc_div").innerHTML = "<img width='130' src='../vCode.jpg?ram="+Math.random()+"'/>";
}
$(document).ready(function() {
			$("#comment_btn").bind("click", function(){
				onLogin();
			}); 	
});
function onLogin(){
			var message = document.getElementById('message').value;
			var vcode = document.getElementById('vcode').value;
			var storeId = document.getElementById('store').value;
			var msg = "";
			if(message==""){
				msg+= "请输入留言。\n";
			}
			if(vcode==""){
				msg+= "请输入验证码。\n";
			}
			if(msg!=""){
				alert(msg);
				return;
			}
		 	jQuery.post("addComnt.do",{store:storeId, detail:message,vcode:vcode},
				function(date){
					if(date == "true"){
						alert("添加成功");
						window.location.href="getComment.do?store=1&iframe=liuyan";
					}			
					else{
						alert(date);
					}
			});
}
</script>

<style type="text/css">

.leave_words{
	width:180px;
	height:150px;
	float:left;
	border:#ff9933 solid 1px;
	margin-top:16px;
}

.leave_words h4{
padding-left:8px;
color:#222;
font-size:14px;
line-height:22px;
font-weight:bold;
background:url(../image/comment/shop_comment_title_bg.png) repeat 0px -10px;
width:172px;
padding-bottom:2px;

}

.leave_words span{
	margin:8px;
	display:block;
	text-indent:2em;

}

.leave_words a{
	margin-left:32px;
	display:block;

}

#left_main .pingfen{
	padding-left:16px;
	padding-right:16px;
	display:inline;
	height:32px;
}

#left_main .pingfen .text{
	margin-left:16px;
}


.pingfen .text .item{
	margin-left:8px;
	font-size:13px;

}

#left_main .pingfen .text .fen{
	color:#e51313;
	font-size:13px;
	font-weight:bold;
}
</style>
</head>


<body>
<%@ include file="../library/stateBanner.jsp"%>

	<div id="wrapper">
    
    	<%@ include file="../library/header.jsp"%>
        
        <div id="shop_ibody">
			<%@ include file="../library/main_nav.jsp"%>
            <div id="bread">
                    您的位置: 
                    <a href="../index.jsp">首页</a>
                    > 
                    <span class="current"><a href="store_${store.storeId}">${store.storeName}</a></span>
            </div>
        
        	      
        <div id="left_side">
          <div id="left_main">
          	<span class="title" style="margin-bottom:16px;">
          		<span class="text">
          			<a style="font-size:16px;font-weight:bold;color:black" href="store_${store.storeId}">${store.storeName}</a>
          			<div class="pingfen">
	            	<c:if test="${store.storeStars > 4.7}"><c:if test="${store.storeStars <= 5}"><span class="sstar50" title="5星商户"></span></c:if></c:if>
			        <c:if test="${store.storeStars > 4.3}"><c:if test="${store.storeStars <= 4.7}"><span class="sstar45" title="4星商户"></span></c:if></c:if>
			        <c:if test="${store.storeStars > 3.7}"><c:if test="${store.storeStars <= 4.3}"><span class="sstar40" title="4星商户"></span></c:if></c:if>
			        <c:if test="${store.storeStars > 3.3}"><c:if test="${store.storeStars <= 3.7}"><span class="sstar35" title="3星商户"></span></c:if></c:if>
			        <c:if test="${store.storeStars > 2.7}"><c:if test="${store.storeStars <= 3.3}"><span class="sstar30" title="3星商户"></span></c:if></c:if>
			        <c:if test="${store.storeStars > 1.7}"><c:if test="${store.storeStars <= 2.7}"><span class="sstar20" title="2星商户"></span></c:if></c:if>
			        <c:if test="${store.storeStars > 0.7}"><c:if test="${store.storeStars <= 1.7}"><span class="sstar10" title="1星商户"></span></c:if></c:if>
			        <c:if test="${store.storeStars <= 0.7}"><span class="sstar00" title="0星商户"></span></c:if>     
	                <span class="text">
	                	<span class="item">口味</span>
	                    <span class="fen">${store.storeTaste}</span>
	                    <span class="item">速度</span>
	                    <span class="fen">${store.storeSpeed}</span>
	                    <span class="item">健康</span>
	                    <span class="fen">${store.storeHealth}</span>
	                </span>
	         	</div>   
          		</span>
				       	
          	</span>   
            <div class="logo" >
            	<span><a href="store_${store.storeId}"><img src="..${store.storeImgSrc}" alt="${store.storeName}" width="168" height="120"></a></span>
            </div>
            
         <div class="shop_detail">
                 <span class="item_style1"><strong>店铺信息</strong></span>
                 
                 <span class="text">
                 	<span style="color:#555">详细地址：</span>                    
                 <span>${store.storeAddrName}</span>
                    
          <span style="cursor:pointer;color:#858585;">
                    	<img src="../image/map.gif" style="margin-bottom: -2px;" alt="">
                        <span style="text-decoration: underline;">
                        <a href="javascript:ymPrompt.win({title:'${store.storeName}',fixPosition:true,winPos:'rb',maxBtn:false,minBtn:false,width:420,height:350,iframe:{id:'myId',name:'myName',src:'../map.do?type=store&store=${store.storeId}&height=340&width=380'}})" class="shop_brief_intro_div_ckdt">查看地图</a>
                         <a class="shop_brief_intro_div_ckdt" href="store_${store.storeId}">[立即订餐]</a>
                        </span>
                    </span>
                    
                    <br/>
                    
              <span style="color:#555">营业时间：</span>
                    <span>9:00-21:00</span>                 
                 </span>
                 
                 <span class="item_style1"><strong>外送标准</strong></span>
                 
                 <span class="text">                     
                     <span style="color:#555">外送范围：</span>
                     <span>${store.storeSendDistance}公里</span> 
                     <br/>
                     
                     <!-- 
                     <span style="color:#555">外送费用：</span>
                     <span>2元</span>  -->
                 </span>
                 <span class="item_style1"><strong><a style="font-weight:600;color:#ff9933" href="store_${store.storeId}&block=${f_block.blockId}">立即订餐！</a></strong></span>
		    </div>
            
            	
   	  	  </div>
          
          <div id="left_comment">
          	<div id="left_comment_title" class="title">
               <ul>
               	<li><a <c:if test="${type == 'all'}">id="init_current_a" class="on" </c:if> href="getComment.do?type=all&store=${store.storeId}" target="mainFrame"><span>全部评论</span></a></li>
               	<li><a <c:if test="${type == 'comment'}">id="init_current_a" class="on" </c:if> href="getComment.do?type=comment&store=${store.storeId}" target="mainFrame"><span>服务评价</span></a></li>
                <li><a <c:if test="${type == 'liuyan'}">id="init_current_a" class="on" </c:if> href="getComment.do?type=liuyan&store=${store.storeId}" target="mainFrame"><span>顾客留言</span></a></li>
               </ul>
            </div>
            
            <div class="comment_frame" style="width:700px;float:left;height:auto;">
                <iframe id="mainFrame" name="mainFrame" style="width:700px;border:none;"  frameborder="no" border="0" scrolling="no" scrolling="no" src="getComment.do?type=${type}&store=${store.storeId}">
                </iframe>
            </div>
            
          </div>
          
          <div id="leave_comment">
          <input type="hidden" name="store" id="store" value="${store.storeId}"/>
          <table>
          	<tr><td colspan="3"><span class="title"><span class="text">我要给<span class="shop_name">${store.storeName }</span>留言</span></span>
            <span style="margin:8px 16px;display:block;">留言:<span style="color:#999">(0~200字)</span></span></td></tr>
            <tr><td colspan="3"><textarea id="message" name="message" style="margin:8px 16px;" class="msg" type="text"></textarea></td></tr>
            <tr><td width="240"><span style="margin-left:16px;">验证码:</span><input id="vcode" name="vcode" style="margin-left:16px;" type="text"/></td><td><div style="margin-left:16px;" id="vc_div" style=""><img width="130" alt="验证码" src="../vCode.jpg"/></div></td></tr>
            <tr><td><button id="comment_btn" style="margin:8px 16px;">提交留言</button></td><td><a style="margin-left:16px;" href="javascript:onVcode()">看不清？换一个</a></td></tr>
          </table>
          </div>
          
          
          
        </div>

        <div style="float:left;width:16px;height:100px;"></div>
        <div class="leave_words">
        	<h4>给店家留言：</h4>
            <span>有要留给店家的意见或建议吗？现在就去留言，我们会替您转达。</span>
            <a style="font-size:14px;" href="#leave_comment">嗯,我要留言!</a>
        </div> 
            <div class="clear"></div>
        </div>
        <%@ include file="../library/footer.jsp"%>
        </div>
</body>
</html>
