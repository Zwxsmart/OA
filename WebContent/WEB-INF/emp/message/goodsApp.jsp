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

        var jsonStr = '{"goodsApp.goodsAppId":"_goodsAppId","goodsApp.empId":"_empId","goodsApp.emp":"_empName",'+
        	'"goodsApp.appDay":"_appDay","goodsApp.goodsName":"_goodsName",'+
        	'"goodsApp.quantity":"_quantity","goodsApp.des":"_des",'+
        	'"goodsApp.status":"_status","goodsApp.appStatus":"_appStatus","goodsApp.unitPrice":"_unitPrice"}';

        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/goodsApp/saveGoodsApp",
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
            $("#empNameInput1").textbox('setValue',rows[0].emp.name);
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的物品申购", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_goodsAppId", row.goodsAppId).replace("_empId",row.empId).
                    replace("_empName",row.emp.name).replace("_appDay", row.appDay).replace("_goodsName", row.goodsName).
                    replace("_quantity", row.quantity).replace("_des", row.des).replace("_status",row.status).
                    replace("_appStatus", row.appStatus).replace("_unitPrice", row.unitPrice);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的物品申购", "info");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/goodsApp/update",
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
                $.messager.alert("提示", "请先选择需要删除的物品申购", "info");
            }
        }


        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
        function formatterOptt(value, row, index) {
            if (row.appStatus == 1) {
                return "<b>审核中</b>"
			} else if(row.appStatus == 0) {
                return "<b>已失败</b>"
			} else if(row.appStatus == 2){
				return "<b>已审核</b>"
			}
        }
        
        function formatterOptt1(value, row, index) {
        	if (row.appStatus == 0) {
        		return "<a>通过</a>"
        	} else {
        		return "<a>未通过</a>"
        	}
        }
        
        function adable(index){   // 未通过
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goodsApp/goodsAppDis?id=" + row.goodsAppId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		 
    	function aavate(index){  // 通过
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goodsApp/goodsAppAct?id=" + row.goodsAppId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
    	}

        function formatterOpt1(value, row, index) {
        	if (row.status == 0) {
        		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
        	}
        }
        
      	//给员工赋值
        function formatterOpt2(value) {
        	return value.name;
        }
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goodsApp/goodsAppDisable?id=" + row.goodsAppId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
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
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goodsApp/goodsAppActivate?id=" + row.goodsAppId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
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
			url:'<%=path %>/goodsApp/giveBack',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'goodsAppId',checkbox:true">物品申购编号</th>
		<th data-options="field:'appDay',width:125" formatter="formatTime">申购时间</th>
		<th data-options="field:'goodsName',width:90">物品名称</th>
		<th data-options="field:'quantity',width:90">物品数量</th>
		<th data-options="field:'unitPrice',width:60">申购价格</th>
		<th data-options="field:'des',width:100">申购原因</th>
		<th data-options="field:'appStatus',width:90" formatter="formatterOptt">申购状态</th>
		<th data-options="field:'status',width:90" formatter="formatterOpt">状态</th>
		<th data-options="field:'bbb',width:80" formatter="formatterOpt1">操作</th>
		
		
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加物品申购" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">申购时间</td>
				<td><input class="easyui-datebox" name="goodsApp.appDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>物品名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsApp.goodsName" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goodsApp.quantity" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>申购价格</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsApp.unitPrice" data-options="required:true,precision:2"/></td>
			</tr>
			<tr>
				<td>申购原因</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsApp.des" data-options="required:true" style="width:100%;height:32px"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改物品申购" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="goodsApp.goodsAppId" />
		<table>
			<tr>
				<td width="100px">申购时间</td>
				<td><input class="easyui-datebox" name="goodsApp.appDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>物品名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsApp.goodsName" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goodsApp.quantity" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>申购价格</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsApp.unitPrice" data-options="required:true,precision:2"/></td>
			</tr>
			<tr>
				<td>申购原因</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goodsApp.des" data-options="required:true" style="width:100%;height:32px"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="goodsApp.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
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