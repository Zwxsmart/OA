<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="<%=path%>/css/home.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>

	<script>

        var jsonStr = '{"duty.dutyId":"_dutyId","duty.weekDay":"_weekDay","duty.emp1":"_empId1","duty.emp1Name":"_emp1Name",'+
        	
        	'"duty.add1":"_add1","duty.emp2":"_empId2","duty.emp2Name":"_emp2Name","duty.add2":"_add2","duty.emp3":"_empId3",'+
        	
        	'"duty.emp3Name":"_emp3Name","duty.add3":"_add3","duty.empId4":"_empId4","duty.add4":"_add4","duty.empId5":"_empId5",'+
        	
        	'"duty.add5":"_add5","duty.empId6":"_empId6","duty.add6":"_add6","duty.empId7":"_empId7",'+
       
        	'"duty.add7":"_add7","duty.empId8":"_empId8","duty.add8":"_add8"}';
        	

        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
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
                    replace("_add8", row.add8).replace("_emp1", row.emp1).replace("_emp2", row.emp2).replace("_emp3",row.emp3);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
                
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的值班", "info");
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
       		alert(value.name);
        }
     	// 员工2
		 function formatterEmp2(value, row, index) {
        	return value.name;
        }
     	// 员工3
        function formatterEmp3(value, row, index) {
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
	</script>
	

</head>
<body>

<div class="fixed">
	<div class="logo">
		<img src="<%=path %>/images/3.png" style="width: 900px; height: 300px;"/>
	</div>
	<div class="name">
		<th>dasa按时大大大aa</th>
	</div>
	<div class="types">
		<samp>公告类型：</samp>
		<th>奖惩法</th>
	</div>
	<div class="des">
		<th>sadsad啥都会杀不到杀鸡骇猴aaaaaaaaa啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</th>
	</div>
	<div class="person">
		<samp>发布人：</samp>
		<th>阿大声道</th>
	</div>
	<div class="shijian">
		<th>2017年1月12日</th>
	</div>
</div>
<div class="Attendance">员工值班</div>
<table class="easyui-datagrid" data-options="singleSelect: true,
					iconCls: 'icon-save',
					url:'<%=path %>/duty/queryAll',
					method: 'get'
				">
		<thead>
		<tr>
			<th data-options="field:'weekDay',width:90">值班日期</th>
			<th data-options="field:'emp1',width:65" formatter="formatterEmp1">员工1</th>
			<th data-options="field:'add1',width:65">地点1</th>
			<th data-options="field:'emp2',width:65" formatter="formatterEmp2">员工2</th>
			<th data-options="field:'add2',width:65">地点2</th>
			<th data-options="field:'emp3',width:65" formatter="formatterEmp3">员工3</th>
			<th data-options="field:'add3',width:65">地点3</th>
			<th data-options="field:'empId4',width:65">员工4</th>
			<th data-options="field:'add4',width:65">地点4</th>
			<th data-options="field:'empId5',width:65">员工5</th>
			<th data-options="field:'add5',width:65">地点5</th>
			<th data-options="field:'empId6',width:65">员工6</th>
			<th data-options="field:'add6',width:65">地点6</th>
			<th data-options="field:'empId7',width:65">员工7</th>
			<th data-options="field:'add7',width:65">地点7</th>
			<th data-options="field:'empId8',width:65">员工8</th>
			<th data-options="field:'add8',width:65">地点8</th>
			
		</tr>
		</thead>
	</table>
</body>
</html>