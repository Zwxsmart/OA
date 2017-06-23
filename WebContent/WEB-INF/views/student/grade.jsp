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

        var jsonStr = '{"grade.gradeId":"_gradeId","grade.name":"_name","grade.emp1":"_empId1","grade.empId1Name":"_empId1Name","grade.emp2":"_empId2","grade.empId2Name":"_empId2Name","grade.emp3":"_empId3","grade.empId3Name":"_empId3Name","grade.des":"_des","grade.quantity":"_quantity","grade.status":"_status"}';

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
            authority('com.cs.action.GradeAction.save', "", "save");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/grade/save",
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
                    var jsonStr1 = jsonStr.replace("_gradeId", row.gradeId).replace("_name", row.name).replace("_empId1", row.empId1).replace("_empId2", row.empId2).replace("_empId3", row.empId3).replace("_des", row.des).replace("_quantity", row.quantity).replace("_status", row.status).replace("_emp1", row.emp1).replace("_emp2", row.emp2).replace("_emp3", row.emp3);
                    authority('com.cs.action.GradeAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
            $("#empEditInputName1").textbox('setValue',rows[0].emp1.name);
            $("#empEditInputName2").textbox('setValue',rows[0].emp2.name);
            $("#empEditInputName3").textbox('setValue',rows[0].emp3.name);
            $("#empEditInputId1").val(rows[0].empId1);
            $("#empEditInputId2").val(rows[0].empId2);
            $("#empEditInputId3").val(rows[0].empId3);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/grade/update",
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
	      $("#stuTable").datagrid({url:'<%=path %>/stu/termIdQueryAll?str=1&termId='+rows[0].gradeId + '&who='+'gradeId ='});// 当点击所有学生框时再加载学生信息
	      $("#stuWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	   }
		//添加学生时显示所有学生
		function showStuAllWin() {
			 var rows = $("#list").datagrid("getSelections");
	      $("#stuAllTable").datagrid({url:'<%=path %>/stu/termIdQueryAll?str=0&who=gradeid&termId='+rows[0].gradeId});// 当点击所有学生框时再加载学生信息
	       $("#stuAllWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	   }
		// 在所有学生里点击添加时 , 批量添加学生
		function addStu(){
			var gradeRow = $("#list").datagrid("getSelected");//获取所有选中行元素
			var rows = $("#stuAllTable").datagrid("getSelections");//获取所有选中行元素
			var stuRows = $('#stuTable').datagrid('getData');
			if(rows.length > 0){// 获取到了元素
				// stuRows.rows.length 班级已有学生总数, rows.length 选择添加了多少个学生, gradeRow.quantity 班级学生最大数
				if(stuRows.rows.length + rows.length > gradeRow.quantity){
					$.messager.alert("提示", "总学生数超过班级最大学生数","info");
				}else {
					var ids = "";// 设置一个字符串
					for (var i =0, len = rows.length; i < len; i++){
						if(ids == ""){// 假如这个字符串刚开始设置,
							ids = rows[i].stuId;// 则直接赋上0索引上的id属性
						}else {
							ids += "," + rows[i].stuId// 否则就加上逗号把rows里所有的id都赋给ids
						}
					}
					if (ids != ""){ //假如这个字符串不是空
								//此时ids存放了已选中所有要删除的行id
								$.get("<%=path %>/grade/addStuByIds?stuIds=" + ids +"&gradeId="+gradeRow.gradeId,//传出行元素ids元素
										function(data) {
											$.messager.alert("提示", data.result.message, "info");
											$("#stuAllWin").window("close");
											$("#stuTable").datagrid("reload");
										}
									),"json"
					}
				}
			}else {
				$.messager.alert("提示", "请先选择需要添加的学生","info");
			}
		}
		// 在班级里删除学生
		function removeGradeStu() {
			var gradeRow = $("#list").datagrid("getSelected");//获取所有选中行元素
			var rows = $("#stuTable").datagrid("getSelections");//获取所有选中行元素
			if(rows.length > 0){// 获取到了元素
				// stuRows.rows.length 班级已有学生总数, rows.length 选择添加了多少个学生, gradeRow.quantity 班级学生最大数
					var ids = "";// 设置一个字符串
					for (var i =0, len = rows.length; i < len; i++){
						if(ids == ""){// 假如这个字符串刚开始设置,
							ids = rows[i].stuId;// 则直接赋上0索引上的id属性
						}else {
							ids += "," + rows[i].stuId// 否则就加上逗号把rows里所有的id都赋给ids
						}
					}
					if (ids != ""){ //假如这个字符串不是空
								//此时ids存放了已选中所有要删除的行id
								$.messager.confirm("提示", "确认删除吗?", function(r){
									if(r){
								$.get("<%=path %>/grade/delStuByIds?stuIds=" + ids +"&gradeId="+gradeRow.gradeId,//传出行元素ids元素
										function(data) {
											$.messager.alert("提示", data.result.message, "info");
											$("#stuAllWin").window("close");
											$("#stuTable").datagrid("reload");
										}
									),"json"
								}
					});
				}
			}else {
				$.messager.alert("提示", "请先选择需要删除的学生","info");
			}
		}
		// 班主任:
		// 当添加或修改点击班主任时, 查看所有员工
		function showEmpWin1(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});
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
		<th data-options="field:'operation',width:70" formatter="formatterOptStatus">操作</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看所有班级</a>
		<a href="javascript:;" onclick="showFreezeAllWin();" class="easyui-linkbutton" iconCls="icon-search">查看冻结班级</a>
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

<!-- 添加班级div -->
<div id="addWin" class="easyui-window" title="添加班级" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>班级名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="grade.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>班主任</td>
				<td><a href="javascript:;" onclick="showEmpWin1();">
				<input id="empInputName1" class="easyui-validatebox easyui-textbox" name="grade.empId1Name" data-options="required:true"/>
				<input id="empInputId1" type="hidden" name="grade.empId1" /></a></td>
			</tr>
			<tr>
				<td>任课老师</td>
				<td><a href="javascript:;" onclick="showEmpWin2();">
				<input id="empInputName2" class="easyui-validatebox easyui-textbox" name="grade.empId2Name"  data-options="required:true"/>
				<input id="empInputId2" type="hidden" name="grade.empId2" /></a></td>
				
			</tr>
			<tr>
				<td>辅导老师</td>
				<td><a href="javascript:;" onclick="showEmpWin3();">
				<input id="empInputName3" class="easyui-validatebox easyui-textbox" name="grade.empId3Name"  data-options="required:true"/>
				<input id="empInputId3" type="hidden" name="grade.empId3" /> </a></td>
			</tr>
			<tr>
				<td>最大人数</td>
				<td><input class="easyui-validatebox easyui-textbox" name="grade.quantity" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="grade.des" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 编辑班级信息div -->
<div id="editWin" class="easyui-window" title="修改班级" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="grade.gradeId" />
		<table>
			<tr>
				<td>班级名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="grade.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>班主任</td>
				<td><a href="javascript:;" onclick="showEmpEditWin1();">
				<input id="empEditInputName1" class="easyui-validatebox easyui-textbox" name="grade.empId1Name1" data-options="required:true"/>
				<input id="empEditInputId1" type="hidden" name="grade.empId1" /></a></td>
			</tr>
			<tr>
				<td>任课老师</td>
				<td><a href="javascript:;" onclick="showEmpEditWin2();">
				<input id="empEditInputName2" class="easyui-validatebox easyui-textbox" name="grade.empId2Name1"  data-options="required:true"/>
				<input id="empEditInputId2" type="hidden" name="grade.empId2" /></a></td>
				
			</tr>
			<tr>
				<td>辅导老师</td>
				<td><a href="javascript:;" onclick="showEmpEditWin3();">
				<input id="empEditInputName3" class="easyui-validatebox easyui-textbox" name="grade.empId3Name1" data-options="required:true"/>
				<input id="empEditInputId3" type="hidden" name="grade.empId3" /> </a></td>
			</tr>
			<tr>
				<td>最大人数</td>
				<td><input class="easyui-validatebox easyui-textbox" name="grade.quantity" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>详情</td>
				<td><input class="easyui-validatebox easyui-textbox" name="grade.des" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
				</td>
			</tr>

		</table>
	</form>
</div>
<!-- 班级学生div里的按钮div -->
<div id="tf" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showStuAllWin();" class="easyui-linkbutton" iconCls="icon-add">添加学生</a>
		<a href="javascript:;" onclick="removeGradeStu();" class="easyui-linkbutton" iconCls="icon-remove">删除学生</a>
	</div>
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
		<th data-options="field:'name',width:60">姓名</th>
	</tr>
	</thead>
</table>
</div>
</body>
</html>
