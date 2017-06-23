<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
	<script type="text/javascript" src="<%=path%>/js/main.js"></script>
	<script type="text/javascript" src="<%=path%>/js/validate.js"></script>
	
<script>
		//datagird 数据
        var jsonStr = '{"stu.stuId":"_stuId","stu.stuNo":"_stuNo",' +
			'"stu.name":"_name","stu.pwd":"_pwd","stu.idCard":"_idCard",'+
			'"stu.phone":"_phone","stu.qq":"_qq","stu.weChat":"_weChat",' +
			'"stu.school":"_school","stu.age":"_age","stu.birthday":"_birthday", '
			+'"stu.gender":"_gender", "stu.address":"_address","stu.nation":"_nation",' +
			'"stu.resIdence":"_resIdence","stu.gradeId":"_gradeId","stu.roomId":"_roomId",' +
			'"stu.parentName":"_parentName", "stu.parentPhone":"_parentPhone","stu.startDay":"_startDay", ' +
			'"stu.empId":"_empId", "stu.des":"_des", "stu.status":"_status","stu.stuStatus":"_stuStatus","stu.role":"_role"}';
			
        $(function() {
        	document.getElementById("stuDetails").style.display="none";//启动隐藏详情div
            setPagination("list");
        });
        
        function authority(methodName, str, method) {
    		$.get("<%=path %>/auth/authority?methodName=" + methodName,
    			function(data) {
    				if (data.result.result == "success") {
    					if (method == "save") {
    						document.getElementById("stuDetails").style.display="";// 显示隐藏窗口
	                		qingkong();
    					} else if (method == "update") {
    						$("#stuDetailsFrom").form("load", JSON.parse(str));
    						document.getElementById("stuDetails").style.display="";// 显示隐藏窗口
    					}
    				} else if (data.result.result == "fail") {
    					$.messager.alert("提示", data.result.message, "info");
    				}
    			}, "json");
    	}
        
    	// 模糊查询方法
    	function qq(value,name){
    		$('#list').datagrid({ url: '<%=path %>/stu/blurredAllQuery?value1='+value+'&name1='+name});
                   
    	 }
    	// 查看所有学生方法
    	function showAllProductWin(){
          	$('#list').datagrid({ url: '<%=path %>/stu/queryAll'}); 
          }
    	//查看所有被冻结学生方法
    	function showFreezeAllWin(){
          	$('#list').datagrid({ url: '<%=path %>/stu/queryFreezeAll'}); 
          }
    	// 点击冻结按钮
    	function showStuFreeze(index){
    		var row=$('#list').datagrid('getData').rows[index];
    		if (row){
    			$.messager.confirm("提示", "确定冻结吗?", function (r){
    				if (r) { // 点击了确定按键
    					$.get("<%=path %>/stu/updateFreeze?status=0&stuId=" + row.stuId, function (data) {
    						$("#list").datagrid("reload");
    						$.messager.alert("提示", data.result.message, "info");
    					}, "json");
    				}
    			})
    	}else {
    		$.messager.alert("提示", "请先选择需要冻结的学生", "info");
    	}
    	}
    	// 点击启用按钮
    	function showStuStart(index){
    		var row=$('#list').datagrid('getData').rows[index];
    		if (row){
    					$.get("<%=path %>/stu/updateFreeze?status=1&stuId=" + row.stuId, function (data) {
    						$("#list").datagrid("reload");
    						$.messager.alert("提示", data.result.message, "info");
    					}, "json");
    	} else {
    		$.messager.alert("提示", "请先选择需要冻结的学生", "info");
    	}
    	}
    	// 查询学生成绩
    	function showStuScore(index){
    		var row=$('#list').datagrid('getData').rows[index];
    		if (row){
    			$("#scoreWin").window("open");
    			$('#scoreTable').datagrid({url: '<%=path %>/score/stuScoreById?stuId=' + row.stuId}); 	
    	} else {
    		$.messager.alert("提示", "请先选择需要查看的学生", "info");
    	}
    	}
	</script>
