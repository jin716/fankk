<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head><script language="javascript" src=" http://api.51ditu.com/js/maps.js "></script></head>
  <body>
	<div id="myMap" style="position:relative;width:${width}px; height:${height}px;"></div> 
    <script type="text/javascript">	
    	function getMouseOverCallBack(mk,html) 
		{ 
		        return function(){mk.openInfoWinHtml(html)} ;
		}
			var maps = new LTMaps( "myMap" );
		<c:if test="${block_list != null}">
			var points = new Array();
			<c:forEach items="${block_list}" var="block">
				points.push(new LTPoint( ${block.NTULongitude} , ${block.NTULatitude} ));
			</c:forEach>
		</c:if>
		maps.getBestMap(points);
		var control2 = new LTSmallMapControl();
		maps.addControl(control2);
	</script>
  </body>
</html>
