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

        var jsonStr = '{"empLeave.leaveId":"_leaveId","empLeave.empId":"_empId","empLeave.emp":"_empName",' +
        	
			'"empLeave.startTime":"_startTime","empLeave.endTime":"_endTime","empLeave.leaveDay":"_leaveDay",' +
			
			'"empLeave.des":"_des","empLeave.status":"_status","empLeave.firstLevel":"_firstLevel",'+
			
			'"empLeave.secondLevel":"_secondLevel", "empLeave.pass":"_pass"}';
	    	
			
        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/empLeave/save",
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
        }

        function showEditProductWin() {
            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
            var rows = $("#list").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的员工", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_leaveId", row.leaveId).replace("_empId", row.empId).replace("_empName",row.emp.name).
					replace("_startTime", row.startTime).replace("_endTime", row.endTime).replace("_leaveDay", row.leaveDay).
					replace("_des", row.des).replace("_status", row.status).replace("_firstLevel", row.firstLevel).
					replace("_secondLevel", row.secondLevel).replace("_pass",row.pass);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的员工", "info");
            }
            $("#empNameInput1").textbox('setValue',rows[0].emp.name);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/empLeave/update",
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

        function removeProduct() {
            var row = $("#list").datagrid("getSelected");
            if (row) {
                $.messager.confirm("提示", "确定删除吗？", function (r) {
                    if (r) { // 点击了确定按键
                        $.get("<%=path %>/product/del?id=" + row.id, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的商品", "info");
            }
        }

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
        function formatterOpt3(value, row, index) {
            if (row.firstLevel == 1) {
                return "<b>通过</b>"
			} else if(row.firstLevel == 0) {
                return "<b>不通过</b>"
			}
        }
        
        function formatterOpt4(value, row, index) {
            if (row.secondLevel == 1) {
                return "<b>通过</b>"
			} else if(row.secondLevel == 0) {
                return "<b>不通过</b>"
			}
        }
        
        function formatterOpt5(value, row, index) {
            if (row.pass == 1) {
                return "<b>通过</b>"
			} else if(row.pass == 0) {
                return "<b>不通过</b>"
			}
        }
        
        function formatterOpt1(value, row, index) {
        	if (row.status == 0) {
        		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
        	}
        	
        }
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/empLeave/empLeaveDisable?id=" + row.leaveId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/empLeave/empLeaveActivate?id=" + row.leaveId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
    	}
		 
		 //给员工赋值
	      function formatterOpt2(value) {
	        	return value.name;
	       }
		 
	    //模糊查询方法
	      function qq(value,name){
	        	$('#list').datagrid({ url: '<%=path %>/empLeave/blurredAllQuery?value1='+value+'&name1='+name});
	        }
	     	 
     	//时间段查询
        function findPositions(){
    		var beginTime=$("#startDatetime").datetimebox("getValue");
    		var endTime=$("#endDatetime").datetimebox("getValue");
    		$('#list').datagrid({ url: '<%=path %>/empLeave/serachTime?beginTime='+beginTime+'&endTime='+endTime});
    	}
     	
     	// 查询全部
        function showAllProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/empLeave/queryAll'}); 
     	}
		 
	</script>
	
	<script>

		//添加
		function showEmpAll(){
			 $("#empDiv").form("clear"); // 清除表单里的所有数据
			 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
		}
		function getEmp(){
			var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empNameInput").textbox('setValue',rows[0].name);
			 $("#emp").textbox('setValue',rows[0].empId);
			 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		//修改
		function showEmpAll1(){
			 $("#empDiv1").form("clear"); // 清除表单里的所有数据
			 $("#empDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#empTable1").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载宿舍信息
		}
		function getEmp1(){
			var rows = $("#empTable1").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empNameInput1").textbox('setValue',rows[0].name);
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
			url:'<%=path %>/empLeave/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'leaveId',checkbox:true">请假编号</th>
		<th data-options="field:'emp',width:80" formatter="formatterOpt2">员工姓名</th>
		<th data-options="field:'startTime',width:125">开始时间</th>
		<th data-options="field:'endTime',width:125">结束时间</th>
		<th data-options="field:'leaveDay',width:125">提交时间</th>
		<th data-options="field:'des',width:100">请假描述</th>
		<th data-options="field:'firstLevel',width:100" formatter="formatterOpt3">直属上司审核</th>
		<th data-options="field:'secondLevel',width:100" formatter="formatterOpt4">老板审核</th>
		<th data-options="field:'pass',width:100" formatter="formatterOpt5">通过状态</th>
	    <th data-options="field:'status',width:80" formatter="formatterOpt">状态</th>
	    <th data-options="field:'bbb',width:80" formatter="formatterOpt1">操作</th>
		
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		开始时间:<input id="startDatetime" name="startDatetime" class="easyui-datebox" style="width:150px;"/>
		结束时间:<input id="endDatetime" name="endDatetime" class="easyui-datebox" style="width:150px;"/>
		<a href="javascript:;" onclick="findPositions();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	    <div data-options="name:'empp'">员工姓名</div>
	</div>

<div id="addWin" class="easyui-window" title="添加员工请假信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工姓名</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll();">
						<input id="empNameInput" class="easyui-textbox easyui-validatebox" name="empName" data-options="required:true"/>
						<input type="hidden" id="emp"  class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>开始时间</td>
				<td><input class="easyui-datetimebox" name="empLeave.startTime"></td>
			</tr>
			<tr>
				<td>结束时间</td>
				<td><input class="easyui-datetimebox" name="empLeave.endTime"></td>
			</tr>
			<tr>
				<td>提交时间</td>
				<td><input class="easyui-datetimebox" name="empLeave.leaveDay"></td>
			</tr>
			<tr>
				<td>请假描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empLeave.des" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>直属上司审核</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.firstlevel"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>老板审核</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.secondlevel"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>通过状态</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.pass"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.status"><option value="1">启用</option><option value="0">禁用</option></select></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改员工请假信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="empLeave.leaveId" />
		<table>
			<tr>
				<td>员工姓名</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll1();">
						<input id="empNameInput1" class="easyui-textbox easyui-validatebox" name="empLeave.empName" data-options="required:true"/>
						<input type="hidden" id="emp1" class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>开始时间</td>
				<td><input class="easyui-datetimebox" name="empLeave.startTime"></td>
			</tr>
			<tr>
				<td>结束时间</td>
				<td><input class="easyui-datetimebox" name="empLeave.endTime"></td>
			</tr>
			<tr>
				<td>提交时间</td>
				<td><input class="easyui-datetimebox" name="empLeave.leaveDay"></td>
			</tr>
			<tr>
				<td>请假描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empLeave.des" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>直属上司审核</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.firstlevel"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>老板审核</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.secondlevel"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>通过状态</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.pass"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><select style="width:80px;" class="easyui-combobox" name="empLeave.status"><option value="1">启用</option><option value="0">禁用</option></select></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="empDiv" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
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