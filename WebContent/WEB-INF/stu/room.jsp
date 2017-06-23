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
			var stuRows = $('#stuAllTable1').datagrid('getData');
			if(rows.length > 0){// 获取到了元素
				// stuRows.rows.length 班级已有学生总数, rows.length 选择添加了多少个学生, gradeRow.quantity 班级学生最大数
				if(stuRows.rows.length + rows.length > roomRow.quantity+1){
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
  	$('#list').datagrid({ url: '<%=path %>/room/queryAlls'}); 
  }
//查看所有被冻结学生方法
function showFreezeAllWin(){
  	$('#list').datagrid({ url: '<%=path %>/room/queryFreezeAll'}); 
  }
//模糊查询方法
function qq(value,name){
	$('#list').datagrid({ url: '<%=path %>/room/blurredAllQuerys?value1='+value+'&name1='+name});
 }
</script>
</head>
<body style="height:100%;">
<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:true,
			onClickRow:showStuWin,
			collapsible:true,
			url:'<%=path %>/room/queryAlls',
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
		</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看所有宿舍</a>
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
</body>
</html>