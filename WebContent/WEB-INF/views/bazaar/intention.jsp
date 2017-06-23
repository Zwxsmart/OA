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
		+'"stu.gender":"_gender", "stu.saveress":"_saveress","stu.nation":"_nation",' +
		'"stu.resIdence":"_resIdence","stu.gradeId":"_gradeId","stu.roomId":"_roomId",' +
		'"stu.parentName":"_parentName", "stu.parentPhone":"_praentPhone","stu.startDay":"_startDay", ' +
		'"stu.empId":"_empId", "stu.des":"_des", "stu.status":"_status","stu.stuStatus":"_stuStatus"}';
   	
        $(function() {
            setPagination("list");
        });

        function authority(methodName, str, method) {
    		$.get("<%=path %>/auth/authority?methodName=" + methodName,
    			function(data) {
    				if (data.result.result == "success") {
    					if (method == "save") {
    						$("#saveWin").window("open"); // 打开窗口
    					} else if (method == "update") {
    						$("#editForm").form("load", JSON.parse(str)); // 把JSON对象row的值自动赋值给form表单
    						$("#editWin").window("open"); // 打开编辑的窗口
    					}
    				} else if (data.result.result == "fail") {
    					$.messager.alert("提示", data.result.message, "info");
    				}
    			}, "json");
    	}
        
        function showAddProductWin() {
            $("#saveForm").form("clear"); // 清除表单里的所有数据
            authority('com.cs.action.StuIntentionAction.save', "", "save");
            
        }

        function saveProduct() {
            if ($("#saveForm").form("validate")) {
                $.post("<%=path %>/intention/save",
                    $("#saveForm").serialize(),
                    function (data) {
                        if (data.result.result == "success") {
                            $("#saveWin").window("close"); // 关闭指定的窗口
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
                $.messager.alert("提示", "请先选择一个需要修改的信息", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                   var jsonStr1 = jsonStr.replace("_stuId", row.stuId).replace("_stuNo", row.stuNo).
					replace("_name", row.name).replace("_pwd", row.pwd).replace("_cardNo", row.cardNo).
					replace("_phone", row.phone).replace("_qq", row.qq).replace("_weChat", row.weChat).
					replace("_school", row.school).replace("_age", row.age).replace("_birthday", row.birthday).
					replace("_gender", row.gender).replace("_saveress", row.saveress).replace("_nation", row.nation).
					replace("_resIdence", row.resIdence).replace("_gradeId",row.gradeId).replace("_roomId",row.roomId).
					replace("_parentName",row.parentName).replace("_parentPhone",row.parentPhone).replace("_startDay",row.startDay).
					replace("_empId",row.empId).replace("_des",row.des).replace("_status",row.status).replace("_stuStatus",row.stuStatus);
                   authority('com.cs.action.StuIntentionAction.update', jsonStr1, "update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的信息", "info");
            }
        }

        function showEditProductWin1(index) {
            var row = $('#list').datagrid('getData').rows[index];
            
            if (row) { // 有选中的行
                // var jsonStr = '{"sAdmin.id":"' + row.id + '","sAdmin.email":"' + row.email +'","sAdmin.name":"' + row.name +'","sAdmin.des":"' + row.des +'"}';
                 var jsonStr1 = jsonStr.replace("_stuId", row.stuId).replace("_stuNo", row.stuNo).
					replace("_name", row.name).replace("_pwd", row.pwd).replace("_cardNo", row.cardNo).
					replace("_phone", row.phone).replace("_qq", row.qq).replace("_weChat", row.weChat).
					replace("_school", row.school).replace("_age", row.age).replace("_birthday", row.birthday).
					replace("_gender", row.gender).replace("_saveress", row.saveress).replace("_nation", row.nation).
					replace("_resIdence", row.resIdence).replace("_gradeId",row.gradeId).replace("_roomId",row.roomId).
					replace("_parentName",row.parentName).replace("_parentPhone",row.parentPhone).replace("_startDay",row.startDay).
					replace("_empId",row.empId).replace("_des",row.des).replace("_status",row.status).replace("_stuStatus",row.stuStatus);
                $("#editForm").form("load", JSON.parse(jsonStr1));
                $("#editWin").window("open");
            }
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/intention/update",
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
        

        function showDlg() {
            $("#dlg").dialog("open"); // 打开对话框   close关闭对话框
        }
        
        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已冻结</b>"
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
            if (row.stuStatus == 'intention') {
                return "<b>意向学生</b>"
			} else if(row.stuStatus == 'predetermine') {
                return "<b>预定学生</b>"
			} else if(row.stuStatus == 'official') {
                return "<b>正式学生</b>"
			}
        }
        
        function formatterOpt3(value, row, index) {
            if (row.gender == 'woman') {
                return "<b>女</b>"
            } else if (row.gender == 'boy') {
                return "<b>男</b>"
            }
        }
        
        
        function showAllProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/intention/queryAssign'}); 
        }
        
        function showEnabledProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/intention/queryStu'}); 
        }
        
        function showDisabledProductWin(){
        	$('#list').datagrid({ url: '<%=path %>/intention/queryStu1'}); 
        }
        
        function qq(value,name){
            $('#list').datagrid({ url: '<%=path %>/intention/blurredAllQuery?value1='+value+'&name1='+name});
        }
        
        function formatterOpt4(value, row, index){
    		if (row.status == 0) {
        		return "<a href='javascript:;' onclick='activate("+index+");'>启用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='disable("+index+");'>冻结</a>"
        	}
    	}
        
        function disable(index){   // 冻结
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/intention/roleDisable?id=" + row.stuId,
    				$("#editForm").serialize(),
    				function(data){
    				$.messager.alert("提示", "已成功冻结", "info");
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/intention/roleActivate?id=" + row.stuId,
    				$("#editForm").serialize(),
    				function(data){
    					$.messager.alert("提示", "已成功启用", "info");
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
    	}

    	 function showAlterProductWin(){
    		   var rows = $("#list").datagrid("getSelections");
        		if(rows.length  > 1 ){
        			$.messager.alert("提示","请选择要转为预定的学生","info");
        		}else if(rows.length == 1){
        			var row = rows[0];
        			if (row.status == 1) {
        				if(row){
        					$("#intentionForm").form("clear"); // 清除表单里的所有数据
            				$("#intentionWin").window("open");
            			}
        			} else {
        				$.messager.alert("提示","你的学生被冻结","info");
        			}
        			
        		}else if(rows.length == 0){
        			$.messager.alert("提示","请选择要转为预定的学生","info");
        		}
    	}
    	
    	function intentionAlter(){  // 
    		var ss =  $("#stuStatus").val();
    		var aa =  $("#money").val();
    		var rows = $("#list").datagrid("getSelections");
    		if(aa >= 300){
    		 if (rows) {
                 $.post("<%=path %>/intention/changeIntention?id="+rows[0].stuId+"&money="+aa+"&stuStatus="+ss,
              		 function (data) {
                       if (data.result.result == "success") {
                           $("#intentionWin").window("close"); // 关闭指定的窗口
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
    		}else{
       			$.messager.alert("提示", "金额最低为300￥", "info");
       		}
    		}
    	
    	
    	function showProductWin(){
   		   var rows = $("#list").datagrid("getSelections");
       		if(rows.length  > 1 ){
       			$.messager.alert("提示","请选择要转为预定的学生","info");
       		}else if(rows.length == 1){
       			var row = rows[0];
       			if (row.status == 1) {
       				if(row){
       					$("#predetermineForm").form("clear"); // 清除表单里的所有数据
           				$("#predetermineWin").window("open");
           			}
       			} else {
       				$.messager.alert("提示","你的学生被冻结","info");
       			}
       			
       		}else if(rows.length == 0){
       			$.messager.alert("提示","请选择要转为预定的学生","info");
       		}
   	}
   	
   	function predetermineAlter(){  // 
   		var ss =  $("#stuStatus").val();
   		var aa =  $("#stuMoney").val();
   		var rows = $("#list").datagrid("getSelections");
   		if(aa >= 3000){
   		 if (rows) {
                $.post("<%=path %>/intention/changePredetermine?id="+rows[0].stuId+"&stuMoney="+aa+"&stuStatus="+ss,
             		 function (data) {
                      if (data.result.result == "success") {
                          $("#predetermineWin").window("close"); // 关闭指定的窗口
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
   		}else{
   			$.messager.alert("提示", "金额最低为3000￥", "info");
   		}
   		}
	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path%>/intention/queryAssign',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'stuId',checkbox:true">学生编号</th>
		<th data-options="field:'name',width:50">姓名</th>
		<th data-options="field:'gender',width:40" formatter="formatterOpt3">性别</th>
		<th data-options="field:'age',width:40">年龄</th>
		<th data-options="field:'phone',width:60">手机号</th>
		<th data-options="field:'qq',width:60">QQ号</th>
		<th data-options="field:'school',width:80">毕业学校</th>
		<th data-options="field:'operation',width:40" formatter="formatterOpt4">操作</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		<a href="javascript:;" onclick="showAlterProductWin();" class="easyui-linkbutton" iconCls="icon-redo">转为预定学生</a>
		<a href="javascript:;" onclick="showProductWin();" class="easyui-linkbutton" iconCls="icon-redo">转为正式学生</a>
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看全部意向学生</a>
		<a href="javascript:;" onclick="showEnabledProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看冻结意向学生</a>
		
	
	<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	    <div data-options="name:'name',iconCls:'icon-ok'">姓名</div>
	    <div data-options="name:'phone'">手机号</div>
	     <div data-options="name:'qq'">QQ号</div>
	     <div data-options="name:'school'">毕业学校</div>
	</div>
	
	</div>
</div>
 
    
<div id="saveWin" class="easyui-window" title="添加信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="saveForm" style="margin-left: 100px;margin-right: 100px;">
		<table>
			<tr>
				<td>姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.name" data-options="required:true,validType:'length[2,4]'"/></td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
					<select style="width:170px;" class="easyui-combobox" name="stu.gender" data-options="required:true, editable:false"><option value="boy">男</option><option value="woman">女</option></select>
				</td>
			</tr>
			<tr>
				<td>年龄</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="stu.age" data-options="required:true, max:30,min:14"/></td>
			</tr>
			<tr>
				<td>手机号</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="stu.phone" data-options="required:true,validType:'length[3,11]'"/></td>
			</tr>
			<tr>
				<td>QQ号</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="stu.qq" data-options="required:true,validType:'length[6,10]'"/></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.school" data-options="required:true,validType:'length[3,15]'" /></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="saveProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改信息" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm" style="margin-left: 100px;margin-right: 100px;">
		<input type="hidden" name="stu.stuId" />
		<table>
			<tr>
				<td>姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.name" data-options="required:true,validType:'length[2,4]'"/></td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
					<select style="width:170px;" class="easyui-combobox" name="stu.gender" data-options="required:true, editable:false"><option value="boy">男</option><option value="woman">女</option></select>
				</td>
			</tr>
			<tr>
				<td>年龄</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="stu.age" data-options="required:true, max:30,min:14"/></td>
			</tr>
			<tr>
				<td>手机号</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="stu.phone" data-options="required:true,validType:'length[3,11]'"/></td>
			</tr>
			<tr>
				<td>QQ号</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="stu.qq" data-options="required:true,validType:'length[6,10]'"/></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.school" data-options="required:true,validType:'length[3,15]'" /></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>


<div id="intentionWin" class="easyui-window" title="转为预定学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;">
		<form id = "intentionForm">
			<table>
			<tr>
				<td>请交转为预定学生的费用</td>
				<td><input id="money" class="easyui-validatebox easyui-numberbox" style = "height:30px;" name="money" data-options="required:true"/></td>
				
			</tr>
			
			<tr>
				<td>
					<a href="javascript:;" onclick="intentionAlter();"class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:100%;height:32px">确认</a>
				</td>
			</tr>
			</table>
		</form>	
	</div>
	
	<div id="predetermineWin" class="easyui-window" title="转为正式学生" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;">
		<form id = "predetermineForm">
			<table>
			<tr>
				<td>请交转为正式学生的费用</td>
				<td><input id="stuMoney" class="easyui-validatebox numberbox" style = "height:30px;" name="money"  data-options="required:true"/></td>
				
			</tr>
			
			<tr>
				<td>
					<a href="javascript:;" onclick="predetermineAlter();"class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:100%;height:32px">确认</a>
				</td>
			</tr>
			</table>
		</form>	
	</div>
</body>
</html>