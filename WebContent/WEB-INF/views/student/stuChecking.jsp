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

        var jsonStr = '{"stuChecking.checkingId":"_checkingId","stuChecking.stuId":"_stuId","stuChecking.checkingDay":"_checkingDay","stuChecking.checking1":"_checking1","stuChecking.checking2":"_checking2","stuChecking.checking3":"_checking3"}';

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
            authority('com.cs.action.StuCheckingAction.save', "", "save");
        }

        function addProduct() {
        	alert($("#addForm").serialize());
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/stuChecking/save",
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
            var rows = $("#stuCheckInglist").datagrid("getSelections");
            if (rows.length < 1) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_checkingId", row.checkingId).replace("_stuId", row.stuId).replace("_checkingDay", row.checkingDay).replace("_checking1", row.checking1).replace("_checking2", row.checking2).replace("_checking3", row.checking3);
                    $("#stuInputa1").textbox('setValue',row.stu.name);
                	$("#stuIda1").val(row.stu.stuId);
                	authority('com.cs.action.StuCheckingAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
            $("#stuInputa").textbox('setValue',rows[0].stu.name);
    	    $("#stuIda1").val(rows[0].stuId);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/stuChecking/update",
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
	}
</script>
<script>
		function termSerach(){
			var row = $("#list").datagrid("getSelected");
			var gradeId=row.gradeId;
			var year=$("#year option:selected").text();
			var month=$("#month option:selected").text();
			$.get("<%=path %>/stuChecking/stuChecking?gradeId="+gradeId+"&year="+year+"&month="+month,
				function(data) {
				var table = $("#table1");//获取一个table标签,此标签没子元素
				table.html(""); // 把div内部的内容设置为空字符串
				var checking1;
				var checking2;
				var checking3;
				$.each(data.stuList, function(idx, item) { // 返回的data是JSON对象的数组，所以需要each循环
					if(data.stuList != null){
						if(item.checking1 == 1){
							checking1 = '✔';
						}else{
							checking1 = '×';
						}if(item.checking2 == 1){
							checking2 = '✔';
						}else{
							checking2 = '×';
						}if(item.checking3 == 1){
							checking3 = '✔';
						}else{
							checking3 = '×';
						}
						table.append("<tr><td width='50px'>" + item.stu.name + "</td><td>" + checking1 + "</td><td>" + checking2 + "</td><td>" + checking3 + "</td></tr>");//在获取到的table中追加trtd形成一个表格
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
	var gradeId=row.gradeId;
	$.post("<%=path %>/stuChecking/queryAll?gradeId="+gradeId)
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
</script>
</head>
<body style="height:100%;">
<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
	   		onClickRow:showstuCheckIngWin,
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/grade/queryAll',
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

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
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
			<tr><td width="50px">学生 </td>
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

<div id="addWin" class="easyui-window" title="添加考勤" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>学生</td><td><a href="javascript:;" onclick="showStuWin();">
				<input id="stuInputa" class="easyui-textbox" name="stuChecking.stuName"/>
				<input id="stuIda" type="hidden" name="stuChecking.stuId"/></a>
				</td>
			</tr>
			<tr>
				<td width ="100px">考勤时间</td>
				<td><input class="easyui-datebox" name="stuChecking.checkingDay" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>上午</td>
				<td><select style="width:173px;" class="easyui-combobox" name="stuChecking.checking1"><option value="1">正常</option><option value="0">迟到</option></select></td>
			</tr>
			<tr>
				<td>中午</td>
				<td><select style="width:173px;" class="easyui-combobox" name="stuChecking.checking2"><option value="1">正常</option><option value="0">迟到</option></select></td>
			</tr>
			<tr>
				<td>下午</td>
				<td><select style="width:173px;" class="easyui-combobox" name="stuChecking.checking3"><option value="1">正常</option><option value="0">迟到</option></select></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改考勤" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="stuChecking.checkingId" />
		<table>
			<tr>
				<td>学生</td><td><a href="javascript:;" onclick="showEditStuWin();">
				<input id="stuInputa1" class="easyui-textbox" name="stuChecking.stuName"/>
				<input id="stuIda1" type="hidden" name="stuChecking.stuId"/></a>
				</td>
			</tr>
			<tr>
				<td>考勤时间</td>
				<td><input class="easyui-datebox" name="stuChecking.checkingDay" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>上午</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stuChecking.checking1" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>中午</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stuChecking.checking2" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>下午</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stuChecking.checking3" data-options="required:true,validType:'length[1,20]'"/></td>
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