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

        var jsonStr = '{"talk.talkId":"_talkId","talk.empId":"_empId","talk.stuId":"_stuId","talk.talkDay":"_talkDay","talk.des":"_des","talk.status":"_status"}';

        $(function() {
            setPagination("list");
        });
        
        function authority(methodName, str, method) {
    		$.get("<%=path %>/auth/authority?methodName=" + methodName,
    			function(data) {
    				if (data.result.result == "success") {
    					if (method == "save") {
    						$("#addWin").window("open"); 
    					} else if (method == "update") {
    						$("#editForm").form("load", JSON.parse(str)); 
    						$("#editWin").window("open"); 
    					}
    				} else if (data.result.result == "fail") {
    					$.messager.alert("提示", data.result.message, "info");
    				}
    			}, "json");
    	}

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            authority('com.cs.action.TalkAction.save', "", "save");
        }

        function addProduct() {
        	alert($("#addForm").serialize());
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/talk/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_talkId", row.talkId).replace("_stuId", row.stuId).replace("_empId", row.empId).replace("_talkDay", row.talkDay).replace("_des", row.des).replace("_status", row.status);
                    $("#stuInputa1").textbox('setValue',row.stu.name);
                	$("#stuIda1").val(row.stu.stuId);
                	$("#empInputa1").textbox('setValue',row.emp.name);
                	$("#empIda1").val(row.emp.empId);
                	authority('com.cs.action.TalkAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
        }

        function editProduct() {
        	alert($("#editForm").serialize());
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/talk/update",
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
                        $.get("<%=path %>/product/del?roomid=" + row.roomid, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的数据", "info");
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
       		if (row.role == 'super') {
                return "<b>超级管理员</b>"
            } else if (row.role == 'normal') {
                return "<b>管理员</b>"
            }

        }
        function showName(value){
        	return value.name;
        }
	</script>
	<script>
	function showRoomAll(){
		 $("#roomDiv").form("clear"); // 清除表单里的所有数据
		 $("#roomDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	function getRoom(){
		var rows = $("#roomTable").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#roomInput").textbox('setValue',rows[0].name);
		alert(rows[0].roomId);
		//stu.roomId.val(rows[0].id)
	}
</script>
<script>
//学生:
//添加按钮
function showStuWin() {
	   var rows = $("#list").datagrid("getSelections");
	   $("#stuTable").datagrid("reload");
	  $("#stuTable").datagrid({url:'<%=path %>/stu/queryAll'});// 当点击所有学生框时再加载学生信息
	  $("#stuWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
//编辑按钮
function showEditStuWin() {
	   var rows = $("#list").datagrid("getSelections");
	   $("#stuEditTable").datagrid("reload");
	  $("#stuEditTable").datagrid({url:'<%=path %>/stu/queryAll'});// 当点击所有学生框时再加载学生信息
	  $("#stuEditWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	
//选择学生
function addConfirmStu(){
	var row = $("#stuTable").datagrid("getSelected");
	$("#stuInputa").textbox('setValue',row.name);
	$("#stuIda").val(row.stuId);
	$("#stuWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
}
//修改学生
function editConfirmStu(){
	var row = $("#stuEditTable").datagrid("getSelected");
	$("#stuInputa1").textbox('setValue',row.name);
	$("#stuIda1").val(row.stuId);
	$("#stuEditWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
}

// 员工:
//添加按钮
function showEmpWin() {
	   var rows = $("#list").datagrid("getSelections");
	   $("#empTable").datagrid("reload");
	  $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
	  $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
//编辑按钮
function showEditEmpWin() {
	   var rows = $("#list").datagrid("getSelections");
	   $("#empEditTable").datagrid("reload");
	  $("#empEditTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
	  $("#empEditWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	
//选择员工
function addConfirmEmp(){
	var row = $("#empTable").datagrid("getSelected");
	$("#empInputa").textbox('setValue',row.name);
	$("#empIda").val(row.empId);
	$("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
}
//修改员工
function editConfirmEmp(){
	var row = $("#empEditTable").datagrid("getSelected");
	$("#empInputa1").textbox('setValue',row.name);
	$("#empIda1").val(row.empId);
	$("#empEditWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
}
</script>
<script>
//所有formatter
function formatterOptStatus(value, row, index){
	if (row.status == 1) {
		return "<a href='javascript:;'onclick='showStuFreeze("+ index + ");'>冻结</a>";
	}else if (row.status == 0) {
		return "<a href='javascript:;' onclick='showStuStart("+ index + ");'>启用</a>";
	}
}
//点击启用按钮
function showStuStart(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
				$.get("<%=path %>/talk/updateFreeze?status=1&talkId=" + row.talkId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
} else {
	$.messager.alert("提示", "请先选择需要冻结的反馈记录", "info");
}
}
//点击冻结学生
function showStuFreeze(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
		$.messager.confirm("提示", "确定冻结吗?", function (r){
			if (r) { // 点击了确定按键
				$.get("<%=path %>/talk/updateFreeze?status=0&talkId=" + row.talkId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
			}
		})
} else {
	$.messager.alert("提示", "请先选择需要冻结的反馈记录", "info");
}
}
//模糊查询方法
function qq(value,name){
	$('#list').datagrid({ url: '<%=path %>/talk/blurredAllQuery?value1='+value+'&name1='+name});
}
//查看所有学生方法
function showAllProductWin(){
  	$('#list').datagrid({ url: '<%=path %>/talk/queryAll'}); 
  }
//查看所有被冻结学生方法
function showFreezeAllWin(){
  	$('#list').datagrid({ url: '<%=path %>/talk/queryFreezeAll'}); 
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
</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/talk/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'talkId',checkbox:true">编号</th>
		<th data-options="field:'emp',width:100" formatter="showName">员工</th>
		<th data-options="field:'stu',width:100" formatter="showName">学生</th>
		<th data-options="field:'talkDay',width:100" formatter="formatTime">谈心时间</th>
		<th data-options="field:'des',width:100">描述</th>
		<th data-options="field:'operation',width:70" formatter="formatterOptStatus">操作</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看所有就业信息</a>
		<a href="javascript:;" onclick="showFreezeAllWin();" class="easyui-linkbutton" iconCls="icon-search">查看冻结就业信息</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
	</div>
</div>
	<div id="mm" style="width:120px">
	    <div data-options="name:'name'">学生姓名</div>
	</div>

<div id="addWin" class="easyui-window" title="添加商品" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工</td><td><a href="javascript:;" onclick="showEmpWin();">
				<input id="empInputa" class="easyui-textbox" name="talk.empName"/>
				<input id="empIda" type="hidden" name="talk.empId"/></a>
				</td>
			</tr>
			<tr>
				<td>学生</td><td><a href="javascript:;" onclick="showStuWin();">
				<input id="stuInputa" class="easyui-textbox" name="talk.stuName"/>
				<input id="stuIda" type="hidden" name="talk.stuId"/></a>
				</td>
			</tr>
			<tr>
				<td width="100px">谈心时间</td>
				<td><input class="easyui-datebox" name="talk.talkDay" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="talk.des" data-options="required:true,validType:'length[1,20]'"/></td>
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
		<input type="hidden" name="talk.talkId" />
		<table>
			<tr>
				<td>员工</td><td><a href="javascript:;" onclick="showEditEmpWin();">
				<input id="empInputa1" class="easyui-textbox" name="talk.empName"/>
				<input id="empIda1" type="hidden" name="talk.empId"/></a>
				</td>
			</tr>
			<tr>
				<td>学生</td><td><a href="javascript:;" onclick="showEditStuWin();">
				<input id="stuInputa1" class="easyui-textbox" name="talk.stuName"/>
				<input id="stuIda1" type="hidden" name="talk.stuId"/></a>
				</td>
			</tr>
			<tr>
				<td width="100px">谈心时间</td>
				<td><input class="easyui-datebox" name="talk.talkDay" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="talk.des" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
				</td>
			</tr>

		</table>
	</form>
</div>

<!-- 查看学生div -->
<div id="stuWin" class="easyui-window" title="所有学生" data-options="closed:true" style="width:500px;height:300px;">
	<table id="stuTable" class="easyui-datagrid"
	   data-options="onClickRow:addConfirmStu,
	   		singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'stuNo',width:60">学号</th>
		<th data-options="field:'name',width:60">姓名</th>
	</tr>
	</thead>
</table>
</div>
<!-- 查看学生div -->
<div id="stuEditWin" class="easyui-window" title="所有学生" data-options="closed:true" style="width:500px;height:300px;">
	<table id="stuEditTable" class="easyui-datagrid"
	   data-options="onClickRow:editConfirmStu,
	   		singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'stuNo',width:60">学号</th>
		<th data-options="field:'name',width:60">姓名</th>
	</tr>
	</thead>
</table>
</div>
<!-- 查看员工div -->
<div id="empWin" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable" class="easyui-datagrid"
	   data-options="onClickRow:addConfirmEmp,
	   		singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'name',width:60">员工</th>
	</tr>
	</thead>
</table>
</div>
<!-- 查看员工div -->
<div id="empEditWin" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empEditTable" class="easyui-datagrid"
	   data-options="onClickRow:editConfirmEmp,
	   		singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'name',width:60">姓名</th>
	</tr>
	</thead>
</table>
</div>
</body>
</html>