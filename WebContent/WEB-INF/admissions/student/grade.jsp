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

        var jsonStr = '{"grade.gradeId":"_gradeId","grade.name":"_name","grade.emp1":"_empId1","grade.empId1Name":"_empId1Name","grade.emp2":"_empId2","grade.empId2Name":"_empId2Name","grade.emp3":"_empId3","grade.empId3Name":"_empId3Name","grade.des":"_des","grade.quantity":"_quantity","grade.status":"_status"}';

        $(function() {
            setPagination("list");
        });


        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
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
		//选中班级行时则查看此班所有学生
		function showStuWin() {
	       var rows = $("#list").datagrid("getSelections");
	      $("#stuTable").datagrid({url:'<%=path %>/stu/termIdQueryAll?termId='+rows[0].gradeId + '&who='+'gradeId'});// 当点击所有学生框时再加载学生信息
	      $("#stuWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	   }
		// 班主任:
		// 当添加或修改点击班主任时, 查看所有员工
		function showEmpWin1(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp1()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmp1(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empInputName1").textbox('setValue',row.name);
			 $("#empInputId1").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		// ------------
		// 任课老师:
			// 当添加或修改点击班主任时, 查看所有员工
			function showEmpWin2(){
			    $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
			    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
			    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp2()}});
			    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
			}
			function getEmp2(){
				var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
				 $("#empInputName2").textbox('setValue',row.name);
				 $("#empInputId2").val(row.empId);
				 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
			}
		//-----------
		//辅导老师:
			// 当添加或修改点击班主任时, 查看所有员工
			function showEmpWin3(){
			    $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
			    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
			    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp3()}});
			    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
			}
			function getEmp3(){
				var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
				 $("#empInputName3").textbox('setValue',row.name);
				 $("#empInputId3").val(row.empId);
				 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
			}
		//------
		
		//点击修改时的赋值
		// 班主任:
		// 当添加或修改点击班主任时, 查看所有员工
		function showEmpEditWin1(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit1()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmpEdit1(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empEditInputName1").textbox('setValue',row.name);
			 $("#empEditInputId1").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		// ------------
		// 任课老师:
			// 当添加或修改点击班主任时, 查看所有员工
			function showEmpEditWin2(){
			    $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
			    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
			    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit2()}});
			    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
			}
			function getEmpEdit2(){
				var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
				 $("#empEditInputName2").textbox('setValue',row.name);
				 $("#empEditInputId2").val(row.empId);
				 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
			}
		//-----------
		//辅导老师:
			// 当添加或修改点击班主任时, 查看所有员工
			function showEmpEditWin3(){
			    $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});// 当点击所有学生框时再加载学生信息
			    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
			    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit3()}});
			    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
			}
			function getEmpEdit3(){
				var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
				 $("#empEditInputName3").textbox('setValue',row.name);
				 $("#empEditInputId3").val(row.empId);
				 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
			}
		//------
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
		        			  alert(row.stuId);
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
		function formatterOptStatus(value, row, index){
			if (row.status == 1) {
				return "<a href='javascript:;'onclick='showStuFreeze("+ index + ");'>冻结</a>";
			}else if (row.status == 0) {
				return "<a href='javascript:;' onclick='showStuStart("+ index + ");'>启用</a>";
			}
		}
		
</script>
<script>
function showAllProductWin(){
  	$('#list').datagrid({ url: '<%=path %>/grade/queryAll'}); 
  }
//查看所有被冻结学生方法
function showFreezeAllWin(){
  	$('#list').datagrid({ url: '<%=path %>/grade/queryFreezeAll'}); 
  }
//点击启用按钮
function showStuStart(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
				$.get("<%=path %>/grade/updateFreeze?status=1&gradeId=" + row.gradeId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
} else {
	$.messager.alert("提示", "请先选择需要冻结的班级", "info");
}
}
//点击冻结学生
function showStuFreeze(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
		$.messager.confirm("提示", "确定冻结吗?", function (r){
			if (r) { // 点击了确定按键
				$.get("<%=path %>/grade/updateFreeze?status=0&gradeId=" + row.gradeId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
			}
		})
} else {
	$.messager.alert("提示", "请先选择需要冻结的班级", "info");
}
}
</script>
<script>
//模糊查询方法
function qq(value,name){
	$('#list').datagrid({ url: '<%=path %>/grade/blurredAllQuery?value1='+value+'&name1='+name});
 }
</script>
</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:true,
			onClickRow:showStuWin,
			collapsible:true,
			url:'<%=path %>/grade/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'name',width:60">班级名称</th>
		<th data-options="field:'emp1',width:100" formatter="showName">班主任</th>
		<th data-options="field:'emp2',width:100" formatter="showName">任课老师</th>
		<th data-options="field:'emp3',width:100" formatter="showName">辅导老师</th>
		<th data-options="field:'des',width:100">描述</th>
		<th data-options="field:'quantity',width:100">最大人数</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
	</div>
</div>
<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	<div data-options="name:'name'">名称</div>
	    <div data-options="name:'teacher'">班主任</div>
	    <div data-options="name:'instructor'">任课老师</div>
	</div>

<!-- 查看班级学生div -->
<div id="stuWin" class="easyui-window" title="班级学生" data-options="closed:true" style="width:500px;height:300px;">
	<table id="stuTable" class="easyui-datagrid"
	   data-options="toolbar:'#tf',
	   		singleSelect:false,
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
<div id="stuConfirm" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="addStu();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
	</div>
</div>
<!-- 显示所有学生让班级添加 -->
<div id="stuAllWin" class="easyui-window" title="所有学生" data-options="closed:true" style="width:500px;height:300px;">
	<table id="stuAllTable" class="easyui-datagrid"
	   data-options="toolbar:'#stuConfirm',
	   		singleSelect:false,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'stuId',checkbox:true"></th>
		<th data-options="field:'name',width:60">姓名</th>
	</tr>
	</thead>
</table>
</div>
<!-- 添加员工时显示所有员工 -->
<div id="empWin" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable" class="easyui-datagrid"
	   data-options="
	   		singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'empId',width:60">员工编号</th>
		<th data-options="field:'name',width:60">姓名</th>
	</tr>
	</thead>
</table>
</div>
</body>
</html>
