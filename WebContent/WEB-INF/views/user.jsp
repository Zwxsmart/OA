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

        var jsonStr = '{"sAdmin.id":"_id","sAdmin.email":"_email","sAdmin.name":"_name","sAdmin.password":"_password","sAdmin.role":"_role","sAdmin.create_time":"_create_time", "sAdmin.status":"_status"}';

        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/admin/add",
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
                $.messager.alert("提示", "请先选择一个需要修改的商品", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_id", row.id).replace("_email", row.email).replace("_name", row.name).replace("_password", row.password).replace("_role", row.role).replace("_status", row.status);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的商品", "info");
            }
        }

        function showEditProductWin1(index) {
            var row = $('#list').datagrid('getData').rows[index];
            if (row) { // 有选中的行
                // var jsonStr = '{"sAdmin.id":"' + row.id + '","sAdmin.email":"' + row.email +'","sAdmin.name":"' + row.name +'","sAdmin.des":"' + row.des +'"}';
                var jsonStr1 = jsonStr.replace("_id", row.id).replace("_email", row.email).replace("_name", row.name).replace("_role", row.role).replace("_status", row.status);
                alert(jsonStr1);
                $("#editForm").form("load", JSON.parse(jsonStr1));
                $("#editWin").window("open");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/admin/update",
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

        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
        }

        function formatterOpt(value, row, index) {
            if (row.status == 'Y') {
                return "<b>已启用</b>"
			} else if(row.status == 'N') {
                return "<b>已禁用</b>"
			}
        }

        function formatterOpt1(value, row, index) {
       		if (row.role == 'super') {
                return "<b>超级管理员</b>"
            } else if (row.role == 'normal') {
                return "<b>管理员</b>"
            }

        }

	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/user/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'id',checkbox:true">编号</th>
		<th data-options="field:'email',width:100">邮箱</th>
		<th data-options="field:'name',width:50">姓名</th>
		<th data-options="field:'bbb',width:100" formatter="formatterOpt1">角色</th>
		<th data-options="field:'last_login_time',width:120">最后一次登录时间</th>
		<th data-options="field:'create_time',width:120">创建时间</th>
		<th data-options="field:'aaa',width:80" formatter="formatterOpt">状态</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加商品" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>email</td>
				<td><input class="easyui-validatebox easyui-textbox" name="sAdmin.email" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>名字</td>
				<td><input class="easyui-validatebox easyui-textbox" name="sAdmin.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="sAdmin.password" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>角色</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="sAdmin.role"><option value="normal">管理员</option><option value="super">超级管理员</option></select>
					<%--<input class="easyui-validatebox easyui-textbox" name="sAdmin.role" data-options="required:true,validType:'length[2,20]'"/>--%>
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

<div id="editWin" class="easyui-window" title="修改商品" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="sAdmin.id" />
		<table>
			<tr>
				<td>email</td>
				<td><input class="easyui-validatebox easyui-textbox" name="sAdmin.email" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>名字</td>
				<td><input class="easyui-validatebox easyui-textbox" name="sAdmin.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="sAdmin.password" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>角色</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="sAdmin.role"><option value="normal">管理员</option><option value="super">超级管理员</option></select>

					<%--<input class="easyui-validatebox easyui-textbox" name="sAdmin.role" data-options="required:true,validType:'length[2,20]'"/>--%>
				</td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select style="width: 100px;" class="easyui-combobox" name="sAdmin.status"><option value="Y">启用</option><option value="N">禁用</option></select>
					<%--<input class="easyui-validatebox easyui-textbox" name="sAdmin.status" data-options="required:true"/>--%>
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

<div id="dlg" class="easyui-dialog" title="超级电商" data-options="closed:true" style="width:400px;height:200px;padding:10px">
	这是一个对话框
</div>

</body>
</html>