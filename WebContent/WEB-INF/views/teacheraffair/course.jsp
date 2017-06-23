<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程管理</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script>

var jsonStr='{"course.courseId":"_courseId","course.name":"_name","course.totalHour":"_totalHour","course.term":"_term","course.courseOrder":"_courseOrder","course.des":"_des"}';

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

/**
 * 打开添加窗口
 */
function showAddWin() {
	$("#addForm").form("clear"); // 清除表单里的所有数据
	authority('com.cs.action.CourseAction.addCourse', "", "save");
}
/**
 * 打开编辑窗口
 * @returns
 */

function showEditWin() {
	var rows = $("#list").datagrid("getSelections");
    if (rows.length > 1) {
        $.messager.alert("提示", "请先选择一个需要修改的课程", "info");
    } else if (rows.length == 1) {
        var row = rows[0];
        if (row) { // 有选中的行
        	var jsonStr1 = jsonStr.replace("_courseId", row.courseId).replace("_name", row.name).replace("_totalHour", row.totalHour).replace("_term", row.term).replace("_courseOrder", row.courseOrder).replace("_des", row.des);
        authority('com.cs.action.CourseAction.updateCourse', jsonStr1, "update");
        }
    } else if (rows.length == 0) {
        $.messager.alert("提示", "请先选择一个需要修改的课程", "info");
    }
}

/**
 * 删除课程
 * @returns
 */
function removeCourse() {
	var row = $("#list").datagrid("getSelected");
	if (row) {
        $.messager.confirm("提示", "确定删除吗？", function (r) {
            if (r) { // 点击了确定按键
                $.get("<%=path %>/course/deleteCourse?id=" + row.courseId,
                	function (data) {
                	$.messager.alert("提示", data.result.message, "info");
                    $("#list").datagrid("reload");
                }, "json");
            }
        })
    } else {
        $.messager.alert("提示", "请先选择需要删除的课程", "info");
    }
}

/**
 * 添加的新的课程
 */
