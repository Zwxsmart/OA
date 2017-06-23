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

        var jsonStr = '{"role.roleId":"_roleId","role.name":"_name","role.des":"_des","role.status":"_status"}';

        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/role/add",
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
                $.messager.alert("提示", "请先选择一个需要修改的角色", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_roleId", row.roleId).replace("_name", row.name).replace("_des", row.des).replace("_status", row.status);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的角色", "info");
            }
        }

        function showEmpWin(index) {
            var row = $('#list').datagrid('getData').rows[index];
            if (row) { // 有选中的行
                // var jsonStr = '{"sAdmin.id":"' + row.id + '","sAdmin.email":"' + row.email +'","sAdmin.name":"' + row.name +'","sAdmin.des":"' + row.des +'"}';
                var jsonStr1 = jsonStr.replace("_depId", row.id).replace("_name", row.email).replace("_roleId", row.name).replace("_role", row.role).replace("_status", row.status);
                $("#editForm").form("load", JSON.parse(jsonStr1));
                $("#editWin").window("open");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/role/update",
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
    			$.post("<%=path %>/role/roleDisable?id=" + row.roleId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/role/roleActivate?id=" + row.roleId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    	}
    	
    	//模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path %>/role/blurredAllQuery?value1='+value+'&name1='+name});
         }
    	
    	// 查询全部
        function showAllProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/role/queryAll'}); 
     }

	</script>
	
	<script>
	//查询角色对应的员工
	function showEmpAll(index){
		 $("#empDiv").form("clear"); // 清除表单里的所有数据
		 var rows = $("#list").datagrid("getSelections");
		 if (rows.length > 1) {
             $.messager.alert("提示", "请先选择一个需要查看的角色", "info");
         } else if (rows.length == 1) {
             var row = rows[0];
             if (row) { // 有选中的行
            	 $("#empTable").datagrid({url:'<%=path %>/emp/queryRoleAll?id='+rows[0].roleId});// 当点击部门框时再加载部门信息
            	 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
             }
         } else if (rows.length == 0) {
             $.messager.alert("提示", "请先选择一个需要查看的角色", "info");
         }
		
	}
	function getEmp(){
		var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#empNameInput").textbox('setValue',rows[0].name);
		 $("#emp").textbox('setValue',rows[0].empId);
		 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/role/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'roleId',checkbox:true">编号</th>
		<th data-options="field:'name',width:100">姓名</th>
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
		<a href="javascript:;" onclick="showEmpAll();" class="easyui-linkbutton" plain="flase" iconCls="icon-search">查询员工</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	<div data-options="name:'name'">名称</div>
	</div>

<div id="addWin" class="easyui-window" title="添加角色" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>名称</td>
				<td>
					<select class="easyui-combobox" name="role.name" style="width:150px;">
						<option value="行政部主任">行政部主任</option>
						<option value="班主任">班主任</option>
						<option value="教务部主任">教务部主任</option>
						<option value="任课老师">任课老师</option>
						<option value="招生部主任">招生部主任</option>
						<option value="招生老师">招生老师</option>
						<option value="后勤部主任">后勤部主任</option>
						<option value="财务部主任">财务部主任</option>
						<option value="超级管理员">超级管理员</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>介绍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="role.des" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="role.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改角色" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="role.roleId" />
		<table>
			<tr>
				<td>名称</td>
				<td>
					<select class="easyui-combobox" name="role.name" style="width:150px;">
						<option value="行政部主任">行政部主任</option>
						<option value="班主任">班主任</option>
						<option value="教务部主任">教务部主任</option>
						<option value="任课老师">任课老师</option>
						<option value="招生部主任">招生部主任</option>
						<option value="招生老师">招生老师</option>
						<option value="后勤部主任">后勤部主任</option>
						<option value="财务部主任">财务部主任</option>
						<option value="超级管理员">超级管理员</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>介绍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="role.des" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="role.status"><option value="1">启用</option><option value="0">禁用</option></select>
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

</body>
</html>