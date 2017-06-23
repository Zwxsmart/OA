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
        	
			'"emp.name":"_name","emp.pwd":"_pwd","emp.idCard":"_idCard",'+
			
			'"emp.nation":"_nation","emp.gender":"_gender","emp.fingerNo":"_fingerNo",' +
			
			'"emp.birthDay":"_birthDay","emp.email":"_email","emp.phone":"_phone", '+
			
			'"emp.qq":"_qq", "emp.weChat":"_weChat","emp.address":"_address","emp.married":"_married",' +
			
			'"emp.contactName":"_contactName","emp.contactPhone":"_contactPhone","emp.college":"_college",' +
			
			'"emp.major":"_major","emp.eduback":"_eduback","emp.bankName":"_bankName","emp.accountName":"_accountName",' +
			
			'"emp.accountNo":"_accountNo", "emp.alipay":"_alipay","emp.hireDay":"_hireDay","emp.resignDay":"_resignDay",'+
			
			'"emp.status":"_status", "emp.deptName":"_deptName", "emp.roleName":"_roleName", "emp.roleId":"_roleId"}';
	    	
        
        $(function() {
        	<%
			request.setAttribute("height", "60%");
			%>
        	document.getElementById("empDetails").style.display="none";//启动隐藏详情div
            setPagination("list");
        });

        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
        function formatterOptGender(value, row, index) {
		    if (row.gender == 'girl') {
		        return "<b>女</b>"
		    } else if (row.gender == 'boy') {
		        return "<b>男</b>"
		    }
		}
        
        function formatterOptMarried(value, row, index) {
		    if (row.married == 'yes') {
		        return "<b>是</b>"
		    } else if (row.married == 'no') {
		        return "<b>否</b>"
		    }
		}
        
        
        function formatterOpt1(value, row, index) {
        	if (row.status == 0) {
        		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='disable("+index+");'>禁用</a>"
        	}
        }
        
        
        function formatterOpt3(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/emp/empDisable?id=" + row.empId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/emp/empActivate?id=" + row.empId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
    	}
    	
    	//模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path %>/emp/blurredAllQuery?value1='+value+'&name1='+name});
         }
     	 
     	//时间段查询
        function findPositions(){
    		var beginTime=$("#startDatetime").datetimebox("getValue");
    		var endTime=$("#endDatetime").datetimebox("getValue");
    		$('#list').datagrid({ url: '<%=path %>/emp/serachTime?beginTime='+beginTime+'&endTime='+endTime});
    	}
		
		 function showAllProductWin(){
	        	$('#list').datagrid({ url: '<%=path %>/emp/queryAll'}); 
	     }

</script>
	
