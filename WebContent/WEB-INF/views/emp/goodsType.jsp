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

        var jsonStr = '{"goodsType.goodsTypeId":"_goodsTypeId","goodsType.name":"_name","goodsType.des":"_des","goodsType.status":"_status"}';

        
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
            authority("com.cs.action.GoodsTypeAction.save","","save");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/goodsType/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的物品类型", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { 
                    var jsonStr1 = jsonStr.replace("_goodsTypeId", row.goodsTypeId).
                    replace("_name", row.name).replace("_des", row.des).replace("_status", row.status);
                    authority("com.cs.action.GoodsTypeAction.update",jsonStr1,"update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的物品类型", "info");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/goodsType/update",
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
                        $.get("<%=path %>/goodsType/del?id=" + row.id, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的物品类型", "info");
            }
        }

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
        function formatterOpt2(value, row, index) {
        	if (row.status == 0) {
        		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
        	}
        	
        }
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goodsType/empDisable?id=" + row.goodsTypeId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goodsType/empActivate?id=" + row.goodsTypeId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
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
			url:'<%=path %>/goodsType/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'goodsTypeId',checkbox:true">物品类型编号</th>
		<th data-options="field:'name',width:80">类型名称</th>
		<th data-options="field:'des',width:115">物品描述</th>
		<th data-options="field:'aa',width:80" formatter="formatterOpt">物品状态</th>
		<th data-options="field:'bbb',width:80" formatter="formatterOpt2">操作</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加物品类型信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">类型名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsType.name" style="width:175px;" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>物品描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsType.des" data-options="required:true" style="width:175px;height:32px"/></td>
			</tr>
			<%-- <tr>
				<td>物品状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="goodsType.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr>
 --%>			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改物品类型信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="goodsType.goodsTypeId" />
		<table>
			<tr>
				<td width="100px">类型名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsType.name" style="width:175px;" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>物品描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsType.des" data-options="required:true" style="width:175px;height:32px"/></td>
			</tr>
			<tr>
				<td>物品状态</td>
				<td>
					<select style="width:175px;" class="easyui-combobox" name="goodsType.status"><option value="1">启用</option><option value="0">禁用</option></select>
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

</body>
</html>