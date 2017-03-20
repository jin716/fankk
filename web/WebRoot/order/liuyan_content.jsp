<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>饭快快广州外卖：免费，快捷，不占线</title>
<meta name ="keywords" content="广州外卖,天河外卖,白云外卖,越秀外卖,花都外卖,番禺外卖,海珠外卖,荔湾外卖">
<meta name="description" content="饭快快,叫外卖不占线,顾客留言">
<link href="../css/Ymai.css" rel="stylesheet" type="text/css" />
<link href="../css/index.css" rel="stylesheet" type="text/css" />

<link href="../css/taobao_nav.css" rel="stylesheet" type="text/css" />
<link href="../css/stars.css" rel="stylesheet" type="text/css" />
<link href="../css/shop_comment.css" rel="stylesheet" type="text/css" />
<link href="../css/pagination.css" rel="stylesheet" type="text/css" />


</head>


<body>

	<div id="wrapper"><div class="clear"></div>
        
        <div id="shop_ibody">
        	      
        <div id="left_side">         	            
          
          
          <div id="left_comment">
            
            <div class="comment">
            	<ul>
            		<c:forEach items="${page.list}" var="comment">
                	<li>
	                        <span class="name">${comment.userName}(${comment.storeComntTimeString}):</span>
	
	                        <span class="text">${comment.storeComntDetail}</span>
	                        <div class="foot">
	                        	<span></span>
	                        </div>
                    	</li>
                    </c:forEach>


                </ul>
                <div class="pagination" style="width:700px;margin-top:16px;">
                    <ul>
                    <li><a href="getComment.do?type=liuyan&store=${store.storeId}&page=${page.pre}">上一页</a></li>
                    <c:forEach items="${page.pageList}" var="pageNo" varStatus="status">
                   		<c:if test="${pageNo == page.cur}"><li class="currentpage">${pageNo}</li></c:if>
                   		<c:if test="${pageNo == '-1'}"><li>...</li></c:if>
                    	<c:if test="${pageNo != '-1'}"><c:if test="${pageNo != page.cur}"><li><a href="getComment.do?type=liuyan&store=${store.storeId}&page=${pageNo}">${pageNo}</a></li></c:if></c:if>
                    </c:forEach>
                    <li><a href="getComment.do?type=liuyan&store=${store.storeId}&page=${page.next}">下一页</a></li>
                    </ul>
                </div>
            </div>
            
          </div>
          
                 
          
          
        </div>

            
            
            <div class="clear"></div>
        </div></div>
</body>
</html>
