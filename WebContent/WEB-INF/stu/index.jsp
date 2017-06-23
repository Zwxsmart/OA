<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>宏图OA办公系统</title>
<link id="easyuiTheme" rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<link rel="stylesheet" href="<%=path%>/css/inMenu.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon-hamburg.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/themes/jeasyui.icons.hamburg.js"></script>

<style type="text/css">
.menu ul {
	margin-left: 0px;
	padding-left: 30px;
}
.menu ul li {
	margin-left: 0px;
	list-style: none;
}
</style>
<script>
$(document).ready(function() {
	tabCloseEven();
});

function aa() {
	if ('${sessionScope.emp}' == null) {
		alert("请登录之后再来访问");
		$.post("<%=path %>/stu/loginPage",
				$("#editForm").serialize(),
				function(data){
			},"json");
	}
}

/**
 * easyui更新主题方法
 */
function changeTheme(themeName){
	var $easyuiTheme = $('#easyuiTheme');  
    var url = $easyuiTheme.attr('href');  
    var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';  
    $easyuiTheme.attr('href', href);  
    var $iframe = $('iframe');  
    if ($iframe.length > 0) {  
        for ( var i = 0; i < $iframe.length; i++) {  
            var ifr = $iframe[i];  
            $(ifr).contents().find('#easyuiTheme').attr('href', href);  
        }  
    } 
};
</script>

<%if(request.getSession().getAttribute("stu")==null)
{%>
 	 <script>
		window.location.href="<%=path%>/stu/outSession";
	</script>
<%}%> 

</head>
<body onclick="aa()" class="easyui-layout">
			<div data-options="region:'north'" style="height:65px">
			<div style="float:left">
				<img src="<%=path %>/images/logo.png" class="logo"/>
			</div>
			<div style="font-size:15px; height:60px; line-height:60px; float:right">
				<span>您的角色是：学生</span>
				<span>欢迎您:${sessionScope.stu.name}</span>
				<a href="<%=path%>/stu/outSession">安全退出</a>
				<a href="javascript:;" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu'">更换皮肤</a>
			</div>
       </div>  
       
		<div class="liMenu" data-options="region:'west',split:true" title="菜单" style="width:200px;">
			<div class="easyui-accordion menu" style="width:200px;">
				<div title="查询" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('宿舍','<%=path%>/room/skipPages');">宿舍</a></li>
						<li><a href="javascript:;" onclick="addTab('班级','<%=path%>/grade/skipPages');">班级</a></li>
						<li><a href="javascript:;" onclick="addTab('成绩','<%=path%>/score/skipPages');">成绩</a></li>
						<li><a href="javascript:;" onclick="addTab('请假','<%=path%>/stuLeave/skipPages');">请假</a></li>
						<li><a href="javascript:;" onclick="addTab('反馈','<%=path%>/stuFeedback/skipPages');">反馈</a></li>
						<li><a href="javascript:;" onclick="addTab('谈心','<%=path%>/talk/skipPages');">谈心</a></li>
						<li><a href="javascript:;" onclick="addTab('考勤','<%=path%>/stuChecking/skipPages');">考勤</a></li>
					</ul>
				</div>
				<div title="物品管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-config'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('物品申领','<%=path%>/goods/stuGoodsPage');">物品申领</a></li>
						<li><a href="javascript:;" onclick="addTab('物品归还','<%=path%>/goodsUse/goodsApplyPage');">物品归还</a></li>
					</ul>
				</div>
				<div title="系统管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-world'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('系统公告栏','<%=path%>/notice/skipPage');">系统公告栏</a></li>
					</ul>
				</div>
				<div id="ac" title="信息管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-docs'">
						<a href="javascript:;" onclick="addTab('我的信息','<%=path%>/stu/stuMessagePage');">我的信息</a>
				</div>
				 <!-- 此div为了让菜单不默认展开 -->
				 <div title="" selected style="padding:0px;"></div>
   				<div id="layout_north_pfMenu" style=" display: none;">
					<div data-options="name:'term'" onclick="changeTheme('default');">default</div>
					<div data-options="name:'term'" onclick="changeTheme('bootstrap');">bootstrap</div>
					<div data-options="name:'term'" onclick="changeTheme('gray');">gray</div>
					<div data-options="name:'term'" onclick="changeTheme('metro');">metro</div>
					<div data-options="name:'term'" onclick="changeTheme('material');">material</div>
				</div> 
				 <!-- 此div为了让菜单不默认展开 -->
				 <div title="" selected style="padding:0px;"></div>
			</div>
		</div>
		<div data-options="region:'center'">
			<div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">
				<div title="主页" style="padding:10px" data-options="plain: true, iconCls: 'icon-hamburg-home'">
				<!--  	<jsp:include page="home.jsp"></jsp:include> -->
				</div>
			</div>
		</div>
		
		<div data-options="region:'south',split:false" style="height:50px; text-align:center;">Copyright&copy;15秋预科  2016-2020</div>
		
		<!-- 菜单窗口 -->
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseleft">关闭左边选项卡</div>
		<div id="mm-tabcloseright">关闭右边选项卡</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
</body>
</html>