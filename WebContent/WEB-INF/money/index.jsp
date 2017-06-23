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
	if ('${sessionScope.emp}' == null) {
		alert("请登录之后再来访问");
		$.post("<%=path %>/emp/loginPage",
				$("#editForm").serialize(),
				function(data){
			
			},"json");
	}
}

</script>
<%-- <%if(request.getSession().getAttribute("emp")==null)
{%>
 	 <script>
		window.location.href="<%=path%>/admin/outSession";
	</script>

<%}%> --%>

</head>
<body onclick="aa()" class="easyui-layout">
		<div data-options="region:'north'" style="height:60px">
			<img src="<%=path %>/images/logo.png" class="logo"/>
			<div id="wel">
				<a href="javascript:;">欢迎您：${sessionScope.emp.name}</a>
				<a href="<%=path%>/admin/outSession">安全退出</a>
			</div>
		</div>
		<div data-options="region:'west',split:true" title="菜单" style="width:200px;">
			<div class="easyui-accordion menu" style="width:200px;">
				<div id="ac" title="日常办公" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-archives'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('部门管理','<%=path%>/dept/skipPage');">部门管理</a>
						<li><a href="javascript:;" onclick="addTab('员工角色', '<%=path%>/role/skipPage');">员工角色</a>
						<li><a href="javascript:;" onclick="addTab('员工管理', '<%=path%>/emp/skipPage');">员工管理</a>
						<li><a href="javascript:;" onclick="addTab('员工教育背景', '<%=path%>/edu/skipPage');">员工教育背景</a>
						<li><a href="javascript:;" onclick="addTab('员工工作经历', '<%=path%>/exp/skipPage');">员工工作经历</a>
						<li><a href="javascript:;" onclick="addTab('员工工作日志', '<%=path%>/report/skipPage');">员工工作日志</a>
						<li><a href="javascript:;" onclick="addTab('员工值班', '<%=path%>/duty/skipPage');">员工值班</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤信息', '<%=path%>/empCheckingInfo/skipPage');">员工考勤信息</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤', '<%=path%>/empChecking/skipPage');">员工考勤</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤申诉', '<%=path%>/empAppeal/skipPage');">员工考勤申诉</a>
						<li><a href="javascript:;" onclick="addTab('员工考勤反馈', '<%=path%>/empFeedBack/skipPage');">员工考勤反馈</a>
						<li><a href="javascript:;" onclick="addTab('员工请假', '<%=path%>/empLeave/skipPage');">员工请假</a>
						<li><a href="javascript:;" onclick="addTab('员工巡查', '<%=path%>/check/skipPage');">员工巡查</a>
						<li><a href="javascript:;" onclick="addTab('物品类型管理', '<%=path%>/goodsType/skipPage');">物品类型管理</a>
						<li><a href="javascript:;" onclick="addTab('物品管理', '<%=path%>/goods/skipPage');">物品管理</a>
						<li><a href="javascript:;" onclick="addTab('物品申购', '<%=path%>/goodsApp/skipPage');">物品申购</a>
						<li><a href="javascript:;" onclick="addTab('物品领用', '<%=path%>/goodsUse/skipPage');">物品领用</a>
					</ul>
				</div>
				<div title="市场管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-hire-me'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('意向学生','<%=path%>/intention/skipPage');">意向学生</a></li>
						<li><a href="javascript:;" onclick="addTab('预定学生','<%=path%>/predetermine/skipPage');">预定学生</a></li>
					</ul>
				</div>
				<div title="学生管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('正式学生管理','<%=path%>/stu/skipPage');">正式学生管理</a></li>
						<li><a href="javascript:;" onclick="addTab('宿舍管理','<%=path%>/room/skipPage');">宿舍管理</a></li>
						<li><a href="javascript:;" onclick="addTab('班级管理','<%=path%>/grade/skipPage');">班级管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生成绩','<%=path%>/score/skipPage');">学生成绩</a></li>
						<!-- <li><a href="javascript:;" onclick="addTab('学生答辩管理','<%=path%>/user/skipPage');">学生答辩管理</a></li> -->
						<li><a href="javascript:;" onclick="addTab('学生请假管理','<%=path%>/stuLeave/skipPage');">学生请假管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生反馈管理','<%=path%>/stuFeedback/skipPage');">学生反馈管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生就业管理','<%=path%>/job/skipPage');">学生就业管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生谈心管理','<%=path%>/talk/skipPage');">学生谈心管理</a></li>
						<li><a href="javascript:;" onclick="addTab('学生考勤管理','<%=path%>/stuChecking/skipPage');">学生考勤管理</a></li>
					</ul>
				</div>
				<div title="教务管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-logout'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('课程管理','<%=path%>/course/courseSkipPage');">课程管理</a></li>
						<li><a href="javascript:;" onclick="addTab('研讨会管理','<%=path%>/meetting/meettingSkipPage');">研讨会管理</a></li>
						<li><a href="javascript:;" onclick="addTab('课程进度管理','<%=path%>/progress/progressSkipPage');">课程进度管理</a></li>
						<!-- <li><a href="javascript:;" onclick="addTab('员工反馈管理','<%=path%>/empfeedback/empFeedBackSkipPage');">员工反馈管理</a></li> -->
					</ul>
				</div>
				<div title="财务管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-bank'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('工资基本信息管理','<%=path%>/salaryInfo/salaryInfoPage');">工资基本信息管理</a></li>
						<li><a href="javascript:;" onclick="addTab('支出类别','<%=path%>/payType/payTypePage');">支出类别</a></li>
						<li><a href="javascript:;" onclick="addTab('收入类别','<%=path%>/incomeType/incomeTypePage');">收入类型</a></li>
						<li><a href="javascript:;" onclick="addTab('工资管理','<%=path%>/salary/salaryPage');">工资管理</a></li>
						<li><a href="javascript:;" onclick="addTab('支出管理','<%=path%>/pay/payPage');">支出管理</a></li>
						<li><a href="javascript:;" onclick="addTab('收入管理','<%=path%>/income/incomePage');">收入管理</a></li>
					</ul>
				</div>
				<div title="物品管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-customers'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('物品申领','<%=path%>/goods/empGoodsPage');">物品申领</a></li>
						<li><a href="javascript:;" onclick="addTab('物品归还','<%=path%>/goodsUse/goodsApplyPage');">物品归还</a></li>
						<li><a href="javascript:;" onclick="addTab('我的申购','<%=path%>/goodsApp/giveBackPage');">物品申购</a></li>
					</ul>
				</div>
				<div title="系统管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-billing'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('系统公告类型','<%=path%>/noticeType/skipPage');">系统公告类型</a></li>
						<li><a href="javascript:;" onclick="addTab('系统公告栏','<%=path%>/notice/skipPage');">系统公告栏</a></li>
					</ul>
				</div>
				<div id="ac" title="信息管理" style="text-align:center;" data-options="plain: true, iconCls: 'icon-hamburg-archives'">
					<ul>
						<li><a href="javascript:;" onclick="addTab('我的信息','<%=path%>/emp/empMessagePage');">我的信息</a>
						<li><a href="javascript:;" onclick="addTab('我的教育背景', '<%=path%>/edu/empEduPage');">我的教育背景</a>
						<li><a href="javascript:;" onclick="addTab('我的工作经历', '<%=path%>/exp/empExpPage');">我的工作经历</a>
						<li><a href="javascript:;" onclick="addTab('我的工作日志', '<%=path%>/report/empReportPage');">我的工作日志</a>
						<li><a href="javascript:;" onclick="addTab('我的反馈', '<%=path%>/empFeedBack/empFeedBackPage');">我的反馈</a>
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