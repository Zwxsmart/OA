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

        var jsonStr = '{"exp.expId":"_expId","exp.empId":"_empId","exp.emp":"_empName","exp.company":"_company",'+
        	'"exp.startDay":"_startDay","exp.endDay":"_endDay","exp.jobTitle":"_jobTitle",'+
        	'"exp.des":"_des"}';

        
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
            authority("com.cs.action.ExpAction.save","","save");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/exp/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的员工工作经历", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_expId", row.expId).replace("_empId", row.empId).replace("_empName",row.emp.name).
                    	replace("_company", row.company).replace("_startDay", row.startDay).replace("_endDay", row.endDay).
                    	replace("_jobTitle", row.jobTitle).replace("_des", row.des);
                    authority("com.cs.action.ExpAction.update",jsonStr1,"update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的员工工作经历", "info");
            }
            $("#empNameInput1").textbox('setValue',rows[0].emp.name);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/exp/update",
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
                    $.get("<%=path %>/exp/deleteById?id=" + row.expId, function (data) {
                        $("#list").datagrid("reload");
                    }, "json");
                }
            })
        } else {
            $.messager.alert("提示", "请先选择需要删除的商品", "info");
        }
    }
    
    //给员工赋值
    function formatterOpt2(value) {
    	return value.name;
    }
    
    // 模糊查询方法
	  function qq(value,name){
      $('#list').datagrid({ url: '<%=path %>/exp/blurredAllQuery?value1='+value+'&name1='+name});
  }
 
	  function showAllProductWin(){
    	$('#list').datagrid({ url: '<%=path %>/exp/queryAll'}); 
    }
    
	  
	  function findPositions(){
			var startDay=$("#startDatetime").datetimebox("getValue");
			var endDay=$("#endDatetime").datetimebox("getValue");
			$('#list').datagrid({ url: '<%=path %>/exp/serachTime?startDay='+startDay+'&endDay='+endDay});
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
			url:'<%=path %>/exp/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'expId',checkbox:true">员工工作经历编号</th>
		<th data-options="field:'emp',width:80" formatter="formatterOpt2">员工姓名</th>
		<th data-options="field:'company',width:130">公司名称</th>
		<th data-options="field:'startDay',width:125"  formatter="formatTime">入职时间</th>
		<th data-options="field:'endDay',width:125">离职时间</th>
		<th data-options="field:'jobTitle',width:80">工作职位</th>
		<th data-options="field:'des',width:120">工作描述</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<!-- <a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="removeProduct();" class="easyui-linkbutton" iconCls="icon-remove">删除</a> -->
		
		开始时间:<input id="startDatetime" name="startDatetime" class="easyui-datebox" style="width:150px;"  data-options="editable:false"/>
		结束时间:<input id="endDatetime" name="endDatetime" class="easyui-datebox" style="width:150px;"  data-options="editable:false"/>
		<a href="javascript:;" onclick="findPositions();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	
	
	<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	    <div data-options="name:'name',iconCls:'icon-ok'">姓名</div>
	    <div data-options="name:'company'">公司名称</div>
	    <div data-options="name:'jobTitle'">职位</div>
	</div>

<div id="addWin" class="easyui-window" title="添加员工工作经历" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">员工姓名</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll();">
						<input id="empNameInput" class="easyui-textbox easyui-validatebox" name="empName" data-options="required:true"/>
						<input type="hidden" id="emp" class="easyui-textbox"  name="empId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>公司名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="exp.company" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>入职时间</td>
				<td><input class="easyui-datetimebox" name="exp.startDay" data-options="editable:false"></td>
			</tr>
			<tr>
				<td>离职时间</td>
				<td><input class="easyui-datetimebox" name="exp.endDay" data-options="editable:false"></td>
			</tr>
			<tr>
				<td>工作职位</td>
				<td><input class="easyui-validatebox easyui-textbox" name="exp.jobTitle" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>工作描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="exp.des" data-options="required:true" style="width:100%;height:32px"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改员工工作经历" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="exp.expId" />
		<table>
			<tr>
				<td width="100px">员工姓名</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll1();">
						<input id="empNameInput1" class="easyui-textbox easyui-validatebox" name="exp.empName" data-options="required:true"/>
						<input type="hidden" id="emp1" class="easyui-textbox"  name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>公司名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="exp.company" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>入职时间</td>
				<td><input class="easyui-datetimebox" name="exp.startDay" data-options="editable:false"></td>
			</tr>
			<tr>
				<td>离职时间</td>
				<td><input class="easyui-datetimebox" name="exp.endDay" data-options="editable:false"></td>
			</tr>
			<tr>
				<td>工作职位</td>
				<td><input class="easyui-validatebox easyui-textbox" name="exp.jobTitle" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>工作描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="exp.des" data-options="required:true" style="width:100%;height:32px"/></td>
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