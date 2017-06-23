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

        var jsonStr = '{"goodsUse.useId":"_useId","goodsUse.goodsId":"_goodsId","goodsUse.goods":"_goodsName",'+
        	'"goodsUse.empId":"_empId","goodsUse.emp":"_empName","goodsUse.quantity":"_quantity",'+
        	'"goodsUse.useDay":"_useDay","goodsUse.ereturnDay":"_ereturnDay","goodsUse.useStatus":"_useStatus","goodsUse.des":"_des"}';

        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
            if ($("#addForm").form("validate")) {
                $.post("<%=path %>/goodsUse/save",
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
                $.messager.alert("提示", "请先选择一个需要修改的物品领用", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_useId", row.useId).replace("_goodsId",row.goodsId).
                    replace("_goodsName", row.goods.name).replace("_empId", row.empId).
                    replace("_empName", row.emp.name).replace("_quantity", row.quantity).
                    replace("_useDay", row.useDay).replace("_ereturnDay", row.ereturnDay).replace("_useStatus",row.useStatus).replace("_des",row.des);
                    alert(jsonStr1)
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的物品领用", "info");
            }
            $("#empNameInput1").textbox('setValue',rows[0].emp.name);
            $("#goodsNameInput1").textbox('setValue',rows[0].goods.name);
        }
        
        function updateUseStatus() {
        	 var rows = $("#list").datagrid("getSelections");
             if (rows.length > 1) {
                 $.messager.alert("提示", "请先选择一个需要归还的物品", "info");
             } else if (rows.length == 1) {
                 var row = rows[0];
                 if (row) { // 有选中的行
                	 if (row.useStatus != 0) {
                		 if (row.useStatus != 1) {
                			 if (row.useStatus != 2) {
                				 if (row.useStatus != 4) {
                					 $.post("<%=path %>/goodsUse/updateUseStatus?id="+rows[0].useId,
                                             $("#editForm").serialize(),
                                             function (data) {
                                                	$("#list").datagrid("reload"); // 重新加载指定数据网格数据
                                                 $.messager.alert("提示", data.result.message, "info");
                                             }, "json"
                                         );
                				 } else {
                					 $.messager.alert("提示", "你的物品领用失败", "info");
                				 }
                			 }else {
                    			 $.messager.alert("提示", "你的物品待确定归还中", "info");
                    		 }
                		 } else {
                			 $.messager.alert("提示", "你的物品已归还", "info");
                		 }
                	 } else {
                		 $.messager.alert("提示", "你的物品在审核中", "info");
                	 }
                	
                 }
             } else if (rows.length == 0) {
                 $.messager.alert("提示", "请先选择一个需要归还的物品领用", "info");
             }
                
        }

        function editProduct() {
        	var rows = $("#list").datagrid("getSelections");
   		 if (rows) {
   		  $.post("<%=path %>/goodsUse/update",
               		 function (data) {
                      if (data.result.result == "success") {
                          $("#purchaseWin").window("close"); // 关闭指定的窗口
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
                        $.get("<%=path %>/goodsUse/deleteById?id=" + row.useId, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的物品领用", "info");
            }
        }


        function formatterOpt(value, row, index) {
            if (row.status == 1) {
                return "<b>已启用</b>"
			} else if(row.status == 0) {
                return "<b>已禁用</b>"
			}
        }

      //给员工赋值
        function formatterOpt2(value) {
        	return value.name;
        }
      
      //给物品赋值
        function formatterOpt3(value) {
        	return value.name;
        }
      
        //给物品赋值
        function formatterOpt1(value, row, index) {
        	 if (row.useStatus == 0) {
                 return "<b>待审核</b>"
 			} else if (row.useStatus == 1) {
 				return "<b>已归还</b>"
 			} else if(row.useStatus == 2) {
                 return "<b>待确定</b>"
 			} else if (row.useStatus == 3) {
 				return "<b>未归还</b>"
 			} else if (row.useStatus == 4) {
 				return "<b>失败</b>"
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
	
	<script>

		//添加
		function showEmpAll(){
			 $("#empDiv").form("clear"); // 清除表单里的所有数据
			 $("#empDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#empTable").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载部门信息
		}
		function getEmp(){
			var rows = $("#empTable").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empNameInput").textbox('setValue',rows[0].name);
			 $("#emp").textbox('setValue',rows[0].empId);
			 $("#empDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		//修改
		function showEmpAll1(){
			 $("#empDiv1").form("clear"); // 清除表单里的所有数据
			 $("#empDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#empTable1").datagrid({url:'<%=path %>/emp/queryAll'});// 当点击部门框时再加载宿舍信息
		}
		function getEmp1(){
			var rows = $("#empTable1").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#empNameInput1").textbox('setValue',rows[0].name);
			 $("#emp1").textbox('setValue',rows[0].empId);
			 $("#empDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
	</script>
	
	<script>

		//添加
		function showGoodsAll(){
			 $("#goodsDiv").form("clear"); // 清除表单里的所有数据
			 $("#goodsDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#goodsTable").datagrid({url:'<%=path %>/goods/queryAll'});// 当点击部门框时再加载部门信息
		}
		function getGoods(){
			var rows = $("#goodsTable").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#goodsNameInput").textbox('setValue',rows[0].name);
			 $("#goods").textbox('setValue',rows[0].goodsId);
			 $("#goodsDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
		
		//修改
		function showGoodsAll1(){
			 $("#goodsDiv1").form("clear"); // 清除表单里的所有数据
			 $("#goodsDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
			 $("#goodsTable1").datagrid({url:'<%=path %>/goods/queryAll'});// 当点击部门框时再加载宿舍信息
		}
		function getGoods1(){
			var rows = $("#goodsTable1").datagrid("getSelections");// 获取表格中选中行的数据
			 $("#goodsNameInput1").textbox('setValue',rows[0].name);
			 $("#goods1").textbox('setValue',rows[0].goodsId);
			 $("#goodsDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
		}
	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/goodsUse/goodsApply',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'useId',checkbox:true">物品领用编号</th>
		<th data-options="field:'goods',width:80" formatter="formatterOpt2">物品名称</th>
		<th data-options="field:'quantity',width:70">领用数量</th>
		<th data-options="field:'useDay',width:125" formatter="formatTime">领用时间</th>
		<th data-options="field:'des',width:80">申领原因</th>
		<th data-options="field:'ereturnDay',width:125" formatter="formatTime">预还时间</th>
		<th data-options="field:'returnDay',width:125" formatter="formatTime">归还时间</th>
		<th data-options="field:'useStatus',width:70"  formatter="formatterOpt1">归还状态</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="updateUseStatus();" class="easyui-linkbutton" iconCls="icon-add">归还</a>
	</div>
</div>

<div id="addWin" class="easyui-window" title="添加物品领用" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">物品名称</td>
				<td>
					<a href="javascript:;" onclick="showGoodsAll();">
						<input id="goodsNameInput" class="easyui-validatebox easyui-textbox" name="goodsName" data-options="required:true"/>
						<input type="hidden" id="goods" class="easyui-textbox" name="goodsId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>员工名称</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll();">
						<input id="empNameInput" class="easyui-validatebox easyui-textbox" name="empName" data-options="required:true"/>
						<input type="hidden" id="emp"  class="easyui-textbox" name="empId" />
					</a>
				</td>
			</tr>
			<tr>
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goodsUse.quantity" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>领用时间</td>
				<td><input class="easyui-datetimebox" name="goodsUse.useDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>预还时间</td>
				<td><input class="easyui-datetimebox" name="goodsUse.ereturnDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改物品领用" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="goodsUse.useId" />
		<table>
			<tr>
				<td width="100px">物品名称</td>
				<td>
					<a href="javascript:;" onclick="showGoodsAll1();">
						<input id="goodsNameInput1" class="easyui-validatebox easyui-textbox" name="goodsUse.goodsName" data-options="required:true"/>
						<input type="hidden" id="goods1"  class="easyui-textbox" name="goodsId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>员工名称</td>
				<td>
					<a href="javascript:;" onclick="showEmpAll1();">
						<input id="empNameInput1" class="easyui-validatebox easyui-textbox" name="goodsUse.empName" data-options="required:true"/>
						<input type="hidden" id="emp1"  class="easyui-textbox" name="empId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goodsUse.quantity" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>领用时间</td>
				<td><input class="easyui-datetimebox" name="goodsUse.useDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>预还时间</td>
				<td><input class="easyui-datetimebox" name="goodsUse.ereturnDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
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

<!-- 物品 -->
<div id="goodsDiv" class="easyui-window" title="所有员工" data-options="closed:true" style="width:500px;height:300px;">
	<table id="goodsTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getGoods,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'goodsId',checkbox:true">物品编号</th>
			<th data-options="field:'name',width:80">物品名称</th>
		</tr>
	</thead>
</table>
</div>


<div id="goodsDiv1" class="easyui-window" title="所有商品类型" data-options="closed:true" style="width:500px;height:300px;">
	<table id="goodsTable1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getGoods1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'goodsId',checkbox:true">物品编号</th>
			<th data-options="field:'name',width:80">物品名称</th>
		</tr>
	</thead>
</table>
</div> 

</body>
</html>