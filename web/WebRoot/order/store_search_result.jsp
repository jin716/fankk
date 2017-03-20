<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ymai.struts.Page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>饭快快广州${block.blockName}外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线,${block.blockName}地区的外卖店铺">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/shop_list.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" id='skin' type="text/css" href="../js/ymPrompt4/skin/simple/ymPrompt.css" />
</head>
<body>
<%@ include file="../library/stateBanner.jsp"%>
	<div id="wrapper">
		<%@ include file="../library/header.jsp"%>
        
        <div id="s_ibody">
        	
            <%@ include file="../library/main_nav.jsp"%>
          <form action="search.do" method="get" onsubmit="return search_ready()">
            <div id="bread">
            	<div style="width:300px;float:left;">
            	您的位置: 
                <a href="../index.jsp">首页</a>
                 > 
                <span class="current">名称与${real_key}有关的店铺</span>
                </div>
                <div style="width:300px;height:20px;float:left;margin-left:250px;">
                	<span>				
                		<input style="height:18px;" id="KeyWord" type="text" value="${real_key}">
                	</span>
                	<input autocomplete="off" id="key" name="KeyWord" type="hidden" class="gray" value="">
                	<span><select name="searchType">
                				<option value="1">店铺名</option>
                				<option value="0">小区</option>
                			</select>
                	</span>
                	<span><input style="height:25px;" type="submit" value="搜索"></span>
                </div>
        	</div>
			</form>
        	
            
            <div id="s_main">
            
            <ul class="shop_list_ul">
            
            <c:forEach items="${page.list}" var="store">
            	<li class="shop_list_li">
                <div class="shop_list_div" >
                
                    <div class="shop_logo">
                    	<a href="../order/store_${store.storeId}" target="_blank">
                        	<img width="116" height="78" alt="${store.storeName}" src="..${store.storeImgSrc}" >
                        </a>
                  	</div>
                    <div class="shop_brief">
                        <div class="shop_title_line">
                            <span class="shop_title_name"><a class="shop_title_a" href="../order/store_${store.storeId}" target="_blank">
                            <strong>${store.storeName}</strong></a></span>
                            
                            <span class="shop_title_comment">
                                        <a class="shop_title_comment_a"
href="../order/getComment.do?store=${store.storeId}" target="_blank" >评论</a>

                                        <a class="shop_title_comment_a" 
href="../order/getComment.do?store=${store.storeId}" target="_blank" >口味(<span class="shop_title_comment_span">${store.storeTaste}</span>)</a>

                                        <a class="shop_title_comment_a" 
href="../order/getComment.do?store=${store.storeId}" target="_blank" >速度(<span class="shop_title_comment_span">${store.storeSpeed}</span>)</a>
                          				<a class="shop_title_comment_a" 
