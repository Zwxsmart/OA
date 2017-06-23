<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程进度管理</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript">

	function empformat(value){
		return empName=value.name;
	}
	function gradeformat(value){
		return gradeName=value.name;
	}
	
	//从jsp页面中拿到需要进行查询的数据，传到后台进行数据库查询
	function doSearch(value,name){
		 $('#list').datagrid({ url: '<%=path %>/progress/blurredAllQuery?value1='+value+'&name1='+name});
	}
	
	
	function formatTime(value){
		if (value == undefined || value == null || value == '') {
		    return "";
		}else {
		    var date = new Date(value);
		    var year = date.getFullYear().toString();
		    var month = (date.getMonth() + 1);
		    var day = date.getDate().toString();
		    var hour = date.getHours().toString();
		    var minutes = date.getMinutes().toString();
		    var seconds = date.getSeconds().toString();
		if (month < 10) {
		    month = "0" + month;
		}
		if (day < 10) {
		    day = "0" + day;
		}
		if (hour < 10) {
		    hour = "0" + hour;
		}
		if (minutes < 10) {
		    minutes = "0" + minutes;
		}
		if (seconds < 10) {
		    seconds = "0" + seconds;
		}
		   return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
		}
	}
</script>
</head>
<body style="height: 100%;">
	<table id="list" class="easyui-datagrid"
		data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path%>/progress/progressQueryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:30"
		style="height: 100%;">
		<thead>
			<tr>
				<th data-options="field:'progressId',checkbox:true">课程进度编号</th>
				<th data-options="field:'emp',width:100" formatter="empformat">员工</th>
				<th data-options="field:'grade',width:100" formatter="gradeformat">班级</th>
				<th data-options="field:'des',width:100">描述</th>
				<th data-options="field:'progressDay',width:100" formatter="formatTime">添加时间</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<input class="easyui-searchbox" data-options="prompt:'请输入搜索条件',menu:'#mm',searcher:doSearch" style="width:300px"></input>
			<div id="mm">
				<div data-options="name:'empName',iconCls:'icon-ok'">员工</div>
				<div data-options="name:'gradeName'">班级</div>
			</div>
		</div> 
	</div>
</div>
</body>
</html>