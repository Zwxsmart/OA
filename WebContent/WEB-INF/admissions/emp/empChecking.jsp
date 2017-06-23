<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/default/easyui.css" />
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
	<link rel="stylesheet" href="<%=path%>/css/main.css" />
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
	<script type="text/javascript" src="<%=path%>/js/main.js"></script>

	<script>

        $(function() {
            setPagination("list");
        });

	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/empChecking/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'checkingId',checkbox:true">考勤编号</th>
		<th data-options="field:'empId',width:80">员工编号</th>
		<th data-options="field:'checkingDay',width:100">打卡日期</th>
		<th data-options="field:'time1',width:100">时间点1</th>
		<th data-options="field:'time2',width:100">时间点2</th>
		<th data-options="field:'time3',width:100">时间点3</th>
		<th data-options="field:'time4',width:100">时间点4</th>
		<th data-options="field:'time5',width:100">时间点5</th>
		<th data-options="field:'time6',width:100">时间点6</th>
		<th data-options="field:'time7',width:100">时间点7</th>
		<th data-options="field:'time8',width:100">时间点8</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
	</div>
</div>

</body>
</html>