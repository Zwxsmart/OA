<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支出信息</title>
<link rel="stylesheet"
	href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>

<script>

        var jsonStr = '{"pay.payId":"_payId",'+
        	'"pay.payTypeId":"_payTypeId",'+
        	'"pay.payDay":"_payDay",'+
        	'"pay.des":"_des",'+
        	'"pay.pay":"_pay",'+
        	'"pay.empId":"_empId",'+
        	'"pay.toName":"_toName",'+
        	'"pay.toPhone":"_toPhone",'+
        	'"pay.payTypeName":"_payTypeName",'+
        	'"pay.empName":"_empName",'+
        	'"pay.empId":"_empId"}'

        $(function () {
            setPagination("list");
        });
        function authority(methodName, str, method) {
    		$.get("<%=path%>/auth/authority?methodName=" + methodName,
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
        function showAddProductWin() {//+++++
            $("#addForm").form("clear"); // 清除表单里的所有数据
            authority('com.cs.action.PayAction.save', "", "save");
        }

        function showEditProductWin() {
            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
            var rows = $("#list").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的支出情况", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                	// var jsonStr1 = jsonStr.replace("_payTypeId", row.payTypeId).replace("_name", row.name).replace("_des", row.des).replace("_status", row.status);
                    var jsonStr1 = jsonStr
                        .replace("_payId", row.payId)
                        .replace("_payTypeId", row.payTypeId)
                        .replace("_payDay", row.payDay)
                        .replace("_des", row.des)
                        .replace("_pay", row.pay)
                        .replace("_empId", row.empId)
                        .replace("_toName", row.toName)
                        .replace("_toPhone", row.toPhone)
                        .replace("_payTypeName", row.payType.name)
                        .replace("_empName", row.emp.name)
                        .replace("_empId", row.emp.id)
                        .replace("_payTypeId", row.payType.id);
                    authority('com.cs.action.PayAction.update', jsonStr1, "update");//+++
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改支出", "info");
            }
            $("#payTypeInput1").textbox('setValue',rows[0].payType.name);
            $("#empInput1").textbox('setValue',rows[0].emp.name);
            
        }

        function addPay() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path%>/pay/save",
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

        function editPay() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path%>/pay/update",
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

    	//模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path %>/pay/blurredAllQuery?value1='+value+'&name1='+name});
         }
     	 
     	//时间段查询
        function findPositions(){
    		var beginTime=$("#startDatetime").datetimebox("getValue");
    		var endTime=$("#endDatetime").datetimebox("getValue");
    		$('#list').datagrid({ url: '<%=path %>/pay/serachTime?beginTime='+beginTime+'&endTime='+endTime});
    	}
		
		 function showAllProductWin(){
	        	$('#list').datagrid({ url: '<%=path %>/pay/queryAll'}); 
		 }

      //赋值
         function formatterOpt2(value) {
        	return value.name;
        }

        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
        }

      //添加
        function showpayTypeAll(){
	   		 $("#payTypeDiv").form("clear"); // 清除表单里的所有数据
	   		 $("#payTypeDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
	   		 $("#payTypeTable").datagrid({url:'<%=path%>/payType/queryAll'});// 当点击部门框时再加载部门信息
   		}
   		function getpayType(){
			var rows = $("#payTypeTable").datagrid("getSelections");// 获取表格中选中行的数据
	   		 $("#payTypeInput").textbox('setValue',rows[0].name);
	   		 $("#payType").textbox('setValue',rows[0].payTypeId);
	   		 $("#payTypeDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
   		}
  	//修改
		function showpayTypeAll1(){
			 $("#payTypeDiv1").form("clear"); // 清除表单里的所有数据
			 $("#payTypeDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#payTypeTable1").datagrid({url:'<%=path%>/payType/queryAll'});// 当点击部门框时再加载宿舍信息
	}
	function getpayType1() {
		var rows = $("#payTypeTable1").datagrid("getSelections");// 获取表格中选中行的数据
		$("#payTypeInput1").textbox('setValue', rows[0].name);
		$("#payType1").textbox('setValue', rows[0].payTypeId);
		$("#payTypeDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
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
<body style="height: 100%;">
	<table id="list" class="easyui-datagrid"
		data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path%>/pay/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
		style="height: 100%;">
		<thead>
			<tr>
				<th data-options="field:'payId',checkbox:true">支出编号</th>
				<th data-options="field:'payType',width:100" formatter="formatterOpt2">支出类别</th>
				<th data-options="field:'emp',width:80" formatter="formatterOpt2">员工</th>
				<th data-options="field:'payDay',width:125">支出时间</th>
				<th data-options="field:'des',width:80">描述</th>
				<th data-options="field:'pay',width:80">支出金额</th>
				<th data-options="field:'toName',width:80">收款人姓名</th>
				<th data-options="field:'toPhone',width:80">收款人联系方式</th>
			</tr>
		</thead>
	</table>

	<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a> 
			<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" plain="false" iconCls="icon-search">查询全部</a>
		开始时间:<input id="startDatetime" name="startDatetime" class="easyui-datebox" data-options="editable:false" style="width:150px;"/>
		结束时间:<input id="endDatetime" name="endDatetime" class="easyui-datebox" data-options="editable:false" style="width:150px;"/>
		<a href="javascript:;" onclick="findPositions();" class="easyui-linkbutton" data-options="iconCls:'icon-'">查询</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
		<div data-options="name:'payTypes'">支出类别名称</div>
	    <div data-options="name:'emps'">员工名称</div>
	</div>


	<div id="addWin" class="easyui-window" title="添加支出"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<form id="addForm">
			<table>
				<tr>
					<td>支出类别</td>
					<td>
						<a href="javascript:;" onclick="showpayTypeAll();"> 
							<input id="payTypeInput" class="easyui-textbox" name="payTypeName" /> 
							<input type="hidden" id="payType" class="easyui-textbox" name="payTypeId" />
						</a>
					</td>
				</tr>
				<tr>
					<td>支出时间</td>
					<td><input type="text" class="easyui-datetimebox"
						name="pay.payDay" data-options="required:true,showSeconds:false"
						value="3/4/2010 2:3"></td>
				</tr>
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
					<td>支出金额</td>
					<td><input class="easyui-validatebox easyui-numberbox"
						name="pay.pay" data-options="required:true" precision="2"  /></td>
				</tr>
				<tr>
					<td>收款人姓名</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="pay.toName"
						data-options="required:true,validType:'length[1,20]'" /></td>
				</tr>
				<tr>
					<td>收款人联系方式</td>
					<td><input class="easyui-validatebox easyui-numberbox"
						name="pay.toPhone"
						data-options="required:true,validType:'length[11,11]'" /></td>
				</tr>
				<tr>
					<td>描述</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="pay.des" style="height: 100px;" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="addPay();"
						class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="editWin" class="easyui-window" title="修改支出"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<form id="editForm">
			<input type="hidden" name="pay.payId" />
			<table>
				<tr>
					<td>支出类别</td>
					<td><a href="javascript:;" onclick="showpayTypeAll1();"> <input
							id="payTypeInput1" class="easyui-textbox" name="payTypeName" /> <input
							type="hidden" id="payType1" class="easyui-textbox"
							name="payTypeId" />
					</a></td>
				</tr>
				<tr>
					<td>支出时间</td>
					<td><input type="text" class="easyui-datetimebox"
						name="pay.payDay" data-options="required:true,showSeconds:false"
						value="3/4/2010 2:3"></td>
				</tr>
				<tr>
					<td>员工</td>
					<td>
						<a href="javascript:;" onclick="showempAll1();"> 
							<input id="empInput1" class="easyui-textbox" name="empName" /> 
							<input type="hidden" id="emp1" class="easyui-textbox" name="empId" />
						</a>
					</td>
				</tr>
				<tr>
					<td>支出金额</td>
					<td><input class="easyui-validatebox easyui-numberbox"
						name="pay.pay" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>收款人姓名</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="pay.toName"
						data-options="required:true,validType:'length[1,20]'" /></td>
				</tr>
				<tr>
					<td>收款人联系方式</td>
					<td><input class="easyui-validatebox easyui-numberbox"
						name="pay.toPhone"
						data-options="required:true,validType:'length[11,11]'" /></td>
				</tr>
				<tr>
					<td>描述</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="pay.des" style="height: 100px;" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="editPay();"
						class="easyui-linkbutton" data-options="iconCls:'icon-save'">修改</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="payTypeDiv" class="easyui-window" title="收入类型"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="payTypeTable" class="easyui-datagrid"
			data-options="singleSelect:true,
	   		onClickRow:getpayType,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'payTypeId',checkbox:true">收入类型编号</th>
					<th data-options="field:'name',width:60">收入名称</th>
					<th data-options="field:'des',width:100">收入描述</th>
				</tr>
			</thead>
		</table>
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
			<th data-options="field:'depId',checkbox:true">编号</th>
			<th data-options="field:'name',width:60">姓名</th>
		</tr>
	</thead>
</table>
</div>
<!-- 添加 員工-->
	<div id="payTypeDiv1" class="easyui-window" title="收入类型"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="payTypeTable1" class="easyui-datagrid"
			data-options="singleSelect:true,
	   		onClickRow:getpayType1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'payTypeId',checkbox:true">收入类型编号</th>
					<th data-options="field:'name',width:60">收入名称</th>
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
		</tr>
	</thead>
</table>
</div>
<!-- 修改 員工-->
</body>
</html>