href="../order/getComment.do?store=${store.storeId}" target="_blank" >健康(<span class="shop_title_comment_span">${store.storeHealth}</span>)</a>
                          </span>
                        </div>
                        
                         <div class="shop_brief_intro">
                        	<div class="shop_brief_intro_div">
                            	${store.storeAddrName}&nbsp;&nbsp;
                                <span><img src="../image/shop_list/map.gif" class="shop_brief_intro_map"  alt="">
                            <a href="javascript:ymPrompt.win({title:'${store.storeName}',fixPosition:true,winPos:'rb',maxBtn:false,minBtn:false,width:420,height:350,iframe:{id:'myId',name:'myName',src:'../map.do?type=store&store=${store.storeId}&height=340&width=380'}})" class="shop_brief_intro_div_ckdt">查看地图</a>
                            <div class="shop_brief_intro_div_text">
                            营业时间：${store.storeStartTimeString}--${store.storeEndTimeString}&nbsp;&nbsp;<br>
                            起送价格：${store.storeLowCost }元&nbsp;&nbsp;  外送价格：${store.storeSendCost }元
                        	</div>
                        	</div> 
                            
                            <div class="star_div">
                            	<c:if test="${store.storeStars > 4.7}"><c:if test="${store.storeStars <= 5}"><span class="sstar50" title="5星商户"></span></c:if></c:if>
                            	<c:if test="${store.storeStars > 4.3}"><c:if test="${store.storeStars <= 4.7}"><span class="sstar45" title="4星商户"></span></c:if></c:if>
                            	<c:if test="${store.storeStars > 3.7}"><c:if test="${store.storeStars <= 4.3}"><span class="sstar40" title="4星商户"></span></c:if></c:if>
                            	<c:if test="${store.storeStars > 3.3}"><c:if test="${store.storeStars <= 3.7}"><span class="sstar35" title="3星商户"></span></c:if></c:if>
                            	<c:if test="${store.storeStars > 2.7}"><c:if test="${store.storeStars <= 3.3}"><span class="sstar30" title="3星商户"></span></c:if></c:if>
                            	
                            	<c:if test="${store.storeStars > 1.7}"><c:if test="${store.storeStars <= 2.7}"><span class="sstar20" title="2星商户"></span></c:if></c:if>
                            	<c:if test="${store.storeStars > 0.7}"><c:if test="${store.storeStars <= 1.7}"><span class="sstar10" title="1星商户"></span></c:if></c:if>
                            	<c:if test="${store.storeStars <= 0.7}"><span class="sstar00" title="0星商户"></span></c:if>
                            </div>              
                            <c:if test="${store.canOrder == true}">
                                <c:if test="${store.isOnline == true}">
                            	<div class="dc_img"><a href="../order/store_${store.storeId}_${block.blockId}"></a></div>  
                            	</c:if>
                            	<c:if test="${store.isOnline != true}">
                            	<div class="xyz_img"></div>
                            	</c:if>
                            </c:if>
                            <c:if test="${store.canOrder != true}">
                            	<!--<div class="xyz_img"></div>-->
                            	<div class="dhdc_img"><a href="../order/store_${store.storeId}_${block.blockId}"></a></div>
                            </c:if>                     
                        </div>
                        
               	  </div>
                  </div>
                        
                       
            	</li>
            </c:forEach>
                
            </ul>
                <form name="pageSearch" method="get">
								<input name="searchType" value="0" type="hidden"/>
								<input name="KeyWord" value="${key}" type="hidden"/>
								<input name="page" id="s_page" value="1" type="hidden"/>

								<div class="pagination" style="width:776px;margin-top:5px;">
						                <ul>
						                    <c:if test="${page.cur == 1}"><li class="disablepage">上一页</li></c:if>
						                	<c:if test="${page.cur != 1}"><li><a href="javascript:toPage('${page.pre}')">上一页</a></li></c:if>
						                <c:forEach items="${page.pageList}" var="number">
						                    <c:if test="${number == page.cur}"><li class="currentpage">${number}</li></c:if>
						                    <c:if test="${number != -1}"><c:if test="${number !=  page.cur}"><li><a href="javascript:toPage('${number}')">${number}</a></li></c:if></c:if>
						               		<c:if test="${number == -1}">...</c:if>
						               		
						                </c:forEach>
						                   <c:if test="${page.next == page.cur}"><li class="disablepage">下一页</li></c:if>
						                   <c:if test="${page.next != page.cur}"><li ><a href="javascript:toPage('${page.next}')">下一页</a></li></c:if>
						                	
						                </ul>
						        </div>
						        </form>
            	            
                
            	
          	</div>
            
            <div id="s_advertise">
                <ul class="s_ad">
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/01.jpg" /></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/02.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/03.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/04.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/05.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/06.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/07.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/08.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/09.jpg"></a></li>
                  <li class="s_ad"><a href="###" target="_blank"><img src="../images/10.jpg"></a></li>                
               </ul>
            </div>
            <div class="clear"></div>
        </div>
		<%@ include file="../library/footer.jsp"%>
        </div>
</body>
</html>
<script type="text/javascript" src="../js/ymPrompt4/ymPrompt.js"></script>
<script type="text/javascript">
function search_ready(){
		var key = document.getElementById('KeyWord').value;
		if(key == ""){
			return false;
		}
		else{
			document.getElementById('key').value = encodeURI(key);
			return true;
		}
	}
function toPage(pageNo){
		document.getElementById("s_page").value = pageNo;
		document.pageSearch.submit();
	}
</script>
