<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" import="java.util.*, com.cs.bean.StuChecking"%>

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

        var jsonStr = '{"empChecking.checkingId":"_checkingId","empChecking.empId":"_empId","empChecking.checkingDay":"_checkingDay",'+
        	
        	'"empChecking.time1":"_time1","empChecking.time2":"_time2","empChecking.time3":"_time3","empChecking.time4":"_time4",'+
        	
        	'"empChecking.time5":"_time5","empChecking.time6":"_time6","empChecking.time7":"_time7","empChecking.time8":"_time8"}';

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
            authority("com.cs.action.EmpCheckingAction.save","","save");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/empChecking/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的考勤信息", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_checkingId", row.checkingId).
                    replace("_empId", row.empId).replace("_checkingDay", row.checkingDay).
                    replace("_time1", row.time1).replace("_time2", row.time2).
                    replace("_time3", row.time3).replace("_time4", row.time4).
                    replace("_time5", row.time5).replace("_time6", row.time6).
                    replace("_time7", row.time7).replace("_time8", row.time8);
                    authority("com.cs.action.EmpCheckingAction.update",jsonStr1,"update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的考勤信息", "info");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/empChecking/update",
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
                        $.get("<%=path %>/empChecking/deleteById?id=" + row.checkingId, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的考勤信息", "info");
            }
        }

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }

        function formatterOpt1(value, row, index) {
        	return "<a href='javascript:;' onclick='showStuDetails("+ index + ");'>查看详情</a>";

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
	function showRoomAll(){
		 $("#roomDiv").form("clear"); // 清除表单里的所有数据
		 $("#roomDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	function getRoom(){
		var rows = $("#roomTable").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#roomInput").textbox('setValue',rows[0].name);
		alert(rows[0].depId);
		//stu.roomId.val(rows[0].id)
	}
</script>
<script>
		function termSerach(){
			var row = $("#list").datagrid("getSelected");
			var depId=row.depId;
			var year=$("#year option:selected").text();
			var month=$("#month option:selected").text();
			
			$.get("<%=path %>/empChecking/empChecking?depId="+depId+"&year="+year+"&month="+month,
				function(data) {
				alert("1111111");
				var table = $("#table1");//获取一个table标签,此标签没子元素
				table.html(""); // 把div内部的内容设置为空字符串
				var checkingTime1;
				var checkingTime2;
				var checkingTime3;
				var checkingTime4;
				var checkingTime5;
				var checkingTime6;
				var checkingTime7;
				var checkingTime8;
				
				var checking1;
				var checking2;
				var checking3;
				var checking4;
				var checking5;
				var checking6;
				var checking7;
				var checking8;
				alert(data.checkinfo);
				alert(data.infoList);
				$.each(data.infoList, function(idx, item) {
					// 返回的data是JSON对象的数组，所以需要each循环
					if(idx == 0){
						checkingTime1 = item.checkingTime
					}if(idx == 1){
						checkingTime2 = item.checkingTime
					} if (idx == 2) {
						checkingTime3 = item.checkingTime
					} if (idx == 3) {
						checkingTime4 = item.checkingTime
					}if (idx == 4) {
						checkingTime5 = item.checkingTime
					}if (idx == 5) {
						checkingTime6 = item.checkingTime
					}if (idx == 6) {
						checkingTime7 = item.checkingTime
					}if (idx == 7) {
						checkingTime8 = item.checkingTime
					}
					
				});
				
				$.each(data.checkinfo, function(idx, item1) { // 返回的data是JSON对象的数组，所以需要each循环
				alert(checkingTime1 + "aaaaaaaaaaaaa");
				alert(item1.time1 + "cccc");
				alert(formatTime(item1.time1).substring(11,19));
					if(data.checkinfo != null){
						if(formatTime(item1.time1).substring(11,19) < checkingTime1){
							checking1 = '✔';
						}else{
							checking1 = '×';
						}if(item1.time2 < checkingTime2){
							checking2 = '✔';
						}else{
							checking2 = '×';
						}if(item1.time3 < checkingTime3){
							checking3 = '✔';
						}else{
							checking3 = '×';
						}if(item1.time4 < checkingTime4){
							checking4 = '✔';
						}else{
							checking4 = '×';
						}if(item1.time5 < checkingTime5){
							checking5 = '✔';
						}else{
							checking5 = '×';
						}if(item1.time6 < checkingTime6){
							checking6 = '✔';
						}else{
							checking6 = '×';
						}if(item1.time7 < checkingTime7){
							checking7 = '✔';
						}else{
							checking7 = '×';
						}if(item1.time8 < checkingTime8){
							checking8 = '✔';
						}else{
							checking8 = '×';
						}
						table.append("<tr><td width='50px'>" + item.emp.name + "</td><td>" + checking1 + "</td><td>" + checking2 + "</td><td>" + checking3 + "</td><td>" + checking4 + "</td><td>" + checking5 + "</td><td>" + checking6 + "</td><td>" + checking7 + "</td><td>" + checking8 + "</td></tr>");//在获取到的table中追加trtd形成一个表格
					}else{}
				}); 
				
				
		}, "json");
			
			
			$('#chooseStuCheckingDiv').window('open');
		}
</script>
<script>
//添加按钮
function showStuWin() {
	   var rows = $("#list").datagrid("getSelections");
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
//打开一个的窗口
function showstuCheckIngWin(){
	var row = $("#list").datagrid("getSelected");
	var depId=row.depId;
	alert(depId);
	$.post("<%=path %>/empChecking/queryAll?depId="+depId)
	$("#chooseMonth").window("open");
}
function formatName(value){
	return stuName=value.name;
}
function formatChecking1(value, row, index){
	if (row.checking1 == 1) {
        return "<b>√</b>"
    } else if (row.checking1 == 0) {
        return "<b>×</b>"
    }
}
function formatChecking2(value, row, index){
	if (row.checking2 == 1) {
        return "<b>√</b>"
    } else if (row.checking2 == 0) {
        return "<b>×</b>"
    }
}
function formatChecking3(value, row, index){
	if (row.checking3 == 1) {
        return "<b>√</b>"
    } else if (row.checking3 == 0) {
        return "<b>×</b>"
    }
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
	   		onClickRow:showstuCheckIngWin,
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/dept/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'checkingId',checkbox:true">考勤编号</th>
		<th data-options="field:'empId',width:80">员工姓名</th>
		<th data-options="field:'checkingDay',width:100" formatter="formatTime">打卡日期</th>
		<th data-options="field:'time1',width:100"  formatter="formatTime">时间点1</th>
		<th data-options="field:'time2',width:100"  formatter="formatTime">时间点2</th>
		<th data-options="field:'time3',width:100"  formatter="formatTime">时间点3</th>
		<th data-options="field:'time4',width:100"  formatter="formatTime">时间点4</th>
		<th data-options="field:'time5',width:100"  formatter="formatTime">时间点5</th>
		<th data-options="field:'time6',width:100"  formatter="formatTime">时间点6</th>
		<th data-options="field:'time7',width:100"  formatter="formatTime">时间点7</th>
		<th data-options="field:'time8',width:100"  formatter="formatTime">时间点8</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="showRemoveProductWin();" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
	</div>
</div>

<div id="chooseMonth" class="easyui-window" title="选择年月" data-options="closed:true" style="text-align:center">
<form id="chooseStuCheckingForm" >
		<select id="year" style="width:100px;"><option value="2000" >2000</option><option value="2001" >2001</option>
		<option value="2002" >2002</option><option value="2003" >2003</option>
		<option value="2004" >2004</option><option value="2005" >2005</option>
		<option value="2006" >2006</option><option value="2007" >2007</option>
		<option value="2008" >2008</option><option value="2009" >2009</option>
		<option value="2010" >2010</option><option value="2011" >2011</option>
		<option value="2012" >2012</option><option value="2013" >2013</option>
		<option value="2014" >2014</option><option value="2015" >2015</option>
		<option value="2016" >2016</option><option value="2017" >2017</option>
		<option value="2018" >2018</option><option value="2019" >2019</option>
		<option value="2020" >2020</option></select>
		<select id="month" style="width:100px;"><option value="1">1</option><option value="2">2</option>
		<option value="3" >3</option><option value="4" >4</option>
		<option value="5" >5</option><option value="6" >6</option>
		<option value="7" >7</option><option value="8" >8</option>
		<option value="9" >9</option><option value="10" >10</option>
		<option value="11" >11</option><option value="12" >12</option></select>
		<a href="javascript:;" onclick="termSerach();" class="easyui-linkbutton" iconCls="icon-add">确认</a>
	</form>
</div>
<div id="chooseStuCheckingDiv" class="easyui-window" title="考勤信息" data-options="closed:true" style="width:1130px;height:520px;">
	<table width="1500px" border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
			<tr><td width="50px">员工 </td>
			<td width="46px">1</td><td width="46px">2</td><td width="46px">3</td><td width="46px">4</td>
			<td width="46px">5</td><td width="46px">6</td><td width="46px">7</td><td width="46px">8</td>
			<td width="46px">9</td><td width="46px">10</td><td width="46px">11</td><td width="46px">12</td>
			<td width="46px">13</td><td width="46px">14</td><td width="46px">15</td><td width="46px">16</td>
			<td width="46px">17</td><td width="46px">18</td><td width="46px">19</td><td width="46px">20</td>
			<td width="46px">21</td><td width="46px">22</td><td width="46px">23</td><td width="46px">24</td>
			<td width="46px">25</td><td width="46px">26</td><td width="46px">27</td><td width="46px">28</td>
			<td width="46px">29</td><td width="46px">30</td><td width="46px">31</td>
			</tr>
	</table>
	<table id= "table1" border="1px" bordercolor="#000000" cellspacing="0px" style="border-collapse:collapse">
				
	</table>
</div>

<div id="addWin" class="easyui-window" title="添加员工考勤信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empChecking.empId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>打卡日期</td>
				<td><input class="easyui-datetimebox" name="empChecking.checkingDay"></td>
			</tr>
			<tr>
				<td>时间点1</td>
				<td><input class="easyui-datetimebox" name="empChecking.time1"></td>
			</tr>
			<tr>
				<td>时间点2</td>
				<td><input class="easyui-datetimebox" name="empChecking.time2"></td>
			</tr>
			<tr>
				<td>时间点3</td>
				<td><input class="easyui-datetimebox" name="empChecking.time3"></td>
			</tr>
			<tr>
				<td>时间点4</td>
				<td><input class="easyui-datetimebox" name="empChecking.time4"></td>
			</tr>
			<tr>
				<td>时间点5</td>
				<td><input class="easyui-datetimebox" name="empChecking.time5"></td>
			</tr>
			<tr>
				<td>时间点6</td>
				<td><input class="easyui-datetimebox" name="empChecking.time6"></td>
			</tr>
			<tr>
				<td>时间点7</td>
				<td><input class="easyui-datetimebox" name="empChecking.time7"></td>
			</tr>
			<tr>
				<td>时间点8</td>
				<td><input class="easyui-datetimebox" name="empChecking.time8"></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改员工考勤信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="empChecking.checkingId" />
		<table>
			<tr>
				<td>员工姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empChecking.empId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>打卡日期</td>
				<td><input class="easyui-datetimebox" name="empChecking.checkingDay"></td>
			</tr>
			<tr>
				<td>时间点1</td>
				<td><input class="easyui-datetimebox" name="empChecking.time1"></td>
			</tr>
			<tr>
				<td>时间点2</td>
				<td><input class="easyui-datetimebox" name="empChecking.time2"></td>
			</tr>
			<tr>
				<td>时间点3</td>
				<td><input class="easyui-datetimebox" name="empChecking.time3"></td>
			</tr>
			<tr>
				<td>时间点4</td>
				<td><input class="easyui-datetimebox" name="empChecking.time4"></td>
			</tr>
			<tr>
				<td>时间点5</td>
				<td><input class="easyui-datetimebox" name="empChecking.time5"></td>
			</tr>
			<tr>
				<td>时间点6</td>
				<td><input class="easyui-datetimebox" name="empChecking.time6"></td>
			</tr>
			<tr>
				<td>时间点7</td>
				<td><input class="easyui-datetimebox" name="empChecking.time7"></td>
			</tr>
			<tr>
				<td>时间点8</td>
				<td><input class="easyui-datetimebox" name="empChecking.time8"></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" style="width:60px;" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
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