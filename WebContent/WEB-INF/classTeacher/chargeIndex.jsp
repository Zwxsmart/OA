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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon-hamburg.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/themes/jeasyui.icons.hamburg.js"></script>

<script>
$(document).ready(function() {
	tabCloseEven();
});

function aa() {
	if ('${sessionScope.emp.name}' == null) {
		alert("请登录之后再来访问");
		$.post("<%=path %>/emp/loginPage",
				$("#editForm").serialize(),
				function(data){
			},"json");
	}
}




</script>
<%if(request.getSession().getAttribute("emp")==null)
{%>
 	 <script>
		window.location.href="<%=path%>/emp/outSession";
	</script>

<%}%>

</head>


<body onclick="aa()" class="easyui-layout">

		<div data-options="region:'north'" style="height:60px">
			<img src="<%=path %>/images/logo.png" class="logo"/>
			<div id="wel">
				<a href="javascript:;">欢迎您：${sessionScope.emp.name}</a>
				<a href="<%=path%>/emp/outSession">安全退出</a>
			</div>
		</div>
		<div data-options="region:'west',split:true" title="菜单" style="width:200px;">
			<div class="easyui-accordion menu" style="width:200px;">
				<div title="学生管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('意向学生管理','<%=path%>/intention/skipPage');">意向学生管理</a></li>
						<li><a href="javascript:;" onclick="addTab('预定学生管理','<%=path%>/predetermine/skipPage');">预定学生管理</a></li>
						<li><a href="javascript:;" onclick="addTab('正式学生管理','<%=path%>/stu/skipPage');">正式学生管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生请假管理','<%=path%>/stu/skipPage');">学生请假管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生考勤管理','<%=path%>/stu/skipPage');">学生考勤管理</a></li>
					</ul>
				</div>
				<div title="日常办公" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('查看部门','<%=path%>/goods/empGoodsPage');">查看部门</a></li>
						<li><a href="javascript:;" onclick="addTab('我的值班','<%=path%>/goodsApp/giveBackPage');">我的值班</a></li>
						<li><a href="javascript:;" onclick="addTab('我的巡查','<%=path%>/goodsApp/giveBackPage');">我的巡查</a></li>
						<li><a href="javascript:;" onclick="addTab('我的考勤','<%=path%>/goodsApp/giveBackPage');">我的考勤</a></li>
						<li><a href="javascript:;" onclick="addTab('我要请假','<%=path%>/goodsUse/goodsApplyPage');">我要请假</a></li>
						<li><a href="javascript:;" onclick="addTab('我的反馈','<%=path%>/goodsApp/giveBackPage');">我的反馈</a></li>
						<li><a href="javascript:;" onclick="addTab('工作日志','<%=path%>/goodsApp/giveBackPage');">工作日志</a></li>
					</ul>
				</div>
				<div title="教务管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('班级课程','<%=path%>/stu/skipPage');">班级课程</a></li>
						<li><a href="javascript:;" onclick="addTab('课程进度','<%=path%>/goodsApp/giveBackPage');">课程进度</a></li>
						<li><a href="javascript:;" onclick="addTab('研讨会','<%=path%>/goodsApp/giveBackPage');">研讨会</a></li>
					</ul>
				</div>
				<div title="物品管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('物品管理','<%=path%>/stu/skipPage');">物品管理</a></li>
						<li><a href="javascript:;" onclick="addTab('物品申购','<%=path%>/goodsApp/giveBackPage');">物品申购</a></li>
						<li><a href="javascript:;" onclick="addTab('物品归还','<%=path%>/goodsApp/giveBackPage');">物品归还</a></li>
					</ul>
				</div>
				<div id="ac" title="信息管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-archives'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('我的信息','<%=path%>/emp/empMessagePage');">我的信息</a>
						<li><a href="javascript:;" onclick="addTab('我的工资', '<%=path%>/edu/empEduPage');">我的工资</a>
						<li><a href="javascript:;" onclick="addTab('系统公告', '<%=path%>/exp/empExpPage');">系统公告</a>
					</ul>
				</div>
				 <!-- 此div为了让菜单不默认展开 -->
				 <div title="" selected style="padding:0px;"></div>
			</div>
		</div>
		<div data-options="region:'center'">
			<div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">
				<div title="主页" style="padding:10px" data-options="plain: true, iconCls: 'icon-hamburg-home'">
					主页内容
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