<script>
		//添加栏位方法
	    function showLan(){
			var empIndex = $('#list').datagrid("getRows").length +1
			$("#list").datagrid("insertRow", {
     		   index: empIndex,
     	  		 row: {"emp.empId":"","emp.depId":"","emp.name":"","emp.pwd":"","emp.idCard":"","emp.nation":"","emp.gender":"","emp.fingerNo":"","emp.birthDay":"","emp.email":"","emp.phone":"","emp.qq":"","emp.weChat":"","emp.address":"","emp.married":"","emp.contactName":"","emp.contactPhone":"","emp.college":"","emp.major":"","emp.eduback":"","emp.bankName":"","emp.accountName":"","emp.accountNo":"", "emp.alipay":"","emp.hireDay":"","emp.resignDay":"","emp.status":"", "emp.deptName":"", "emp.roleName":"", "emp.roleId":""}
    		});
		} 
		//用户点击栏位详情div拿数据
		 function showEmpDetails() {
			 var rows = $("#list").datagrid("getSelections");
	            if (rows.length > 1) {
	                $.messager.alert("提示", "请先选择一个需要修改的员工", "info");
	            } else if (rows.length == 1) {
	                var row = rows[0];
	                if (row) { // 有选中的行
	                	if(row.empId){// 假如员工id有, 则拿选中行中所有数据
	                    	var jsonStr1 = jsonStr.replace("_empId", row.empId).replace("_depId", row.depId).
							replace("_name", row.name).replace("_pwd", row.pwd).replace("_idCard", row.idCard).
							replace("_nation", row.nation).replace("_gender", row.gender).replace("_fingerNo", row.fingerNo).
							replace("_birthDay", row.birthDay).replace("_email", row.email).replace("_phone", row.phone).
							replace("_qq", row.qq).replace("_weChat", row.weChat).replace("_address", row.address).
							replace("_married", row.married).replace("_contactName",row.contactName).replace("_contactPhone",row.contactPhone).
							replace("_college",row.college).replace("_major",row.major).replace("_eduback",row.eduback).replace("_bankName",row.bankName).
							replace("_accountName",row.accountName).replace("_accountNo",row.accountNo).replace("_alipay",row.alipay).replace("_hireDay",row.hireDay).
							replace("_resignDay",row.resignDay).replace("_status",row.status).replace("_deptName",row.deptName).replace("_roleName",row.roleName).replace("_roleId",row.roleId);
	                   		$("#empDetailsForm").form("load", JSON.parse(jsonStr1));
	                		$("#room1").val(row.depId);
	                		$("#role1").val(row.roleId);
	                   	  	document.getElementById("empDetails").style.display="";// 显示隐藏窗口
	                   	  	
	              		  }else{
	              			  	// 否则学生id没有, 代表用户是新增栏位, 则清除此div所有数据
		                		document.getElementById("empDetails").style.display="";// 显示隐藏窗口
		                		qingkong();
		                	}
		                }
	            } else if (rows.length == 0) {
	                $.messager.alert("提示", "请先选择一个需要修改的员工", "info");
	            }
	        }
		
		
		// 用户在详情栏点击保存按钮
		function saveEmpDetails() {
			var rows = $("#list").datagrid("getSelections");// 获取表格中选中行的数据
			  if (rows.length > 1) {
		          $.messager.alert("提示", "请先选择一个员工进行操作", "info");
		      } else if (rows.length == 1) {// 假如选中了行
		          var row = rows[0];
		          if (row) { // 有选中的行
		        	  if(row.empId){// 如果这行数据有学生id, 则进行修改信息操作
		        		  if ($("#empDetailsForm").form("validate")) {
		        	             $.post("<%=path %>/emp/update",
		        	                 $("#empDetailsForm").serialize(),
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
		        		  if ($("#empDetailsForm").form("validate")) {
		                      $.post("<%=path %>/emp/save",
		                          $("#empDetailsForm").serialize(),
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
			$('#empDetailsTable').form('clear');
		}
	</script>
	
	<script>
	
	//部门修改
	function showRoomAll1(){
		 $("#roomDiv1").form("clear"); // 清除表单里的所有数据
		 $("#roomDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#roomTable1").datagrid({url:'<%=path %>/dept/queryAll'});// 当点击部门框时再加载宿舍信息
	}
	
	function getRoom1(){
		var rows = $("#roomTable1").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#roomInput1").textbox('setValue',rows[0].name);
		 $("#room1").val(rows[0].depId);
		 $("#roomDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}

	//职位修改
	
	function showRoleAll1(){
		 $("#roleDiv1").form("clear"); // 清除表单里的所有数据
		 $("#roleDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#roleTable1").datagrid({url:'<%=path %>/role/queryAll'});// 当点击部门框时再加载宿舍信息
	}
	function getRole1(){
		var rows = $("#roleTable1").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#roleInput1").textbox('setValue',rows[0].name);
		 $("#role1").val(rows[0].roleId);
		 $("#roleDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	
</script>
<script>
	// 表格行编辑
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true}
			if ($('#list').datagrid('validateRow', editIndex)){
				var ed = $('#list').datagrid('getEditor', {index:editIndex,field:'empId'});
				
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		// 选中行编辑方法
		function onClickRow(index){
			if (editIndex != index){
				if (endEditing()){
					$('#list').datagrid('selectRow', index)
							.datagrid('beginEdit', index);
					editIndex = index;
				} else {
					$('#list').datagrid('selectRow', editIndex);
				}
			}
		}
</script>

</head>
<body style="height:${request.height}">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
	   		onClickRow:showEmpDetails,
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/emp/empMessage',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'empId',checkbox:true">员工编号</th>
		<th data-options="field:'name',width:80,align:'center',editor:{type:'text'}">员工姓名</th>
		<th data-options="field:'roleName',width:80">职位</th>
		<th data-options="field:'deptName',width:80">部门</th>
		<th data-options="field:'idCard',width:120,align:'center',editor:{type:'text'}">身份证号码</th>
		<th data-options="field:'gender',width:35" formatter="formatterOptGender">性别</th>
		<th data-options="field:'email',width:90,align:'center',editor:{type:'text'}">员工邮箱</th>
		<th data-options="field:'phone',width:90">手机号码</th>
		<th data-options="field:'hireDay',width:125">入职时间</th>
		<th data-options="field:'resignDay',width:125">离职时间</th>
		<th data-options="field:'aaa',width:60" formatter="formatterOpt">状态</th>
		<th data-options="field:'bbb',width:60" formatter="formatterOpt1">操作</th>
	</tr>
	</thead>
</table>

<div id="empDetails">
<!-- 学生详情div -->
	<div style="padding-left:10px;">
		<a href="javascript:;" onclick="saveEmpDetails();" class="easyui-linkbutton" iconCls="icon-add">保存</a>
		<a href="javascript:;" onclick="qingkong();" class="easyui-linkbutton">清空</a>
		${request.height} 
	</div>
<form name="form1" id="empDetailsForm">
	<input type="hidden" name="emp.empId"/>
		<table id="empDetailsTable">
			<tr>
				<td>&nbsp;&nbsp;姓名</td>
				<td><input class="easyui-textbox" name="emp.name" data-options="required:true,validType:'length[2,20]'"/></td>
				<td>&nbsp;&nbsp;部门</td>
				<td>
					<a href="javascript:;" onclick="showRoomAll1();">
						<input id="roomInput1" class="easyui-textbox" name="emp.deptName"/>
						<input type="hidden" id="room1" name="emp.depId"/>
					</a>
				</td>
				<td>&nbsp;&nbsp;职位</td>
				<td>
					<a href="javascript:;" onclick="showRoleAll1();">
						<input id="roleInput1" class="easyui-textbox" name="emp.roleName"/>
						<input type="hidden" id="role1" name="emp.roleId"/>
					</a>
				</td>
				<td>&nbsp;&nbsp;密码</td>
				<td><input type="password" class="easyui-validatebox easyui-textbox" name="emp.pwd" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;身份证号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.idCard" data-options="required:true,validType:'length[0,18]'"/></td>
				<td>&nbsp;&nbsp;籍贯</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.nation" data-options="required:true"/></td>
				<td>&nbsp;&nbsp;性别</td>
				<td>
					<select style="width:175px;" class="easyui-combobox" name="emp.gender"><option value="boy">男</option><option value="girl">女</option></select>
				</td>
				<td>&nbsp;&nbsp;指纹编号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.fingerNo" data-options="required:true,validType:'length[4,11]'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;生日</td>
				<td><input class="easyui-datetimebox" name="emp.birthDay"></td>
				<td>&nbsp;&nbsp;邮箱</td>
				<td><input class="easyui-validatebox textbox" name="emp.email" data-options="required:true,validType:'email'"></td>
				<td>&nbsp;&nbsp;手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.phone" data-options="required:true,validType:'length[0,11]'"/></td>
				<td>&nbsp;&nbsp;QQ</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.qq" data-options="required:true,validType:'length[4,11]'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;微信</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.weChat" data-options="required:true,validType:'length[1,20]'"/></td>
				<td>&nbsp;&nbsp;家庭地址</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.address" data-options="required:true"/></td>
				<td>&nbsp;&nbsp;是否结婚</td>
				<td>
					<select style="width:175px;" class="easyui-combobox" name="emp.married"><option value="yes">是</option><option value="no">否</option></select>
				</td>
				<td>联系人姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.contactName" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>联系人手机号码</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.contactPhone" data-options="required:true,validType:'length[4,11]'"/></td>
				<td>&nbsp;&nbsp;毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.college" data-options="required:true"/></td>
				<td>&nbsp;&nbsp;专业</td>
				<td>
					<select class="easyui-combobox" name="emp.major" style="width:175px;">
						<option value="教师">教师</option>
						<option value="医生">医生</option>
						<option value="会计">会计</option>
						<option value="编程">编程</option>
						<option value="计算机">计算机</option>
					</select>
				</td>
				<td>&nbsp;&nbsp;学历</td>
				<td>
					<select class="easyui-combobox" name="emp.eduback" style="width:175px;">
						<option value="硕士">硕士</option>
						<option value="大专">大专</option>
						<option value="中专">中专</option>
						<option value="专科">专科</option>
						<option value="本科">本科</option>
						<option value="高中">高中</option>
						<option value="初中">初中</option>
						<option value="小学">小学</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>&nbsp;开户行名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.bankName" data-options="required:true"/></td>
				<td>&nbsp;银行卡姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.accountName" data-options="required:true"/></td>
				<td>&nbsp;银行卡账号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.accountNo" data-options="required:true,validType:'length[4,11]'"/></td>
				<td>&nbsp;支付宝账号</td>
				<td><input class="easyui-validatebox easyui-textbox" name="emp.alipay" data-options="required:true,validType:'length[4,11]'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;入职时间</td>
				<td><input class="easyui-datebox" name="emp.hireDay"></td>
				<td>&nbsp;&nbsp;离职时间</td>
				<td><input class="easyui-datebox" name="emp.resignDay"></td>
				<td>&nbsp;&nbsp;状态</td>
				<td>
					<select style="width:80px;" class="easyui-combobox" name="emp.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="roomDiv1" class="easyui-window" title="所有部门" data-options="closed:true" style="width:500px;height:300px;">
	<table id="roomTable1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getRoom1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'depId',checkbox:true">编号</th>
			<th data-options="field:'name',width:60">姓名</th>
			<th data-options="field:'des',width:100">介绍</th>
		</tr>
	</thead>
</table>
</div>

<div id="roleDiv1" class="easyui-window" title="所有角色" data-options="closed:true" style="width:500px;height:300px;">
	<table id="roleTable1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getRole1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'roleId',checkbox:true">编号</th>
			<th data-options="field:'name',width:60">姓名</th>
			<th data-options="field:'des',width:100">介绍</th>
		</tr>
	</thead>
</table>
</div>

</body>
</html>