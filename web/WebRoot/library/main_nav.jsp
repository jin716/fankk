<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String _path = request.getContextPath();
String _basePath = null;
if(request.getServerPort()==80){
	_basePath= request.getScheme()+"://"+request.getServerName()+_path+"/";
}
else {
	_basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+_path+"/";
}
%>
<link href="<%=_basePath%>css/Ymai.css" rel="stylesheet" type="text/css" />
    <link href="<%=_basePath%>css/taobao_nav.css" rel="stylesheet" type="text/css" />
    <div class="layout grid-m" id="channel">
      <div id="vertical-channel">
        <ul>
          <li class="current"><a href="<%=basePath%>index.jsp" 
        target="_self"><span>首页</span></a></li>
          <li><a href="<%=basePath%>jifen.do"  target="_self"><span>积分兑换</span></a></li>
          <li><a href="<%=basePath%>user/my.do"><span>我的饭快快</span></a></li>
          <li><a href="<%=basePath%>user/apply.jsp"><span>店商加盟</span></a></li>
        </ul>
      </div>
    </div>