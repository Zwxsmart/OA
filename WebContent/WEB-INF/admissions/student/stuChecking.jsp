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
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/default/easyui.css" />
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

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
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
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                    $("#stuInputa1").textbox('setValue',row.stu.name);
                	$("#stuIda1").val(row.stu.stuId);
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
            $("#stuInputa").textbox('setValue',rows[0].stu.name);
    	    $("#stuIda1").val(rows[0].stuId);
        }

        function showEditProductWin1(index) {
            var row = $('#list').datagrid('getData').rows[index];
            if (row) { // 有选中的行
                // var jsonStr = '{"sAdmin.id":"' + row.id + '","sAdmin.email":"' + row.email +'","sAdmin.name":"' + row.name +'","sAdmin.des":"' + row.des +'"}';
                var jsonStr1 = jsonStr.replace("_roomId", row.roomid).replace("_name", row.name).replace("_stuId", row.stuid).replace("_quantity", row.quantity).replace("_status", row.status);
                alert(jsonStr1);
                $("#editForm").form("load", JSON.parse(jsonStr1));
                $("#editWin").window("open");
            }
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
		alert(rows[0].roomId);
		//stu.roomId.val(rows[0].id)
	}
</script>
<script>
		//添加栏位方法
		function showLan(){
			var stuIndex = $('#list').datagrid("getRows").length +1
			$("#list").datagrid("insertRow", {
		        index: stuIndex,
		        row: {"stu.address":"","stu.age":"","stu.birthday":"","stu.des":"","stu.empId":"","stu.gender":"","stu.gradeId":"","stu.idCard":"","stu.name":"","stu.nation":"","stu.parentName":"","stu.parentPhone":"","stu.phone":"","stu.pwd":"","stu.qq":"","stu.resIdence":"","stu.role":"","stu.roomId":"","stu.school":"","stu.startDay":"","stu.status":"","stu.stuId":"","stu.stuNo":"","stu.stuStatus":"","stu.weChat":""}
		    });
		}
		//用户点击栏位详情div拿数据
		 function showStuDetails() {
	            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
	            var rows = $("#list").datagrid("getSelections");
	            if (rows.length > 1) {
	                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
	            } else if (rows.length == 1) {
	                var row = rows[0];
	                if (row) { // 有选中的行
	                	if(row.stuId){// 假如学生id有, 则拿选中行中所有数据
	                		var jsonStr1 = jsonStr.replace("_roomId", row.roomId).replace("_name", row.name).replace("_stuId", row.stuId).replace("_quantity", row.quantity).replace("_status", row.status);
	                        $("#editForm").form("load", JSON.parse(jsonStr1));
	                        $("#editWin").window("open");
		                    $("#stuDetailsFrom").form("load", JSON.parse(jsonStr1));
		                    document.getElementById("stuDetails").style.display="";// 显示隐藏窗口
	                	}else{// 否则学生id没有, 代表用户是新增栏位, 则清楚此div所有数据
	                		document.getElementById("stuDetails").style.display="";// 显示隐藏窗口
	                		qingkong();
	                	}
	                }
	            } else if (rows.length == 0) {
	                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
	            }
	        }
		
		// 用户在详情栏点击保存按钮
		function saveStuDetails() {
			var rows = $("#list").datagrid("getSelections");// 获取表格中选中行的数据
			  if (rows.length > 1) {
		          $.messager.alert("提示", "请先选择一个学生进行操作", "info");
		      } else if (rows.length == 1) {// 假如选中了行
		          var row = rows[0];
		          if (row) { // 有选中的行
		        	  if(row.stuId){// 如果这行数据有学生id, 则进行修改信息操作
		        		  if ($("#stuDetailsFrom").form("validate")) {
		        			  alert(row.stuId);
		                      $.post("<%=path %>/stu/update",
		                          $("#stuDetailsFrom").serialize(),
		                          function (data) {
		                              if (data.result.result == "success") {
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
		        	  }else{ // 否则这行没有学生id, 代表用户的操作是新增了栏位, 想进行添加操作, 这时执行添加操作
		        		  if ($("#stuDetailsFrom").form("validate")) {
		                      $.post("<%=path %>/stu/save",
		                          $("#stuDetailsFrom").serialize(),
		                          function (data) {
		                              if (data.result.result == "success") {
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
		          }
		        }
		}
		
		// 清空详情栏
		function qingkong(){
			$('#stuDetailsTable').form('clear');
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
	alert(gradeId);
	$.post("<%=path %>/stuChecking/stuChecking?gradeId="+gradeId)
    $("#selectStuScoreWin").window("open");
	$("#chooseStuCheckingDiv").window("open"); // 关闭指定的窗口
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
		<a href="javascript:;" onclick="showRemoveProductWin();" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
	</div>
</div>

<div id="chooseStuCheckingDiv" class="easyui-dialog" title="近一个月的考勤信息" data-options="closed:true" style="width:800px;height:500px;">
	<table>
	   	<c:choose>
			<c:when test="${requestScope.stuChecking.size() > 0 }">
				<table>
					<c:forEach items="${requestScope.stuChecking }" var="s">
						<tr>
							<td>${s.checkingId}</td>
							<td>${s.checkingDay }</td>
							<td>${s.stu.name}</td>
							<td>${s.checking1 }</td>
							<td>${s.checking2 }</td>
							<td>${s.checking3 }</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>暂时没有考勤信息</c:otherwise>
		</c:choose>
	</table>
</div>

<div id="addWin" class="easyui-window" title="添加商品" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>学生</td><td><a href="javascript:;" onclick="showStuWin();">
				<input id="stuInputa" class="easyui-textbox" name="stuChecking.stuName"/>
				<input id="stuIda" type="hidden" name="stuChecking.stuId"/></a>
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
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改商品" data-options="closed:true" style="width:500px;height:300px;">
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