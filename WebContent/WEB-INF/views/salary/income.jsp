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
<title>Insert title here</title>
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

        var jsonStr = '{"income.incomeId":"_incomeId","income.incomeTypeId":"_incomeTypeId",'+
			'"income.incomeDay":"_incomeDay","income.des":"_des","income.income":"_income",'+
			'"income.empId":"_empId","income.stuId":"_stuId","income.incomeTypeName":"_incomeTypeName"'+
			'"income.empName":"_empName","income.stuName":"_stuName","income.empId":"_empId"'+
			'"income.stuId":"_stuId"}'
        
		function authority(methodName, str, method) {//+++
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
		$(function() {
            setPagination("list");
        });
		
		function showAddProductWin() {//+++++
            $("#addForm").form("clear"); // 清除表单里的所有数据
            authority('com.cs.action.IncomeAction.save', "", "save");
        }
		
        function showEditProductWin() {
            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
            var rows = $("#list").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的工资情况", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_incomeId", row.incomeId)
                    .replace("_incomeTypeId", row.incomeTypeId)
                    .replace("_incomeDay", row.incomeDay)
                    .replace("_des", row.des)
                    .replace("_income", row.income)
                    .replace("_empId", row.empId)
					.replace("_stuId", row.stuId)
					.replace("_incomeTypeName", row.incomeType.name)
					.replace("_empName", row.emp.name)
					.replace("_stuName", row.stu.name)
					.replace("_incomeTypeId", row.incomeType.id)
					.replace("_empId", row.emp.id)
					.replace("_stuId", row.stu.id);
                    authority('com.cs.action.IncomeAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改支出", "info");
            }
            $("#incomeTypeInput1").textbox('setValue',rows[0].incomeType.name);
            $("#empInput1").textbox('setValue',rows[0].emp.name);
        }
    

        function addIncome() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path%>/income/save",
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

        function editIncome() {//修改
            if ($("#editForm").form("validate")) {
                $.post("<%=path%>/income/update",
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
        </script>
<!-- 查询 -->
<script>
      //模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path%>/income/blurredAllQuery?value1='+value+'&name1='+name});
         }
     	 
     	//时间段查询
        function findPositions(){
    		var beginTime=$("#startDatetime").datetimebox("getValue");
    		var endTime=$("#endDatetime").datetimebox("getValue");
    		$('#list').datagrid({ url: '<%=path%>/income/serachTime?beginTime='+beginTime+'&endTime='+endTime});
    	}
		
		 function showAllProductWin(){
	        	$('#list').datagrid({ url: '<%=path%>/income/queryAll'}); 
		 }
	        	
        //给支出类型赋值
        function formatterOpt2(value) {
        	return value.name;
        }
        
        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
        }

     
	</script>

<!-- 查询其他表的数据 -->
<script>
	
	 //添加类型
    function showincomeTypeAll(){
   		 $("#incomeTypeDiv").form("clear"); // 清除表单里的所有数据
   		 $("#incomeTypeDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
   		 $("#incomeTypeTable").datagrid({url:'<%=path%>/incomeType/queryAll'});// 当点击部门框时再加载部门信息
	}
    
		function getincomeType(){
		var rows = $("#incomeTypeTable").datagrid("getSelections");// 获取表格中选中行的数据
   		 $("#incomeTypeInput").textbox('setValue',rows[0].name);
   		 $("#incomeType").textbox('setValue',rows[0].incomeTypeId);
   		 $("#incomeTypeDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
	//修改类型
		function showincomeTypeAll1(){
			 $("#incomeTypeDiv1").form("clear"); // 清除表单里的所有数据
			 $("#incomeTypeDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#incomeTypeTable1").datagrid({url:'<%=path%>/incomeType/queryAll'});// 当点击部门框时再加载宿舍信息
		}
		function getincomeType1() {
			var rows = $("#incomeTypeTable1").datagrid("getSelections");// 获取表格中选中行的数据
			$("#incomeTypeInput1").textbox('setValue',rows[0].name);
			$("#incomeType1").textbox('setValue', rows[0].incomeTypeId);
			$("#incomeTypeDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
	//添加员工
	function showempAll(){
		 $("#empDiv").form("clear"); // 清除表单里的所有数据
		 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#empTable").datagrid({url:'<%=path%>/emp/queryAll'});// 当点击部门框时再加载部门信息
	}
	function getemp(){
		var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#empInput").textbox('setValue',rows[0].name);
		 $("#emp").textbox('setValue',rows[0].empId);
		 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	//修改员工
	function showempAll1(){
		 $("#empDiv1").form("clear"); // 清除表单里的所有数据
		 $("#empDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#empTable1").datagrid({url:'<%=path%>/emp/queryAll'});// 当点击部门框时再加载宿舍信息
	}
	function getemp1(){
		var rows = $("#empTable1").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#empInput1").textbox('setValue',rows[0].name);
		 $("#emp1").textbox('setValue',rows[0].empId);
		 $("#empDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	//添加学生
	function showstuAll(){
		 $("#stuDiv").form("clear"); // 清除表单里的所有数据
		 $("#stuDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#stuTable").datagrid({url:'<%=path%>/stu/queryAll'});// 当点击部门框时再加载部门信息
	}
	function getstu(){
		var rows = $("#stuTable").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#stuInput").textbox('setValue',rows[0].name);
		 $("#stu").textbox('setValue',rows[0].stuId);
		 $("#stuDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	//修改学生
	function showstuAll1(){
		 $("#stuDiv1").form("clear"); // 清除表单里的所有数据
		 $("#stuDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#stuTable1").datagrid({url:'<%=path%>/stu/queryAll'});// 当点击部门框时再加载宿舍信息
	}
	function getstu1() {
		var rows = $("#stuTable1").datagrid("getSelections");// 获取表格中选中行的数据
		$("#stuInput1").textbox('setValue', rows[0].name);
		$("#stu1").textbox('setValue', rows[0].stuId);
		$("#stuDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
</script>

</head>
<body style="height: 100%;">
	<table id="list" class="easyui-datagrid"
		data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path%>/income/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
		style="height: 100%;">
		<thead>
			<tr>
				<th data-options="field:'incomeId',checkbox:true">工资情况编号</th>
				<th data-options="field:'incomeType',width:100"
					formatter="formatterOpt2">收入类型</th>
				<th data-options="field:'emp',width:100" formatter="formatterOpt2">员工</th>
				<th data-options="field:'stu',width:100" formatter="formatterOpt2">学生</th>
				<th data-options="field:'incomeDay',width:125">收入时间</th>
				<th data-options="field:'des',width:100">收入详情</th>
				<th data-options="field:'income',width:100" onclick="taiyaki()">收入金额</th>

			</tr>
		</thead>
	</table>
	<!-- 操作按钮 -->
	<div id="tb" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<a href="javascript:;" onclick="showAddProductWin();"
				class="easyui-linkbutton" iconCls="icon-add">添加</a>  <a
				href="javascript:;" onclick="showAllProductWin();"
				class="easyui-linkbutton" plain="false" iconCls="icon-search">查询全部</a>
			开始时间:<input id="startDatetime" name="startDatetime"
				class="easyui-datebox" data-options="editable:false"
				style="width: 150px;" /> 结束时间:<input id="endDatetime"
				name="endDatetime" class="easyui-datebox"
				data-options="editable:false" style="width: 150px;" /> <a
				href="javascript:;" onclick="findPositions();"
				class="easyui-linkbutton" data-options="iconCls:'icon-'">查询</a>
			<!-- 组合搜索框input -->
			<input id="ss" class="easyui-searchbox" style="width: 300px"
				data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
		</div>
	</div>
	<!-- 组合搜索框div -->
	<div id="mm" style="width: 120px">
		<div data-options="name:'incomeTypes'">收入类别名称</div>
		<div data-options="name:'emps'">员工名称</div>
		<div data-options="name:'stus'">学生名称</div>
	</div>

	<!-- 添加 -->
	<div id="addWin" class="easyui-window" title="添加收入"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<form id="addForm">
			<table>
				<tr>
					<td>收入类型</td>
					<td><a href="javascript:;" onclick="showincomeTypeAll();">
							<input id="incomeTypeInput" class="easyui-textbox"
							name="incomeTypeName" /> <input type="hidden" id="incomeType"
							class="easyui-textbox" name="incomeTypeId" />
					</a></td>
				</tr>
				<tr>
					<td>收入时间</td>
					<td><input type="text" class="easyui-datetimebox"
						name="income.incomeDay"
						data-options="required:true,showSeconds:false"
						value="3/4/2010 2:3"></td>
				</tr>
				<tr>
					<td>收入金额</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="income.income" data-options="required:true" precision="2" /></td>
				</tr>
				<tr>
					<td>员工</td>
					<td><a href="javascript:;" onclick="showempAll();"> <input
							id="empInput" class="easyui-textbox" name="empName" /> <input
							type="hidden" id="emp" class="easyui-textbox" name="empId" />
					</a></td>
				</tr>
				<tr>
					<td>学生标号</td>
					<td><a href="javascript:;" onclick="showstuAll();"> <input
							id="stuInput" class="easyui-textbox" name="stuName" /> <input
							type="hidden" id="stu" class="easyui-textbox" name="stuId" />
					</a></td>
				</tr>
				<tr>
					<td>收入详情</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="income.des" style="height: 100px;" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="addIncome();"
						class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="editWin" class="easyui-window" title="修改收入"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<form id="editForm">
			<input type="hidden" name="incoem.incoemId" />
			<table>
				<tr>
					<td>收入类型</td>
					<td><a href="javascript:;" onclick="showincomeTypeAll1();">
							<input id="incomeTypeInput1" class="easyui-textbox"
							name="incomeTypeName" /> <input type="hidden" id="incomeType1"
							class="easyui-textbox" name="incomeTypeId" />
					</a></td>
				</tr>
				<tr>
					<td>收入时间</td>
					<td><input type="text" class="easyui-datetimebox"
						name="income.incomeDay"
						data-options="required:true,showSeconds:false"
						value="3/4/2010 2:3"></td>
				</tr>
				<tr>
					<td>收入金额</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="income.income"
						data-options="required:true,validType:'length[1,20]'" /></td>
				</tr>
				<tr>
					<td>员工</td>
					<td><a href="javascript:;" onclick="showempAll1();"> <input
							id="empInput1" class="easyui-textbox" name="empName" /> <input
							type="hidden" id="emp1" class="easyui-textbox" name="empId" />
					</a></td>
				</tr>
				<tr>
					<td>学生标号</td>
					<td><a href="javascript:;" onclick="showstuAll1();"> <input
							id="stuInput1" class="easyui-textbox" name="stuName" /> <input
							type="hidden" id="stu1" class="easyui-textbox" name="stuId" />
					</a></td>
				</tr>
				<tr>
					<td>收入详情</td>
					<td><input class="easyui-validatebox easyui-textbox"
						name="income.des" style="height: 100px;" /></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onclick="editIncome();"
						class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="incomeTypeDiv" class="easyui-window" title="收入类型"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="incomeTypeTable" class="easyui-datagrid"
			data-options="singleSelect:true,
	   		onClickRow:getincomeType,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'incomeTypeId',checkbox:true">收入类型编号</th>
					<th data-options="field:'name',width:60">收入名称</th>
					<th data-options="field:'des',width:100">收入描述</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 添加 員工-->
	<div id="empDiv" class="easyui-window" title="员工"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="empTable" class="easyui-datagrid"
			data-options="singleSelect:true,
	   		onClickRow:getemp,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'empId',checkbox:true">编号</th>
					<th data-options="field:'name',width:60">姓名</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 添加学生 -->
	<div id="stuDiv" class="easyui-window" title="员工"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="stuTable" class="easyui-datagrid"
			data-options="singleSelect:true,
	   		onClickRow:getstu,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'stuId',checkbox:true">编号</th>
					<th data-options="field:'name',width:60">姓名</th>
				</tr>
			</thead>
		</table>
	</div>

	<div id="incomeTypeDiv1" class="easyui-window" title="修改收入类型"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="incomeTypeTable1" class="easyui-datagrid"
			data-options="singleSelect:true,
	   		onClickRow:getincomeType1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'incomeTypeId',checkbox:true">收入类型编号</th>
					<th data-options="field:'name',width:60">收入名称</th>
					<th data-options="field:'des',width:100">收入描述</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 修改 員工-->
	<div id="empDiv1" class="easyui-window" title="员工"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="empTable1" class="easyui-datagrid"
			data-options="singleSelect:true,
		   		onClickRow:getemp1,
				collapsible:true,
				method:'get',
				rownumbers:true,
				autoRowHeight:true,
				pagination:true,
				pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'empId',checkbox:true">员工编号</th>
					<th data-options="field:'name',width:60">员工姓名</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 修改学生 -->
	<div id="stuDiv1" class="easyui-window" title="员工"
		data-options="closed:true" style="width: 500px; height: 300px;">
		<table id="stuTable1" class="easyui-datagrid"
			data-options="singleSelect:true,
	   		onClickRow:getstu1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20"
			style="height: 100%;">
			<thead>
				<tr>
					<th data-options="field:'stuId',checkbox:true">编号</th>
					<th data-options="field:'name',width:60">姓名</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>