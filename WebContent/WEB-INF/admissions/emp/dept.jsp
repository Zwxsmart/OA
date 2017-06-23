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

	<script>
		function getEmp(){
			var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empInput").textbox('setValue',rows[0].name);
			 $("#emp").textbox('setValue',rows[0].empId);
			 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		function getEmp1(){
			var rows = $("#empTable1").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empInput1").textbox('setValue',rows[0].name);
			 $("#emp1").textbox('setValue',rows[0].empId);
			 $("#empDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		//查询角色对应的员工
		function showEmpAll4(index){
			 $("#empDiv2").form("clear"); // 清除表单里的所有数据
			 var rows = $("#list").datagrid("getSelections");
			 if (rows.length > 1) {
	             $.messager.alert("提示", "请先选择一个需要查看的角色", "info");
	         } else if (rows.length == 1) {
	             var row = rows[0];
	             if (row) { // 有选中的行
	            	 $("#empTable").datagrid({url:'<%=path %>/emp/queryDeptAll?id='+rows[0].depId});// 当点击部门框时再加载部门信息
	            	 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
	             }
	         } else if (rows.length == 0) {
	             $.messager.alert("提示", "请先选择一个需要查看的角色", "info");
	         }
			
		}
	</script>
</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/dept/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'depId',checkbox:true">编号</th>
		<th data-options="field:'name',width:60">姓名</th>
		<th data-options="field:'empName',width:60">负责人</th>
		<th data-options="field:'des',width:100">介绍</th>
		</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showEmpAll4();" class="easyui-linkbutton" plain="flase" iconCls="icon-search">查询员工</a>
	</div>
</div>


<div id="empDiv" class="easyui-window" title="所有部门" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable" class="easyui-datagrid"
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
		<th data-options="field:'empId',checkbox:true">员工编号</th>
		<th data-options="field:'name',width:80">员工姓名</th>
	</tr>
	</thead>
</table>
</div>

<div id="empDiv1" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable1" class="easyui-datagrid"
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
		<th data-options="field:'empId',checkbox:true">员工编号</th>
		<th data-options="field:'name',width:80">员工姓名</th>
	</tr>
	</thead>
</table>
</div>

</body>
</html>