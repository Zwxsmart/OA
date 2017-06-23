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

        var jsonStr = '{"goods.goodsId":"_goodsId","goods.name":"_name","goods.quantity":"_quantity",'+
        	'"goods.des":"_des","goods.unitPrice":"_unitPrice","goods.buyDay":"_buyDay",'+
        	'"goods.goodsTypeId":"_goodsTypeId","goods.status":"_status","goods.goodsType":"_goodsTypeName","goods.quantityCount":"_quantityCount"}';

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
        
        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            authority("com.cs.action.GoodsAction.save","","save");
        }

        function addProduct() {
        	var goodsCount = $("#goodsCount").val();
        	var price = $("#price").val();
            if (goodsCount >= 0) {
            	if (price >= 0) {
            		if ($("#addForm").form("validate")) {
                        $.post("<%=path %>/goods/save",
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
            	} else {
            		 $.messager.alert("提示", "物品单价不能为负数", "info");
            	}
            } else {
            	 $.messager.alert("提示", "物品数量不能为负数", "info");
            }
        }

        function showEditProductWin() {
            // var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
            var rows = $("#list").datagrid("getSelections");
            if (rows.length > 1) {
                $.messager.alert("提示", "请先选择一个需要修改的物品", "info");
            } else if (rows.length == 1) {
                var row = rows[0];
                if (row) { // 有选中的行
                    // var jsonStr = '{"sAdmin.id":"' + row.id + '","product.title":"' + row.title +'","product.price":"' + row.price +'","product.des":"' + row.des +'"}';
                    var jsonStr1 = jsonStr.replace("_goodsId", row.goodsId). replace("_name", row.name).
                    replace("_quantity", row.quantity).replace("_des", row.des). replace("_unitPrice", row.unitPrice).
                    replace("_buyDay", row.buyDay).replace("_goodsTypeId", row.goodsTypeId).replace("_goodsTypeName", row.goodsType.name).
                    replace("_status", row.status).replace("_quantityCount", row.quantityCount);
                    authority("com.cs.action.GoodsAction.update",jsonStr1,"update");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的物品", "info");
            }
            $("#goodsTypeNameInput").textbox('setValue',rows[0].goodsType.name);
            $("#goodsType1").textbox('setValue',rows[0].goodsTypeId);
        }

        function editProduct() {
            if ($("#editForm").form("validate")) {
                $.post("<%=path %>/goods/update",
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
                        $.get("<%=path %>/goods/del?id=" + row.id, function (data) {
                            $("#list").datagrid("reload");
                        }, "json");
                    }
                })
            } else {
                $.messager.alert("提示", "请先选择需要删除的物品", "info");
            }
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
        
        //给物品类型赋值
        function formatterOpt2(value) {
        	return value.name;
        }
        
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goods/empDisable?id=" + row.goodsId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goods/empActivate?id=" + row.goodsId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload'); // 重新加载数据表
    			},"json");
    		}
    		
    	}
    	
    	//模糊查询方法
        function qq(value,name){
        	$('#list').datagrid({ url: '<%=path %>/goods/blurredAllQuery?value1='+value+'&name1='+name});
         }
     	 
     	//时间段查询
        function findPositions(){
    		var beginTime=$("#startDatetime").datetimebox("getValue");
    		var endTime=$("#endDatetime").datetimebox("getValue");
    		$('#list').datagrid({ url: '<%=path %>/goods/serachTime?beginTime='+beginTime+'&endTime='+endTime});
    	}
     	
		//查询全部
	    function showAllProductWin(){
	        	$('#list').datagrid({ url: '<%=path %>/goods/queryAll'}); 
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
	function showGoodsTypeAll(){
		 $("#goodsTypeDiv").form("clear"); // 清除表单里的所有数据
		 $("#goodsTypeDiv").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#goodsTypeTable").datagrid({url:'<%=path %>/goodsType/queryAll'});// 当点击部门框时再加载部门信息
	}
	function getGoodsType(){
		var rows = $("#goodsTypeTable").datagrid("getSelections");// 获取表格中选中行的数据
		 $("#goodsTypeInput").textbox('setValue',rows[0].name);
		 $("#goodsType").textbox('setValue',rows[0].goodsTypeId);
		 $("#goodsTypeDiv").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	//修改
	function showGoodsTypeAll1(){
		 $("#goodsTypeDiv1").form("clear"); // 清除表单里的所有数据
		 $("#goodsTypeDiv1").window("open"); // 打开指定的window， open表示打开，close表示关闭
		 $("#goodsTypeTable1").datagrid({url:'<%=path %>/goodsType/queryAll'});// 当点击部门框时再加载宿舍信息
	}
	function getGoodsType1(){
		var rows = $("#goodsTypeTable1").datagrid("getSelections");// 获取表格中选中行的数据
		alert(rows[0].goodsTypeId);
		 $("#goodsTypeNameInput").textbox('setValue',rows[0].name);
		 $("#goodsType1").textbox('setValue',rows[0].goodsTypeId);
		 $("#goodsTypeDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/goods/queryAll',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	 <tr>
		<th data-options="field:'goodsId',checkbox:true">物品编号</th>
		<th data-options="field:'name',width:80">物品名称</th>
		<th data-options="field:'quantityCount',width:80">物品总数</th>
		<th data-options="field:'quantity',width:80">物品剩余数量</th>
		<th data-options="field:'des',width:80">物品描述</th>
		<th data-options="field:'unitPrice',width:80">物品单价</th>
		<th data-options="field:'buyDay',width:125"  formatter="formatTime">领用时间</th>
		<th data-options="field:'goodsType',width:80" formatter="formatterOpt2">物品类型</th>
		<th data-options="field:'status',width:80" formatter="formatterOpt">物品状态</th>
		<th data-options="field:'bbb',width:80" formatter="formatterOpt1">操作</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加</a>
		<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑</a>
		开始时间:<input id="startDatetime" name="startDatetime" class="easyui-datebox" data-options="editable:false" style="width:150px;"/>
		结束时间:<input id="endDatetime" name="endDatetime" class="easyui-datebox" data-options="editable:false" style="width:150px;"/>
		<a href="javascript:;" onclick="findPositions();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		<!-- 组合搜索框input -->
		<input id="ss" class="easyui-searchbox" style="width:300px"
    	data-options="searcher:qq,prompt:'输入搜索条件',menu:'#mm'"></input>
    	<a href="javascript:;" class="easyui-linkbutton" iconAlign="right" data-options="iconCls:'icon-undo'" 
    	onclick="Javascript:$('#tb').form('clear') ,showAllProductWin();">清空</a> 
	</div>
</div>

<!-- 组合搜索框div -->
	<div id="mm" style="width:120px">
	<div data-options="name:'name'">物品名称</div>
	    <div data-options="name:'type'">物品类型</div>
	</div>

<div id="addWin" class="easyui-window" title="添加物品" data-options="closed:true" style="width:500px;height:300px;">
	<form id="addForm">
		<table>
			<tr>
				<td width="100px">物品名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goods.name" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>物品剩余数量</td>
				<td><input id="goodsCount" class="easyui-validatebox easyui-numberbox" name="goods.quantity" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goods.quantityCount" data-options="required:true" style="width:175px;height:32px"/></td>
			</tr>
			<tr>
				<td>物品描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goods.des" data-options="required:true" style="width:175px;height:32px"/></td>
			</tr>
			<tr>
				<td>物品单价</td>
				<td><input id="price" class="easyui-validatebox easyui-numberbox" name="goods.unitPrice" data-options="required:true,precision:2"/></td>
			</tr>
			<tr>
				<td>购买时间</td>
				<td><input class="easyui-datetimebox" name="goods.buyDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>物品类型</td>
				<td>
					<a href="javascript:;" onclick="showGoodsTypeAll();">
						<input id="goodsTypeInput" style="width:165px;" class="easyui-textbox easyui-validatebox" name="goodsTypeName" data-options="required:true"/>
						<input type="hidden" id="goodsType" class="easyui-textbox" name="typeId"/>
					</a>
				</td>
			</tr>
			<%-- <tr>
				<td>物品状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="goods.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr> --%>
			<tr>
				<td>
					<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" title="修改物品" data-options="closed:true" style="width:500px;height:300px;">
	<form id="editForm">
		<input type="hidden" name="goods.goodsId" />
		<table>
			<tr>
				<td width="100px">物品名称</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goods.name" data-options="required:true,validType:'length[2,20]'"/></td>
			</tr>
			<tr>
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goods.quantity" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>物品剩余数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goods.quantityCount" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>物品描述</td>
				<td><input class="easyui-validatebox easyui-textbox" name="goods.des" data-options="required:true" style="width:100%;height:32px"/></td>
			</tr>
			<tr>
				<td>物品单价</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goods.unitPrice" data-options="required:true,precision:2"/></td>
			</tr>
			<tr>
				<td>购买时间</td>
				<td><input class="easyui-datetimebox" name="goods.buyDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>物品类型</td>
				<td>
					<a href="javascript:;" onclick="showGoodsTypeAll1();">
						<input id="goodsTypeNameInput" style="width:165px;" class="easyui-validatebox easyui-textbox" name="goods.goodsTypeName" data-options="required:true"/>
						<input type="hidden" id="goodsType1" class="easyui-textbox" name="typeId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>物品状态</td>
				<td>
					<select style="width:175px;" class="easyui-combobox" name="goods.status"><option value="1">启用</option><option value="0">禁用</option></select>
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

	<div id="goodsTypeDiv" class="easyui-window" title="所有商品类型" data-options="closed:true" style="width:500px;height:300px;">
	<table id="goodsTypeTable" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getGoodsType,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'goodsTypeId',checkbox:true">物品类型编号</th>
			<th data-options="field:'name',width:60">物品名称</th>
		</tr>
	</thead>
</table>
</div>


<div id="goodsTypeDiv1" class="easyui-window" title="所有商品类型" data-options="closed:true" style="width:500px;height:300px;">
	<table id="goodsTypeTable1" class="easyui-datagrid"
	   data-options="singleSelect:true,
	   		onClickRow:getGoodsType1,
			collapsible:true,
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
		<tr>
			<th data-options="field:'goodsTypeId',checkbox:true">物品类型编号</th>
			<th data-options="field:'name',width:60">物品名称</th>
		</tr>
	</thead>
</table>
</div>


</body>
</html>