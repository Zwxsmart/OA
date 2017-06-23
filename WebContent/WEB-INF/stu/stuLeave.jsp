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

        var jsonStr = '{"stuLeave.leaveId":"_leaveId","stuLeave.stuId":"_stuId","stuLeave.startTime":"_startTime","stuLeave.endTime":"_endTime","stuLeave.leaveDay":"_leaveDay","stuLeave.des":"_des","stuLeave.status":"_status","stuLevel.firlevel":"_firlevel","stuLeave.secondLevel":"_secondLevel","stuLeave.pass":"_pass"}';

        $(function() {
            setPagination("list");
        });

        
        function showAddProductWin() {
        	$("#addForm").form("clear"); // 清除表单里的所有数据
        	$("#addWin").window("open");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/stuLeave/saves",
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
                    var jsonStr1 = jsonStr.replace("_leaveId", row.leaveId).replace("_stuId", row.stuId).replace("_startTime", row.startTime).replace("_endTime", row.entTime).replace("_leaveDay", row.leaveDay).replace("_des", row.des).replace("_status", row.status).replace("_firleave", row.firleave).replace("_secondLevel", row.secondLevel).replace("_pass", row.pass);
                    $("#stuInputa1").textbox('setValue',row.stu.name);
                	$("#stuIda1").val(row.stu.stuId);
                	authority('com.cs.action.StuLeaveAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/stuLeave/update",
                    $("#editForm").serialize(),
                    function (data) {
                	alert(data.result.result);
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
        	if (value != null) {
        		return value.name;
        	} else {
        		return "";
        	}
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
		//stu.roomId.val(rows[0].id)
	}
</script>
<script>
		//添加栏位方法
		function showLan(){
			var stuIndex = $('#list').datagrid("getRows").length +1
			$("#list").datagrid("insertRow", {
		        index: stuIndex,
		        row: {"stu.address":"","stu.age":"","stu.birthday":"","stu.des":"","stu.empId":"","stu.gender":"","stu.gradeId":"","stu.idCard":"","stu.name":"","stu.nation":"","stu.parentName":"","stu.parentPhone":"","stu.phone":"","stu.pwd":"","stu.qq":"","stu.resIdence":"","stu.role":"","stu.roomId":"","stu.school":"","stu.startDay":"","stu.status":"","stu.stuId":"","stu.stuNo":"","stu.stuStatus":"","stu.weChat":""}
		    });
		}
		//用户点击栏位详情div拿数据
		 function showStuDetails() {
	            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
	            var rows = $("#list").datagrid("getSelections");
	            if (rows.length > 1) {
	                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
	            } else if (rows.length == 1) {
	                var row = rows[0];
	                if (row) { // 有选中的行
	                	if(row.stuId){// 假如学生id有, 则拿选中行中所有数据
	                		var jsonStr1 = jsonStr.replace("_roomId", row.roomId).replace("_name", row.name).replace("_stuId", row.stuId).replace("_quantity", row.quantity).replace("_status", row.status);
	                        $("#editForm").form("load", JSON.parse(jsonStr1));
	                        $("#editWin").window("open");
		                    $("#stuDetailsFrom").form("load", JSON.parse(jsonStr1));
		                    document.getElementById("stuDetails").style.display="";// 显示隐藏窗口
	                	}else{// 否则学生id没有, 代表用户是新增栏位, 则清楚此div所有数据
	                		document.getElementById("stuDetails").style.display="";// 显示隐藏窗口
	                		qingkong();
	                	}
	                }
	            } else if (rows.length == 0) {
	                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
	            }
	        }
		
		// 用户在详情栏点击保存按钮
		function saveStuDetails() {
			var rows = $("#list").datagrid("getSelections");// 获取表格中选中行的数据
			  if (rows.length > 1) {
		          $.messager.alert("提示", "请先选择一个学生进行操作", "info");
		      } else if (rows.length == 1) {// 假如选中了行
		          var row = rows[0];
		          if (row) { // 有选中的行
		        	  if(row.stuId){// 如果这行数据有学生id, 则进行修改信息操作
		        		  if ($("#stuDetailsFrom").form("validate")) {
		                      $.post("<%=path %>/stu/update",
		                          $("#stuDetailsFrom").serialize(),
		                          function (data) {
		                              if (data.result.result == "success") {
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
		        	  }else{ // 否则这行没有学生id, 代表用户的操作是新增了栏位, 想进行添加操作, 这时执行添加操作
		        		  if ($("#stuDetailsFrom").form("validate")) {
		                      $.post("<%=path %>/stu/save",
		                          $("#stuDetailsFrom").serialize(),
		                          function (data) {
		                              if (data.result.result == "success") {
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
		          }
		        }
		}
		
		// 清空详情栏
		function qingkong(){
			$('#stuDetailsTable').form('clear');
		}
</script>
<script>
//添加按钮
function showStuWin() {
	   var rows = $("#list").datagrid("getSelections");
	   $("#stuTable").datagrid("reload");
	  $("#stuTable").datagrid({url:'<%=path %>/stu/queryAlls'});// 当点击所有学生框时再加载学生信息
	  $("#stuWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
//编辑按钮
function showEditStuWin() {
	   var rows = $("#list").datagrid("getSelections");
	   $("#stuEditTable").datagrid("reload");
	  $("#stuEditTable").datagrid({url:'<%=path %>/stu/queryAlls'});// 当点击所有学生框时再加载学生信息
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
</script>
<script>
function showStatus(value){
	if (value == 2) {
		return "驳回";
	}else if (value == 1) {
		return "通过";
	}else if (value == 0) {
		return "待审核";
	}
}
function showStatus1(value, row, index){
	if (row.firlevel == 1 && row.secondLevel == 1 && row.pass == 1){
		return "通过";
	}else if (row.firlevel == 2 || row.secondLevel == 2 || row.secondLevel == 2){
		return "驳回";
	}else if (row.firlevel == 0 || row.secondLevel == 0){
		return "未审核";
	}
}
//学生请假审核
function formatterOptt1(value, row, index) {
	if (row.firlevel == 1 && row.secondLevel == 1){
		return "通过";
	}else if(row.pass == 2){
		return "驳回";
	} else if (row.firlevel == 0) {// 任课老师审核
		return "<a href='javascript:;'onclick='stuPassTo1("+ index + ");'>通过</a>&nbsp;<a href='javascript:;' onclick='noStuPassTo1("+ index + ");'>驳回</a>";
		} else if (row.firlevel == 1 || row.firlevel == 2) {// 班主任审核
			return "<a href='javascript:;'onclick='stuPassTo2("+ index + ");'>通过</a>&nbsp;<a href='javascript:;' onclick='noStuPassTo2("+ index + ");'>驳回</a>";
	} 
}

//任课老师通过学生请假
function stuPassTo1(index){
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("<%=path %>/stuLeave/stuPass?str=stuPassTo1&id=" + row.leaveId,
			function(data){
				$('#list').datagrid('reload');
		},"json");
	}
}
//任课老师驳回学生请假
function noStuPassTo1(index){
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("<%=path %>/stuLeave/stuPass?str=noStuPassTo1&id=" + row.leaveId,
			function(data){
				$('#list').datagrid('reload');
		},"json");
	}
}
//班主任通过学生请假
function stuPassTo2(index){
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("<%=path %>/stuLeave/stuPass?str=stuPassTo2&id=" + row.leaveId +"&stuPassTo1=" + row.firlevel,
			function(data){
				$('#list').datagrid('reload');
		},"json");
	}
}
//班主任驳回学生请假
function noStuPassTo2(index){
	var row = $('#list').datagrid('getData').rows[index];
	if(row){
		$.post("<%=path %>/stuLeave/stuPass?str=noStuPassTo2&id=" + row.leaveId +"&stuPassTo1=" + row.firlevel,
			function(data){
				$('#list').datagrid('reload');
		},"json");
	}
}
//查看所有学生方法
function showAllProductWin(){
  	$('#list').datagrid({ url: '<%=path %>/stuLeave/queryAll'}); 
  }
//查看所有被冻结学生方法
function showFreezeAllWin(){
  	$('#list').datagrid({ url: '<%=path %>/stuLeave/queryFreezeAll'}); 
  }
//点击启用按钮
function showStuStart(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
				$.get("<%=path %>/stuLeave/updateFreeze?status=1&leaveId=" + row.leaveId, function (data) {
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
				$.get("<%=path %>/stuLeave/updateFreeze?status=0&leaveId=" + row.leaveId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
			}
		})
} else {
	$.messager.alert("提示", "请先选择需要冻结的反馈记录", "info");
}
}
</script>
<script>
//模糊查询方法
function qq(value,name){
	$('#list').datagrid({ url: '<%=path %>/stuLeave/blurredAllQuery?value1='+value+'&name1='+name});
 }
function findPositions(){
	var beginTime=$("#startDatetime").datetimebox("getValue");
	var endTime=$("#endDatetime").datetimebox("getValue");
	$('#list').datagrid({ url: '<%=path %>/stuLeave/serachTime?beginTime='+beginTime+'&endTime='+endTime});
}//

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
			url:'<%=path %>/stuLeave/queryAlls',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'leaveId',checkbox:true">编号</th>
		<th data-options="field:'startTime',width:100" formatter="formatTime">开始时间</th>
		<th data-options="field:'endTime',width:100" formatter="formatTime">结束时间</th>
		<th data-options="field:'leaveDay',width:100" formatter="formatTime">提交时间</th>
		<th data-options="field:'des',width:100" >请假描述</th>
		<th data-options="field:'firlevel',width:100" formatter="showStatus">任课老师审核</th>
		<th data-options="field:'secondLevel',width:100" formatter="showStatus">班主任审核</th>
		<th data-options="field:'pass',width:100" formatter="showStatus1">通过状态</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">我要请假</a>
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看请假记录</a>
		<!-- 组合搜索框input -->
	</div>
</div>


<div id="addWin" class="easyui-window" title="添加学生请假" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>开始时间</td>
				<td><input class="easyui-datebox" name="stuLeave.startTime"/></td>
			</tr>
			<tr>
				<td>结束时间</td>
				<td><input class="easyui-datebox" name="stuLeave.endTime"/></td>
			</tr>
			<tr>
				<td>提交时间</td>
				<td><input class="easyui-datebox" name="stuLeave.leaveDay" /></td>
			</tr>
			<tr>
				<td>请假说明</td>
				<td><input class=" easyui-textbox" name="stuLeave.des"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改学生请假" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="stuLeave.leaveId" />
		<table>
			<tr>
				<td>开始时间</td>
				<td><input class="easyui-datebox" name="stuLeave.startTime"/></td>
			</tr>
			<tr>
				<td>结束时间</td>
				<td><input class="easyui-datebox" name="stuScore.endTime"/></td>
			</tr>
			<tr>
				<td>提交时间</td>
				<td><input class="easyui-datebox" name="stuScore.leaveDay" /></td>
			</tr>
			<tr>
				<td>请假说明</td>
				<td><input class=" easyui-textbox" name="stuLeave.des"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><input class="easyui-textbox" name="stuLeave.status" /></td>
			</tr>
			<tr>
				<td>任课老师审核</td>
				<td><input class="easyui-textbox" name="stuLeave.firlevel" /></td>
			</tr>
			<tr>
				<td>班主任审核</td>
				<td><input class="easyui-textbox" name="stuLeave.secondLevel" /></td>
			</tr>
			<tr>
				<td>通过状态</td>
				<td><input class="easyui-textbox" name="stuLeave.pass" /></td>
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
</body>
</html>