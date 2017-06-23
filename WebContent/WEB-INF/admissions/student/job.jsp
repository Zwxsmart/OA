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

        var jsonStr = '{"job.jobId":"_jobId","job.stuId":"_stuId","job.company":"_company","job.jobTitle":"_jobTitle","job.salary":"_salary","job.welfare":"_welfare","job.address":"_address","job.comPhone":"_comPhone","job.hireDay":"_hireDay","job.status":"_status"}';

        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
        	alert($("#addForm").serialize());
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/job/save",
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
                    var jsonStr1 = jsonStr.replace("_jobId", row.jobId).replace("_stuId", row.stuId).replace("_company", row.company).replace("_jobTitle", row.jobTitle).replace("_salary", row.salary).replace("_welfare", row.welfare).replace("_address", row.address).replace("_comPhone", row.comPhone).replace("_hireDay", row.hireDay).replace("_status", row.status);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                    $("#stuInputa1").textbox('setValue',row.stu.name);
                	$("#stuIda1").val(row.stu.stuId);
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
        }

        function showEditProductWin1(index) {
            var row = $('#list').datagrid('getData').rows[index];
            if (row) { // 有选中的行
                // var jsonStr = '{"sAdmin.id":"' + row.id + '","sAdmin.email":"' + row.email +'","sAdmin.name":"' + row.name +'","sAdmin.des":"' + row.des +'"}';
                var jsonStr1 = jsonStr.replace("_jobId", row.jobId).replace("_stuId", row.stuId).replace("_company", row.company).replace("_endTime", row.endtime).replace("_leaveDay", row.leaveday).replace("_des", row.des).replace("_status", row.status).replace("_firlevel", row.firlevel).replace("_secondLevel", row.secondleavel).replace("_pass", row.pass);
                alert(jsonStr1);
                $("#editForm").form("load", JSON.parse(jsonStr1));
                $("#editWin").window("open");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/job/update",
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
</script>
<script>
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
//查看所有学生方法
function showAllProductWin(){
  	$('#list').datagrid({ url: '<%=path %>/job/queryAll'}); 
  }
//查看所有被冻结学生方法
function showFreezeAllWin(){
  	$('#list').datagrid({ url: '<%=path %>/job/queryFreezeAll'}); 
  }
//点击启用按钮
function showStuStart(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
				$.get("<%=path %>/job/updateFreeze?status=1&jobId=" + row.jobId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
} else {
	$.messager.alert("提示", "请先选择需要冻结的就业管理", "info");
}
}
//点击冻结学生
function showStuFreeze(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
		$.messager.confirm("提示", "确定冻结吗?", function (r){
			if (r) { // 点击了确定按键
				$.get("<%=path %>/job/updateFreeze?status=0&jobId=" + row.jobId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
			}
		})
} else {
	$.messager.alert("提示", "请先选择需要冻结的就业管理", "info");
}
}
//模糊查询方法
function qq(value,name){
	$('#list').datagrid({ url: '<%=path %>/job/blurredAllQuery?value1='+value+'&name1='+name});
 }
</script>
</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/job/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'jboId',checkbox:true">编号</th>
		<th data-options="field:'stu',width:100" formatter="showName">学生</th>
		<th data-options="field:'company',width:100">公司名称</th>
		<th data-options="field:'jobTitle',width:100">职位</th>
		<th data-options="field:'salary',width:100">月薪</th>
		<th data-options="field:'welfare',width:100">福利待遇</th>
		<th data-options="field:'address',width:100">公司地址</th>
		<th data-options="field:'comPhone',width:100">公司电话</th>
		<th data-options="field:'hireDay',width:100">入职时间</th>
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
	    <div data-options="name:'name'">姓名</div>
	    <div data-options="name:'comPhone'">手机号</div>
	</div>

<div id="addWin" class="easyui-window" title="添加商品" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>学生</td><td><a href="javascript:;" onclick="showStuWin();">
				<input id="stuInputa" class="easyui-textbox" name="job.stuName"/>
				<input id="stuIda" type="hidden" name="job.stuId"/></a>
				</td>
			</tr>
			<tr>
				<td>公司名称</td>
				<td><input class="easyui-textbox" name="job.company" /></td>
			</tr>
			<tr>
				<td>职位</td>
				<td><input class="easyui-textbox" name="job.jobTitle"/></td>
			</tr>
			<tr>
				<td>月薪</td>
				<td><input class="easyui-textbox" name="job.salary"/></td>
			</tr>
			<tr>
				<td>福利待遇</td>
				<td><input class="easyui-textbox" name="job.welfare" /></td>
			</tr>
			<tr>
				<td>公司地址</td>
				<td><input class=" easyui-textbox" name="job.address"/></td>
			</tr>
			<tr>
				<td>公司电话</td>
				<td><input class="easyui-textbox" name="job.comPhone" /></td>
			</tr>
			<tr>
				<td>入职时间</td>
				<td><input class="easyui-datebox" name="job.hireDay" /></td>
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
		<input type="hidden" name="job.jobId" />
		<table>
			<tr>
				<td>学生</td><td><a href="javascript:;" onclick="showEditStuWin();">
				<input id="stuInputa1" class="easyui-textbox" name="job.stuName"/>
				<input id="stuIda1" type="hidden" name="job.stuId"/></a>
				</td>
			</tr>
			<tr>
				<td>公司名称</td>
				<td><input class="easyui-textbox" name="job.company" /></td>
			</tr>
			<tr>
				<td>职位</td>
				<td><input class="easyui-textbox" name="job.jobTitle"/></td>
			</tr>
			<tr>
				<td>月薪</td>
				<td><input class="easyui-textbox" name="job.salary"/></td>
			</tr>
			<tr>
				<td>福利待遇</td>
				<td><input class="easyui-textbox" name="job.welfare" /></td>
			</tr>
			<tr>
				<td>公司地址</td>
				<td><input class=" easyui-textbox" name="job.address"/></td>
			</tr>
			<tr>
				<td>公司电话</td>
				<td><input class="easyui-textbox" name="job.comPhone" /></td>
			</tr>
			<tr>
				<td>入职时间</td>
				<td><input class="easyui-datebox" name="job.hireDay" /></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><input class="easyui-textbox" name="job.status" /></td>
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