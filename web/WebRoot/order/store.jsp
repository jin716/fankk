<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${store.storeName}外卖,${store.storeName}外送,${store.storeName}订餐,${store.storeName}外卖电话,饭快快：网上送餐,免费,快捷,不占线</title>
<meta name ="keywords" content="${store.storeName}外卖,${store.storeName}外送,${store.storeName}订餐,${store.storeName}外卖电话,饭快快：网上送餐,免费,快捷,不占线">
<meta name="description" content="饭快快,叫外卖不占线,${store.storeName},">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<link href="../css/shop.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" id='skin' type="text/css" href="../js/ymPrompt4/skin/simple/ymPrompt.css" />
<style type="text/css">
.addr_used {vertical-align:top;line-height:27px;font-size:13px;}
.addr_used li{width:500px;}
</style>
</head>
<body >
	<%@ include file="../library/stateBanner.jsp"%>
	<div id="wrapper">
		<%@ include file="../library/header.jsp"%>
        
        <div id="shop_ibody">
		
        <%@ include file="../library/main_nav.jsp"%>
        <div id="bread">
            	您的位置: 
                <a href="../index.jsp">首页</a>
                 > 
                <c:if test="${u_block != null }"><a href="blockList_${u_block.area.areaId}">${u_block.area.areaName}</a>></c:if>
                <c:if test="${u_block != null }"><a href="storeList_${u_block.blockId}">${u_block.blockName}</a>></c:if>
                <span class="current">${store.storeName}</span>
        </div>
        <div id="left_side">
          <div id="left_main">
          	<span class="title">
            <span class="text">${store.storeName}</span>
            <div class="pingfen">
            	<c:if test="${store.storeStars > 4.7}"><c:if test="${store.storeStars <= 5}"><span class="sstar50" title="5星商户"></span></c:if></c:if>
                <c:if test="${store.storeStars > 4.3}"><c:if test="${store.storeStars <= 4.7}"><span class="sstar45" title="4星商户"></span></c:if></c:if>
                <c:if test="${store.storeStars > 3.7}"><c:if test="${store.storeStars <= 4.3}"><span class="sstar40" title="4星商户"></span></c:if></c:if>
                <c:if test="${store.storeStars > 3.3}"><c:if test="${store.storeStars <= 3.7}"><span class="sstar35" title="3星商户"></span></c:if></c:if>
                <c:if test="${store.storeStars > 2.7}"><c:if test="${store.storeStars <= 3.3}"><span class="sstar30" title="3星商户"></span></c:if></c:if>
                <c:if test="${store.storeStars > 1.7}"><c:if test="${store.storeStars <= 2.7}"><span class="sstar20" title="2星商户"></span></c:if></c:if>
                <c:if test="${store.storeStars <= 1.7}"><span class="sstar10" title="1星商户"></span></c:if>
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
            
            
            <div class="logo_detail">
            
            <div class="logo">
            	<span><img src="..${store.storeImgSrc}" alt="${store.storeName}" width="168" height="120"></span>
            </div>
            
             <div class="shop_detail">
                     <span class="item_style1"><strong>店铺信息</strong></span>
                     <span class="text">
                        <span style="color:#555">详细地址：</span>                    
                     <span>${store.storeAddrName }</span>
                        
              <span style="cursor:pointer;color:#858585;">
                            <img src="../image/map.gif" style="margin-bottom: -2px;" alt="">
                            <span style="text-decoration: underline;">
                            <a href="javascript:ymPrompt.win({title:'${store.storeName}',fixPosition:true,winPos:'rb',maxBtn:false,minBtn:false,width:420,height:350,iframe:{id:'myId',name:'myName',src:'../map.do?type=store&store=${store.storeId}&height=340&width=380'}})" class="shop_brief_intro_div_ckdt">查看地图</a> 
                            <a href="getComment.do?store=${store.storeId}" style="cursor: pointer;" class="shop_brief_intro_div_ckdt">[查看评论]</a>
                            </span>
                        </span>
                        
                        <br/>
                        
                  <span style="color:#555">营业时间：</span>
                        <span>${store.storeStartTimeString}-${store.storeEndTimeString}</span>                 
                     </span>
                     
                     <span class="item_style1"><strong>外送标准</strong></span>
                     <span class="text">                     
                         <span style="color:#555">外送范围：</span>
                         <span style="width:540px;word-break:break-all">${store.storeSendDistanceText}&nbsp;&nbsp;&nbsp; (${store.storeSendDistance}公里)</span> 
                         <br/>
                         <span style="color:#555">外送费用：</span>
                         <span>无</span> <br/>
                         <span style="color:#555">产品、价格、外送费和外送范围仅供参考，具体以订餐实际确认为准。</span>
                     </span>
                </div>
             </div>
   	  	  </div>
        	<div style="clear:left;float:left;width:188px;height:100px;"></div>       
            <div id="shop_main">
            	<div id="menu_nav">	
                	<h4>本店菜单目录：</h4>
                    <div class="menu_list">
                    	<a href="javascript:void(0)" id="swap_menu_mode">[切换菜单模式]</a>
                    	<c:forEach items="${type_list}" var="type">
                    		<a href="#${type}">${type}</a>
                    	</c:forEach>
                	</div>
                </div>
				<div id="order_list_div">	
                	<h4>您的订单：</h4>
            		<div class="order_list" id="order_list">
                        <div class="order_list_content">
                            <table>
                                <tbody>
                                    <tr>
                                        <td colspan="3">
                                            您还没有点餐哦！
                                        </td>
                                    </tr>
                                    
                                    </tbody>
                            </table>
                        </div>
                        
                        <table>
                        	<tbody>
                 
                                
                                <tr>
                                	<td class=" boldfoodname" width="65px">
                                    	总价：
                                    </td>
                                    <td class="" width="20px">
                                    	
                                    </td>
                                    <td class=" boldfoodname" style="text-align:center;" width="85px">
                                    	0.0 
                                        <a href="#0001">下单</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            
            
            	<div class="title">
                    <span class="STYLE2">[外送订单]</span>
                    
                   <c:if test="${c_user == null}">
                   	当前您的身份是游客，无法获得积分，欲使用注册用户身份完成订购 <a href="../user/login.jsp" style="color: blue; text-decoration:underline;">请由此登录</a>
                   </c:if>
            	</div>
                
                <div class="no" style="background-image:url(../image/shop/no1.gif);background-repeat:no-repeat;">
                    选择由<a href="#" class="red" target="_blank" title="${store.storeName}">${store.storeName}</a>
                    <a href="getComment.do?store=${store.storeId}" target="_blank" style="cursor: pointer;" class="black">[查看评论]</a>
                   <!-- <a href="#${store.storeId}" style="cursor: pointer;" class="black">[收藏本店]</a>  -->
                    提供的外送产品。
               	</div>
                <div class="menu" id="menu">
                    <div id="menu_panel" class="menu_list_style_1">
                	<ul>
                		<c:forEach items="${type_list}" var="type">
	                    	<li class="divOrderSummary" id="${type}">
	                        	<c:if test="${type == null}">无分类菜式：</c:if>
	                        	<c:if test="${type != null}">${type}：</c:if>
	                        </li>
	                        <c:set var="oushu" value="0" scope="page"/>
	                        <c:forEach items="${store.items}" var="item" varStatus="status">
	                        	<c:if test="${type == item.itemType}">
	                        	<c:if test="${item.itemState == '上架'}">
	                        	<c:set var="oushu" value="${oushu+1}" scope="page"/>
		                        <li class="menuli <c:if test="${oushu%2 != 0}">oushu</c:if>" id="${item.itemId}">
		                        	<div class="cai_img">
		                       	    	<img src="..${item.itemImgSrc}" width="168" height="120">
		                            </div>
		               	      		<input id="${item.itemId}_price" value="${item.itemPrice}" type="hidden">
		                            <input id="${item.itemId}_name" value="${item.itemName}" type="hidden">
		                            <span class="item_name">
		                                ${item.itemName}
		                            </span>
		                            <span class="price">
		                            	${item.itemPrice}
		                            </span>
		                            <span class="yuan">
		                            	元
		                            </span>
		                            <div class="btn">
		                            <a href="javascript:void(0)" id="menu001">
		                            <img class="visiable" src="../image/shop/button-plus.gif" width="25" height="19" /></a>
		                            <input type="image" src="../image/shop/button-minus.gif"/></div>
		                        </li>
		                        </c:if>
		                       	</c:if>
                        	</c:forEach>
                       </c:forEach>
                        
                    </ul>
                    
                    </div>
                    
                    
                
                </div>

                <div class="no" style="background-image:url(../image/shop/no2.gif);background-repeat:no-repeat;" id="0001">
                   确认您的地址和联系方式，方便外送员与您联系，非常重要！
               	</div>
                <form name="addOrderForm" action="" method="post"  target="cantSee">
               	<input type="hidden" value="${store.storeId}" id="storeId" name="storeId"/>
                <div style="margin:16px 0 0 30px;padding:0 16px 16px 0;float:left;">
                	<ul style="vertical-align:top;line-height:27px;font-size:13px;">
                    	<li>称呼：<input name="name" id="name" type="text" style="font-size:13px;line-height:20px" value=""><input type="radio" name="mrMiss" id="mrMiss" value='先生' checked="checked">先生 <input type="radio" name="mrMiss" id="mrMiss" value='小姐'>小姐</li>
                    	<li>手机：<input name="tele" id="tele" type="text" style="font-size:13px;line-height:20px" value="${c_user.userTele}" maxlength="11"></li>
                    	<li>地址：<input name="address" id="address" type="text" style="font-size:13px;line-height:20px;width:300px;" value="${used_address}"></li>
                    	<li>备注：<textarea name="others" id="others" rows="3" style="font-size:13px;line-height:20px;width:300px;"></textarea></li>
                    </ul>
                </div>
                <c:if test="${c_user != null}">
				<div style="margin:16px 0 0 30px;padding:0 16px 16px 0;float:left;clear:left;">
					<ul class="addr_used" value="${c_user.userTele}">
					 <c:if test="${c_user.userAddr1 != null}"><li style="width:500px;">曾用地址1：<a id="a1_address" href="javascript:onAddress('a1_address')">${c_user.userAddr1}</a></li></c:if>
					 <c:if test="${c_user.userAddr2 != null}"><li>曾用地址2：<a id="a2_address" href="javascript:onAddress('a2_address')">${c_user.userAddr2}</a></li></c:if>
					 <c:if test="${c_user.userAddr3 != null}"><li>曾用地址3：<a id="a3_address" href="javascript:onAddress('a3_address')">${c_user.userAddr3}</a></li></c:if>
					</ul>
                </div>
				</c:if>
                 <div class="lijidingcan" style="clear:left;float:left;margin-left:60px;margin-top:16px;line-height:27px;">
					  	<a  href="javascript:onOrder()" style="background:url(../image/shop/yellow_btn.png)  scroll 0 0 transparent;height:27px;border:none;display:block;width:128px;"></a>
                </div>
                </form>
                <iframe name="cantSee" id="cantSee" style="display:none"></iframe>
                         
                
            	
   	  	  </div>

        </div>
        <div style="float:left;width:16px;height:100px;"></div>
        <div class="leave_words">
        	<h4>给店家留言：</h4>
            <span>有要留给店家的意见或建议吗？现在就去留言，我们会替您转达。</span>
            <a href="getComment.do?store=${store.storeId}&iframe=liuyan#leave_comment">嗯,我要留言!</a>
        </div>
            
            <div class="clear"></div>
        </div>
		<%@ include file="../library/footer.jsp"%>
        </div>
