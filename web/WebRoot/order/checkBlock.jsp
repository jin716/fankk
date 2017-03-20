<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
  <style type="text/css">
  	div{float:left;clear:left;margin-top:20px;color:#ef5919;font-size:15px;font-weight:600;text-align:center;width:500px;}
  	ul{list-style-type:none;width:500px;}
  	li{width:160px;float:left;font-size:13px;color:#000000;}
  	input{width:130px;height:20px;}
  </style>
  </head>
  <body>
  <div>
  	该店家只对以下地区进行配送，请确认您是否在这些地点附近：
  </div>
  <div>
    	${store.storeSendDistanceText}
   </div>
  </body>
</html>