function addCourse() {
    if ($("#addForm").form("validate")) {
    	$.post("<%=path %>/course/addCourse",
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

/**
 * 更新课程信息
 */
 function editCourse() {
     if ($("#editForm").form("validate")) {
         $.post("<%=path %>/course/updateCourse",
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
 function formatterOpt(value, row, index) {
     if (row.status == 1) {
         return "<b>已启用</b>"
		} else if(row.status == 0) {
         return "<b>已禁用</b>"
		}
 }
 /**
  * 模糊查询方法
  */
 function doSearch(value,name){
	 $('#list').datagrid({ url: '<%=path %>/course/blurredAllQuery?value1='+value+'&name1='+name});
 }
 /**
  * 查询所有的课程
  */
 function showCourse(){
	 $('#list').datagrid({ url: '<%=path %>/course/courseQueryAll'});
 }
 
 /**
  * 查询所有冻结的课程
  */
 function showFreeze(){
	 $('#list').datagrid({ url: '<%=path %>/course/courseQueryFreeze'});
 }
 
 function formatterOpt(value, row, index) {
     if (row.status == 1) {
         return "<b>已启用</b>"
	 } else if(row.status == 0) {
         return "<b>已禁用</b>"
	 }
 }
 /**
 *	替换字段名称，1为第一学期
 */
 function formatTerm(value,row,index){
	 if (row.term == 1) {
         return "<b>第一学期</b>"
	 } else if(row.term == 2) {
         return "<b>第二学期</b>"
	 } else if(row.term == 3){
		 return "<b>第三学期</b>"
	 } else if(row.term == 4){
		 return "<b>第四学期</b>"
	 }
 }
 function formatCourseOrder(value,row,index){
	 if (row.courseOrder == 1) {
         return "<b>入门</b>"
	 } else if(row.courseOrder == 2) {
         return "<b>初级</b>"
	 } else if(row.courseOrder == 3){
		 return "<b>中级</b>"
	 } else if(row.courseOrder == 4){
		 return "<b>高级</b>"
	 }
 }
 /**
 *	
 */
 function termSerach(e){
     var name=e.getAttribute("data-name");
     $('#list').datagrid({ url: '<%=path %>/course/termSerach?term='+name+''});
 }
 function formatStatus(value, row, index) {
 	if (row.status == 0) {
 		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
 	} else {
 		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
 	}
 }
 function disable(index){   // 禁用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/course/courseDisable?id=" + row.courseId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload');	
					if(data.resutl.result=="fail"){
						$.messager.alert("提示", data.result.message, "info");
					}
			},"json");
		}
		
	}
		
 function activate(index){  // 启用
		var row = $('#list').datagrid('getData').rows[index];
		if(row){
			$.post("<%=path %>/course/courseActivate?id=" + row.courseId,
				$("#editForm").serialize(),
				function(data){
					$('#list').datagrid('reload'); // 重新加载数据表
					if(data.result.result=="fail"){
						$.messager.alert("提示", data.result.message, "info");
					}
			},"json");
		}
	}
</script>
</head>
<body style="height:100%;">
<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			remoteSort:false,
			url:'<%=path %>/course/courseQueryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:30" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'courseId',checkbox:true">课程编号</th>
		<th data-options="field:'name',width:100">课程名称</th>
		<th data-options="field:'totalHour',width:100">总课时数</th>
		<th data-options="field:'term',width:100" formatter="formatTerm">学期</th>
		<th data-options="field:'courseOrder',width:100,sortable: true" formatter="formatCourseOrder">课程顺序</th>
		<th data-options="field:'des',width:100">描述信息</th>
		<th data-options="field:'status',width:100" formatter="formatterOpt">课程状态</th>
		<th data-options="field:'bbb',width:60" formatter="formatStatus">操作</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="removeCourse();" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		<input class="easyui-searchbox" data-options="prompt:'请输入搜索条件',menu:'#mm',searcher:doSearch" style="width:300px"></input>
		<div id="mm">
			<div data-options="name:'name',iconCls:'icon-ok'">课程名称</div>
			<div data-options="name:'term'" data-name="1" onclick="termSerach(this);">第一学期</div>
			<div data-options="name:'term'" data-name="2" onclick="termSerach(this);">第二学期</div>
			<div data-options="name:'term'" data-name="3" onclick="termSerach(this);">第三学期</div>
			<div data-options="name:'term'" data-name="4" onclick="termSerach(this);">第四学期</div>
		</div>
	</div>
</div>


<div id="addWin" class="easyui-window" title="添加课程" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">课程名称:</td>
				<td><input class="easyui-validatebox easyui-textbox" name="course.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>总课时数:</td>
				<td><input type="number" class="easyui-textbox easyui-numberbox" name="course.totalHour" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>学期:</td>
				<td>
					<select style="width:173px;" class="easyui-combobox" name="course.term" data-options="panelHeight: 'auto'">
						<option value="1">第一学期</option>
						<option value="2">第二学期</option>
						<option value="3">第三学期</option>
						<option value="4">第四学期</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="100px">课程顺序:</td>
				<td>
					<select style="width:173px;" class="easyui-combobox" name="course.courseOrder" data-options="panelHeight: 'auto'">
						<option value="1">入门</option>
						<option value="2">初级</option>
						<option value="3">中级</option>
						<option value="4">高级</option>
					</select>
				</td>
			</tr>
			<tr>
                <td>课程描述</td>
                <td><input class="easyui-textbox" data-options="multiline:true" name="course.des" style="height:100px;"/></td>
            </tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addCourse();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改课程" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="course.courseId" />
		<table>
			<tr>
				<td width="100px">课程名称:</td>
				<td><input class="easyui-validatebox easyui-textbox" name="course.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>总课时数:</td>
				<td><input type="number" class="easyui-textbox easyui-numberbox" name="course.totalHour" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>学期:</td>
				<td>
					<select style="width:153px;" class="easyui-combobox" name="course.term" data-options="panelHeight: 'auto'">
						<option value="1">第一学期</option>
						<option value="2">第二学期</option>
						<option value="3">第三学期</option>
						<option value="4">第四学期</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>课程顺序:</td>
				<td>
					<select style="width:153px;" class="easyui-combobox" name="course.courseOrder" data-options="panelHeight: 'auto'">
						<option value="1">入门</option>
						<option value="2">初级</option>
						<option value="3">中级</option>
						<option value="4">高级</option>
					</select>
				</td>
			</tr>
			<tr>
                <td>课程描述</td>
                <td><input class="easyui-textbox" data-options="multiline:true" name="course.des" style="height:100px;"/></td>
            </tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editCourse();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>