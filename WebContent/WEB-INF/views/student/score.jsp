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

        var jsonStr = '{"stuScore.scoreId":"_scoreId","stuScore.stuId":"_stuId","stuScore.courseId":"_courseId","stuScore.score":"_score","stuScore.testDay":"_testDay"}';

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
        	var row = $("#courseTable").datagrid("getSelected");
        	$('#courseId').val(row.courseId);
        	authority('com.cs.action.ScoreAction.save', "", "save");
        }

        function addProduct() {
        	alert($("#addForm").serialize());
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/score/save",
                    $("#addForm").serialize(),
                    function (data) {
                        if (data.result.result == "success") {
                            $("#addWin").window("close"); // 关闭指定的窗口
                            $("#list2").datagrid("reload"); // 重新加载指定数据网格数据
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
        	$("#editForm").form("clear"); // 清除表单里的所有数据
            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
            var courseRow = $("#courseTable").datagrid("getSelected");
        	$('#courseId1').val(courseRow.courseId);
        	var stuRow = $("#list2").datagrid("getSelected");
    		$("#stuInput1").textbox('setValue',stuRow.stu.name);
    		$("#stuInputId1").val(stuRow.stu.stuId);
            var rows = $("#list2").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_scoreId", row.scoreId).replace("_stuId", row.stuId).replace("_courseId", row.courseId).replace("_score", row.score).replace("_testDay", row.testDay);
                    authority('com.cs.action.ScoreAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/score/update",
                    $("#editForm").serialize(),
                    function (data) {
                        if (data.result.result == "success") {
                            $("#editWin").window("close"); // 关闭指定的窗口
                            $("#list2").datagrid("reload"); // 重新加载指定数据网格数据
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
	function showCourseWin(){
		 //$("#courseTable").datagrid("reload");
		 $('#courseTable').datagrid({url: '<%=path %>/course/courseQueryAll'});
		 $("#courseWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	function getCourse(){
		var row = $("#courseTable").datagrid("getSelected");// 获取表格中选中行的数据
		 $("#courseInputa").textbox('setValue',row.name);
		 $("#courseIda").val(row.courseId);
		 $("#courseWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
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
	function showStuAllWin(){
		  var row = $("#list").datagrid("getSelected");
		 $("#stuAllTable").datagrid({url:'<%=path %>/stu/termIdQueryAll?str=1&termId='+row.gradeId + '&who='+'gradeId ='});
		 $("#stuAllTable").datagrid({onClickRow:function(rowIndex, rowDate){addConfirmStu()}});
		 $("#stuAllWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	function showStuAllWin1(){
		  var row = $("#list").datagrid("getSelected");
		 $("#stuAllTable").datagrid({url:'<%=path %>/stu/queryAll?str=1&termId='+row.gradeId + '&who='+'gradeId ='});
		 $("#stuAllTable").datagrid({onClickRow:function(rowIndex, rowDate){editConfirmStu()}});
		 $("#stuAllWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	function addConfirmStu(){
		var row = $("#stuAllTable").datagrid("getSelected");
		$("#stuInput").textbox('setValue',row.name);
		$("#stuInputId").val(row.stuId);
		$("#stuAllWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	function editConfirmStu(){
		var row = $("#stuAllTable").datagrid("getSelected");
		$("#stuInput1").textbox('setValue',row.name);
		$("#stuInputId1").val(row.stuId);
		$("#stuAllWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	function chooseCourse() {
		var row = $("#list").datagrid("getSelected");
		//var courseSlect = $("#courseSelect option:selected");
		// alert(courseSlect.val());// 拿到select下拉框选中的值;
		<%-- $.post("<%=path %>/score/stuScore?gradeId=" + row.gradeId,
                function (data) {
                    	
                }, "json"
            ); --%>
         var courseRow=$('#courseTable').datagrid("getSelected");
         $('#list2').datagrid({ url: '<%=path %>/score/stuScore?gradeId=' + row.gradeId+'&name='+name+'&courseId='+courseRow.courseId}); 
         $("#courseWin").window("close");
         $("#selectStuScoreWin").window("open");
	}
	function showName(value){
		return value.name;
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
function uploadExcel(){
	alert("aaa");
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
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
<!-- 		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a> -->
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

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:true,
			onClickRow:showCourseWin,
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
		<th data-options="field:'emp1',width:60" formatter="showName">班主任</th>
		<th data-options="field:'emp2',width:60" formatter="showName">任课老师</th>
		<th data-options="field:'operation',width:70" formatter="formatterOptStatus">操作</th>
	</tr>
	</thead>
</table>

<div id="selectStuScoreWin" class="easyui-window" title="查看学生成绩" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
		<table id="list2" class="easyui-datagrid"
			data-options="toolbar:'#tp',
			singleSelect:true,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20,
			" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'scoreId',checkbox:true">编号</th>
				<th data-options="field:'stu',width:100" formatter="showName">学生姓名</th>
				<th data-options="field:'course',width:100" formatter="showName">课程</th>
				<th data-options="field:'score',width:80">成绩</th>
				<th data-options="field:'testDay',width:120" formatter="formatTime">考试时间</th>
			</tr>
		</thead>
	</table>
</div>
<div id="tp" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
 		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加成绩</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑成绩</a>
	</div>
</div>
<div id="courseWin" class="easyui-window" title="请选择要查看的科目" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:500px;height:350px;padding:5px;">
		<table id="courseTable" class="easyui-datagrid"
			data-options="
			singleSelect:true,
			onClickRow:chooseCourse,
			collapsible:true,
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20,
			toolbar:'#tb1'" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'courseId',checkbox:true"></th>
				<th data-options="field:'name',width:100">科目</th>
			</tr>
		</thead>
	</table>
	</div>
<%-- <table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/score/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'scoreId',width:60">成绩编号</th>
		<th data-options="field:'stuId',width:100">学生</th>
		<th data-options="field:'courseId',width:100">课程</th>
		<th data-options="field:'score',width:100">成绩</th>
		<th data-options="field:'testday',width:100">考试时间</th>
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
 --%>
<div id="addWin" class="easyui-window" title="添加成绩" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>学生</td>
				<td><a href="javascript:;" onclick="showStuAllWin();">
				<input id="stuInput" class="easyui-validatebox easyui-textbox" name="stuName" data-options="required:true"/>
				<input id="stuInputId" type="hidden" name="stuScore.stuId" /></a></td>
			</tr>
			<tr>
				<tr>
				<td><input id="courseId" type="hidden" name="stuScore.courseId" /></td>
			</tr>
			</tr>
			<tr>
				<td>成绩</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stuScore.score" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>考试时间</td>
				<td><input class="easyui-datebox" name="stuScore.testDay" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改成绩" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="stuScore.scoreId" />
		<table>
			<tr>
				<td>学生</td>
				<td><a href="javascript:;" onclick="showStuAllWin1();">
				<input id="stuInput1" class="easyui-validatebox easyui-textbox" name="stuName" data-options="required:true"/>
				<input id="stuInputId1" type="hidden" name="stuScore.stuId" /></a></td>
			</tr>
			<tr>
				<td><input id="courseId1" type="hidden" name="stuScore.courseId" /></td>
			</tr>
			<tr>
				<td>成绩</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stuScore.score" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>考试时间</td>
				<td><input class="easyui-datebox" name="stuScore.testDay" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
				</td>
			</tr>

		</table>
	</form>
</div>

<!-- 显示所有学生让班级添加 -->
<div id="stuAllWin" class="easyui-window" title="所有学生" data-options="closed:true" style="width:500px;height:300px;">
	<table id="stuAllTable" class="easyui-datagrid"
	   data-options="singleSelect:false,
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

</body>
</html>