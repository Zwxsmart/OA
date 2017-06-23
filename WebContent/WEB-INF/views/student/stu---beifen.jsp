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

        var jsonStr = '{"stu.stuId":"_stuId","stu.stuNo":"_stuNo",' +
			'"stu.name":"_name","stu.pwd":"_pwd","stu_cardNo":"_cardNo",'+
			'"stu.phone":"_phone","stu.qq":"_qq","stu.weChat":"_weChat",' +
			'"stu.school":"_school","stu.age":"_age","stu.birthday":"_birthday", '
			+'"stu.gender":"_gender", "stu.address":"_address","stu.nation":"_nation",' +
			'"stu.resIdence":"_resIdence","stu.gradeId":"_gradeId","stu.roomId":"_roomId",' +
			'"stu.parentName":"_parentName", "stu.parentPhone":"_praentPhone","stu.startDay":"_startDay", ' +
			'"stu.empId":"_empId", "stu.des":"_des", "stu.status":"_status","stu.stuStatus":"_stuStatus"}';
	    	
			
        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/stu/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_stuId", row.stuId).replace("_stuNo", row.stuNo).
					replace("_name", row.name).replace("_pwd", row.pwd).replace("_cardNo", row.cardNo).
					replace("_phone", row.phone).replace("_qq", row.qq).replace("_weChat", row.weChat).
					replace("_school", row.school).replace("_age", row.age).replace("_birthday", row.birthday).
					replace("_gender", row.gender).replace("_address", row.address).replace("_nation", row.nation).
					replace("_resIdence", row.resIdence).replace("_gradeId",row.gradeId).replace("_roomId",row.roomId).
					replace("_parentName",row.parentName).replace("_parentPhone",row.parentPhone).replace("_startDay",row.startDay).
					replace("_empId",row.empId).replace("_des",row.des).replace("_status",row.status).replace("_stuStatus",row.stuStatus);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
            }
        }

        function showStuDetails1(index){
    		var row = $('#list').datagrid('getData').rows[index];
    		if (row) {// 有选中行
    			if(row.stuId){
    				alert(row.stuId);
    				var jsonStr1 = jsonStr.replace("_stuId", row.stuId).replace("_stuNo", row.stuNo).
    				replace("_name", row.name).replace("_pwd", row.pwd).replace("_idCard", row.idCard).
    				replace("_phone", row.phone).replace("_qq", row.qq).replace("_weChat", row.weChat).
    				replace("_school", row.school).replace("_age", row.age).replace("_birthday", row.birthday).
    				replace("_gender", row.gender).replace("_address", row.address).replace("_nation", row.nation).
    				replace("_resIdence", row.resIdence).replace("_gradeId",row.gradeId).replace("_roomId",row.roomId).
    				replace("_parentName",row.parentName).replace("_parentPhone",row.parentPhone).replace("_startDay",row.startDay).
    				replace("_empId",row.empId).replace("_des",row.des).replace("_status",row.status).replace("_role",row.role);//获取行数据组成json, 由js/json2提供的方法
        			$("#stuDetailsForm").form("load", JSON.parse(jsonStr1))
        			$("#stuDetails").window("open");//关闭editWin窗口
    			}else {
    				qingkong();
    			}
    		}else {
    			$.messager.alert("提示", "请先选择查看的学生", "info");
    		}
    	}
    	
        
        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/stu/update",
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
                        $.get("<%=path %>/product/del?id=" + row.id, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的商品", "info");
            }
        }

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 2) {
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

        function formatterOpt2(value, row, index) {
            if (row.bank_type == 'one') {
                return "<b>中国银行</b>"
            } else if (row.bank_type == 'two') {
                return "<b>中国建设银行</b>"
            }else if (row.bank_type == 'three') {
                return "<b>邮政银行</b>"
            }else if (row.bank_type == 'four') {
                return "<b>农业银行</b>"
            }else if (row.bank_type == 'five') {
                return "<b>农商银行</b>"
            }

        }

        function formatterOpt3(value, row, index) {
            if (row.grade == 'one') {
                return "<b>一万</b>"
            } else if (row.grade == 'two') {
                return "<b>二万</b>"
            }else if (row.grade == 'three') {
                return "<b>三万</b>"
            }else if (row.grade == 'four') {
                return "<b>四万</b>"
            }else if (row.grade == 'five') {
                return "<b>五万</b>"
            }

        }

        function formatterOpt4(value, row, index) {
            if (row.gender == 'woman') {
                return "<b>女</b>"
            } else if (row.gender == 'boy') {
                return "<b>男</b>"
            }
        }


	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',onClickRow:test,
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/stu/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'stuId',checkbox:true">学生编号</th>
		<th data-options="field:'stuNo',width:100">学生学号</th>
		<th data-options="field:'name',width:80">学生姓名</th>
		<th data-options="field:'pwd',width:80">密码</th>
		<th data-options="field:'idCard',width:100">身份证号码</th>
		<th data-options="field:'phone',width:80">手机号码</th>
		<th data-options="field:'qq',width:80">学生QQ</th>
		<th data-options="field:'weChat',width:90">学生微信</th>
		<th data-options="field:'school',width:90">毕业学校</th>
		<th data-options="field:'age',width:90">学生年龄</th>
		<th data-options="field:'birthday',width:90">学生生日</th>
		<th data-options="field:'gender',width:90">学生性别</th>
		<th data-options="field:'address',width:90">家庭住址</th>
		<th data-options="field:'nation',width:90">学生籍贯</th>
		<th data-options="field:'resIdence',width:90">学生户口</th>
		<th data-options="field:'gradeId',width:80">学生班级</th>
		<th data-options="field:'roomId',width:90">学生宿舍</th>
		<th data-options="field:'parentName',width:90">家长姓名</th>
		<th data-options="field:'parentPhone',width:90">家长电话</th>
		<th data-options="field:'startDay',width:100">入学时间</th>
		<th data-options="field:'empId',width:90">招生老师</th>
		<th data-options="field:'des',width:100">学生介绍</th>
		<th data-options="field:'status',width:60">状态</th>
		<th data-options="field:'stuStatus',width:90">学生状态</th>
		<th data-options="field:'role',width:90">班干部角色</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加学生" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>学生姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.pwd" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.idCard" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.phone" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生QQ</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.qq" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生微信</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.weChat" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.school" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生年龄</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.age" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生生日</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.birthday" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生性别</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="stu.gender"><option value="boy">男</option><option value="woman">女</option></select>
				</td>
			</tr>
			<tr>
				<td>家庭住址</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.address" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生籍贯</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.nation" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生户口</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.resIdence" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生班级</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.gradeId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生宿舍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.roomId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>家长姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.parentName" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>入学时间</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.startDay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生介绍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.empId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.status" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生状态</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.stuStatus" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生班干部角色</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.role" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改学生信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="merchant.id" />
		<table>
			<tr>
				<td>学生姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.pwd" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>身份证号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.careNo" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.phone" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生QQ</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.qq" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生微信</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.weChat" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.school" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生年龄</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.age" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生生日</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.birthday" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生性别</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="stu.gender"><option value="boy">男</option><option value="woman">女</option></select>
				</td>
			</tr>
			<tr>
				<td>家庭住址</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.address" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生籍贯</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.nation" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生户口</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.resIdence" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生班级</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.gradeId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生宿舍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.roomId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>家长姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.parentName" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>入学时间</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.startDay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生介绍</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.empId" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.status" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生状态</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.stuStatus" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="stuDetails" class="easyui-dialog" title="详情" data-options="closed:true" style="width:500px;height:400px;padding:10px;">
<form id="stuDetailsForm">
	<table>
			<tr>
				<td>学生姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.pwd" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>身份证号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.careNo" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.phone" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生QQ</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.qq" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生微信</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.weChat" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.school" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生年龄</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.age" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生生日</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.birthday" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生性别</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="stu.gender"><option value="boy">男</option><option value="woman">女</option></select>
				</td>
			</tr>
			<tr>
				<td>家庭住址</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.address" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生籍贯</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.nation" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学生户口</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.residence"><option value="countryside">农村</option><option value="city">城镇</option></select></td>
			</tr>
			<tr>
				<td>学生班级</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.gradeId"><option value="intention">班级1</option><option value="predetermine">冻结</option></select>
			</tr>
			<tr>
				<td>学生宿舍</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.roomId"><option value="intention">宿舍1</option><option value="predetermine">冻结</option></select>
			</tr>
			<tr>
				<td>家长姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.parentName" /></td>
			</tr>
			<tr>
				<td>入学时间</td>
				<td><input class="easyui-datebox easyui-textbox" name="stu.startDay" /></td>
			</tr>
			<tr>
				<td>招生老师</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.empId"><option value="intention">老师1</option><option value="predetermine">老师2</option><option value="official">正式学生</option></select></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.Status"><option value="intention">可用</option><option value="predetermine">冻结</option></select></td>
			</tr>
			<tr>
				<td>学生状态</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.stuStatus"><option value="intention">意向学生</option><option value="predetermine">预定学生</option><option value="official">正式学生</option></select>
			</tr>
			</table>
		</form>
</div>


<table>
			<tr>
				<td>&nbsp;&nbsp;姓名</td>
				<td><input class="easyui-validatebox" name="stu.name" data-options="required:true,validType:'length[0,20]'"/></td>
				<td>&nbsp;&nbsp;密码</td>
				<td><input class="easyui-validatebox" name="stu.pwd" data-options="required:true,validType:'length[0,20]'"/></td>
				<td>&nbsp;&nbsp;身份证号码</td>
				<td><input class="easyui-validatebox" name="stu.idCard" data-options="validType:'length[18,20]'"/></td>
				<td>&nbsp;&nbsp;手机号码</td>
				<td><input class="easyui-validatebox" name="stu.phone" data-options="required:true,validType:'length[0,11]'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;学生QQ</td>
				<td><input class="easyui-validatebox" type="text" name="stu.qq" data-options="validType:'length[4,12]'"/></td>
				<td>&nbsp;&nbsp;学生微信</td>
				<td><input class="easyui-validatebox" name="stu.weChat" data-options="validType:'length[0,20]'"/></td>
				<td>&nbsp;&nbsp;毕业学校</td>
				<td><input class="easyui-validatebox" name="stu.school" data-options="validType:'length[0,50]'"/></td>
				<td>&nbsp;&nbsp;学生年龄</td>
				<td><input class="easyui-validatebox" name="stu.age" data-options="required:true,validType:'length[0,3]'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;学生生日</td>
				<td><input class="easyui-datebox" name="stu.birthday"/></td>
				<td>&nbsp;&nbsp;学生性别</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="stu.gender"><option value="boy">男</option><option value="woman">女</option></select>
				</td>
				<td>&nbsp;&nbsp;家庭住址</td>
				<td><input class="easyui-validatebox" name="stu.address" data-options="validType:'length[0,50]'"/></td>
				<td>&nbsp;&nbsp;学生籍贯</td>
				<td><input class="easyui-validatebox" name="stu.nation" data-options="validType:'length[0,20]'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;学生户口</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.residence"><option value="null"></option><option value="countryside">农村</option><option value="city">城镇</option></select></td>
				<td>&nbsp;&nbsp;学生班级</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.gradeId"><option value="null"></option><option value="intention">班级1</option><option value="predetermine">冻结</option></select></td>
				<td>&nbsp;&nbsp;学生宿舍</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.roomId"><option value="null"></option><option value="intention">宿舍1</option><option value="predetermine">冻结</option></select></td>
				<td>&nbsp;&nbsp;家长姓名</td>
				<td><input class="easyui-validatebox" name="stu.parentName"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;入学时间</td>
				<td><input class="easyui-datebox" name="stu.startDay"/></td>
				<td>&nbsp;&nbsp;招生老师</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.empId"><option value="null"></option><option value="intention">老师1</option><option value="predetermine">老师2</option><option value="official">正式学生</option></select></td>
				<td>&nbsp;&nbsp;状态</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.status"><option value="null"></option><option value="intention">可用</option><option value="predetermine">冻结</option></select></td>
				<td>&nbsp;&nbsp;学生状态</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.stuStatus"><option value="null"></option><option value="intention">意向学生</option><option value="predetermine">预定学生</option><option value="official">正式学生</option></select></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;班干部</td>
				<td><select style="width:100px;" class="easyui-combobox" name="stu.role"><option value="null"></option><option value="monitor">班长</option><option value="studies">学习委员</option>
				<option value="sports">体育委员</option><option value="life">生活委员</option><option value="discipline">纪律委员</option></select>
				</td>
				<td>&nbsp;&nbsp;家长手机</td>
				<td><input class="easyui-validatebox" name="stu.parentPhone"/></td>
			</tr>
		</table>
		
		
		
</body>
</html>