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

        var jsonStr = '{"salaryInfo.salaryInfoId":"_salaryInfoId","salaryInfo.empId":"_empId","salaryInfo.basicSalary":"_basicSalary","salaryInfo.jobSalary":"_jobSalary","salaryInfo.emp":"_empName"}'
	    	
			
        $(function() {
            setPagination("list");
        });

        function showAddSalaryInfoWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addSalaryInfo() {//添加
            if ($("#addForm").form("validate")) {
            	$.post("<%=path %>/salaryInfo/save",
            				$("#addForm").serialize(),
                            function (data) {
                            if (data.result.result == "success") {
                                $("#addWin").window("close"); // 关闭指定的窗口
                                $("#list").datagrid("reload"); // 重新加载指定数据网格数据
                                $.messager.alert("提示", data.result.message, "info");
                            } else if (data.result.result == "fail") {
                                $.messager.alert("提示", data.result.message, "info");
                            }
                        }, "json"
                   );
            } else {
                $.messager.alert("提示", "请输入正确的数据", "info");
            }
            $("#empInput1").textbox('setValue',rows[0].emp.name);
        }

        function showEditSalaryInfoWin() {
            var rows = $("#list").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的工资情况", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_salaryInfoId", row.salaryInfoId)
                    .replace("_empId", row.empId)
                    .replace("_basicSalary", row.basicSalary)
                    .replace("_jobSalary", row.jobSalary)
                    .replace("_empName", row.emp.name);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
            }
        }

        function editSalaryInfo() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/salaryInfo/update",
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
        //赋值
        function formatterOpt2(value) {
        	return value.name;
        }
        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
        }
        
    	//添加
    	function showempAll(){
    		 $("#empDiv").form("clear"); // 清除表单里的所有数据
    		 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
    		 $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
    	}
    	function getemp(){
    		var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
    		 $("#empInput").textbox('setValue',rows[0].name);
    		 $("#emp").textbox('setValue',rows[0].empId);
    		 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
    	}
    	
    	//修改
    	function showempAll1(){
    		 $("#empDiv1").form("clear"); // 清除表单里的所有数据
    		 $("#empDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
    		 $("#empTable1").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载宿舍信息
    	}
    	function getemp1(){
    		var rows = $("#empTable1").datagrid("getSelections");// 获取表格中选中行的数据
    		 $("#empInput1").textbox('setValue',rows[0].name);
    		 $("#emp1").textbox('setValue',rows[0].empId);
    		 $("#empDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
    	}
	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/salaryInfo/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:10" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'salaryInfoId',checkbox:true">工资情况编号</th>
		<th data-options="field:'emp',width:100" formatter="formatterOpt2">员工</th>
		<th data-options="field:'basicSalary',width:80">基本工资</th>
		<th data-options="field:'jobSalary',width:80">岗位工资</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddSalaryInfoWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditSalaryInfoWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加工资情况编号" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工</td>
				<td>
					<a href="javascript:;" onclick="showempAll();"> 
							<input id="empInput" class="easyui-textbox" name="empName" /> 
							<input type="hidden" id="emp" class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>基本工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salaryInfo.basicSalary" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>岗位工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salaryInfo.jobSalary" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addSalaryInfo();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">添加</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改工资情况" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="salaryInfo.salaryInfoId" />
		<table>
			<tr><td>员工</td>
				<td>
					<a href="javascript:;" onclick="showempAll1();"> 
						<input id="empInput1" class="easyui-textbox" name="empName" /> 
						<input type="hidden" id="emp1" class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>基本工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salaryInfo.basicSalary" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>岗位工资</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="salaryInfo.jobSalary" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td><a href="javascript:;" onclick="editSalaryInfo();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">修改</a></td>
			</tr>
		</table>
	</form>
</div>
<!-- 添加 員工-->
<div id="empDiv" class="easyui-window" title="员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getemp,
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
			<th data-options="field:'nation',width:100">介绍</th>
		</tr>
	</thead>
</table>
</div>
<!-- 修改 員工-->
	<div id="empDiv1" class="easyui-window" title="员工" data-options="closed:true" style="width:500px;height:300px;">
		<table id="empTable1" class="easyui-datagrid"
		   data-options="singleSelect:true,
		   		onClickRow:getemp1,
				collapsible:true,
				method:'get',
				rownumbers:true,
				autoRowHeight:true,
				pagination:true,
				pageSize:20" style="height:100%;">
			<thead>
				<tr>
					<th data-options="field:'empId',checkbox:true">员工编号</th>
					<th data-options="field:'name',width:60">员工姓名</th>
					<th data-options="field:'nation',width:100">员工介绍</th>
				</tr>
			</thead>
		</table>
	</div>

</body>
</html>