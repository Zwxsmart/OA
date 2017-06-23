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

        var jsonStr = '{"check.checkId":"_checkId","check.empId":"_empId","check.emp":"_empName","check.checkTime":"_checkTime","check.weekDay":"_weekDay",'+
        	'"check.gradeId":"_gradeId","check.grade":"_gradeName","check.roomId":"_roomId","check.room":"_roomName","check.des":"_des"}';

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
            authority("com.cs.action.CheckAction.save",'',"save");
        }

        function addProduct() {
           // if ($("#addForm").form("validate")) {
                $.post("<%=path %>/check/save",
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
           // } else {
              //  $.messager.alert("提示", "请输入正确的数据", "info");
          //  }
        }

        function showEditProductWin() {
            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
            var rows = $("#list").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的巡查", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_checkId", row.checkId).replace("_empId",row.empId).
                    replace("_empName", row.emp.name).replace("_checkTime", row.checkTime).replace("_weekDay", row.weekDay).
                    replace("_gradeId", row.gradeId).replace("_gradeName", row.grade.name).replace("_roomId", row.roomId).
                    replace("_roomName", row.room.name).replace("_des",row.des);
                    authority("com.cs.action.CheckAction.update",jsonStr1,"update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的巡查", "info");
            }
            $("#empEditInputName1").textbox('setValue',rows[0].emp.name);
            $("#gradeEditInputName2").textbox('setValue',rows[0].grade.name);
            $("#roomEditInputName3").textbox('setValue',rows[0].room.name);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/check/update",
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
                        $.get("<%=path %>/check/deleteById?id=" + row.checkId, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的巡查", "info");
            }
        }


        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
     	 //给员工赋值
        function formatterOpt1(value) {
        	return value.name;
        }
      
     	 //给班级赋值
        function formatterOpt2(value) {
        	if (value != '' && value != null) {
     			return value.name;
     		} else {
     			return "";
     		}
        }
      
     	 //给宿舍赋值
        function formatterOpt3(value) {
        	if (value != '' && value != null) {
     			return value.name;
     		} else {
     			return "";
     		}
        }
     	 
      	//模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path %>/check/blurredAllQuery?value1='+value+'&name1='+name});
         }
     	 
     	//时间段查询
        function findPositions(){
    		var beginTime=$("#startDatetime").datetimebox("getValue");
    		var endTime=$("#endDatetime").datetimebox("getValue");
    		$('#list').datagrid({ url: '<%=path %>/check/serachTime?beginTime='+beginTime+'&endTime='+endTime});
    	}
     	
     	// 查询全部
        function showAllProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/check/queryAll'}); 
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
		//添加................
		//员工
		function showEmpWin1(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmp1()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmp1(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empInputName1").textbox('setValue',row.name);
			 $("#empInputId1").textbox('setValue', row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 班级
		function showGradeWin2(){
		    $("#gradeTable").datagrid({url:'<%=path %>/grade/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#gradeTable").datagrid({onClickRow:function(rowIndex, rowDate){getGrade2()}});
		    $("#gradeWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getGrade2(){
			var row = $("#gradeTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#gradeInputName2").textbox('setValue',row.name);
			 $("#gradeInputId2").textbox('setValue', row.gradeId);
			 $("#gradeWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}

		// 宿舍 
		function showRoomWin3(){
		    $("#roomTable").datagrid({url:'<%=path %>/room/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#roomTable").datagrid({onClickRow:function(rowIndex, rowDate){getRoom3()}});
		    $("#roomWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getRoom3(){
			var row = $("#roomTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#roomInputName3").textbox('setValue',row.name);
			 $("#roomInputId3").textbox('setValue', row.roomId);
			 $("#roomWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// -------修改操作
		// 员工
		function showEmpEditWin1(){
		    $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#empTable").datagrid({onClickRow:function(rowIndex, rowDate){getEmpEdit1()}});
		    $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getEmpEdit1(){
			var row = $("#empTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#empEditInputName1").textbox('setValue',row.name);
			 $("#empEditInputId1").textbox('setValue',row.empId);
			 $("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 班级
		function showGradeEditWin2(){
		    $("#gradeTable").datagrid({url:'<%=path %>/grade/queryAll'});
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#gradeTable").datagrid({onClickRow:function(rowIndex, rowDate){getGradeEdit2()}});
		    $("#gradeWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getGradeEdit2(){
			var row = $("#gradeTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#gradeEditInputName2").textbox('setValue',row.name);
			 $("#gradeEditInputId2").textbox('setValue',row.gradeId);
			 $("#gradeWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		// 宿舍
		function showRoomEditWin3(){
		    $("#roomTable").datagrid({url:'<%=path %>/room/queryAll'});// 当点击所有学生框时再加载学生信息
		    // 判断通过不同的input点击却进入相同的datagrid, 但选中行时可以给不同input赋值
		    $("#roomTable").datagrid({onClickRow:function(rowIndex, rowDate){getRoomEdit3()}});
		    $("#roomWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		function getRoomEdit3(){
			var row = $("#roomTable").datagrid("getSelected");// 获取表格中选中行的数据
			 $("#roomEditInputName3").textbox('setValue',row.name);
			 $("#roomEditInputId3").textbox('setValue',row.roomId);
			 $("#roomWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/check/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'checkId',checkbox:true">巡查编号</th>
		<th data-options="field:'emp',width:100" formatter="formatterOpt2">员工编号</th>
		<th data-options="field:'checkTime',width:125" formatter="formatTime">巡查时间</th>
		<th data-options="field:'weekDay',width:100">周几</th>
		<th data-options="field:'grade',width:100" formatter="formatterOpt2">班级编号</th>
		<th data-options="field:'room',width:100" formatter="formatterOpt3">宿舍编号</th>
		<th data-options="field:'des',width:100">巡查描述</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		开始时间:<input id="startDatetime" name="startDatetime" class="easyui-datebox"  style="width:150px;" data-options="editable:false"/>
		结束时间:<input id="endDatetime" name="endDatetime" class="easyui-datebox" style="width:150px;" data-options="editable:false"/>
		<a href="javascript:;" onclick="findPositions();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	<div data-options="name:'gradee'">班级</div>
	    <div data-options="name:'roomm'">宿舍</div>
	    <div data-options="name:'empp'">员工</div>
	</div>


<div id="addWin" class="easyui-window" title="添加巡查" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">员工姓名</td>
				<td>
					<a href="javascript:;" onclick="showEmpWin1();">
						<input id="empInputName1" style="width:162px;" class="easyui-textbox easyui-validatebox" name="empName" data-options="required:true"/>
						<input id="empInputId1" type="hidden" class="easyui-textbox" name="empId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>巡查时间</td>
				<td><input class="easyui-datetimebox" name="check.checkTime" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>周几</td>
				<td>
					<select class="easyui-combobox" name="check.weekDay" style="width:172px;" data-options="editable:false">
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
				<td>班级名称</td>
				<td>
					<a href="javascript:;" onclick="showGradeWin2();">
						<input id="gradeInputName2" style="width:162px;" class="easyui-textbox easyui-validatebox" name="gradeName" data-options="required:true"/>
						<input id="gradeInputId2" type="hidden" class="easyui-textbox" name="gradeId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>宿舍名称</td>
				<td>
					<a href="javascript:;" onclick="showRoomWin3();">
						<input id="roomInputName3" style="width:162px;" class="easyui-textbox easyui-validatebox" name="roomName" data-options="required:true"/>
						<input id="roomInputId3" type="hidden" class="easyui-textbox name="roomId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>巡查描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="check.des" data-options="required:true" style="width:172px;height:32px"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改巡查" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="check.checkId" />
		<table>
			<tr>
				<td width="100px">员工姓名</td>
				<td>
					<a href="javascript:;" onclick="showEmpEditWin1();">
						<input id="empEditInputName1" style="width:162px;" class="easyui-textbox easyui-validatebox" name="check.empName" data-options="required:true"/>
						<input id="empEditInputId1"  type="hidden" class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>巡查时间</td>
				<td><input class="easyui-datetimebox" name="check.checkTime" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>周几</td>
				<td>
					<select class="easyui-combobox" name="check.weekDay" style="width:172px;" data-options="editable:false">
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
				<td>班级名称</td>
				<td>
					<a href="javascript:;" onclick="showGradeEditWin2();">
						<input id="gradeEditInputName2" style="width:162px;" class="easyui-textbox easyui-validatebox" name="check.gradeName" data-options="required:true"/>
						<input id="gradeEditInputId2" type="hidden" class="easyui-textbox" name="gradeId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>宿舍名称</td>
				<td>
					<a href="javascript:;" onclick="showRoomEditWin3();">
						<input id="roomEditInputName3" style="width:162px;" class="easyui-textbox easyui-validatebox" name="check.roomName" data-options="required:true"/>
						<input id="roomEditInputId3" type="hidden" class="easyui-textbox" name="roomId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>巡查描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="check.des" data-options="required:true" style="width:172px;height:32px"/></td>
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

<!-- 班级 -->
<div id="gradeWin" class="easyui-window" title="所有班级" data-options="closed:true" style="width:500px;height:300px;">
	<table id="gradeTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'gradeId',checkbox:true">班级编号</th>
			<th data-options="field:'name',width:60">班级名称</th>
		</tr>
	</thead>
</table>
</div> 

<!-- 宿舍 -->
<div id="roomWin" class="easyui-window" title="所有宿舍" data-options="closed:true" style="width:500px;height:300px;">
	<table id="roomTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'roomId',checkbox:true">宿舍编号</th>
			<th data-options="field:'name',width:60">宿舍名称</th>
		</tr>
	</thead>
</table>
</div> 

</body>
</html>