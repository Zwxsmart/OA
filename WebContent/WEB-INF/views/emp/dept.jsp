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
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
	<link rel="stylesheet" href="<%=path%>/css/main.css" />
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
	<script type="text/javascript" src="<%=path%>/js/main.js"></script>

	<script>

        var jsonStr = '{"dept.depId":"_depId","dept.name":"_name","dept.empId":"_empId","dept.des":"_des","dept.status":"_status","dept.empName":"_empName"}';

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
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            authority("com.cs.action.DeptAction.add","","save");
        }

        function addProduct() {
		 	if ($("#addForm").form("validate")) {
                $.post("<%=path %>/dept/add",
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
                $.messager.alert("提示", "请先选择一个需要修改的部门", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_depId", row.depId).replace("_name", row.name).replace("_empId", row.empId).replace("_des", row.des).replace("_status", row.status).replace("_empName", row.empName);
                    authority("com.cs.action.DeptAction.update",jsonStr1,"update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的部门", "info");
            }
        }

        function showEditProductWin1(index) {
            var row = $('#list').datagrid('getData').rows[index];
            if (row) { // 有选中的行
                // var jsonStr = '{"sAdmin.id":"' + row.id + '","sAdmin.email":"' + row.email +'","sAdmin.name":"' + row.name +'","sAdmin.des":"' + row.des +'"}';
                var jsonStr1 = jsonStr.replace("_depId", row.id).replace("_name", row.email).replace("_empId", row.name).replace("_role", row.role).replace("_status", row.status);
                alert(jsonStr1);
                $("#editForm").form("load", JSON.parse(jsonStr1));
                $("#editWin").window("open");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/dept/update",
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
                $.messager.alert("提示", "请先选择需要删除的部门", "info");
            }
        }

        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
        }

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
       

        function formatterOpt1(value, row, index) {
        	if (row.status == 0) {
        		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
        	}
        	
        }
        
        function formatterOpt2(value) {
        	return value.name;
        }
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/dept/depDisable?id=" + row.depId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/dept/depActivate?id=" + row.depId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
    	}
        
        function showStuDetails(depId) {
        	alert(depId)
        	$.get("<%=path %>/dept/updateStatus?id="+depId, 
        			function(data) { // data已经是一个JSON对象
        		}, "json");
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
			 $("#empInput").textbox('setValue',rows[0].name);
			 $("#emp").textbox('setValue',rows[0].empId);
			 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		//修改
		function showEmpAll1(){
			 $("#empDiv1").form("clear"); // 清除表单里的所有数据
			 $("#empDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#empTable1").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
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
	             $.messager.alert("提示", "请先选择一个需要查看的部门", "info");
	         } else if (rows.length == 1) {
	             var row = rows[0];
	             if (row) { // 有选中的行
	            	 $("#empTable").datagrid({url:'<%=path %>/emp/queryDeptAll?id='+rows[0].depId});// 当点击部门框时再加载部门信息
	            	 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
	             }
	         } else if (rows.length == 0) {
	             $.messager.alert("提示", "请先选择一个需要查看的部门", "info");
	         }
			
		}
	</script>
</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
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
		<th data-options="field:'empName',width:90">负责人</th>
		<th data-options="field:'des',width:100">介绍</th>
		<th data-options="field:'aaa',width:80" formatter="formatterOpt">状态</th>
		<th data-options="field:'bbb',width:80" formatter="formatterOpt1">操作</th>
		</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="showEmpAll4();" class="easyui-linkbutton" plain="flase" iconCls="icon-search">查询员工</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加部门" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">部门名称</td>
				<td>
					<select id="depIdSele" class="easyui-combobox" name="dept.name" style="width:175px;" data-options="editable:false">
						<option value="政教部">政教部</option>
						<option value="学术部">学术部</option>
						<option value="行政部">行政部</option>
						<option value="后勤部">后勤部</option>
						<option value="财务部">财务部</option>
						<option value="招生部">招生部</option>
						<option value="研发部">研发部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>负责人</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll();">
						<input id="empInput" style="width:165px;" class="easyui-textbox easyui-validatebox" name="empName" data-options="required:true"/>
						<input type="hidden" id="emp" class="easyui-textbox" name="empId"/>
					</a>
				</td>
			</tr>
			
			<tr>
				<td>介绍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="dept.des" data-options="required:true" style="width:175px;height:32px"/></td>
			</tr>
			<%-- <tr>
				<td>状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="dept.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr> --%>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改部门" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="dept.depId" />
		<table>
			<tr>
				<td width="100px">部门名称</td>
				<td>
					<select class="easyui-combobox" name="dept.name" style="width:175px;" data-options="editable:false">
						<option value="政教部">政教部</option>
						<option value="学术部">学术部</option>
						<option value="行政部">行政部</option>
						<option value="后勤部">后勤部</option>
						<option value="财务部">财务部</option>
						<option value="招生部">招生部</option>
						<option value="研发部">研发部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>负责人</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll1();">
						<input id="empInput1" style="width:165px;" class="easyui-textbox easyui-validatebox" name="dept.empName" data-options="required:true"/>
						<input type="hidden" id="emp1" class="easyui-textbox" name="dept.empId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>介绍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="dept.des" data-options="required:true" style="width:175px;height:32px"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select style="width:175px;" class="easyui-combobox" name="dept.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" style="width: 60px;" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>

		</table>
	</form>
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

<div id="empDiv2" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable2" class="easyui-datagrid"
	   data-options="singleSelect:true,
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