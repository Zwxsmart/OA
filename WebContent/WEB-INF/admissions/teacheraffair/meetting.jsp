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
<title>研讨会管理</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript">
	
	
	function formatterOpt1(value){
		return empName=value.name;
	}
	
	<%-- var url = "<%=path %>/meetting/queryAllEmp";
	$.getJSON(url, function(json) {
		$('#com').combobox({
			method:'get',
			data:json.comboBoxEasyUIs,
			valueField:'id',
			textField:'name',
			panelHeight:'auto'
		});
	}); --%>
	
	function getEmp(){
		var rows = $("#empList").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#empInput").textbox('setValue',rows[0].name);
		 $("#empInputId").textbox('setValue',rows[0].empId);
		 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	function getEmp1(){
		var rows = $("#empList1").datagrid("getSelections");// 获取表格中选中行的数据
		$("#empInput1").textbox('setValue',rows[0].name);
		$("#empInput2").val(rows[0].empId);
		$("#empWin1").window("close");
	}
	
	function doSearch(value,name){
		 $('#list').datagrid({ url: '<%=path %>/meetting/blurredAllQuery?value1='+value+'&name1='+name});
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
	
	function findPositions(){
		var beginTime=$("#startDatetime").datetimebox("getValue");
		var endTime=$("#endDatetime").datetimebox("getValue");
		$('#list').datagrid({ url: '<%=path %>/meetting/serachTime?beginTime='+beginTime+'&endTime='+endTime});
	}
</script>
</head>
<body style="height:100%;">
<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/meetting/meettingQueryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:30" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'meettingId',checkbox:true">研讨会编号</th>
		<th data-options="field:'emp',width:100" formatter="formatterOpt1">主持人</th>
		<th data-options="field:'meettingDay',width:100" formatter="formatTime">研讨会时间</th>
		<th data-options="field:'createdDay',width:100" formatter="formatTime">添加时间</th>
		<th data-options="field:'des',width:100">研讨会详情</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<input class="easyui-searchbox" data-options="prompt:'请输入搜索条件',menu:'#mm',searcher:doSearch" style="width:300px"></input>
		<div id="mm">
			<div data-options="name:'name',iconCls:'icon-ok'">主持人</div>
		</div>
		开始时间:<input id="startDatetime" name="startDatetime" class="easyui-datebox" data-options="required:false,editable:false" style="width:150px;"/>
		结束时间:<input id="endDatetime" name="endDatetime" class="easyui-datebox" data-options="required:false,editable:false" style="width:150px;"/>
		<a href="javascript:;" onclick="findPositions();" class="easyui-linkbutton" data-options="iconCls:'icon-'">查询</a>
	</div>
</div>

<div id="empWin" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empList" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getEmp,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'empId',checkbox:true">编号</th>
		<th data-options="field:'name',width:60">姓名</th>
		<th data-options="field:'gender',width:60">性别</th>
		<th data-options="field:'email',width:60">电子邮箱</th>
		<th data-options="field:'phone',width:60">手机</th>
	</tr>
	</thead>
</table>
</div>

<div id="empWin1" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empList1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getEmp1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'empId',checkbox:true">编号</th>
		<th data-options="field:'name',width:60">姓名</th>
		<th data-options="field:'gender',width:60">性别</th>
		<th data-options="field:'email',width:60">电子邮箱</th>
		<th data-options="field:'phone',width:60">手机</th>
	</tr>
	</thead>
</table>
</div>
</body>
</html>