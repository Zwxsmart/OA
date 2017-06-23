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

        var jsonStr = '{"emp.empId":"_empId","emp.depId":"_depId",' +
			'"emp.name":"_name","emp.pwd":"_pwd","emp_idCard":"_idCard",'+
			'"emp.nation":"_nation","emp.gender":"_gender","emp.fingerNo":"_fingerNo",' +
			'"emp.birthday":"_birthday","emp.email":"_email","emp.phone":"_phone", '
			+'"emp.qq":"_qq", "emp.weChat":"_weChat","emp.address":"_address","emp.married":"_married"' +
			'"emp.contactName":"_contactName","emp.contactPhone":"_contactPhone","emp.college":"_college",' +
			'"emp.major":"_major","emp.eduback":"_eduback","emp.backName":"_backName","emp.accountName":"_accountName",' +
			'"emp.accountNo":"_accountNo", "emp.alipay":"_alipay","emp.hireDay":"_hireDay","emp.resignDay":"_resignDay"'+
			'"emp.status":"_status"}';
	    	
			
        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/emp/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的员工", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    var jsonStr1 = jsonStr.replace("_empId", row.empId).replace("_depId", row.depId).
					replace("_name", row.name).replace("_pwd", row.pwd).replace("_idCard", row.idCard).
					replace("_nation", row.nation).replace("_gender", row.gender).replace("_fingerNo", row.fingerNo).
					replace("_birthday", row.birthday).replace("_email", row.email).replace("_phone", row.phone).
					replace("_qq", row.qq).replace("_weChat", row.weChat).replace("_address", row.address).
					replace("_married", row.married).replace("_contactName",row.contactName).replace("_contactPhone",row.contactPhone).
					replace("_college",row.college).replace("_major",row.major).replace("_eduback",row.eduback).replace("_bankName",row.bankName).
					replace("_accountName",row.accountName).replace("_accountNo",row.accountNo).replace("_alipay",row.alipay).replace("_hireDay",row.hireDay).
					replace("_resignDay",row.resignDay).replace("_status",row.status);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的员工", "info");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/emp/update",
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
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/emp/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'stuId',checkbox:true">员工编号</th>
		<th data-options="field:'depId',width:100">部门编号</th>
		<th data-options="field:'name',width:80">员工姓名</th>
		<th data-options="field:'pwd',width:80">密码</th>
		<th data-options="field:'idCard',width:100">身份证号码</th>
		<th data-options="field:'nation',width:90">籍贯</th>
		<th data-options="field:'gender',width:90">员工性别</th>
		<th data-options="field:'fingerNo',width:90">指纹编号</th>
		<th data-options="field:'birthDay',width:90">员工生日</th>
		<th data-options="field:'email',width:90">员工邮箱</th>
		<th data-options="field:'phone',width:80">手机号码</th>
		<th data-options="field:'qq',width:80">员工QQ</th>
		<th data-options="field:'weChat',width:90">员工微信</th>
		<th data-options="field:'address',width:90">家庭住址</th>
		<th data-options="field:'married',width:90">是否结婚</th>
		<th data-options="field:'contactName',width:100">联系人姓名</th>
		<th data-options="field:'contactPhone',width:110">联系人手机号码</th>
		<th data-options="field:'college',width:90">毕业学校</th>
		<th data-options="field:'major',width:90">专业</th>
		<th data-options="field:'eduback',width:90">学历</th>
		<th data-options="field:'bankName',width:110">开户行名称</th>
		<th data-options="field:'accountName',width:100">银行卡姓名</th>
		<th data-options="field:'accountNo',width:90">银行卡账号</th>
		<th data-options="field:'alipay',width:90">支付宝账号</th>
		<th data-options="field:'hireDay',width:90">入职时间</th>
		<th data-options="field:'resignDay',width:90">离职时间</th>
		<th data-options="field:'status',width:60">员工状态</th>
		
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加员工" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td>员工姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.pwd" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.idCard" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>籍贯</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.nation" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工性别</td>
				<td><select style="width:100px;" class="easyui-combobox" name="emp.gender"><option value="boy">男</option><option value="woman">女</option></select></td>
			</tr>
			<tr>
				<td>指纹编号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.fingerNo" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工生日</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.birthday" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工邮箱</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.email" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.phone" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工QQ</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.qq" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工微信</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.weChat" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>家庭地址</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.address" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>是否结婚</td>
				<td><select style="width:100px;" class="easyui-combobox" name="student.gender"><option value="yes">是</option><option value="no">否</option></select></td>
			</tr>
			<tr>
				<td>联系人姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.contactName" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>联系人手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.contactNo" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.college" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>专业</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.major" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学历</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.eduback" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>开户行名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.bankName" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>银行卡姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.accountName" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>银行卡账号</td>
			<td><input class="easyui-validatebox easyui-textbox" name="emp.accountNo" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>支付宝账号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.alipay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>入职时间</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.hireDay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>离职时间</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.resignDay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工状态</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.status" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改员工信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="merchant.id" />
		<table>
			<tr>
				<td>员工姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.pwd" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.idCard" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>籍贯</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.nation" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工性别</td>
				<td><select style="width:100px;" class="easyui-combobox" name="emp.gender"><option value="boy">男</option><option value="woman">女</option></select></td>
			</tr>
			<tr>
				<td>指纹编号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.fingerNo" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工生日</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.birthday" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工邮箱</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.email" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.phone" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工QQ</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.qq" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工微信</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.weChat" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>家庭地址</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.address" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>是否结婚</td>
				<td><select style="width:100px;" class="easyui-combobox" name="student.gender"><option value="yes">是</option><option value="no">否</option></select></td>
			</tr>
			<tr>
				<td>联系人姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.contactName" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>联系人手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.contactNo" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.college" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>专业</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.major" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>学历</td>
				<td><select style="width:100px;" class="easyui-combobox" name="emp.eduback"><option value="boy">男</option><option value="woman">女</option></select></td>
			</tr>
			<tr>
				<td>开户行名称</td>
				<td><select style="width:100px;" class="easyui-combobox" name="emp.bankName"><option value="boy">男</option><option value="woman">女</option></select></td>
			</tr>
			<tr>
				<td>银行卡姓名</td>
				<td><select style="width:100px;" class="easyui-combobox" name="emp.accountName"><option value="boy">男</option><option value="woman">女</option></select></td>
			</tr>
			<tr>
				<td>银行卡账号</td>
				<td><select style="width:100px;" class="easyui-combobox" name="emp.accountNo"><option value="boy">男</option><option value="woman">女</option></select></td>
			</tr>
			<tr>
				<td>支付宝账号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.alipay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>入职时间</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.hireDay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>离职时间</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.resignDay" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>员工状态</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.status" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>