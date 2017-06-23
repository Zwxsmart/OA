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
 /**
 *	
 */
 function termSerach(e){
     var name=e.getAttribute("data-name");
     $('#list').datagrid({ url: '<%=path %>/course/termSerach?term='+name+''});
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
		<th data-options="field:'courseOrder',width:100,sortable: true">课程顺序</th>
		<th data-options="field:'des',width:100">描述信息</th>
		<th data-options="field:'status',width:100" formatter="formatterOpt">课程状态</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
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


</body>
</html>