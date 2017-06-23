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

	var jsonStr = '{"progress.progressId":"_progressId","progress.empId":"_empId","progress.gradeId":"_gradeId","progress.des":"_des","progress.progressDay":"_progressDay","progress.status":"_status","progress.gradeName":"_gradeName","progress.empName":"_empName"}'
	
		$(function() {
	    	<%
			request.setAttribute("height", "60%");
			%>
	        setPagination("list");
	        $("input",$("#empInput").next("span")).click(function(){// 点击详情宿舍弹出所有宿舍
	             showEmpAll();
	        });
	    });
	
	function addProgress() {
	    if ($("#addForm").form("validate")) {
	    	$.post("<%=path%>/progress/addProgress?empId=${sessionScope.emp.empId}",
	            $("#addForm").serialize(),
	            function (data) {
	                if (data.result.result == "success") {
	                    $("#addWin").window("close"); // 关闭指定的窗口
	                    $("#list").datagrid("reload"); // 重新加载指定数据网格数据
	                    $.messager.alert("提示", data.result.message, "info");
	                } else if (data.result.result == "fail") {
	                    $.messager.alert("提示", "添加失败", "info");
	                }
	            }, "json");
	    } else {
	        $.messager.alert("提示", "请输入正确的数据", "info");
	    }
	}
	
	function editProgress() {
	    if ($("#editForm").form("validate")) {
	        $.post("<%=path%>/progress/updateProgress",
	            $("#editForm").serialize(),
	            function (data) {
	                if (data.result.result == "success") {
	                    $("#editWin").window("close"); // 关闭指定的窗口
	                    $("#list").datagrid("reload"); // 重新加载指定数据网格数据
	                    $.messager.alert("提示", data.result.message, "info");
	                } else if (data.result.result == "fail") {
	                    $.messager.alert("提示", data.result.message, "info");
	                }
	            }, "json"
	        );
	    } else {
	        $.messager.alert("提示", "请输入正确的表单数据", "info");
	    }
	}
	
	function removeProgress(){
		var row = $("#list").datagrid("getSelected");
		if (row) {
	        $.messager.confirm("提示", "确定删除吗？", function (r) {
	            if (r) { // 点击了确定按键
	                $.get("<%=path%>/progress/deleteProgress?id="
							+ row.progressId, function(data) {
						$.messager.alert("提示", data.result.message, "info");
						$("#list").datagrid("reload");
					}, "json");
				}
			})
		} else {
			$.messager.alert("提示", "请先选择需要删除的课程进度", "info");
		}
	}
	function showAddWin() {
		$("#addForm").form("clear"); // 清除表单里的所有数据
		$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}

	function showEditWin() {
		var rows = $("#list").datagrid("getSelections");
		if (rows.length > 1) {
			$.messager.alert("提示", "请先选择一个需要修改的课程进度", "info");
		} else if (rows.length == 1) {
			var row = rows[0];
			if (row) { // 有选中的行
				var jsonStr1 = jsonStr.replace("_progressId", row.progressId)
						.replace("_empId", row.empId)
						.replace("_gradeId",row.gradeId)
						.replace("_des",row.des)
						.replace("_progressDay", row.progressDay)
						.replace("_status", row.status)
						.replace("_gradeName", row.gradeName)
						.replace("_empName", row.empName)
						.replace("_emp", row.emp)
						.replace("_grade", row.grade);
				$("#editForm").form("load", JSON.parse(jsonStr1));
				$("#editWin").window("open");
			}
		} else if (rows.length == 0) {
			$.messager.alert("提示", "请先选择一个需要修改的课程进度", "info");
		}
		
	    $("#empInput1").textbox('setValue',rows[0].emp.name);
	    $("#empInputId1").val(rows[0].empId);
	    $("#gradeInput1").textbox('setValue',rows[0].grade.name);
	    $("#gradeInputId1").val(rows[0].gradeId);
	}
	
	//状态修改
	function formatterOpt(value, row, index) {
		if (row.status == 1) {
			return "<b>已启用</b>"
		} else if (row.status == 0) {
			return "<b>已禁用</b>"
		}
	}
	
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
	
	//添加主持人
	function showEmpAll(){
		 $("#empWin").form("clear"); // 清除表单里的所有数据
		 $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#empList").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
	}
	
	function getEmp(){
		var rows = $("#empList").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#empInput").textbox('setValue',rows[0].name);
		 $("#empInputId").textbox('setValue',rows[0].empId);
		 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	//修改主持人
	function showEmpAll1(){
		$("#empWin1").form("clear");//清楚表单中的所有数据
		$("#empWin1").window("open");//打开指定的window。
		$("#empList1").datagrid({url:'<%=path %>/emp/queryAll'});
	}
	
	function getEmp1(){
		var rows = $("#empList1").datagrid("getSelections");// 获取表格中选中行的数据
		$("#empInput1").textbox('setValue',rows[0].name);
		$("#empInputId1").val(rows[0].empId);
		$("#empWin1").window("close");
	}

	//添加班级
	function showGradeAll(){
		$("#gradeWin").form("clear");
		$("#gradeWin").window("open");
		$("#gradeList").datagrid({url:'<%=path %>/grade/queryAll'});
	}
	
	function getGrade(){
		var rows = $("#gradeList").datagrid("getSelections");// 获取表格中选中行的数据
		$("#gradeInput").textbox('setValue',rows[0].name);
		$("#gradeInputId").textbox('setValue',rows[0].gradeId);
		$("#gradeWin").window("close");
	}
	//修改班级
	function showGradeAll1(){
		$("#gradeWin1").form("clear");
		$("#gradeWin1").window("open");
		$("#gradeList1").datagrid({url:'<%=path%>/grade/queryAll'});
	}
	
	function getGrade1(){
		var rows = $("#gradeList1").datagrid("getSelections");// 获取表格中选中行的数据
		$("#gradeInput1").textbox('setValue',rows[0].name);
		$("#gradeInputId1").val(rows[0].gradeId);
		$("#gradeWin1").window("close");
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
	function formatStatus(value, row, index) {
	 	if (row.status == 0) {
	 		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
	 	} else {
	 		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
	 	}
	 }
	 function disable(index){   // 禁用
			var row = $('#list').datagrid('getData').rows[index];
			if(row){
				$.post("<%=path %>/progress/progressDisable?id=" + row.progressId,
					$("#editForm").serialize(),
					function(data){
						$('#list').datagrid('reload');
						if(data.result.result=="fail"){
							$.messager.alert("提示", data.result.message, "info");	
						}
				},"json");
			}
			
		}
			
	 function activate(index){  // 启用
			var row = $('#list').datagrid('getData').rows[index];
			if(row){
				$.post("<%=path %>/progress/progressActivate?id=" + row.progressId,
					$("#editForm").serialize(),
					function(data){
						$('#list').datagrid('reload'); // 重新加载数据表
						if(data.result.result=="fail"){
							$.messager.alert("提示", data.result.message, "info");		
						}
				},"json");
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
				<th data-options="field:'status',width:100" formatter="formatterOpt">状态</th>
				<th data-options="field:'bbb',width:60" formatter="formatStatus">操作</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:;" onclick="showAddWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a> 
			<a href="javascript:;" onclick="showEditWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a> 
			<a href="javascript:;" onclick="removeProgress();" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
			<input class="easyui-searchbox" data-options="prompt:'请输入搜索条件',menu:'#mm',searcher:doSearch" style="width:300px"></input>
			<div id="mm">
				<div data-options="name:'empName',iconCls:'icon-ok'">员工</div>
				<div data-options="name:'gradeName'">班级</div>
			</div>
		</div> 
	</div>

	<div id="addWin" class="easyui-window" title="添加课程进度" data-options="closed:true" style="width: 500px; height: 300px;">
		<form id="addForm">
			<input type="hidden" name="progress.progressId"/>
			<table>
				<tr>
					<td width="100px">班级:</td>
					<td>
						<a href="javascript:;" onclick="showGradeAll();">
							<input id="gradeInput" class="easyui-textbox" name="gradeName"/>
							<input type="hidden" id="gradeInputId" class="easyui-textbox" name="progress.gradeId"/>
						</a>
					</td>
				</tr>
				<tr>
					<td>添加时间:</td>
					<td><input id="dd" type="datetime" class="easyui-datetimebox"
						name="progress.progressDay"
						data-options="required:true,showSeconds:false"
						value="3/4/2010 2:3"></td>
				</tr>
				<tr>
					<td>详情:</td>
					<td><input class="easyui-textbox"
						data-options="multiline:true" name="progress.des"
						style="height: 100px;" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="addProgress();"
						class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="editWin" class="easyui-window" title="修改课程进度"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<form id="editForm">
			<input type="hidden" name="progress.progressId" />
			<input type="hidden" name="progress.empId" />
			<table>
				<tr>
					<td width="100px">班级:</td>
					<td>
						<a href="javascript:;" onclick="showGradeAll1();">
							<input id="gradeInput1" class="easyui-textbox" name="gradeName"/>
							<input type="hidden" id="gradeInputId1" name="gradeId"/>
						</a>
					</td>
				</tr>
				<tr>
					<td>添加时间:</td>
					<td><input id="dd" type="datetime" class="easyui-datetimebox"
						name="progress.progressDay"
						data-options="required:true,showSeconds:false"
						value="3/4/2010 2:3"></td>
				</tr>
				<tr>
					<td>详情:</td>
					<td><input class="easyui-textbox"
						data-options="multiline:true" name="progress.des"
						style="height: 100px;" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="editProgress();"
						class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
<!-- 添加员工 -->
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
<!-- 修改员工 -->
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
<!-- 添加班级 -->
<div id="gradeWin" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="gradeList" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getGrade,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'gradeId',checkbox:true">班级编号</th>
		<th data-options="field:'name',width:60">班级名称</th>
		<th data-options="field:'des',width:60">描述</th>
		<th data-options="field:'quantity',width:60">最大人数</th>
		<th data-options="field:'status',width:60" formatter="formatterOpt">状态</th>
	</tr>
	</thead>
</table>
</div>
<!-- 修改班级 -->
<div id="gradeWin1" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="gradeList1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getGrade1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'gradeId',checkbox:true">班级编号</th>
		<th data-options="field:'name',width:60">班级名称</th>
		<th data-options="field:'des',width:60">描述</th>
		<th data-options="field:'quantity',width:60">最大人数</th>
		<th data-options="field:'status',width:60" formatter="formatterOpt">状态</th>
	</tr>
	</thead>
</table>
</div>
</body>
</html>