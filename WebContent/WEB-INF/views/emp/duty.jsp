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

        var jsonStr = '{"duty.dutyId":"_dutyId","duty.weekDay":"_weekDay","duty.emp1":"_empId1","duty.emp1Name":"_emp1Name",'+
        	
        	'"duty.add1":"_add1","duty.emp2":"_empId2","duty.emp2Name":"_emp2Name","duty.add2":"_add2","duty.emp3":"_empId3",'+
        	
        	'"duty.emp3Name":"_emp3Name","duty.add3":"_add3","duty.emp4":"_empId4","duty.emp4Name":"_emp4Name","duty.add4":"_add4",'+
        	
        	'"duty.emp5":"_empId5","duty.emp5Name":"_emp5Name","duty.add5":"_add5",'+
        	
        	'"duty.emp6":"_empId6","duty.emp6Name":"_emp6Name","duty.add6":"_add6","duty.emp7":"_empId7",'+
       
        	'"duty.emp7Name":"_emp7Name","duty.add7":"_add7","duty.emp8":"_empId8","duty.emp8Name":"_emp8Name","duty.add8":"_add8"}';
        	
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
            authority("com.cs.action.DutyAction.save","","save");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/duty/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的值班", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_dutyId", row.dutyId).replace("_weekDay", row.weekDay).
                    replace("_empId1", row.empId1).replace("_add1", row.add1).replace("_empId2", row.empId2).
                    replace("_add2", row.add2).replace("_empId3", row.empId3).replace("_add3", row.add3).
                    replace("_empId4", row.empId4).replace("_add4", row.add4).replace("_empId5", row.empId5).
                    replace("_add5", row.add5).replace("_empId6", row.empId6).replace("_add6", row.add6).
                    replace("_empId7", row.empId7).replace("_add7", row.add7).replace("_empId8", row.empId8).
                    replace("_add8", row.add8).replace("_emp1", row.emp1).replace("_emp2", row.emp2).
                    replace("_emp3",row.emp3).replace("_emp4",row.emp4).replace("_emp5",row.emp5).
                    replace("_emp6",row.emp6).replace("_emp7",row.emp7).replace("_emp8",row.emp8);
                    authority("com.cs.action.DutyAction.update",jsonStr1,"update");
                }
                
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的值班", "info");
            }
            $("#empEditInputName1").textbox('setValue',rows[0].emp1.name);
            $("#empEditInputName2").textbox('setValue',rows[0].emp2.name);
            $("#empEditInputName3").textbox('setValue',rows[0].emp3.name);
            $("#empEditInputName4").textbox('setValue',rows[0].emp4.name);
            $("#empEditInputName5").textbox('setValue',rows[0].emp5.name);
            $("#empEditInputName6").textbox('setValue',rows[0].emp6.name);
            $("#empEditInputName7").textbox('setValue',rows[0].emp7.name);
            $("#empEditInputName8").textbox('setValue',rows[0].emp8.name);
            $("#empEditInputId1").val(rows[0].empId1);
            $("#empEditInputId2").val(rows[0].empId2);
            $("#empEditInputId3").val(rows[0].empId3);
            $("#empEditInputId4").val(rows[0].empId4);
            $("#empEditInputId5").val(rows[0].empId5);
            $("#empEditInputId6").val(rows[0].empId6);
            $("#empEditInputId7").val(rows[0].empId7);
            $("#empEditInputId8").val(rows[0].empId8);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/duty/update",
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
                        $.get("<%=path %>/duty/deleteById?id=" + row.dutyId, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的值班", "info");
            }
        }
        
        // 员工1
         function formatterEmp1(value) {
       		return value.name;
        }
     	// 员工2
		 function formatterEmp2(value) {
        	return value.name;
        }
     	// 员工3
        function formatterEmp3(value) {
        	return value.name;
        }
     	
       // 员工4
        function formatterEmp4(value) {
      		return value.name;
        }
    	// 员工5
	    function formatterEmp5(value) {
       		return value.name;
       }
    	// 员工6
       function formatterEmp6(value) {
       	return value.name;
       }
    	
	    // 员工7
       function formatterEmp7(value) {
     		return value.name;
      }
	   	// 员工8
	  function formatterEmp8(value) {
      	return value.name;
      }
     	
      	//模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path %>/duty/blurredAllQuery?value1='+value+'&name1='+name});
         }
     	 
    	 // 查询全部
        function showAllProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/duty/queryAll'}); 
     	}

	</script>
	
	<script>
		// -------添加操作
		// 员工1 
		function showEmpWin1(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
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
		
		// 员工2
		function showEmpWin2(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
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

		// 员工3 
		function showEmpWin3(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
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
		
		// 员工4
		function showEmpWin4(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp4()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmp4(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empInputName4").textbox('setValue',row.name);
			 $("#empInputId4").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工5 
		function showEmpWin5(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp5()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmp5(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empInputName5").textbox('setValue',row.name);
			 $("#empInputId5").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工6 
		function showEmpWin6(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp6()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmp6(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empInputName6").textbox('setValue',row.name);
			 $("#empInputId6").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工7
		function showEmpWin7(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp7()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmp7(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empInputName7").textbox('setValue',row.name);
			 $("#empInputId7").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工8
		function showEmpWin8(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp8()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmp8(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empInputName8").textbox('setValue',row.name);
			 $("#empInputId8").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// -------修改操作
		// 员工1
		function showEmpEditWin1(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
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
		
		// 员工2
		function showEmpEditWin2(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
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
		
		// 员工3
		function showEmpEditWin3(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击所有学生框时再加载学生信息
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
		
		// 员工4
		function showEmpEditWin4(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit4()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmpEdit4(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empEditInputName4").textbox('setValue',row.name);
			 $("#empEditInputId4").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工5
		function showEmpEditWin5(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit5()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmpEdit5(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empEditInputName5").textbox('setValue',row.name);
			 $("#empEditInputId5").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工6
		function showEmpEditWin6(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit6()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmpEdit6(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empEditInputName6").textbox('setValue',row.name);
			 $("#empEditInputId6").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工7
		function showEmpEditWin7(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit7()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmpEdit7(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empEditInputName7").textbox('setValue',row.name);
			 $("#empEditInputId7").val(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 员工8
		function showEmpEditWin8(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit8()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmpEdit8(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empEditInputName8").textbox('setValue',row.name);
			 $("#empEditInputId8").val(row.empId);
			 alert(row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
	</script>
	

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/duty/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'dutyId',checkbox:true">值班编号</th>
		<th data-options="field:'weekDay',width:80">值班日期</th>
		<th data-options="field:'emp1',width:80" formatter="formatterEmp1">员工1</th>
		<th data-options="field:'add1',width:80">地点1</th>
		<th data-options="field:'emp2',width:80" formatter="formatterEmp2">员工2</th>
		<th data-options="field:'add2',width:80">地点2</th>
		<th data-options="field:'emp3',width:80" formatter="formatterEmp3">员工3</th>
		<th data-options="field:'add3',width:80">地点3</th>
		<th data-options="field:'emp4',width:80" formatter="formatterEmp4">员工4</th>
		<th data-options="field:'add4',width:80">地点4</th>
		<th data-options="field:'emp5',width:80" formatter="formatterEmp5">员工5</th>
		<th data-options="field:'add5',width:80">地点5</th>
		<th data-options="field:'emp6',width:80" formatter="formatterEmp6">员工6</th>
		<th data-options="field:'add6',width:80" >地点6</th>
		<th data-options="field:'emp7',width:80" formatter="formatterEmp7">员工7</th>
		<th data-options="field:'add7',width:80">地点7</th>
		<th data-options="field:'emp8',width:80" formatter="formatterEmp8">员工8</th>
		<th data-options="field:'add8',width:80">地点8</th>
		
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="removeProduct();" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
		<div data-options="name:'empp'">员工</div>
	</div>

<div id="addWin" class="easyui-window" title="添加值班" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">周几</td>
				<td>
					<select class="easyui-combobox" name="duty.weekDay" style="width:175px;" data-options="editable:false">
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
						<option value="星期天">星期天</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>员工1</td>
				<td><a href="javascript:;" onclick="showEmpWin1();">
				<input id="empInputName1" class="easyui-textbox easyui-validatebox" name="duty.emp1Name" data-options="required:true"/>
				<input id="empInputId1" type="hidden" name="duty.empId1" /></a></td>
			</tr>
			<tr>
				<td>地点1</td>
				<td><input class="easyui-validatebox easyui-textbox" name="duty.add1" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工2</td>
				<td><a href="javascript:;" onclick="showEmpWin2();">
				<input id="empInputName2" class="easyui-textbox easyui-validatebox" name="duty.emp2Name" data-options="required:true"/>
				<input id="empInputId2" type="hidden" name="duty.empId2" /></a></td>
			</tr>
			<tr>
				<td>地点2</td>
				<td><input class="easyui-validatebox easyui-textbox" name="duty.add2" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工3</td>
				<td><a href="javascript:;" onclick="showEmpWin3();">
				<input id="empInputName3" class="easyui-textbox easyui-validatebox" name="duty.emp3Name" data-options="required:true"/>
				<input id="empInputId3" type="hidden" name="duty.empId3" /> </a></td>
			</tr>
			<tr>
				<td>地点3</td>
				<td><input class="easyui-validatebox easyui-textbox" name="duty.add3" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工4</td>
				<td><a href="javascript:;" onclick="showEmpWin4();">
				<input id="empInputName4" class="easyui-textbox easyui-validatebox" style="width:175px;" name="duty.emp4Name" data-options="required:true"/>
				<input id="empInputId4" type="hidden" name="duty.empId4" /></a></td>
			</tr>
			<tr>
				<td>地点4</td>
				<td><input class="easyui-textbox" name="duty.add4"/></td>
			</tr>
			<tr>
				<td>员工5</td>
				<td><a href="javascript:;" onclick="showEmpWin5();">
				<input id="empInputName5" class="easyui-textbox easyui-validatebox" style="width:175px;" name="duty.emp5Name" data-options="required:true" />
				<input id="empInputId5" type="hidden" name="duty.empId5" /></a></td>
			</tr>
			<tr>
				<td>地点5</td>
				<td><input class=" easyui-textbox" name="duty.add5"/></td>
			</tr>
			<tr>
				<td>员工6</td>
				<td><a href="javascript:;" onclick="showEmpWin6();">
				<input id="empInputName6" class="easyui-textbox easyui-validatebox" style="width:175px;" name="duty.emp6Name" data-options="required:true"/>
				<input id="empInputId6" type="hidden" name="duty.empId6" /></a></td>
			</tr>
			<tr>
				<td>地点6</td>
				<td><input class="easyui-textbox" name="duty.add6"/></td>
			</tr>
			<tr>
				<td>员工7</td>
				<td><a href="javascript:;" onclick="showEmpWin7();">
				<input id="empInputName7" class="easyui-textbox easyui-validatebox" style="width:175px;" name="duty.emp7Name" data-options="required:true"/>
				<input id="empInputId7" type="hidden" name="duty.empId7" /></a></td>
			</tr>
			<tr>
				<td>地点7</td>
				<td><input class="easyui-textbox" name="duty.add7"/></td>
			</tr>
			<tr>
				<td>员工8</td>
				<td><a href="javascript:;" onclick="showEmpWin8();">
				<input id="empInputName8" class="easyui-textbox easyui-validatebox" style="width:175px;" name="duty.emp8Name" data-options="required:true"/>
				<input id="empInputId8" type="hidden" name="duty.empId8" /></a></td>
			</tr>
			<tr>
				<td>地点8</td>
				<td><input class="easyui-textbox" name="duty.add8"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改值班" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="duty.dutyId" />
		<table>
			<tr>
				<td width="100px">周几</td>
				<td>
					<select class="easyui-combobox" name="duty.weekDay" style="width:175px;" data-options="editable:false">
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
						<option value="星期天">星期天</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>员工1</td>
				<td><a href="javascript:;" onclick="showEmpEditWin1();">
				<input id="empEditInputName1" class="easyui-textbox" name="duty.emp1Name1"/>
				<input id="empEditInputId1" type="hidden" name="duty.empId1" /></a></td>
			</tr>
			<tr>
				<td>地点1</td>
				<td><input class="easyui-validatebox easyui-textbox" name="duty.add1" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工2</td>
				<td><a href="javascript:;" onclick="showEmpEditWin2();">
				<input id="empEditInputName2" class="easyui-textbox" name="duty.emp2Name1"/>
				<input id="empEditInputId2" type="hidden" name="duty.empId2" /></a></td>
			</tr>
			<tr>
				<td>地点2</td>
				<td><input class="easyui-validatebox easyui-textbox" name="duty.add2" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工3</td>
				<td><a href="javascript:;" onclick="showEmpEditWin3();">
				<input id="empEditInputName3" class="easyui-textbox" name="duty.emp3Name1"/>
				<input id="empEditInputId3" type="hidden" name="duty.empId3" /> </a></td>
			</tr>
			<tr>
				<td>地点3</td>
				<td><input class="easyui-validatebox easyui-textbox" name="duty.add3" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工4</td>
				<td><a href="javascript:;" onclick="showEmpEditWin4();">
				<input id="empEditInputName4" class="easyui-textbox" style="width:175px;" name="duty.emp4Name1" data-options="required:true"/>
				<input id="empEditInputId4" type="hidden"  name="duty.empId4" /></a></td>
			</tr>
			<tr>
				<td>地点4</td>
				<td><input class="easyui-textbox" name="duty.add4"/></td>
			</tr>
			<tr>
				<td>员工5</td>
				<td><a href="javascript:;" onclick="showEmpEditWin5();">
				<input id="empEditInputName5" class="easyui-textbox" style="width:175px;" name="duty.emp5Name1" data-options="required:true"/>
				<input id="empEditInputId5" type="hidden"  name="duty.empId5" /></a></td>
			</tr>
			<tr>
				<td>地点5</td>
				<td><input class=" easyui-textbox" name="duty.add5"/></td>
			</tr>
			<tr>
				<td>员工6</td>
				<td><a href="javascript:;" onclick="showEmpEditWin6();">
				<input id="empEditInputName6" class="easyui-textbox" style="width:175px;" name="duty.emp6Name1" data-options="required:true"/>
				<input id="empEditInputId6" type="hidden"  name="duty.empId6" /></a></td>
			</tr>
			<tr>
				<td>地点6</td>
				<td><input class="easyui-textbox" name="duty.add6"/></td>
			</tr>
			<tr>
				<td>员工7</td>
				<td><a href="javascript:;" onclick="showEmpEditWin7();">
				<input id="empEditInputName7" class="easyui-textbox" style="width:175px;" name="duty.emp7Name1" data-options="required:true"/>
				<input id="empEditInputId7" type="hidden"  name="duty.empId7" /></a></td>
			</tr>
			<tr>
				<td>地点7</td>
				<td><input class="easyui-textbox" name="duty.add7"/></td>
			</tr>
			<tr>
				<td>员工8</td>
				<td><a href="javascript:;" onclick="showEmpEditWin8();">
				<input id="empEditInputName8" class="easyui-textbox" style="width:175px;" name="duty.emp8Name1" data-options="required:true"/>
				<input id="empEditInputId8" type="hidden"  name="duty.empId8" /></a></td>
			</tr>
			<tr>
				<td>地点8</td>
				<td><input class="easyui-textbox" name="duty.add8"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
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
		<th data-options="field:'empId',checkbox:true">员工编号</th>
	   <th data-options="field:'name',width:80">员工姓名</th>
	</tr>
	</thead>
</table>
</div>

</body>
</html>