</body>
</html>
<script type="text/javascript" src="../js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../js/selector-min.js"></script>
<script type="text/javascript" src="../js/event-delegate-min.js"></script>
<script type="text/javascript" src="../js/yui-min.js"></script>
<script type="text/javascript" src="../js/yui-later.js"></script>
<script type="text/javascript" src="../js/ymPrompt4/ymPrompt.js"></script>
<script type="text/javascript">
	var orderId = new Array();	
	var orderQtt = new Array();	
	var orderName = new Array();
	var orderPrice = new Array();
(function() {
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;
	var addItem=function(id){
		<c:if test="${store.canOrder != true}">
			ymPrompt.win({title:'很抱歉，该店家暂未开通在线订餐功能',fixPosition:true,winPos:'c',winAlpha:'0.9',width:'454',height:'332',showMask:false,iframe:{id:'myId',name:'myName',src:'noOpen.do?store=${store.storeId}'}});
		</c:if>
		<c:if test="${store.canOrder == true}">
		for(i=0;i<orderId.length;i++){
			if (id==orderId[i]){
				orderQtt[i]=orderQtt[i]+1;
				return 0;
			}
		}
		var newItem=orderId.length;
		orderId[newItem]=id;
		orderQtt[newItem]=1;
		//alert("price:"+document.getElementById(id+"_price").value);
		orderName[newItem]=document.getElementById(id+"_name").value;
		orderPrice[newItem]=parseFloat(document.getElementById(id+"_price").value);
		</c:if>
	}
	
	var deleteItem=function(id){
		for(i=0;i<orderId.length;i++){
			if (id==orderId[i]){
				if (orderQtt[i]>1){
					orderQtt[i]=orderQtt[i]-1;
					return 0;
				}
				else{
					for(j=i;j>0;j--)
					{
						orderId[j]=orderId[j-1];
						orderQtt[j]=orderQtt[j-1];
						orderName[j]=orderName[j-1];
						orderPrice[j]=orderPrice[j-1];
					}
					orderId.shift(i);
					orderQtt.shift(i);
					orderName.shift(i);
					orderPrice.shift(i);
					return 0;
				}
				return 0;
			}
		}
		
	}
	
	var orderListPrint=function(){
		var total=0;
		var fenshu=0;
		var temptext="";
		var orderText="<h4>您的订单：<a style='margin-left:60px;font-size:12px' href=\"#0001\"> 下单</a></h4><div class=\"order_list\" id=\"order_list\"><div class=\"order_list_content\"><table><tbody>";
		
		
		if (orderId.length==0){
			var orderText="<h4>您的订单：</h4><div class=\"order_list\" id=\"order_list\"><div class=\"order_list_content\"><table><tbody>"+"<tr><td>你还没有点餐哦！</td></tr>";
		}
		else{
			if (orderId.length>5)//###
				orderText="<h4>您的订单：<a style='margin-left:60px;font-size:12px' href=\"#0001\"> 下单</a></h4><div class=\"order_list\" id=\"order_list\"><div class=\"order_list_content scroll\"><table ><tbody>";

			for(i=0;i<orderId.length;i++){
				temptext=orderName[i];
				if(temptext.length > 11) 
  					temptext = temptext.substring(0,10)+"...";  
				orderText=orderText+"<tr><td colspan=\"3\" class=\"boldfoodname\">"+temptext
						+"</td></tr><tr><td  width=\"70px\">单价："+orderPrice[i]
						+"</td><td width=\"20px\"><span style=\"width:20px;\">元</span></td><td width=\"80px\" style=\"text-align:right;\">"
						+orderQtt[i]
						+"份 <input id=\""+"O"+orderId[i]+"\" type=\"image\" src=\"../image/shop/button-minus.gif\"/></td></tr>"
				total=total+orderPrice[i]*orderQtt[i];
				fenshu=fenshu+orderQtt[i];
			}
			total=Math.round(total*10)/10;
		}
		
		orderText=orderText+"</tbody></table></div>"+"<table><tbody<tr><td class=\" boldfoodname\"  width=\"45px\">总价：</td><td class=\"\" style=\"text-align:right;\" width=\"95px\">"
		+total+"</td><td class=\" boldfoodname\" style=\"text-align:center;\" width=\"60px\">元 <a href=\"#0001\"> 下单</a>"
		+"</td></tr></tbody></table><div>";
		document.getElementById("order_list_div").innerHTML=orderText;
	}
	
	
	var onClickPlus = function (event, matchedEl, container) {
		
		var id=Dom.generateId(matchedEl);
		id=Dom.generateId(Dom.getAncestorByClassName(matchedEl,"menuli"));		
		addItem(id);
		orderListPrint();
		

		
	}
	
	var onClickMinus = function (event, matchedEl, container) {
		var id=Dom.generateId(matchedEl);
		id=Dom.generateId(Dom.getAncestorByClassName(matchedEl,"menuli"));		
		deleteItem(id);		
		orderListPrint();


		
	}
	
	var onClickOrderMinus = function (event, matchedEl, container) {
		var id=Dom.generateId(matchedEl);
		id=id.substring(1);	
		deleteItem(id);		
		orderListPrint();		
	}

	Event.delegate("menu", "click", onClickPlus,"a");
	Event.delegate("menu", "click", onClickMinus,"input");
	Event.delegate("order_list_div", "click", onClickOrderMinus,"input");
	
	function changeXY(){
		var scrolltop;
		scrolltop=Dom.getDocumentScrollTop();
		var X=Dom.getX("shop_main");
		Dom.setX("order_list_div",X+584);
		Dom.setX("menu_nav",X-188);
		if (scrolltop<267){
			var Y;
			Y=Dom.getY("shop_main")+1;
			Dom.setY("order_list_div",Y);
			Dom.setY("menu_nav",Y);
		}
		else{
			scrolltop=scrolltop+150;
			Dom.setY("order_list_div",scrolltop);
			Dom.setY("menu_nav",scrolltop);
		}
		Dom.setStyle("order_list_div","height","296px");
		Dom.setStyle("menu_nav","height","296px");
	}
	
	var onLoad = function(){
		 YAHOO.lang.later(15,"order_list_div",changeXY,1,true);
	}
	
	window.onload=function(){   
		onLoad();
	};     
	
	var onClickSwap = function(){
		 if (Dom.hasClass("menu_panel","menu_list_style_2")){
			 Dom.removeClass("menu_panel","menu_list_style_2");
			 Dom.addClass("menu_panel","menu_list_style_1");
		 }
		 else{
			 Dom.removeClass("menu_panel","menu_list_style_1");
			 Dom.addClass("menu_panel","menu_list_style_2");
		 }
	}
	
	
	Event.on("swap_menu_mode", "click", onClickSwap);
	
})();

