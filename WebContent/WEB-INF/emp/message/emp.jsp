<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>宏图OA办公系统</title>
<link id="easyuiTheme" rel="stylesheet" href="<%=path%>/jquery-easyui/themes/metro/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<link rel="stylesheet" href="<%=path%>/css/site_main.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon-hamburg.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/themes/jeasyui.icons.hamburg.js"></script>
<script>
function edit() {
	alert("aaaa");
	if ($("#editForm").form("validate")) {
        $.post("<%=path %>/emp/empUpdateByid",
            $("#editForm").serialize(),
            function (data) {
                if (data.result == "success") {
                } else if (data.result == "fail") {
                	$.message.alert("提示","更新失败","info");
                }
            }, "json"
        );
    } else {
        $.messager.alert("提示", "请输入正确的表单数据", "info");
    }
}
/**
 * 打开窗口
 */
function openWin(id) {
    $("#" + id).window("open");
}
/**
 * 关闭窗口
 */
function closeWin(id) {
    $("#" + id).window("close");
}
</script>
</head>
<body>
	<table id="info" class="site_table">
		<caption>我的基本信息</caption>
		<thead>
			<tr>
				<th>名称</th>
				<th>值</th>
			</tr>
			<tr>
				<td>邮箱</td>
				<td>${requestScope.Emp.email}</td>
			</tr>
			<tr>
				<td>名字</td>
				<td>${requestScope.Emp.name}</td>
			</tr>
			<tr>
				<td>手机</td>
				<td>${requestScope.Emp.phone}</td>
			</tr>
			<tr>
				<td>地址</td>
				<td>${requestScope.Emp.address}</td>
			</tr>
			<tr>
				<td>性别</td>
				<td>${requestScope.Emp.gender }</td>
			</tr>
		</thead>
	</table>
<div>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="openWin('editWin')">修改</a>
</div>
<div class="easyui-window site_win_small input_big" id="editWin" data-options="title:'修改账号信息',resizable:false,mode:true,closed:true">
	<form id="editForm">
		<table>
			<tr>
				<td><input type="hidden" name="empId" value=${requestScope.Emp.empId }></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input type="text" name="email" class="easyui-textbox" data-options="required:true,novalidate:true"
					value="${requestScope.Emp.email}"
				/></td>
			</tr>
			<tr>
				<td>名字</td>
				<td><input type="text" name="name" class="easyui-textbox" data-options="required:true,novalidate:true"
					value="${requestScope.Emp.name}"
				/></td>
			</tr>
			<tr>
				<td>手机</td>
				<td><input type="text" name="phone" class="easyui-textbox" data-options="required:true,novalidate:true"
					value="${requestScope.Emp.phone }"
				/></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="address" class="easyui-textbox" data-options="required:true,novalidate:true"
					value="${requestScope.Emp.address }"
				/></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="text" name="gender" class="easyui-textbox" data-options="required:true,novalidate:true"
					value="${requestScope.Emp.gender}"
				/></td>
			</tr>
			<tr>
                <td><button type="button" onclick="closeWin('editWin');">取消</button></td>
                <td>
                    <button type="submit" onclick="edit();">确认</button>
                </td>
            </tr>
		</table>
	</form>
</div>
</body>
</html>