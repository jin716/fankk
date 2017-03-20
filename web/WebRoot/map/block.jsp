<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%
  	String url = request.getRequestURL().toString();
  	if(url.contains("www.fankk.com")){%>  
  	<script type="text/javascript" src="http://api.map.baidu.com/api?key=d5354598c297127714a3c6b882d63261&v=1.0&services=true" ></script>
  	<%}
  	else if(url.contains("gz.fankk.com")){%>  
  	<script type="text/javascript" src="http://api.map.baidu.com/api?key=0a06f908a2d8225506a02036fa744df8&v=1.0&services=true" ></script>
  	<%}
  	else if(url.contains("fankk.com")){%>  
  	<script type="text/javascript" src="http://api.map.baidu.com/api?key=0b993c3875b6f45c022cc80df50e028d&v=1.0&services=true" ></script>
  	<%}
  	else{%>  
  	<script type="text/javascript" src="http://api.map.baidu.com/api?key=d5354598c297127714a3c6b882d63261&v=1.0&services=true" ></script>
  	<%}
  %>
  
  
  </head>
  <body>
  	<input type="button" onclick="myPushpin.open()" value="标注" />
  
	<div style="width:${width}px;height:${height}px;border:1px solid gray" id="container"></div>  
	
	<script type="text/javascript">  
		var map = new BMap.Map("container");          // 创建地图实例  
		var point = new BMap.Point(${block.longitude},  ${block.latitude});  // 创建点坐标  
		map.centerAndZoom(point, 15);
		var opts = {type: BMAP_NAVIGATION_CONTROL_SMALL};
		map.addControl(new BMap.NavigationControl(opts));
		var marker = new BMap.Marker(point);        // 创建标注  
		map.addOverlay(marker); 
		var myPushpin = new BMap.PushpinTool(map);   // 创建标注工具实例
		myPushpin.addEventListener("markend", function(e){
			parent.document.getElementById("latidute").value = e.marker.getPoint().lat;
			parent.document.getElementById("longitude").value = e.marker.getPoint().lng;
		});
		map.addControl(new BMap.ScaleControl());  
		
	</script>  
	
  </body>
</html>
