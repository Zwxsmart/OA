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

        var jsonStr = '{"empAppeal.appealId":"_appealId","empAppeal.empId":"_empId","empAppeal.appealDay":"_appealDay",'+
        	
        	'"empAppeal.des":"_des","empAppeal.status":"_status","empAppeal.firstLevel":"_firstLevel","empAppeal.secondLevel":"_secondLevel",'+
        	
        	'"empAppeal.pass":"_pass"}';

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
            authority("com.cs.action.EmpAppealAction.save","","save");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/empAppeal/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的考勤申诉信息", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_appealId", row.appealId).
                    replace("_empId", row.empId).replace("_appealDay", row.appealDay).
                    replace("_des", row.des).replace("_status", row.status).
                    replace("_firstLevel", row.firstLevel).replace("_secondLevel", row.secondLevel).
                    replace("_pass", row.pass);
                    authority("com.cs.action.EmpAppealAction.update",jsonStr1,"update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的考勤申诉信息", "info");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/empAppeal/update",
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

        <%--
        function removeProduct() {
            var row = $("#list").datagrid("getSelected");
            if (row) {
                $.messager.confirm("提示", "确定删除吗？", function (r) {
                    if (r) { // 点击了确定按键
                        $.get("<%=path %>/product/del?id=" + row.id, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的考勤申诉信息", "info");
            }
        }
        
        --%>

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
        function formatterOpt3(value, row, index) {
            if (row.firstLevel == 1) {
                return "<b>通过</b>"
			} else if(row.firstLevel == 0) {
                return "<b>不通过</b>"
			}
        }
        
        function formatterOpt4(value, row, index) {
            if (row.secondLevel == 1) {
                return "<b>通过</b>"
			} else if(row.secondLevel == 0) {
                return "<b>不通过</b>"
			}
        }
        
        function formatterOpt5(value, row, index) {
            if (row.pass == 1) {
                return "<b>通过</b>"
			} else if(row.pass == 0) {
                return "<b>不通过</b>"
			}
        }
        
        function formatterOpt1(value, row, index) {
        	if (row.status == 0) {
        		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
        	}
        	
        }
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/empAppeal/empAppealDisable?id=" + row.appealId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/empAppeal/empAppealActivate?id=" + row.appealId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
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
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/empAppeal/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'appealId',checkbox:true">请假编号</th>
		<th data-options="field:'empId',width:100">员工姓名</th>
		<th data-options="field:'appealDay',width:100"  formatter="formatTime">提交时间</th>
		<th data-options="field:'des',width:100">请假描述</th>
		<th data-options="field:'firstLevel',width:100" formatter="formatterOpt3">直属上司审核</th>
		<th data-options="field:'secondLevel',width:100" formatter="formatterOpt4">老板审核</th>
		<th data-options="field:'pass',width:100" formatter="formatterOpt5">通过状态</th>
		<th data-options="field:'status',width:80" formatter="formatterOpt">状态</th>
		<th data-options="field:'bbb',width:80" formatter="formatterOpt1">操作</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加员工考勤申诉信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empAppeal.empId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>提交时间</td>
				<td><input class="easyui-datetimebox" name="empAppeal.appealDay"></td>
			</tr>
			<tr>
				<td>请假描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empAppeal.des" data-options="required:true" style="width:100%;height:32px"></td>
			</tr>
			<%-- <tr>
				<td>直属上司审核</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="empAppeal.firstLevel"><option value="1">通过</option><option value="0">不通过</option></select>
				</td>
			</tr>
			<tr>
				<td>老板审核</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="empAppeal.secondLevel"><option value="1">通过</option><option value="0">不通过</option></select>
				</td>
			</tr> --%>
			<%-- <tr>
				<td>通过状态</td>
				<td><select style="width:100px;" class="easyui-combobox" name="empAppeal.pass"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="empAppeal.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr> --%>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改员工考勤申诉信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="empAppeal.appealId" />
		<table>
			<tr>
				<td>员工姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empAppeal.empId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>提交时间</td>
				<td><input class="easyui-datetimebox" name="empAppeal.appealDay"></td>
			</tr>
			<tr>
				<td>请假描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="empAppeal.des" data-options="required:true" style="width:100%;height:32px"></td>
			</tr>
			<tr>
				<td>直属上司审核</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="empAppeal.firstLevel"><option value="1">通过</option><option value="0">不通过</option></select>
				</td>
			</tr>
			<tr>
				<td>老板审核</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="empAppeal.secondLevel"><option value="1">通过</option><option value="0">不通过</option></select>
				</td>
			</tr>
			<tr>
				<td>通过状态</td>
				<td><select style="width:100px;" class="easyui-combobox" name="empAppeal.pass"><option value="1">通过</option><option value="0">不通过</option></select></td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="empAppeal.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" style="width:60px;" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>