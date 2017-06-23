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
	<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/metro/easyui.css" />
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
	<link rel="stylesheet" href="<%=path%>/css/main.css" />
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
	<script type="text/javascript" src="<%=path%>/js/main.js"></script>

	<script>
		var jsonStr = '{"notice.noticeId":"_noticeId","notice.name":"_name","notice.des":"_des","notice.typeId":"_typeId","notice.noticeType":"_noticeTypeName","notice.noticeDay":"_noticeDay","notice.empId":"_empId","notice.emps":"_empsName","notice.status":"_status"}';
		
		
		
		//分页
		$(function(){
			setPagination("list");	//分页
		});
		
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
		
		//添加公告类型
		  function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
           authority('com.cs.action.NoticeAction.save', "", "save");
        }
		//添加信息
		function addProduct(){
			if ($("#addForm").form("validate")) {
                $.post("<%=path %>/notice/save",
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
		//编辑公告类型
		function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/notice/update",
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
		
		function showEditProductWin(){
			var rows = $("#list").datagrid("getSelections");//获取数据表格选中的数据
			
			if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的商品", "info");
            } else if (rows.length == 1) {//如果选中的行数等于1
                var row = rows[0];
                if (row) { // 有选中的行
                	<!--alert("选中一行有值得数据"+row.noticeId);-->
            		var jsonStr1 = jsonStr.replace("_noticeId", row.noticeId).replace("_name", row.name).replace("_des", row.des).
            		replace("_typeId", row.typeId).replace("_noticeTypeName", row.noticeType.name).
            		replace("_noticeDay", row.noticeDay).replace("_empId", row.empId).replace("_empsName",row.emps.name).replace("_status",row.status);
                    authority('com.cs.action.NoticeAction.update', jsonStr1, "update");
            	//	$("#editForm").form("load", JSON.parse(jsonStr1));
                  // $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的商品", "info");
            }
			$("#noticeTypeNameInput").textbox('setValue',rows[0].noticeType.name);
			$("#empNameInput").textbox('setValue',rows[0].emps.name);
		}
	
		
		 
        //给物品类型赋值
        function formatterOpt2(value) {
        	return value.name;
        }
        //给发件人赋值
        function formatterOpt3(value) {
        	return value.name;
        }
		
	</script>
	
	<script>
		//添加公告类型
		function showNoticeTypeAll(){
			 $("#noticeTypeDiv").form("clear"); // 清除表单里的所有数据
			 $("#noticeTypeDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#noticeTypeTable").datagrid({url:'<%=path %>/noticeType/queryAll'});// 当点击部门框时再加载部门信息
		}
		function getNoticeType(){
			var rows = $("#noticeTypeTable").datagrid("getSelections");// 获取表格中选中行的数据
			$("#noticeTypeInput").textbox('setValue',rows[0].name);
			$("#noticeType").textbox('setValue',rows[0].noticeTypeId);
			$("#noticeTypeDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		//修改公告类型
		function showNoticeTypeAll1(){
			 $("#noticeTypeDiv1").form("clear"); // 清除表单里的所有数据
			 $("#noticeTypeDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#noticeTypeTable1").datagrid({url:'<%=path %>/noticeType/queryAll'});// 当点击部门框时再加载宿舍信息
		}
		function getNoticeType1(){
			var rows = $("#noticeTypeTable1").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#noticeTypeNameInput").textbox('setValue',rows[0].name);
			 $("#noticeType1").textbox('setValue',rows[0].noticeTypeId);
			 $("#noticeTypeDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		
		//添加员工
		function showEmpAll(){
			 $("#empDiv").form("clear"); // 清除表单里的所有数据
			 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
		}
		function getEmp(){
			var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empInput").textbox('setValue',rows[0].name);
			 $("#emp").textbox('setValue',rows[0].empId);
			 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		//修改员工
		function showEmpAll1(){
			 $("#empDiv1").form("clear"); // 清除表单里的所有数据
			 $("#empDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#empTable1").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
		}
		function getEmp1(){
			var rows = $("#empTable1").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empNameInput").textbox('setValue',rows[0].name);
			 $("#emp1").textbox('setValue',rows[0].empId);
			 $("#empDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		
		 function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
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
    			$.post("<%=path %>/notice/noticeDisable?id=" + row.noticeId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	} 
    		
    	function activate(index) {  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/notice/noticeActivate?id=" + row.noticeId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
    	} 
		
		//根据名字查询
		function doSearch(value,name){
		 $('#list').datagrid({ url: '<%=path %>/notice/bulurredAllQuery?value1='+value+'&name1='+name});
		}
		
		//查询全部
		function showAllProductWin(){
	        	$('#list').datagrid({ url: '<%=path %>/notice/queryAll'}); 
	     }
		
		
	</script>
</head>
<body style="height:100%;">
<!-- toolbar:工具栏 -->
<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/notice/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>							
				<th data-options="field:'noticeId',checkbox:true">公告编号</th>
				<th data-options="field:'name',width:80">名称</th>
				<th data-options="field:'des',width:80">描述</th>
				<th data-options="field:'noticeType',width:80" formatter="formatterOpt2">公告类型</th>
				<th data-options="field:'noticeDay',width:125">发布时间</th>
				<th data-options="field:'emps',width:80" formatter="formatterOpt3">发布人</th>
				<th data-options="field:'status',width:60" formatter="formatterOpt">状态</th>
				<th data-options="field:'bbb',width:60" formatter="formatterOpt1">操作</th> 
				
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<input id="ss" class="easyui-searchbox" data-options="prompt:'请输入搜索条件',menu:'#mm',searcher:doSearch" style="width:300px;"></input>
		<!-- 组合搜索框div -->
			<div id="mm" style="width:120px;">
			    <div data-options="name:'name'">名称</div>
			   	<div data-options="name:'noticeTypeName'">公告类型</div>
			   	<div data-options="name:'empsName'">发布人</div>
			    
			</div>
		</div>
	</div>
	
	<!-- 添加公告信息 -->
<div id="addWin" class="easyui-window" title="添加公告信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>公告标题</td>
				<td><input class="easyui-validatebox easyui-textbox" name="notice.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>公告详情</td>
				<td><input class="easyui-validatebox easyui-textbox" name="notice.des" data-options="required:true,validType:'length[2,500]'"/></td>
			</tr>
			<tr>
				<td>公告类型</td>
				<td>
					<a href="javascript:;" onclick="showNoticeTypeAll();">
						<input id="noticeTypeInput" class="easyui-validatebox easyui-textbox"/>
						<input type="hidden" id="noticeType" class="easyui-textbox" name="typeId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>发布时间</td>
				<td><input class="easyui-datebox easyui-textbox" name="notice.noticeDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>发布人</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll();">
						<input id="empInput" class="easyui-validatebox easyui-textbox"/>
						<input type="hidden" id="emp" class="easyui-textbox" name="empId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 编辑公告信息 -->	
<div id="editWin" class="easyui-window" title="编辑公告信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="notice.noticeId">
		<table>
			<tr>
				<td>公告标题</td>
				<td><input class="easyui-validatebox easyui-textbox" name="notice.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>公告详情</td>
				<td><input class="easyui-validatebox easyui-textbox" name="notice.des" data-options="required:true,validType:'length[2,500]'"/></td>
			</tr>
			<tr>
				<td>公告类型</td>
				<td>
					<a href="javascript:;" onclick="showNoticeTypeAll1();">
						<input id="noticeTypeNameInput" class="easyui-validatebox easyui-textbox" name="notice.noticeTypeName"/>
						<input type="hidden" id="noticeType1" class="easyui-textbox" name="typeId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>发布时间</td>
				<td><input class="easyui-datebox easyui-textbox" name="notice.noticeDay"/></td>
			</tr>
			<tr>
				<td>发布人</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll1();">
						<input id="empNameInput" class="easyui-validatebox easyui-textbox" name="notice.empsName"/>
						<input type="hidden" id="emp1" class="easyui-textbox" name="empId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>状态</td>
					<td>
						<select style="width:100px;" class="easyui-combobox" name="notice.status"><option value="1">启用</option></select>
					</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 公告类型的添加与删除 -->
<div id="noticeTypeDiv" class="easyui-window" title="公告类型" data-options="closed:true" style="width:500px;height:300px;">
	<table id="noticeTypeTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getNoticeType,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'noticeTypeId',checkbox:true">公告类型编号</th>
			<th data-options="field:'name',width:60">公告名称</th>
			<th data-options="field:'des',width:100">公告描述</th>
		</tr>
	</thead>
</table>
</div>


<div id="noticeTypeDiv1" class="easyui-window" title="公告类型" data-options="closed:true" style="width:500px;height:300px;">
	<table id="noticeTypeTable1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getNoticeType1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'noticeTypeId',checkbox:true">公告类型编号</th>
			<th data-options="field:'name',width:60">公告名称</th>
			<th data-options="field:'des',width:100">公告描述</th>
		</tr>
	</thead>
</table>
</div>
	
<!-- 员工 -->
<div id="empDiv" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getEmp,
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

<div id="empDiv1" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="empTable1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getEmp1,
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

</body>
</html>