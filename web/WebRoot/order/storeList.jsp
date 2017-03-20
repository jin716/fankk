<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ymai.struts.Page"%>
<%@ page import="com.ymai.struts.CookieUtil"%>
<%@ page import="com.ymai.hibernate.Block"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${block.blockName}外卖,${block.blockName}外送,${block.blockName}订餐,${block.blockName}外卖电话,饭快快：网上送餐,免费,快捷,不占线</title>
<meta name ="keywords" content="${block.blockName}外卖,${block.blockName}外送,${block.blockName}订餐,${block.blockName}外卖电话,饭快快：网上送餐,免费,快捷,不占线">
<meta name="description" content="饭快快,叫外卖不占线,${block.blockName}的外卖店家">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/shop_list.css" rel="stylesheet" type="text/css" />
<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/ymPrompt4/ymPrompt.js"></script>
<link rel="stylesheet" id='skin' type="text/css" href="../js/ymPrompt4/skin/simple/ymPrompt.css" />
</head>


<body>
<%@ include file="../library/stateBanner.jsp"%>
	<div id="wrapper">
		<%@ include file="../library/header.jsp"%>
        <div id="s_ibody">
        	
            <%@ include file="../library/main_nav.jsp"%>
            <div id="bread">
            	您的位置: 
                <a href="../index.jsp">首页</a>
                 > 
                <a href="blockList_${block.area.areaId}">${block.area.areaName}</a>
                  > 
                <span class="current">${block.blockName}</span>
        </div>

        	
            
            <div id="s_main">
            
            <ul class="shop_list_ul">
            
            <c:forEach items="${page.list}" var="store">
            	<li class="shop_list_li">
                <div class="shop_list_div" >
                
                    <div class="shop_logo">
                    	<a href="store_${store.storeId}_${block.blockId}" target="_blank">
                        	<img width="116" height="78" alt="${store.storeName}" src="..${store.storeImgSrc}" >
                        </a>
                  	</div>
                    <div class="shop_brief">
                        <div class="shop_title_line">
                            <span class="shop_title_name"><a class="shop_title_a" href="store_${store.storeId}_${block.blockId}" target="_blank">
                            <strong>${store.storeName}</strong></a></span>
                            <c:if test="${store.canOrder == true}">
								<span style="float:left;display:block;margin-left:16px;" ><img src="../image/shop_list/zxdc.png" width="65" height="26" />
							</c:if>
                            </span>
                            <span class="shop_title_comment">
                                        <a class="shop_title_comment_a" href="getComment.do?store=${store.storeId}&block=${block.blockId}"
 target="_blank" >评论(<span class="shop_title_comment_span">${store.storeEv }</span>)</a>

                                        <a class="shop_title_comment_a" href="getComment.do?store=${store.storeId}&block=${block.blockId}"
 target="_blank" >口味(<span class="shop_title_comment_span">${store.storeTaste}</span>)</a>

                                        <a class="shop_title_comment_a" href="getComment.do?store=${store.storeId}&block=${block.blockId}"
 target="_blank" >速度(<span class="shop_title_comment_span">${store.storeSpeed}</span>)</a>
                          				<a class="shop_title_comment_a" href="getComment.do?store=${store.storeId}&block=${block.blockId}"
 target="_blank" >健康(<span class="shop_title_comment_span">${store.storeHealth}</span>)</a>
                          </span>
                        </div>
                        
                         <div class="shop_brief_intro">
                        	<div class="shop_brief_intro_div">
                            	${store.storeAddrName}&nbsp;&nbsp;
                                <span><img src="../image/shop_list/map.gif" class="shop_brief_intro_map"  alt="">
 								<a href="javascript:ymPrompt.win({title:'${store.storeName}',fixPosition:true,winPos:'rb',maxBtn:false,minBtn:false,width:420,height:350,iframe:{id:'myId',name:'myName',src:'../map.do?type=store&store=${store.storeId}&height=340&width=380'}})" class="shop_brief_intro_div_ckdt">查看地图</a>                                </span><br>
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
                            	<c:if test="${store.storeStars <= 1.7}"><span class="sstar10" title="1星商户"></span></c:if>
                            </div>              
                            <!-- //### -->
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
                <div class="pagination" style="width:776px;">
                    <ul>
                    <li><a href="storeList_${block.blockId}&page=${page.pre}">上一页</a></li>
                    <c:forEach items="${page.pageList}" var="pageNo" varStatus="status">
                   		<c:if test="${pageNo == page.cur}"><li class="currentpage">${pageNo}</li></c:if>
                   		<c:if test="${pageNo == '-1'}"><li>...</li></c:if>
                    	<c:if test="${pageNo != '-1'}"><c:if test="${pageNo != page.cur}"><li><a href="storeList_${block.blockId}&page=${pageNo}">${pageNo}</a></li></c:if></c:if>
                    </c:forEach>
                    <li><a href="storeList_${block.blockId}&page=${page.next}">下一页</a></li>
                    </ul>
                </div>
            	            
                
            	
          	</div>
            
            <div id="s_advertise">
                <img src="../image/shop_list/tbrm.png" width="98" height="39" alt="淘宝热卖" />
            <iframe frameborder="0" marginheight="0" marginwidth="0" border="0" id="alimamaifrm" name="alimamaifrm" scrolling="no" height="142px" width="186px" style="width:186px;height:142px" src="http://z.alimama.com/cpscode.php?pid=mm_17357224_0_0&w=192&h=142&uid=13085188&m=41&t=1000&bgc=FFFFFF&bdc=ffffff&tc=0000FF&sc=37"></iframe>
            	<iframe frameborder="0" marginheight="0" marginwidth="0" border="0" id="alimamaifrm" name="alimamaifrm" scrolling="no" height="142px" width="186px" style="width:186px;height:142px" src="http://z.alimama.com/cpscode.php?pid=mm_17357224_0_0&w=192&h=142&uid=12970923&m=41&t=1000&bgc=FFFFFF&bdc=ffffff&tc=0000FF&sc=14"></iframe>
              <iframe frameborder="0" marginheight="0" marginwidth="0" border="0" id="alimamaifrm" name="alimamaifrm" scrolling="no" height="142px" width="186px" style="width:186px;height:142px" src="http://z.alimama.com/cpscode.php?pid=mm_17357224_0_0&w=192&h=142&uid=11064982&m=41&t=1000&bgc=FFFFFF&bdc=ffffff&tc=0000FF&sc=1056"></iframe>
                <iframe frameborder="0" marginheight="0" marginwidth="0" border="0" id="alimamaifrm" name="alimamaifrm" scrolling="no" height="142px" width="186px" style="width:186px;height:142px" src="http://z.alimama.com/cpscode.php?pid=mm_17357224_0_0&w=192&h=142&uid=13093583&m=41&t=1000&bgc=FFFFFF&bdc=ffffff&tc=0000FF&sc=14"></iframe>
              <iframe frameborder="0" marginheight="0" marginwidth="0" border="0" id="alimamaifrm" name="alimamaifrm" scrolling="no" height="142px" width="186px" style="width:186px;height:142px" src="http://z.alimama.com/cpscode.php?pid=mm_17357224_0_0&w=192&h=142&uid=13163903&m=41&t=1000&bgc=FFFFFF&bdc=ffffff&tc=0000FF&sc=37"></iframe>
            </div>
            <div class="clear"></div>
        </div>
		<%@ include file="../library/footer.jsp"%>
        </div>
</body>
</html>

