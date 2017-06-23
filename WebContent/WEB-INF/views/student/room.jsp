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

        var jsonStr = '{"room.roomId":"_roomId","room.name":"_name","room.stuId":"_stuId","room.quantity":"_quantity","room.status":"_status"}';

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
            authority('com.cs.action.RoomAction.save', "", "save");
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/room/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_roomId", row.roomId).replace("_name", row.name).replace("_stuId", row.stuId).replace("_quantity", row.quantity).replace("_status", row.status);
                    authority('com.cs.action.RoomAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的数据", "info");
            }
            	$("#roomInputa1").textbox('setValue',rows[0].stu.name);
            	$("#roomIda1").val(rows[0].stu.stuId);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
	                $.post("<%=path %>/room/update",
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

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
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
	function showRoomAll(){
		 $("#roomDiv").form("clear"); // 清除表单里的所有数据
		 $("#roomDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	function getRoom(){
		var rows = $("#roomTable").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#roomInput").textbox('setValue',rows[0].name);
		//stu.roomId.val(rows[0].id)
	}
</script>
<script>
		//选中班级行时则查看此班所有学生
		function showStuWin() {
		  var rows = $("#list").datagrid("getSelections");
		 // $("#stuTable").datagrid("reload");
		  $("#stuTable").datagrid({url:'<%=path %>/stu/termIdQueryAll?str=1&termId='+rows[0].roomId + '&who='+'roomId ='});// 当点击所有学生框时再加载学生信息
		  $("#stuWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
		//添加学生时显示所有学生
		function showStuAllWin1() {
			var rows = $("#list").datagrid("getSelections");
			//$("#stuAllTable1").datagrid("reload");
		  $("#stuAllTable1").datagrid({url:'<%=path %>/stu/termIdQueryAll?str=0&who=roomid&termId='+rows[0].roomId});// 当点击所有学生框时再加载学生信息
		   $("#stuAllWin1").window("open"); // 打开指定的window， open表示打开，close表示关闭
		} 
		// 在所有学生里点击添加时 , 批量添加学生
		function addStu(){
			var roomRow = $("#list").datagrid("getSelected");//获取所有选中行元素
			var rows = $("#stuAllTable1").datagrid("getSelections");//获取所有选中行元素
			var stuRows = $('#stuTable').datagrid('getData');
			if(rows.length > 0){// 获取到了元素
				// stuRows.rows.length 班级已有学生总数, rows.length 选择添加了多少个学生, gradeRow.quantity 班级学生最大数
				if(stuRows.rows.length + rows.length > roomRow.quantity){
					$.messager.alert("提示", "总学生数超过宿舍最大学生数","info");
				}else {
					var ids = "";// 设置一个字符串
					for (var i =0, len = rows.length; i < len; i++){
						if(ids == ""){// 假如这个字符串刚开始设置,
							ids = rows[i].stuId;// 则直接赋上0索引上的id属性
						}else {
							ids += "," + rows[i].stuId// 否则就加上逗号把rows里所有的id都赋给ids
						}
					}
					if (ids != ""){ //假如这个字符串不是空
								//此时ids存放了已选中所有要删除的行id
								$.get("<%=path %>/room/addStuByIds?stuIds=" + ids +"&roomId="+roomRow.roomId,//传出行元素ids元素
										function(data) {
											$.messager.alert("提示", data.result.message, "info");
											$("#stuAllWin1").window("close");
											$("#stuTable").datagrid("reload");
										}
									),"json"
					}
				}
			}else {
				$.messager.alert("提示", "请先选择需要添加的学生","info");
			}
		}
		// 在宿舍里删除学生
		function removeGradeStu() {
			var roomRow = $("#list").datagrid("getSelected");//获取所有选中行元素
			var rows = $("#stuTable").datagrid("getSelections");//获取所有选中行元素
			if(rows.length > 0){// 获取到了元素
				// stuRows.rows.length 班级已有学生总数, rows.length 选择添加了多少个学生, gradeRow.quantity 班级学生最大数
					var ids = "";// 设置一个字符串
					for (var i =0, len = rows.length; i < len; i++){
						if(ids == ""){// 假如这个字符串刚开始设置,
							ids = rows[i].stuId;// 则直接赋上0索引上的id属性
						}else {
							ids += "," + rows[i].stuId// 否则就加上逗号把rows里所有的id都赋给ids
						}
					}
					if (ids != ""){ //假如这个字符串不是空
								//此时ids存放了已选中所有要删除的行id
								$.messager.confirm("提示", "确认删除吗?", function(r){
									if(r){
								$.get("<%=path %>/room/delStuByIds?stuIds=" + ids +"&roomId="+roomRow.roomId,//传出行元素ids元素
										function(data) {
											$.messager.alert("提示", data.result.message, "info");
											$("#stuAllWin1").window("close");
											$("#stuTable").datagrid("reload");
											$("#list").datagrid("reload");
										}
									),"json"
								}
					});
				}
			}else {
				$.messager.alert("提示", "请先选择需要删除的学生","info");
			}
		}
</script>
<script>
		//点击修改宿舍里的宿舍长框
		function showEditStuWin() {
			   var rows = $("#list").datagrid("getSelections");
			   $("#stuEditTable").datagrid("reload");
			  $("#stuEditTable").datagrid({url:'<%=path %>/stu/termIdQueryAll?str=1&termId='+rows[0].roomId + '&who='+'roomId ='});// 当点击所有学生框时再加载学生信息
			  $("#stuEditWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
			}
		//选择学生添加宿舍长
		function addConfirmStu(){
			var row = $("#stuAllTable").datagrid("getSelected");
			$("#roomInputa").textbox('setValue',row.name);
			$("#roomIda").val(row.stuId);
			$("#stuAllWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		//修改宿舍长
		function editConfirmStu(){
			var row = $("#stuEditTable").datagrid("getSelected");
			$("#roomInputa1").textbox('setValue',row.name);
			$("#roomIda1").val(row.stuId);
			$("#stuEditWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
</script>
<script>
//所有formatter
function formatterOptStatus(value, row, index){
	if (row.status == 1) {
		return "<a href='javascript:;'onclick='showStuFreeze("+ index + ");'>冻结</a>";
	}else if (row.status == 0) {
		return "<a href='javascript:;' onclick='showStuStart("+ index + ");'>启用</a>";
	}
}
//查看所有学生方法
function showAllProductWin(){
  	$('#list').datagrid({ url: '<%=path %>/room/queryAll'}); 
  }
//查看所有被冻结学生方法
function showFreezeAllWin(){
  	$('#list').datagrid({ url: '<%=path %>/room/queryFreezeAll'}); 
  }
//点击启用按钮
function showStuStart(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
				$.get("<%=path %>/room/updateFreeze?status=1&roomId=" + row.roomId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
} else {
	$.messager.alert("提示", "请先选择需要冻结的宿舍", "info");
}
}
//点击冻结学生
function showStuFreeze(index){
	var row=$('#list').datagrid('getData').rows[index];
	if (row){
		$.messager.confirm("提示", "确定冻结吗?", function (r){
			if (r) { // 点击了确定按键
				$.get("<%=path %>/room/updateFreeze?status=0&roomId=" + row.roomId, function (data) {
					$("#list").datagrid("reload");
				}, "json");
			}
		})
} else {
	$.messager.alert("提示", "请先选择需要冻结的宿舍", "info");
}
}
</script>
<script>
//模糊查询方法
function qq(value,name){
	$('#list').datagrid({ url: '<%=path %>/room/blurredAllQuery?value1='+value+'&name1='+name});
 }
</script>
</head>
<body style="height:100%;">
<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:true,
			onClickRow:showStuWin,
			collapsible:true,
			url:'<%=path %>/room/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'roomId',checkbox:true">编号</th>
		<th data-options="field:'name',width:60">宿舍名称</th>
		<th data-options="field:'stu',width:100" formatter="showName">宿舍长</th>
		<th data-options="field:'quantity',width:100">宿舍最大人数</th>
		<th data-options="field:'operation',width:70" formatter="formatterOptStatus">操作</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看所有宿舍</a>
		<a href="javascript:;" onclick="showFreezeAllWin();" class="easyui-linkbutton" iconCls="icon-search">查看冻结宿舍</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	<div data-options="name:'name'">名称</div>
	    <div data-options="name:'building'">楼栋</div>
	    <div data-options="name:'floor'">楼层</div>
	</div>

<!-- 宿舍学生div里的按钮div -->
<div id="tf" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showStuAllWin1();" class="easyui-linkbutton" iconCls="icon-add">添加学生</a>
		<a href="javascript:;" onclick="removeGradeStu();" class="easyui-linkbutton" iconCls="icon-remove">删除学生</a>
	</div>
</div>
<!-- 查看宿舍学生div -->
<div id="stuWin" class="easyui-window" title="宿舍学生" data-options="closed:true" style="width:500px;height:300px;">
	<table id="stuTable" class="easyui-datagrid"
	   data-options="toolbar:'#tf',
	   		singleSelect:false,
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

<!-- 查看宿舍学生div -->
<div id="stuEditWin" class="easyui-window" title="宿舍学生" data-options="closed:true" style="width:500px;height:300px;">
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


<!-- 添加学生div里的添加按钮div -->
<div id="ts" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="addStu();" class="easyui-linkbutton" iconCls="icon-add">确认</a>
	</div>
</div>
<!-- 显示宿舍所有学生让宿舍添加学生 -->
<div id="stuAllWin1" class="easyui-window" title="所有学生" data-options="closed:true" style="width:500px;height:300px;">
	<table id="stuAllTable1" class="easyui-datagrid"
	   data-options="toolbar:'#ts',
	   		singleSelect:false,
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

<div id="addWin" class="easyui-window" title="添加宿舍" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>名字</td>
				<td><input class="easyui-validatebox easyui-textbox" name="room.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>宿舍最大人数</td>
				<td><input class="easyui-validatebox easyui-textbox" name="room.quantity" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改宿舍" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="room.roomId" />
		<table>
				<tr>
				<td>名字</td>
				<td><input class="easyui-validatebox easyui-textbox" name="room.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>宿舍长</td><td><a href="javascript:;" onclick="showEditStuWin();">
				<input id="roomInputa1" class="easyui-textbox" name="room.stuName"/>
				<input id="roomIda1" type="hidden" name="stuId"/></a>
				</td>
			</tr>
			<tr>
				<td>宿舍最大人数</td>
				<td><input class="easyui-validatebox easyui-textbox" name="room.quantity" data-options="required:true,validType:'length[1,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
				</td>
			</tr>

		</table>
	</form>
</div>

</body>
</html>