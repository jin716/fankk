<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link href="css/pi.css" rel="stylesheet" type="text/css" />
<link href="css/pi_setup.css" rel="stylesheet" type="text/css" />	
<LINK rel=stylesheet type=text/css href="order_queue/tbsp.css">
<LINK rel=stylesheet type=text/css href="order_queue/common_v2.css">
<LINK rel=stylesheet type=text/css href="order_queue/common.css">
<LINK rel=stylesheet type=text/css href="order_queue/item_list_v2.1.css">
<script type="text/javascript" src="../../js/tools.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>

<STYLE type=text/css>.item-list-col6 {
	WIDTH: 128px
}
.item-list-bd TABLE {
	WIDTH: auto !important
}
.item-list-col1 {
	WIDTH: 200px
}
#near_by_block{
	width:490px;
}
#near_by_block li{
	margin-top:5px;
}
#near_by_block a{
	display:block;
	width:90%;
}
#near_by_block a:hover{
}
</STYLE>
<script type="text/javascript">
		function onSearch(){
		var key = document.getElementById('KeyWord_1').value;
		if ((key == "")){
			return;
		}
		else{
			document.getElementById('KeyWord').value = encodeURI(key);
			document.searchForm.submit();
		}
	}
	function search_ready(){
		var key = document.getElementById('KeyWord_1').value;
		if ((key == "")){
			return false;
		}
		else{
			document.getElementById('KeyWord').value = encodeURI(key);
			return true;
		}
	}
	</script>
  </head>
  <body>
<div class="main" id="maindiv">
        <div class="h4title"><h4>店铺管理<span style="font-weight: normal;"></span></h4></div>
</div>
<DIV class=main-wrap style="margin-left:16px;">

<DIV id=main-content>

<DIV class=item-list>
<DIV class=item-list-hd>
	<UL class="item-list-tabs item-list-tabs-flexible clearfix" style="!margin-top:-12px;height:27px;">
	  <LI  class = "current"><A href="#">查询管理</A> </LI>
	  <LI><A href="welcome.do?action=storeAdd">添加店铺</A> </LI>
	</UL>
</DIV>

<DIV class="item-list-bd" style="width:764px;">
<div class="bcontentlist">
  	<form name="searchForm" action="welcome.do" method="get" onsubmit="return search_ready()">
            <input type="hidden" value="storeList" name="action"/>
            <input type="hidden" value="" name="KeyWord" id="KeyWord"/>
  	<table width="720" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">            
            <tr class="order-item">
            	<td width="250" class=order-hd>搜索</td>
            	<td width="350"><input type="text" id="KeyWord_1" name="KeyWord_1" value="${real_key}"></td>
            	<td width="120"><input type="button" onclick="onSearch()" value="搜索"></td>
            </tr>
    </table>
    </form>
    <c:if test="${store_list!=null}">
    <table width="720" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">            
            <tr>
              	<td width="720"  class=order-hd>地图</td>
            </tr>
             <tr>
              	<td  width="720" height="300">
              		<iframe width="710"  height="300" id="mapFrame" name="mapFrame" frameborder="no" border="0" scrolling="no">
                	</iframe>
                </td>
            </tr>
		</table>
	<form name="mapForm" action="../../map.do" method="get" target="mapFrame">
    	<input type="hidden" name="type" value="stores"/>
    	<input type="hidden" name="key" id="key" value=""/>
    	<input type="hidden" name="height" value="300"/>
    	<input type="hidden" name="width" value="710"/>
    </form>
    <script type="text/javascript">
    	document.getElementById("key").value = '${key}';
    	document.mapForm.submit();
    </script>
  	<table width="720" style="margin-top:20px;border-right:1px solid #f3f3f3;border-top:1px solid #f3f3f3" class="order success-order xcard">            
             <tr class="order-item">
            	<td width="200" class=order-hd>铺名</td>
            	<td width="200" class=order-hd>所在小区</td>
            	<td width="320" class=order-hd>操作</td>
            </tr>
		    <c:forEach items="${store_list}" var="store">
				<tr>
					<td>${store.storeName}</td>
					<td>${store.block.blockName}</td>
					<td>
						<a href="welcome.do?action=menuUp&store=${store.storeId}">修改</a><br>
						<a href="welcome.do?action=account&store=${store.storeId}">帐户管理</a>
					</td>
				</tr>
				
			</c:forEach>
				<tr><td colspan="3">只显示当前页，请使用精确的关键字</td></tr>
		</table>
		</c:if>
  	</div>
</DIV>
</DIV></DIV></DIV>
</body>
</html>




