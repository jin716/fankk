<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ymai.hibernate.*"%>
<%@ page import="com.ymai.struts.CookieUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
Block[] u_block = CookieUtil.getBlocksInCookies(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广州外卖,快餐外卖,写字楼外卖,网络点餐,饭快快：免费，快捷，不占线</title>
		<meta name ="keywords" content="广州外卖,快餐外卖,外卖美食,网上订餐,外卖电话">
		<meta name="description" content="外卖,外送,订餐,外卖电话,网上外卖,网上外送,网上订餐,饭快快：网上送餐,免费,快捷,不占线">
		<meta name="chinaz-site-verification" content="7db25af9-b504-4cea-803a-63f6cce3c2ab" />
		<link href="css/Ymai.css" rel="stylesheet" type="text/css" />
		<link href="css/index.css" rel="stylesheet" type="text/css" />
		<link href="css/taobao_nav.css" rel="stylesheet" type="text/css" />
		<link href="css/paipai_search.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
.search-form .gray {
	color: #C1C1C1;
}
</style>
	</head>
	<body>
		<!-- #BeginLibraryItem "/Library/state_banner.lbi" -->
		<%@ include file="/library/stateBanner.jsp"%>
		<!-- #EndLibraryItem -->
		<div id="wrapper">
			<%@ include file="/library/header.jsp"%>
			<div id="ibody">
				<!-- #BeginLibraryItem "/Library/nav_bar_home.lbi" -->
				<%@ include file="/library/main_nav.jsp"%>
				<!-- #EndLibraryItem -->
				<div class="firstview">
					<div class="col-sub">
						
						<!--S 最新功能-->
						<div class="function" id="newFunction" style="border-bottom-style:solid;">
				          <h3>加入饭快快<span id="pageSpan">2/3</span><em class="previous" 
				id="prev"></em><em class="next" id="next"></em></h3>
							<!-- 此处代码格式不可更改！<div><a><img>间不可间隔 -->
				          <div class="bd"><a target="_blank" 
				              href="#"><img src="image/index/index_50_50_dianJia.png" alt="外卖店家加盟" back_src="image/index/index_50_50_dianJia.png"></a>
				              <p><a target="_blank"  href="user/apply.jsp">快在饭快快注册自己的店铺吧！</a></p>
				          </div>
				  		  <div class="bd"><a target="_blank" 
				              href="#"><img src="image/index/index_50_50_ad.png" 
				              alt="商品分库存功能" back_src="image/index/index_50_50_ad.png"></a>
				              <p><a target="_blank" href="user/apply.jsp">快快在饭快快投放您的广告！</a></p>
				          </div>
				  		  <div class="bd"><a target="_blank" 
				              href="#"><img src="image/index/index_50_50_co.png"  
				              alt="合作" back_src="image/index/index_50_50_co.png"></a>
				                <p><a target="_blank" href="user/apply.jsp">饭快快期待与您的合作！</a></p>
				          </div><!--[if !IE]>|xGv00|f4a104c1449075ef4ad85719911e9ec4<![endif]-->
				        </div>
						<!--E 最新功能-->
						<div class="notice" style="margin-top:9px;">
							<ul class="hd" id="notice" style="color: #666666;">
								<li tabindex="0" class="current" id="tab-notice"
									style="font-weight: bold;">
									联系我们
								</li>
							</ul>
							<div class="bd" id="noticeContents"
								style=" padding-top: 5px;">
								<div style=""></div>
								<div style="width:100%;height:200px;">
									<table>
										<tr><td width="100">服务电话</td><td><span style="font-size:13px;color:#EB8E00;font-weight:600">020-28961310</span></td></tr>
										<tr><td height="30">电子邮箱</td><td>fankk001@gmail.com</td></tr>
										<tr><td>在线客服</td><td><a class="qq" target="blank" href="http://wpa.qq.com/msgrd?v=3&uin=1504053573&site=qq&menu=yes"></td></a></tr>
									</table>
								</div>
							</div>
						</div>
						<div class="ft" style="margin-bottom: 8px;"></div>
						
						<div class="hd3" style="margin-top: 8px;"></div>
						<div class="chengbao">
							<p>
								<a href="#"><img
										alt="饭快快" height="63px;" src="image/logo_v2_1.png">
								</a>
							</p>
							<ul style="display: block; color: #777777;">
								<li>
									<span>饭快快就是在网上订的外卖！</span>
								</li>
								<li>
									<span>对，你可以在我们这网上订餐</span>
								</li>
								<li>
									<span>还可以查到你周边的外卖电话</span>
								</li>
                                <li>
									<span>与大家分享你的外卖订餐体验</span>
								</li>
								<li>
									<span>广州外卖、订餐，尽在饭快快！</span>
								</li>
							</ul>
						</div>
						<div class="ft"></div>
					</div>
				</div>
				<div class="frame_8px_width"></div>
				<div id="main" style="margin-right: 8px;">

					<div id="main_func">
						<div class="head_paipai" id="primary_site"
							style="padding-left: 8px;">
							<div class="m" id="search_bar">
								<div class="search-bar">

									<div class="search-form">
										<div class="search-tabs" id="searchTab">
											<p id="search_tabs_item1" attr="0" class="now">
												<span>小区</span>
											</p>
											<p class="" attr="1" class="now">
												<span>店铺</span>
											</p>
										</div>
										<div class="search-input">
											<form name="searchForm" action="order/search.do"
												onsubmit="return search_ready()" method="get">
												<input id="searchType" name="searchType" value="0"
													type="hidden">
												<input autocomplete="off" id="key" name="KeyWord"
													type="hidden" class="gray" value="">
												<input autocomplete="off" id="KeyWord_1" type="text"
													class="gray" value="输入您所在的地段名称，如：华景,或 hj" style="background: #FFF">
											</form>
											<a class="s_btn" href="javascript:onSearch()"></a>
											<span class="tl"></span>
											<span class="tr"></span>
										</div>
										<div class="hot-items">
											本市区域：
												<a title="天河外卖" href="order/blockList_1">天河</a>
												<a title="越秀外卖" href="order/blockList_2">越秀</a>
												<a title="海珠外卖" href="order/blockList_5">海珠</a> 
												<a title="荔湾外卖" href="order/blockList_6">荔湾</a> 
												<a title="白云外卖" href="order/blockList_7">白云</a> 
												<a title="花都外卖" href="order/blockList_3">花都</a> 
												<a title="番禺外卖" href="order/blockList_4">番禺</a>
											</div>
										<div class="hot-items"
											style="padding-top: 8px !important; padding-top: 0px;">
											常用区域：
											<%for(Block _block : u_block){ 
												if(_block != null){
													%><a title="<%=_block.getBlockName()%>附近外卖店铺" href="order/storeList_<%=_block.getBlockId()%>"><%=_block.getBlockName()%></a><%
												}
											}%>
											<!--<a target="_blank" href="order/store.do?store=1">饭快快测试店铺</a>-->
										</div>
									</div>



								</div>
							</div>
						</div>
						<div class="main_func_img">
							<img src="image/dc.png" width="490" />
						</div>
					</div>



					<div class="slider" style="display: ; margin-top: 8px;">
						<ul class="num" id="homePushName" style="display: none">
							<li class="" id="homeAd0">
								1
							</li>
							<li class="" id="homeAd1">
								2
							</li>
							<li class="" id="homeAd2">
								3
							</li>
							<li class="" id="homeAd3">
								4
							</li>
							<li class="" id="homeAd4">
								5
							</li>
						</ul>
						<ul class="bg" id="homePushBg" style="display: none">
							<li>
								&nbsp;
							</li>
							<li>
								&nbsp;
							</li>
							<li>
								&nbsp;
							</li>
							<li>
								&nbsp;
							</li>
							<li>
								&nbsp;
							</li>
						</ul>
						<ul style="margin-top: 0px;" class="pic" id="homePushShow">
          <li id="homePushShow0" style="height: 180px; overflow: hidden;"><a 
            href="javascript:void(0)"
             ><img 
             alt="" src="image/scroll_ad/1.png"
            back_src="image/scroll_ad/1.png"></a></li>
          <li id="homePushShow1" style="height: 180px; overflow: hidden;"><a 
            href="javascript:void(0)" 
            ><img alt="" src="image/scroll_ad/2.png"
            back_src="image/scroll_ad/2.png"></a></li>
          <li id="homePushShow2" style="height: 180px; overflow: hidden;"><a 
            href="javascript:void(0)"
             ><img 
            
             alt="" src="image/scroll_ad/3.png"
            back_src="image/scroll_ad/3.png"></a></li>
          <li id="homePushShow3" style="height: 180px; overflow: hidden;"><a 
            href="javascript:void(0)" ><img
            
             alt="" src="image/scroll_ad/4.png"
            back_src="image/scroll_ad/4.png"></a></li>
          <li id="homePushShow4" style="height: 180px; overflow: hidden;"><a 
            href="javascript:void(0)"><img alt=""  src="image/scroll_ad/5.png"
            back_src="image/scroll_ad/5.png"></a></li>
        </ul>
					</div>
				</div>
				<div id="right_sidebar">
					<div class="catatest">
						全市外送的广州外卖品牌
					</div>
					<div id="right_ad_area">
						<div class="brandLogoShow">
							<ul>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E8%2582%25AF%25E5%25BE%25B7%25E5%259F%25BA" title="肯德基"><img
											src="image/index/brand/sKFC.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E8%2582%25AF%25E5%25BE%25B7%25E5%259F%25BA" title="肯德基">
									肯德基</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E7%259C%259F%25E5%258A%259F%25E5%25A4%25AB" title="真功夫"><img
											src="image/index/brand/szgf.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_KeyWord=%25E7%259C%259F%25E5%258A%259F%25E5%25A4%25AB" title="真功夫">
									真功夫
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E9%25BA%25A6%25E5%25BD%2593%25E5%258A%25B3&searchType=1" title="麦当劳"><img
											src="image/index/brand/smls.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E9%25BA%25A6%25E5%25BD%2593%25E5%258A%25B3&searchType=1" title="麦当劳">
									麦当劳
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E5%25BF%2585%25E8%2583%259C%25E5%25AE%2585%25E6%2580%25A5%25E9%2580%2581&searchType=1" title="必胜宅急送"><img
											src="image/index/brand/sbs.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E5%25BF%2585%25E8%2583%259C%25E5%25AE%2585%25E6%2580%25A5%25E9%2580%2581&searchType=1" title="必胜宅急送">
									必胜宅急送
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E9%2583%25BD%25E5%259F%258E%25E5%25BF%25AB%25E9%25A4%2590&searchType=1" title="都城快餐"><img
											src="image/index/brand/sdckc.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E9%2583%25BD%25E5%259F%258E%25E5%25BF%25AB%25E9%25A4%2590&searchType=1" title="都城快餐">
									都城快餐
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E5%258D%258E%25E8%25BE%2589%25E6%258B%2589%25E8%2582%25A0&searchType=1" title="华辉拉肠"><img
											src="image/index/brand/shhlc.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E5%258D%258E%25E8%25BE%2589%25E6%258B%2589%25E8%2582%25A0&searchType=1" title="华辉拉肠">
									华辉拉肠
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E8%2582%25AF%25E5%25BE%25B7%25E5%259F%25BA" title="肯德基"><img
											src="image/index/brand/sKFC.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_KeyWord=%25E8%2582%25AF%25E5%25BE%25B7%25E5%259F%25BA" title="肯德基">
									肯德基</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E7%259C%259F%25E5%258A%259F%25E5%25A4%25AB" title="真功夫"><img
											src="image/index/brand/szgf.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E7%259C%259F%25E5%258A%259F%25E5%25A4%25AB" title="真功夫">
									真功夫
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E9%25BA%25A6%25E5%25BD%2593%25E5%258A%25B3&searchType=1" title="麦当劳"><img
											src="image/index/brand/smls.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E9%25BA%25A6%25E5%25BD%2593%25E5%258A%25B3&searchType=1" title="麦当劳">
									麦当劳
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E5%25BF%2585%25E8%2583%259C%25E5%25AE%2585%25E6%2580%25A5%25E9%2580%2581&searchType=1" title="必胜宅急送"><img
											src="image/index/brand/sbs.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E5%25BF%2585%25E8%2583%259C%25E5%25AE%2585%25E6%2580%25A5%25E9%2580%2581&searchType=1" title="必胜宅急送">
									必胜宅急送
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E9%2583%25BD%25E5%259F%258E%25E5%25BF%25AB%25E9%25A4%2590&searchType=1" title="都城快餐"><img
											src="image/index/brand/sdckc.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E9%2583%25BD%25E5%259F%258E%25E5%25BF%25AB%25E9%25A4%2590&searchType=1" title="都城快餐">
									都城快餐
									</a>
								</li>
								<li>
									<a href="http://www.fankk.com/search_s/key_%25E5%258D%258E%25E8%25BE%2589%25E6%258B%2589%25E8%2582%25A0&searchType=1" title="华辉拉肠"><img
											src="image/index/brand/shhlc.jpg" width="75"
											height="50" />
									</a>
									<a class="atext" href="http://www.fankk.com/search_s/key_%25E5%258D%258E%25E8%25BE%2589%25E6%258B%2589%25E8%2582%25A0&searchType=1" title="华辉拉肠">
									华辉拉肠
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<%@ include file="/library/footer.jsp"%>
				<p><script src="http://s14.cnzz.com/stat.php?id=2287605&web_id=2287605&show=pic" language="JavaScript"></script></p> 			
			</div>
		</div>
		<script type="text/javascript">
//横幅滚屏广告的脚本  
(function(){var nowOrder=$randomInt(5),
    pushTop=0,
    rollTime=30,
	pushOrder=nowOrder,
	nowPush=$id('homePushShow'),
	toImgIntr,
	pushIntr;
focusImg(nowOrder);
//初次进入，自动循环一次
var rollIntr=setInterval(function(){
    nowOrder=(++nowOrder>4)?0:nowOrder;
    (--rollTime)>0?focusImg(nowOrder):clearInterval(rollIntr);
},7000);
$id("homePushName").onmouseover=function(e){
    var e=e||window.event,
        target=e.srcElement||e.target;
    if('li'==target.tagName.toLowerCase()){
		clearTimeout(toImgIntr);
		toImgIntr=setTimeout(function(){
			focusImg(target.id.replace("homeAd",""));
		},200);
    };
    clearInterval(rollIntr);
};
function focusImg(num){
    var nowShow=$id('homeAd'+num),
        nowObj=$id('homePushShow'+num),
        nowPic=nowObj.childNodes[0].childNodes[0],
        num=num*1,
        end=num*180,
        speed=(num-pushOrder)>0?18:-18;
    if(nowPic.src==''){
        nowPic.src=nowPic.getAttribute('back_src');
        nowObj.style.visibility='';
    };
    if(num==pushOrder){
        pushTop=end;
        nowPush.style.marginTop="-"+pushTop+"px"; 
        nowShow.className='current';
        return;
    }   
    clearInterval(pushIntr);
    //先把距离默认拉到只有一个图片间隔
    pushTop=(speed>0?(num-1):(num+1))*180;
    pushIntr=setInterval(function(){
        if(end!=pushTop){
            pushTop+=speed;
            nowPush.style.marginTop="-"+pushTop+"px"; 
        }else{
            nowShow.className='current';
            if(num!=pushOrder){
                $id('homeAd'+pushOrder).className='';
                pushOrder=num;
            }
            clearInterval(pushIntr);
        }
    },30);
};
/*********** Begin Core Function ***********/
function $id(id){
	return document.getElementById(id)
};
//获取0-N之间的随机整数
function $randomInt(num){
	return 0;
	return Math.floor(Math.random()*num);
};
/***********  End Core Function  ***********/})();
</script>
<script type="text/javascript" charset="gb2312">
//搜索框的脚本   
(function(){
		  $namespace("PP.head_paipai");
		  window["_PP_head"]={};
		  PP.head_paipai.init=function(){this.changeType();};
		  PP.head_paipai.changeType=function(){
			  var typeItem,typeTab=$id("searchTab");
			  if(!typeTab) return;
			  var typeNodes=typeTab.getElementsByTagName("p");
			  for(var i=0,len=typeNodes.length;i<len;i++){
				  typeNodes[i].setAttribute("attr",i);
				  typeNodes[i].onclick=changeFun;
			  }
		  function changeFun(){
			  var typeItem,typeTab=$id("searchTab"),typeNodes=typeTab.getElementsByTagName("p"),t=this.getAttribute("attr");
			  for(var n=0;n<typeNodes.length;n++){
				  if(n==t){
					  typeNodes[n].className="now";
					  $id("searchType").value=t;
					}
					else{
						typeNodes[n].className="";
					}
				}
			};
		};
	PP.head_paipai.init();
	function $id(id){
		return document.getElementById(id)
	};
	function $namespace(str){
		var arr=str.split(',');
		for(var i=0;i<arr.length;i++){
			arr[i]=arr[i].split(".");
			str="";
			var strEval="";
			for(var j=0;j<arr[i].length;j++){
				if(j!=0){str+="."};
				str+=arr[i][j];
				strEval+="if (typeof("+str+") == 'undefined'){"+str+" = {}};";
			};
			if(strEval!=""){
				eval(strEval)
			};
		}
	};
})();
</script>
<script type="text/javascript" charset="gb2312"> 
//左边栏广告的脚本
$namespace("FanKK.index");
FanKK.index.init=function(){this.bindTabs();this.bindNews();};
FanKK.index.bindTabs=function(){var randnum=$randomInt(1);$tabExchange({titleId:"notice",titleTag:"li",contentId:"noticeContents",contentTag:"ul",initIndex:randnum,timeLag:200});};
FanKK.index.bindNews=function(){var _orderno=$randomInt(2),_conts=[],contents=$id("newFunction").childNodes,funcOrder=_orderno;for(var i=0,len=contents.length;i<len;i++){var oContent=contents[i];if(oContent.nodeName.toLowerCase()=="div"){_conts.push(oContent);}}focusOrder(_orderno);$id("prev").onclick=function(){focusOrder(_orderno==0?0:(--_orderno));};$id("next").onclick=function(){focusOrder(_orderno==2?2:(++_orderno));};function focusOrder(_orderno){var nowPic=_conts[_orderno].childNodes[0].childNodes[0];_conts[_orderno].className="bd display",$id("pageSpan").innerHTML=(_orderno+1)+"/3";if(''==nowPic.src){nowPic.src=nowPic.getAttribute('back_src');};if(funcOrder!=_orderno){_conts[funcOrder].className="bd";funcOrder=_orderno;}}};
function $id(id){return document.getElementById(id)}; 
function $namespace(str){var arr=str.split(',');for(var i=0;i<arr.length;i++){arr[i]=arr[i].split(".");str="";var strEval="";for(var j=0;j<arr[i].length;j++){if(j!=0){str+="."};str+=arr[i][j];strEval+="if (typeof("+str+") == 'undefined'){"+str+" = {}};";};if(strEval!=""){eval(strEval)};}};
function $randomInt(num){return Math.floor(Math.random()*num);};
function $tabExchange(obj){var option={titleId:"",titleTag:"",contentId:"",contentTag:"",initIndex:0,timeLag:0};for(var i in obj){option[i]=obj[i];}
var tabs=$id(option.titleId).childNodes,contents=$id(option.contentId).childNodes,_cont=[],_tabs=[],conTentTag=option.contentTag.toLowerCase(),titleTag=option.titleTag.toLowerCase();for(var i=0,len=contents.length;i<len;i++){if(conTentTag==contents[i].nodeName.toLowerCase()){_cont.push(contents[i]);}}
for(var i=0,len=tabs.length;i<len;i++){if(titleTag==tabs[i].nodeName.toLowerCase()){_tabs.push(tabs[i]);}}
if(_tabs.length!=_cont.length)return;for(var j=0,len=_cont.length;j<len;j++){_cont[j].style.display=(j==option.initIndex)?"block":"none";}
if(_tabs[option.initIndex]){var images=_cont[option.initIndex].getElementsByTagName("IMG");_tabs[option.initIndex].className="current";for(var i=0,len=images.length;i<len;i++){var oImg=images[i],oImgBack=oImg.getAttribute("back_src");if(''==oImg.src&&oImgBack){oImg.src=oImgBack;}}}
for(var i=0,len=_tabs.length;i<len;i++){var oTab=_tabs[i];oTab.setAttribute("tabIndex",i);oTab.onmouseover=function(){var _i=parseInt(this.getAttribute("tabIndex"));window.activeHover=setTimeout(function(){for(var j=0,len=_cont.length;j<len;j++){var images=_cont[j].getElementsByTagName("IMG");for(var i=0,lenI=images.length;i<lenI;i++){var oImg=images[i],oImgBack=oImg.getAttribute("back_src");if(''==oImg.src&&oImgBack){oImg.src=oImgBack;}}
_cont[j].style.display=(j==_i)?"block":"none";_tabs[j].className=(j==_i)?"current":"";}},option.timeLag);}
oTab.onmouseout=function(){clearTimeout(window.activeHover);}}};
</script><!--[if !IE]>|xGv00|42ddce70561c58e11fb190128fb9248b<![endif]-->
<script type="text/javascript">FanKK.index.init();</script>
<script type="text/javascript" src="js/yahoo-dom-event.js"></script>
<script type="text/javascript" src="js/selector-min.js"></script>
<script type="text/javascript" src="js/event-delegate-min.js"></script>
<script type="text/javascript">
(function() {
	var Dom=YAHOO.util.Dom,
		Event=YAHOO.util.Event,
		CE=YAHOO.util.CustomEvent;
	var tips_text1="输入您所在的地段名称，如：华景,或 hj";
	var tips_text2="输入您想找的店铺名称";
	var tips_text="";
	var getTipsText = function () {
		if (Dom.hasClass("search_tabs_item1","now")){
			return tips_text1;
		}
		else{
			return tips_text2;
		}
	}
	var onInputClick = function () {
		tips_text=getTipsText();
		var temp=document.getElementById("KeyWord_1");
		if ((temp.value==tips_text2)||(temp.value==tips_text1))
			temp.value="";
		Dom.removeClass("KeyWord_1", 'gray');
	}; 
	var onInputFocusOut =function(){
		var temp=document.getElementById("KeyWord_1");
		if (temp.value==""){
			Dom.addClass("KeyWord_1", 'gray');
			temp.value=tips_text;
		}
	}
	var onChangeTabs =function(){
		tips_text=getTipsText();	
		var temp=document.getElementById("KeyWord_1");	
		if ((temp.value==tips_text2)||(temp.value==tips_text1)){
			Dom.addClass("KeyWord_1", 'gray');
			temp.value=tips_text;
		}
	}
	Event.on("KeyWord_1", "click", onInputClick);
	Event.on("KeyWord_1", "focusout", onInputFocusOut);
	Event.delegate("searchTab","click",onChangeTabs,"p");
})();
	function onSearch(){
		var key = document.getElementById('KeyWord_1').value;
		if ((key == "输入您所在的地段名称，如：华景,或 hj")||(key == "输入您想找的店铺名称")){
			return;
		}
		else{
			var type = document.getElementById('searchType').value;
			document.getElementById('key').value = encodeURI(key);
			document.searchForm.submit();
		}
	}
	function search_ready(){
		var key = document.getElementById('KeyWord_1').value;
		if ((key == "输入您所在的地段名称，如：华景,或 hj")||(key == "输入您想找的店铺名称")){
			return false;
		}
		else{
			var type = document.getElementById('searchType').value;
			document.getElementById('key').value = encodeURI(key);
			return true;
		}
	}
</script>
</body>
</html>
