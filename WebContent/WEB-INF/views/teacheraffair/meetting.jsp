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
var jsonStr = '{"meetting.meettingId":"_meettingId","meetting.empId":"_empId","meetting.meettingDay":"_meettingDay","meetting.createdDay":"_createdDay","meetting.des":"_des","meetting.status":"_status","meetting.emp":"_emp"}'
	
	function authority(methodName, str, method) {
		$.get("<%=path %>/auth/authority?methodName=" + methodName,
			function(data) {
				if (data.result.result == "success") {
					if (method == "save") {
						$("#addWin").window("open"); // 打开窗口
					} else if (method == "update") {
						$("#editForm").form("load", JSON.parse(str)); // 把JSON对象row的值自动赋值给form表单
						$("#editWin").window("open"); // 打开编辑的窗口
					}
				} else if (data.result.result == "fail") {
					$.messager.alert("提示", data.result.message, "info");
				}
			}, "json");
	}
	
	$(function() {
    	<%
		request.setAttribute("height", "60%");
		%>
        setPagination("list");
        $("input",$("#empInput").next("span")).click(function(){// 点击详情宿舍弹出所有宿舍
             showEmpAll();
        });
    });
    
	function addMeetting() {
    if ($("#addForm").form("validate")) {
    	$.post("<%=path %>/meetting/addMeetting",
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
	
function editMeetting() {
    if ($("#editForm").form("validate")) {
        $.post("<%=path %>/meetting/updateMeetting",
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
	
	function removeMeetting(){
		var row = $("#list").datagrid("getSelected");
		if (row) {
	        $.messager.confirm("提示", "确定删除吗？", function (r) {
	            if (r) { // 点击了确定按键
	                $.get("<%=path %>/meetting/deleteMeetting?id=" + row.meettingId,
	                	function (data) {
	                	$.messager.alert("提示", data.result.message, "info");
	                    $("#list").datagrid("reload");
	                }, "json");
	            }
	        })
	    } else {
	        $.messager.alert("提示", "请先选择需要删除的探讨会信息", "info");
	    }
	}
	
	function showAddWin() {
		$("#addForm").form("clear"); // 清除表单里的所有数据
		authority('com.cs.action.MeettingAction.addMeetting', "", "save");
	}
	
	function showEditWin() {
		var rows = $("#list").datagrid("getSelections");
	    if (rows.length > 1) {
	        $.messager.alert("提示", "请先选择一个需要修改的研讨会", "info");
	    } else if (rows.length == 1) {
	        var row = rows[0];
	        if (row) { // 有选中的行
	        	var jsonStr1 = jsonStr
	        	.replace("_meettingId", row.meettingId)
	        	.replace("_empId", row.empId)
	        	.replace("_meettingDay", row.meettingDay)
	        	.replace("_createdDay", row.createdDay)
	        	.replace("_des", row.des)
	        	.replace("_status", row.status)
	        	authority('com.cs.action.MeettingAction.updateMeetting', jsonStr1, "update");
	        }
	    } else if (rows.length == 0) {
	        $.messager.alert("提示", "请先选择一个需要修改的研讨会", "info");
	    }
	    $("#empInput1").textbox('setValue',rows[0].emp.name);
	    $("#empInput2").val(rows[0].empId);
	}
	
	function formatterOpt(value, row, index) {
        if (row.status == 1) {
            return "<b>已启用</b>"
		} else if(row.status == 0) {
            return "<b>已禁用</b>"
		}
    }
	
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
				$.post("<%=path %>/meetting/meettingDisable?id=" + row.meettingId,
					$("#editForm").serialize(),
					function(data){
						$('#list').datagrid('reload');
						if(data.result.result=="success"){
							$.messager.alert("提示", data.result.message, "info");
						}
				},"json");
			}
			
		}
			
	 function activate(index){  // 启用
			var row = $('#list').datagrid('getData').rows[index];
			if(row){
				$.post("<%=path %>/meetting/meettingActivate?id=" + row.meettingId,
					$("#editForm").serialize(),
					function(data){
						$('#list').datagrid('reload');	
						if(data.result.result=="fail"){
							$.messager.alert("提示", data.result.message, "info");
						}
				},"json");
			}
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
		<th data-options="field:'status',width:100" formatter="formatterOpt">状态</th>
		<th data-options="field:'bbb',width:60" formatter="formatStatus">操作</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="removeMeetting();" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		<input class="easyui-searchbox" data-options="prompt:'请输入搜索条件',menu:'#mm',searcher:doSearch" style="width:300px"></input>
		<div id="mm">
			<div data-options="name:'name',iconCls:'icon-ok'">主持人</div>
		</div>
		开始时间:<input id="startDatetime" name="startDatetime" class="easyui-datebox" data-options="required:false,editable:false" style="width:150px;"/>
		结束时间:<input id="endDatetime" name="endDatetime" class="easyui-datebox" data-options="required:false,editable:false" style="width:150px;"/>
		<a href="javascript:;" onclick="findPositions();" class="easyui-linkbutton" data-options="iconCls:'icon-'">查询</a>
	</div>
</div>
<div id="addWin" class="easyui-window" title="添加课程" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">主持人</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll();">
						<input id="empInput" class="easyui-textbox" name="empName"/>
						<input type="hidden" id="empInputId" class="easyui-textbox" name="meetting.empId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>开会时间:</td>
				<td><input type="datetime" class="easyui-datebox" name="meetting.meettingDay" data-options="required:true,showSeconds:true" value="3/4/2010 2:3"></td>
				
			</tr>
			<tr>
				<td>添加时间:</td>
				<td><input type="datetime" class="easyui-datebox" name="meetting.createdDay" data-options="required:true,showSeconds:true" value="3/4/2010 2:3"></td>
			</tr>
			<tr>
                <td>详情:</td>
                <td><input class="easyui-textbox" data-options="multiline:true" name="meetting.des" style="height:100px;"/></td>
            </tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addMeetting();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改课程" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="meetting.meettingId" />
		<table>
			<tr>
				<td width="100px">主持人:</td>
	  			<td>
	               	<a href="javascript:;" onclick="showEmpAll1();">
							<input id="empInput1" class="easyui-textbox" name="meetting.empName"/>
							<input type="hidden" id="empInput2" name="empId"/>
					</a>
	            </td>
			</tr>
				<tr>
				<td>开会时间:</td>
				<td><input id="dd" type="text" class="easyui-datebox" name="meetting.meettingDay" data-options="required:true,showSeconds:true" ></td>
				
			</tr>
			<tr>
				<td>添加时间:</td>
				<td><input id="dd" type="text" class="easyui-datebox" name="meetting.createdDay" data-options="required:true,showSeconds:true" ></td>
			</tr>
			<tr>
                <td>详情:</td>
                <td><input class="easyui-textbox" data-options="multiline:true" name="meetting.des" style="height:100px;"/></td>
            </tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editMeetting();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
				</td>
			</tr>
		</table>
	</form>
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