<script>
		//添加栏位方法
		function showLan(){
			var stuIndex = $('#list').datagrid("getRows").length +1
			$("#list").datagrid("insertRow", {
		        index: stuIndex,
		        row: {"stu.address":"","stu.age":"","stu.birthday":"","stu.des":"","stu.empId":"","stu.gender":"","stu.gradeId":"","stu.idCard":"","stu.name":"","stu.nation":"","stu.parentName":"","stu.parentPhone":"","stu.phone":"","stu.pwd":"","stu.qq":"","stu.resIdence":"","stu.role":"","stu.roomId":"","stu.school":"","stu.startDay":"","stu.status":"","stu.stuId":"","stu.stuNo":"","stu.stuStatus":"","stu.weChat":""}
		    });
		}
		//用户点击栏位详情div拿数据
		 function showStuDetails() {
			
	            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
	            var rows = $("#list").datagrid("getSelections");
	            if (rows.length > 1) {
	                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
	            } else if (rows.length == 1) {
	                var row = rows[0];
	                if (row) { // 有选中的行
	                	if(row.stuId){// 假如学生id有, 则拿选中行中所有数据
		                    var jsonStr1 = jsonStr.replace("_stuId", row.stuId).replace("_stuNo", row.stuNo).
							replace("_name", row.name).replace("_pwd", row.pwd).replace("_idCard", row.idCard).
							replace("_phone", row.phone).replace("_qq", row.qq).replace("_weChat", row.weChat).
							replace("_school", row.school).replace("_age", row.age).replace("_birthday", row.birthday).
							replace("_gender", row.gender).replace("_address", row.address).replace("_nation", row.nation).
							replace("_resIdence", row.resIdence).replace("_gradeId",row.gradeId).replace("_roomId",row.roomId).
							replace("_parentName",row.parentName).replace("_parentPhone",row.parentPhone).replace("_startDay",row.startDay).
							replace("_empId",row.empId).replace("_des",row.des).replace("_status",row.status).replace("_stuStatus",row.stuStatus).replace("_role",row.role);
		                    authority('com.cs.action.stuAction.update', jsonStr1, "update");    
		                    /* $("#roomInputa").textbox('setValue',row.room.name);
		                	$("#roomIda").val(row.room.roomId);
		                	$("#gradeInputa").textbox('setValue',row.grade.name);
		                	$("#gradeIda").val(row.grade.gradeId); */
		                	$("#empInputa").textbox('setValue',row.emp.name);
		                	$("#empIda").val(row.empId);
	                	}else{// 否则学生id没有, 代表用户是新增栏位, 则清楚此div所有数据
	                		 authority('com.cs.action.stuAction.save', "", "save");
	                	}
	                }
	            } else if (rows.length == 0) {
	                $.messager.alert("提示", "请先选择一个需要修改的学生", "info");
	            }
	        }
		
		// 用户在详情栏点击保存按钮
		function saveStuDetails() {
			var rows = $("#list").datagrid("getSelections");// 获取表格中选中行的数据
			  if (rows.length > 1) {
		          $.messager.alert("提示", "请先选择一个学生进行操作", "info");
		      } else if (rows.length == 1) {// 假如选中了行
		          var row = rows[0];
		          if (row) { // 有选中的行
		        	  if(row.stuId){// 如果这行数据有学生id, 则进行修改信息操作
		        		  if ($("#stuDetailsFrom").form("validate")) {
		                      $.post("<%=path %>/stu/update",
		                          $("#stuDetailsFrom").serialize(),
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
		        		  if ($("#stuDetailsFrom").form("validate")) {
		        			  $("#predetermineForm").form("clear"); // 清除表单里的所有数据
		          			  $("#predetermineWin").window("open");
		                  } else {
		                      $.messager.alert("提示", "请输入正确的数据", "info");
		                  }
		        	  }
		          }
		        }
		}
		//缴费
		function predetermineAlter(){
	  		var aa =  $("#money").val();
	  		var rows = $("#list").datagrid("getSelections");
	  		 if (rows) {
	               $.post("<%=path %>/stu/save?money="+aa,
	            		  $("#stuDetailsFrom").serialize(),
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
	  		}
		// 清空详情栏
		function qingkong(){
			$('#stuDetailsTable').form('clear');
		}
</script>
<script>
		// 所有formatter
		function formatterOpt(value, row, index){
			if (row.status == 1) {
				return "<a href='javascript:;' onclick='showStuScore("+ index + ");'>查看成绩</a>&nbsp;<a href='javascript:;'onclick='showStuFreeze("+ index + ");'>冻结</a>";
			}else if (row.status == 0) {
				return "<a href='javascript:;' onclick='showStuStart("+ index + ");'>启用</a>";
			}
		}
		
		function formatterOptStuStatus(value, row, index) {
		    if (row.stuStatus == 'intention') {
		        return "<b>意向学生</b>"
			} else if(row.stuStatus == 'predetermine') {
		        return "<b>预定学生</b>"
			} else if(row.stuStatus == 'official') {
		        return "<b>正式学生</b>"
			}
		}
		
		function formatterOptGender(value, row, index) {
		    if (row.gender == 'woman') {
		        return "<b>女</b>"
		    } else if (row.gender == 'boy') {
		        return "<b>男</b>"
		    }
		}
		
		function formatterOptStatus(value, row, index){
			if (row.status == 0) {
		        return "冻结"
		    } else if (row.status == 1) {
		        return "可用"
		    }
		}
		
		function formatterOptRole(value, row, index) {
		    if (row.role == 'monitor') {
		        return "班长"
		    } else if (row.role == 'studies') {
		        return "学习委员"
		    }else if (row.role == 'sports') {
		        return "体育委员"
		    }else if (row.role == 'life') {
		        return "生活委员"
		    }else if (row.role == 'discipline') {
		        return "纪律委员"
		    }else if (row.role == 'student'){
		    	return "学生"
		    }
		}
		function showName(value){
        	if (value != null) {
        		return value.name;
        	} else {
        		return "";
        	}
        }
		function showMoney(value){
			if (value != null) {
	   			for(var i=0;i < value.length;i++){
	   				var ii = value[i];
	   				return ii.income+"元";
	   			}
			}else {
        		return "";
        	}
    	}
</script>
<script>
	//点击框时
	function showRoomAll(){
		  $("#roomTable").datagrid("reload");
		 $("#roomTable").datagrid({url:'<%=path %>/room/queryAll'});// 当点击宿舍框时再加载宿舍信息
		 $("#roomDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	//选择宿舍
	function getRoom(){
		var row = $("#roomTable").datagrid("getSelected");// 宿舍表格的选中行
		$("#roomInputa").textbox('setValue',row.name);
		$("#roomIda").val(row.roomId);
		 $("#roomDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	//点击框时
	function showGradeWin() {
		   $("#gradeTable").datagrid("reload");
		  $("#gradeTable").datagrid({url:'<%=path %>/grade/queryAll'});
		  $("#gradeWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
	//选择班级
	function getGrade(){
		var row = $("#gradeTable").datagrid("getSelected");
		$("#gradeInputa").textbox('setValue',row.name);
		$("#gradeIda").val(row.gradeId);
		$("#gradeWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	//点击框时
	function showEmpWin() {
		   $("#empTable").datagrid("reload");
		  $("#empTable").datagrid({url:'<%=path %>/emp/termIdQueryAll'});
		  $("#empWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
		}
	//选择员工
	function getEmp(){
		var row = $("#empTable").datagrid("getSelected");
		$("#empInputa").textbox('setValue',row.name);
		$("#empIda").val(row.empId);
		$("#empWin").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
</script>
<script>
	// 右键弹出菜单方法
	function menuHandler(item){
		$('#list').prepend('<p>Click Item: '+item.name+'</p>');
	}
	$(function(){
		$(document).bind('contextmenu',function(e){
			e.preventDefault();
			$('#caidan').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
		});
	});
</script>
<script>
	// 表格行编辑
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true}
			if ($('#list').datagrid('validateRow', editIndex)){
				var ed = $('#list').datagrid('getEditor', {index:editIndex,field:'stuId'});
				
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
		function formatTime(value){
			if (value == undefined || value == null || value == '') {
			    return "";
			}else {
			    var date = new Date(value);
			    var year = date.getFullYear().toString();
			    var month = (date.getMonth() + 1);
			    var day = date.getDate().toString();
			    var hour = date.getHours().toString();
			    var minutes = date.getMinutes().toString();
			    var seconds = date.getSeconds().toString();
			if (month < 10) {
			    month = "0" + month;
			}
			if (day < 10) {
			    day = "0" + day;
			}
			if (hour < 10) {
			    hour = "0" + hour;
			}
			if (minutes < 10) {
			    minutes = "0" + minutes;
			}
			if (seconds < 10) {
			    seconds = "0" + seconds;
			}
			   return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
			}
		}
</script>
</head>
<body style="height:69%">
<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
	   		onClickRow:showStuDetails,
			singleSelect:true,
			collapsible:true,
			url:'<%=path %>/stu/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'stuId',checkbox:true">编号</th>
		<th data-options="field:'stuNo',width:30,align:'center',editor:{type:'text'}">学号</th>
		<th data-options="field:'name',width:60,align:'center',editor:{type:'text'}">姓名</th>
		<th data-options="field:'idCard',width:100,align:'center',editor:{type:'text'}">身份证</th>
		<th data-options="field:'phone',width:80,align:'center',editor:{type:'text'}">手机</th>
		<th data-options="field:'age',width:40,align:'center',editor:{type:'text'}">年龄</th>
		<th data-options="field:'gender',width:33" formatter="formatterOptGender">性别</th>
		<th data-options="field:'incomes',width:50" formatter="showMoney">已缴费用</th>
		<th data-options="field:'address',width:90">住址</th>
		<th data-options="field:'grade',width:90" formatter="showName">班级</th>
		<th data-options="field:'room',width:60" formatter="showName">宿舍</th>
		<th data-options="field:'parentName',width:60">家长姓名</th>
		<th data-options="field:'parentPhone',width:90">家长电话</th>
		<th data-options="field:'startDay',width:100" formatter="formatTime">入学时间</th>
		<th data-options="field:'emp',width:90" formatter="showName">招生老师</th>
		<th data-options="field:'operation',width:100" formatter="formatterOpt">操作</th>
	</tr>
	</thead>
</table>
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showLan();" class="easyui-linkbutton" iconCls="icon-add">添加栏位</a>
		<a href="javascript:;" onclick="showAllProductWin();" class="easyui-linkbutton" iconCls="icon-search">查看所有学生</a>
		<a href="javascript:;" onclick="showFreezeAllWin();" class="easyui-linkbutton" iconCls="icon-search">查看所有冻结</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
	</div>
</div>
<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	    <div data-options="name:'name'">姓名</div>
	    <div data-options="name:'phone'">手机号</div>
	     <div data-options="name:'gradeid'">班级</div>
	     <div data-options="name:'roomid'">宿舍</div>
	</div>


<div id="stuDetails">
<!-- 学生详情div -->
	<div style="padding-left:10px;">
		<a href="javascript:;" onclick="saveStuDetails();" class="easyui-linkbutton" iconCls="icon-add">保存</a>
		<a href="javascript:;" onclick="qingkong();" class="easyui-linkbutton" iconCls="icon-add">清空</a>
		${request.height} 
	</div>
<!-- 学生详情div -->
<form name="form1" id="stuDetailsFrom">
	<input type="hidden" name="stu.stuId"/>
		<table id="stuDetailsTable">
			<tr>
				<td>&nbsp;&nbsp;学号</td>
				<td><input class="easyui-textbox" name="stu.stuNo" /></td>
				<td>&nbsp;&nbsp;姓名</td>
				<td><input id="name1" class="easyui-validatebox easyui-textbox" name="stu.name" data-options="required:true,validType:'length[2,20]'"/></td>
				<td>&nbsp;&nbsp;身份证</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.idCard" data-options="validType:'IDCard'"/></td>
				<td>&nbsp;&nbsp;手机</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.phone" data-options="validType:'Mobile'"/></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;性别</td>
				<td>
					<select style="width:173px;" class="easyui-combobox" name="stu.gender"><option value="boy">男</option><option value="woman">女</option></select>
				</td>
				<td>&nbsp;&nbsp;QQ</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.qq" data-options="validType:'length[4,11]'"/></td>
				<td>&nbsp;&nbsp;微信</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.weChat" data-options="validType:'length[1,20]'"/></td>
				<td>&nbsp;&nbsp;毕业学校</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.school" data-options="validType:'length[1,20]'"/></td>
				
			</tr>
			<tr>
			<td>&nbsp;&nbsp;家长姓名</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.parentName"/></td>
				<td>&nbsp;&nbsp;家长手机</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.parentPhone" data-options="validType:'Mobile'"/></td>
				<td>&nbsp;&nbsp;住址</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.address"/></td>
				<td>&nbsp;&nbsp;籍贯</td>
				<td><input class="easyui-validatebox easyui-textbox" name="stu.nation" /></td>
				
			</tr>
			<tr>
				<td>&nbsp;&nbsp;出生年月</td>
				<td><input class="easyui-datebox" name="stu.birthday" /></td>
				<td>&nbsp;&nbsp;入学时间</td>
				<td><input class="easyui-datebox" name="stu.startDay"/></td>
				<td>&nbsp;&nbsp;户口</td>
				<td><select style="width:173px;" class="easyui-combobox" name="stu.resIdence"><option value="countryside">农村</option><option value="city">城镇</option></select>
				</td>
				<!-- <td>&nbsp;&nbsp;班级</td>
				<td><a href="javascript:;" onclick="showGradeWin();">
				<input id="gradeInputa" class="easyui-validatebox easyui-textbox" name="stu.gradeName" data-options="required:true"/>
				<input id="gradeIda" type="hidden" name="stu.gradeId"/></a>
				</td>
				<td>&nbsp;&nbsp;宿舍</td>
				<td><a href="javascript:;" onclick="showRoomAll();">
				<input id="roomInputa" class="easyui-validatebox easyui-textbox" name="stu.roomName" data-options="required:true"/>
				<input type="hidden" id="roomIda" name="stu.roomId"/></a>
				</td> -->
				<td>&nbsp;&nbsp;招生老师</td>
				<td><a href="javascript:;" onclick="showEmpWin();">
				<input id="empInputa" class="easyui-textbox" name="stu.empName" />
				<input id="empIda" type="hidden" name="empId"/></a>
				</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;班级角色</td>
				<td><select style="width:173px;"" class="easyui-combobox" name="stu.role"><option value="monitor">班长</option><option value="studies">学习委员</option>
				<option value="sports">体育委员</option><option value="life">生活委员</option><option value="discipline">纪律委员</option><option value="student">学生</option></select>
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 右键菜单div -->
<div id="caidan" class="easyui-menu" data-options="onClick:menuHandler" style="width:120px;">
		<div data-options="name:'new'">添加栏位</div>
		<div data-options="name:'save',iconCls:'icon-save'">关闭此窗口</div>
		<div class="menu-sep"></div>
		<div data-options="name:'exit'">关闭</div>
	</div>
	
<!-- 所有宿舍div -->
<div id="roomDiv" class="easyui-window" title="所有宿舍" data-options="closed:true" style="width:500px;height:300px;">
	<table id="roomTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getRoom,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'roomId',checkbox:true">编号</th>
		<th data-options="field:'name',width:60">姓名</th>
		<th data-options="field:'stuId',width:100">宿舍编号</th>
		<th data-options="field:'quantity',width:100">宿舍人数</th>
	</tr>
	</thead>
</table>
</div>
<!-- 所有班级div -->
<div id="gradeWin" class="easyui-window" title="所有班级" data-options="closed:true" style="width:500px;height:300px;">
	<table id="gradeTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getGrade,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'gradeId',checkbox:true">编号</th>
		<th data-options="field:'name',width:60">班级</th>
		<th data-options="field:'quantity',width:100">班级最大人数</th>
	</tr>
	</thead>
</table>
</div>
<!-- 所有员工div -->
<div id="empWin" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
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
		<th data-options="field:'empId',checkbox:true">编号</th>
		<th data-options="field:'name',width:60">员工</th>
	</tr>
	</thead>
</table>
</div>
<div id="predetermineWin" class="easyui-window" title="正式学生缴费" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;">
		<form id = "predetermineForm">
			<table>
			<tr>
				<td>请输入此学生已缴的费用</td>
				<td><input id="money" class="easyui-validatebox numberbox" style="height:30px;" name="money"  data-options="required:true, min:3000"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="predetermineAlter();"class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:100%;height:32px">确认</a>
				</td>
			</tr>
			</table>
		</form>	
	</div>
<div id="scoreWin" class="easyui-window" title="所有成绩" data-options="closed:true" style="width:500px;height:300px;">
	<table id="scoreTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
				<th data-options="field:'scoreId',checkbox:true">编号</th>
				<th data-options="field:'stu',width:100" formatter="showName">学生姓名</th>
				<th data-options="field:'course',width:100" formatter="showName">课程</th>
				<th data-options="field:'score',width:80">成绩</th>
				<th data-options="field:'testDay',width:120" formatter="formatTime">考试时间</th>
		</tr>
	</thead>
</table>
</div>
</body>
</html>