function checkmobile(mobile){
 var reg0=/^13\d{9,9}$/;   //130--139。至少11位
 var reg1=/^15\d{9,9}$/;   //150--159。至少11位
 var reg2=/^18\d{9,9}$/;   //180--189。至少11位
 var my=false;
 if (reg0.test(mobile))my=true;
 if (reg1.test(mobile))my=true;
 if (reg2.test(mobile))my=true;
 if (!my){
 alert('请输入正确的手机号码');
 }
 return my;
}
</script>
<c:if test="${store.canOrder == true}">
<c:if test="${store.canOrderNow == true}">
<script type="text/javascript">
			function onOrder(){
			var name = document.getElementById("name").value;
			var tele = document.getElementById("tele").value;
			var address = document.getElementById("address").value;
			var others = document.getElementById("others").value;
			var msg = "";
			
			//orderQtt;	
			//orderPrice;
			if(orderId.length == 0){
				msg+="您还没有订餐哦！\n";
				alert(msg);
				return ;
			}
			if(tele == ""){
				msg+="请输入电话号码！\n";
				document.addOrderForm.tele.focus();
				alert(msg);
				return ;
			}
			if(name == ""){
				msg+="请输入称呼，方便店家联系～\n";
				alert(msg);
				return ;
			}
			if(!checkmobile(tele)){
				document.addOrderForm.tele.focus();
				return ;
			}
			if(address == ""){
				msg+="请输入地址！\n";
				document.addOrderForm.address.focus();
				alert(msg);
				return ;
			}
			if(msg != ""){
				alert(msg);
				return ;
			}
			var act = "addOrder.do?"
			//var act = "addOrder.do?address="+encodeURI(address)+"&tele="+tele+"&others="+encodeURI(others);
			for(i=0;i<orderId.length;++i){
				act += "itemIds="+orderId[i]+"&"+orderId[i]+"_num="+orderQtt[i]+"&";
			}
			document.addOrderForm.action = act;
			document.addOrderForm.submit();
		}
		
		function onAddress(dom_a){
			var addr =	document.getElementById(dom_a).innerHTML;
			document.getElementById("address").value=addr;
		}
		function showOrder(){
			ymPrompt.win({title:'订单确认',fixPosition:true,winPos:'cb',maxBtn:false,minBtn:false,width:750,height:500,iframe:{id:'myId',name:'myName',src:'orderComfirmBody.jsp'}});
		}

</script>
</c:if>
<c:if test="${store.canOrderNow != true}">
	<script type="text/javascript">
			function onOrder(){
				alert('不在营业时间！');
			}
	</script>
</c:if>
</c:if>
<c:if test="${store.canOrder != true}">
	<script type="text/javascript">
			function onOrder(){
					ymPrompt.win({title:'很抱歉，该店家暂未开通在线订餐功能',fixPosition:true,winPos:'c',winAlpha:'0.9',width:'454',height:'332',showMask:false,iframe:{id:'myId',name:'myName',src:'noOpen.do?store=${store.storeId}'}});
			}
	</script>
</c:if>
<script type="text/javascript">
	function tips(){
		ymPrompt.win({title:'所在地确认',fixPosition:true,btn:[["确定","ok"]],winPos:'c',winAlpha:'0.9',width:'620',height:'300',showMask:false,iframe:{id:'myId',name:'myName',src:'checkBlock.do?store=${store.storeId}'}});
	}
<!-- test="${u_block == null }">tips();-->
</script>
