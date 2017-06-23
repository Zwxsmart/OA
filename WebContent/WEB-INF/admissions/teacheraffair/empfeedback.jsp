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
<title>员工反馈</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script>

var jsonStr='{"empfeedback.feedBackId":"_feedBackId","empfeedback.empId":"_empId","empfeedback.feedBackDay":"_feedBackDay","empfeedback.des":"_des","empfeedback.status":"_status"}';

/**
 * 打开添加窗口
 */
function showAddWin() {
	$("#addForm").form("clear"); // 清除表单里的所有数据
	$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
}
/**
 * 打开编辑窗口
 * @returns
 */

function showEditWin() {
	var rows = $("#list").datagrid("getSelections");
    if (rows.length > 1) {
        $.messager.alert("提示", "请先选择一个需要修改的反馈", "info");
    } else if (rows.length == 1) {
        var row = rows[0];
        if (row) { // 有选中的行
        	var jsonStr1 = jsonStr.replace("_feedBackId", row.feedBackId).replace("_empId", row.empId).replace("_feedBackDay", row.feedBackDay).replace("_des", row.des).replace("_status", row.status);
            $("#editForm").form("load", JSON.parse(jsonStr1));
            $("#editWin").window("open");
        }
    } else if (rows.length == 0) {
        $.messager.alert("提示", "请先选择一个需要修改的反馈", "info");
    }
}

/**
 * 删除课程
 * @returns
 */
function removeEmpfeedback() {
	var row = $("#list").datagrid("getSelected");
	if (row) {
        $.messager.confirm("提示", "确定删除吗？", function (r) {
            if (r) { // 点击了确定按键
                $.get("<%=path %>/empfeedback/deleteEmpFeedBack?id=" + row.feedBackId,
                	function (data) {
                    $("#list").datagrid("reload");
                }, "json");
            }
        })
    } else {
        $.messager.alert("提示", "请先选择需要删除的反馈", "info");
    }
}

/**
 * 添加的新的课程
 */
function addEmpFeedBack() {
    if ($("#addForm").form("validate")) {
    	$.post("<%=path %>/empfeedback/addEmpFeedBack",
            $("#addForm").serialize(),
            function (data) {
                if (data.result.result == "success") {
                    $("#addWin").window("close"); // 关闭指定的窗口
                    $("#list").datagrid("reload"); // 重新加载指定数据网格数据
                    $.messager.alert("提示", data.result.message, "info");
                } else if (data.result.result == "fail") {
                    $.messager.alert("提示", "添加反馈失败", "info");
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
 function editEmpFeedBack() {
     if ($("#editForm").form("validate")) {
         $.post("<%=path %>/empfeedback/updateEmpFeedBack",
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
 function doSearch(value,name){
	 $('#list').datagrid({ url: '<%=path %>/empfeedback/blurredAllQuery?value1='+value+'&name1='+name});
 }
</script>
</head>
<body style="height:100%;">
<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/empfeedback/empfeedbackQueryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:30" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'feedBackId',checkbox:true">反馈编号</th>
		<th data-options="field:'empId',width:100">员工编号</th>
		<th data-options="field:'feedBackDay',width:100">反馈时间</th>
		<th data-options="field:'des',width:100">反馈详情</th>
		<th data-options="field:'status',width:100" formatter="formatterOpt">反馈状态</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="removeEmpfeedback();" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		<input class="easyui-searchbox" data-options="prompt:'请输入搜索条件',menu:'#mm',searcher:doSearch" style="width:300px"></input>
		<div id="mm">
			<div data-options="name:'empId'">员工</div>
			<div data-options="name:'des'">详情</div>
		</div>
	</div>
</div>
<div id="addWin" class="easyui-window" title="添加反馈" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工:</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empfeedback.empId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>反馈时间:</td>
				<td><input id="dd" type="text" class="easyui-datetimebox" name="empfeedback.feedBackDay" data-options="required:true,showSeconds:false" value="3/4/2010 2:3"></td>
			</tr>
			<tr>
                <td>反馈详情</td>
                <td><input class="easyui-textbox" data-options="multiline:true" name="empfeedback.des" style="height:100px;"/></td>
            </tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addEmpFeedBack();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改反馈" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="empfeedback.feedBackId" />
		<table>
			<tr>
				<td>员工编号:</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empfeedback.empId" data-options="required:true,validType:'length[2,32]'"/></td>
			</tr>
			<tr>
				<td>反馈时间:</td>
				<td><input id="dd" type="text" class="easyui-datetimebox" name="empfeedback.feedBackDay" data-options="required:true,showSeconds:false" value="3/4/2010 2:3"></td>
			</tr>
			<tr>
                <td>反馈详情</td>
                <td><input class="easyui-textbox" data-options="multiline:true" name="empfeedback.des" style="height:100px;"/></td>
            </tr>
            <tr>
				<td>状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="empfeedback.status" data-options="panelHeight: 'auto'">
						<option value="0">禁用</option>
						<option value="1">启用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editEmpFeedBack();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>