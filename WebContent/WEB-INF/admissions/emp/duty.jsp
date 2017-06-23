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
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/default/easyui.css" />
	<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
	<link rel="stylesheet" href="<%=path%>/css/main.css" />
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
	<script type="text/javascript" src="<%=path%>/js/main.js"></script>

	<script>


        $(function() {
            setPagination("list");
        });

        
        // 员工1
         function formatterEmp1(value) {
       		return value.name;
        }
     	// 员工2
		 function formatterEmp2(value, row, index) {
        	return value.name;
        }
     	// 员工3
        function formatterEmp3(value, row, index) {
        	return value.name;
        }
     	
      	//模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path %>/duty/blurredAllQuery?value1='+value+'&name1='+name});
         }
     	 
    	 // 查询全部
        function showAllProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/duty/queryAll'}); 
     	}

	</script>
	
	

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/duty/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'dutyId',checkbox:true">值班编号</th>
		<th data-options="field:'weekDay',width:80">值班日期</th>
		<th data-options="field:'emp1',width:80" formatter="formatterEmp1">员工1</th>
		<th data-options="field:'add1',width:80">地点1</th>
		<th data-options="field:'emp2',width:80" formatter="formatterEmp2">员工2</th>
		<th data-options="field:'add2',width:80">地点2</th>
		<th data-options="field:'emp3',width:80" formatter="formatterEmp3">员工3</th>
		<th data-options="field:'add3',width:80">地点3</th>
		<th data-options="field:'empId4',width:80">员工4</th>
		<th data-options="field:'add4',width:80">地点4</th>
		<th data-options="field:'empId5',width:80">员工5</th>
		<th data-options="field:'add5',width:80">地点5</th>
		<th data-options="field:'empId6',width:80">员工6</th>
		<th data-options="field:'add6',width:80">地点6</th>
		<th data-options="field:'empId7',width:80">员工7</th>
		<th data-options="field:'add7',width:80">地点7</th>
		<th data-options="field:'empId8',width:80">员工8</th>
		<th data-options="field:'add8',width:80">地点8</th>
		
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
		<div data-options="name:'empp'">员工</div>
	</div>

</body>
</html>