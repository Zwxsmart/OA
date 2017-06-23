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

        var jsonStr = '{"goods.goodsId":"_goodsId","goods.name":"_name","goods.quantity":"_quantity",'+
        	'"goods.des":"_des","goods.unitPrice":"_unitPrice","goods.buyDay":"_buyDay",'+
        	'"goods.goodsTypeId":"_goodsTypeId","goods.status":"_status","goods.goodsType":"_goodsTypeName"}';

        $(function() {
            setPagination("list");
        });

        function showAddProductWin() {
            $("#addForm").form("clear"); // 清除表单里的所有数据
            $("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
        }

        function addProduct() {
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
                    replace("_buyDay", row.buyDay). replace("_goodsTypeId", row.goodsTypeId).replace("_goodsTypeName", row.goodsType.name).
                    replace("_status", row.status);
                    $("#editForm").form("load", JSON.parse(jsonStr1));
                    $("#editWin").window("open");
                }
            } else if (rows.length == 0) {
                $.messager.alert("提示", "请先选择一个需要修改的物品", "info");
            }
            $("#goodsTypeNameInput").textbox('setValue',rows[0].goodsType.name);
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
        		return "<a>商品已禁用</a>"
        	} else {
        		return "<a href='javascript:;' onclick='showAlterProductWin("+index+");'>申领</a>"
        	}
        	
        }
        
        //给物品类型赋值
        function formatterOpt2(value) {
        	return value.name;
        }
        
        function showAlterProductWin(index){
 		   var rows = $("#list").datagrid("getSelections");
     		if(rows.length  > 1 ){
     			$.messager.alert("提示","请选择一个要申领的物品","info");
     		}else if(rows.length == 1){
     			var row = rows[0];
     			if (row.status == 1) {
     				if(row){
     					$("#purchaseForm").form("clear"); // 清除表单里的所有数据
         				$("#purchaseWin").window("open");
         			}
     			} else {
     				$.messager.alert("提示","物品已经被冻结","info");
     			}
     			
     		}else if(rows.length == 0){
     			$.messager.alert("提示","请选择一个要申领的物品","info");
     		}
 	}
        
        function showAlterGoodsAppWin(index){
  		   var rows = $("#list").datagrid("getSelections");
      		if(rows.length  > 1 ){
      			$.messager.alert("提示","请选择一个要申购的物品","info");
      		}else if(rows.length == 1){
      			var row = rows[0];
      			if (row.status == 1) {
      				if(row){
      					$("#emptionForm").form("clear"); // 清除表单里的所有数据
          				$("#emptionWin").window("open");
          			}
      			} else {
      				$.messager.alert("提示","物品已经被冻结","info");
      			}
      			
      		}else if(rows.length == 0){
      			$.messager.alert("提示","请选择一个要申购的物品","info");
      		}
  	}
        
        function disable(index){   // 禁用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goods/goodsPurchase?id=" + row.goodsId,
    				$("#editForm").serialize(),
    				function(data){
    					$('#list').datagrid('reload');
    			},"json");
    		}
    		
    	}
    		
    	function activate(index){  // 启用
    		var row = $('#list').datagrid('getData').rows[index];
    		if(row){
    			$.post("<%=path %>/goods/goodsPurchase?id=" + row.goodsId,
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
    	
      //查询全部
	    function showAllProductWin(){
	        	$('#list').datagrid({ url: '<%=path %>/goods/queryAll'}); 
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
		 $("#goodsTypeNameInput").textbox('setValue',rows[0].name);
		 $("#goodsType1").textbox('setValue',rows[0].goodsTypeId);
		 $("#goodsTypeDiv1").window("close"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	function purchaseAlter(){  // 
		var aa =  $("#count").val();
		var des =  $("#des").val();
		var rows = $("#list").datagrid("getSelections");
		var date = $('#ereturnday').datebox('getValue'); 
		var row = rows[0];
		 if (row) {
			 if (aa != "") {
				 if (aa <= row.quantity) {
					 if (des != "") {
							 if (row.quantity > 0) {
								 if (date != "") {
										 $.post("<%=path %>/goods/goodsPurchase?id="+rows[0].goodsId+"&count="+aa+"&des="+des+"&name="+rows[0].name+"&goodsCount="+rows[0].quantity+"&dateTime="+date,
							            		 function (data) {
							            	$("#purchaseWin").window("close"); // 关闭指定的窗口
							             	$("#list").datagrid("reload"); // 重新加载指定数据网格数据
							              	$.messager.alert("提示", "领用完成, 请等待审核", "info");
							          }, "json"
							      ); 
								 } else {
									 $.messager.alert("提示", "请输入归还的时间", "info");
								 }
							 } else {
								 $.messager.alert("提示", "物品数量不足, 请进行申购", "info");
							 } 
						 } else {
							 $.messager.alert("提示", "请输入你的申购原因", "info");
						 }
					 }else {
						 $.messager.alert("提示", "物品数量不足, 请进行申购", "info");
					 }
					
				 } else {
					 $.messager.alert("提示", "请输入你要申购的数量", "info");
				 }		 
            
         } else {
             $.messager.alert("提示", "请输入正确的表单数据", "info");
         }
		}
	
	
	function emptionAlter(){  // 
		var aa =  $("#appCount").val();
		var des =  $("#appDes").val();
		var rows = $("#list").datagrid("getSelections");
		var row = rows[0];
		if (row) {
			if (row.status == 1) {
				if (aa != '') {
					if (des != '') {
							 $.post("<%=path %>/goods/goodsEmption?id="+rows[0].goodsId+"&count="+aa+"&des="+des+"&name="+rows[0].name+"&price="+rows[0].unitPrice,
						    		 function (data) {
						    	$("#emptionWin").window("close"); // 关闭指定的窗口
						     	$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						      	$.messager.alert("提示", "申购完成, 请等待审核", "info");
						  }, "json"
						);
					} else {
						 $.messager.alert("提示", "请输入你要申购的原因", "info");
					}
				} else {
					 $.messager.alert("提示", "请输入你要申购的数量", "info");
				}
			} else {
				 $.messager.alert("提示", "此物品已经被禁用", "info");
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
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
	   data-options="toolbar:'#tb',
			singleSelect:false,
			collapsible:true,
			url:'<%=path %>/goods/empGoods',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
	<thead>
	<tr>
		<th data-options="field:'goodsId',checkbox:true">物品编号</th>
		<th data-options="field:'name',width:80">物品名称</th>
		<th data-options="field:'quantityCount',width:60">物品总数</th>
		<th data-options="field:'quantity',width:90">物品剩余数量</th>
		<th data-options="field:'des',width:80">物品描述</th>
		<th data-options="field:'unitPrice',width:60">物品单价</th>
		<th data-options="field:'buyDay',width:125" formatter="formatTime">购买时间</th>
		<th data-options="field:'goodsType',width:80" formatter="formatterOpt2">物品类型</th>
		<th data-options="field:'status',width:80" formatter="formatterOpt">物品状态</th>
	</tr>
	</thead>
</table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<a href="javascript:;" onclick="showAlterProductWin();" class="easyui-linkbutton" iconCls="icon-add">申领</a>
		<a href="javascript:;" onclick="showAlterGoodsAppWin();" class="easyui-linkbutton" iconCls="icon-add">申购</a>
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
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goods.quantity" data-options="required:true"/></td>
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
				<td><input class="easyui-datebox" name="goods.buyDay" data-options="editable:false"/></td>
			</tr>
			<tr>
				<td>物品类型</td>
				<td>
					<a href="javascript:;" onclick="showGoodsTypeAll();">
						<input id="goodsTypeInput" class="easyui-textbox" name="goodsTypeName"/>
						<input type="hidden" id="goodsType" class="easyui-textbox" name="goodsTypeId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>物品状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="goods.status"><option value="1">启用</option><option value="0">禁用</option></select>
				</td>
			</tr>
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
				<td><input class="easyui-validatebox easyui-textbox" name="goods.name" data-options="required:true"/></td>
			</tr>
			<tr>
				<td>物品数量</td>
				<td><input class="easyui-validatebox easyui-numberbox" name="goods.quantity" data-options="required:true"/></td>
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
						<input id="goodsTypeNameInput" class="easyui-validatebox easyui-textbox" name="goods.goodsTypeName"/>
						<input type="hidden" id="goodsType1"  class="easyui-textbox" name="goodsTypeId"/>
					</a>
				</td>
			</tr>
			<tr>
				<td>物品状态</td>
				<td>
					<select style="width:100px;" class="easyui-combobox" name="goods.status"><option value="1">启用</option><option value="0">禁用</option></select>
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

<div id="purchaseWin" class="easyui-window" title="申领" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;">
		<form id = "purchaseForm">
			<table>
			<tr>
				<td>请输入你要领用的数量</td>
				<td><input id="count" class="easyui-validatebox numberbox" style = "height:30px;" name="money" /></td>
				
			</tr>
			<tr>
				<td>领用原因</td>
				<td><input id="des" class="easyui-validatebox textbox" style = "height:30px;" name="des" /></td>
				
			</tr>
			<tr>
				<td>预计归还时间</td>
				<td><input id="ereturnday" class="easyui-datetimebox" style = "height:30px;" name="des" /></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="purchaseAlter();"class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:100%;height:32px">确认</a>
				</td>
			</tr>
			</table>
		</form>	
	</div>


<div id="emptionWin" class="easyui-window" title="申购" data-options="closed:true" data-options="iconCls:'icon-save'" style="width:400px;height:300px;">
		<form id="emptionForm">
			<table>
			<tr>
				<td>请输入你要申购的数量</td>
				<td><input id="appCount" class="easyui-validatebox numberbox" style = "height:30px;" name="money" /></td>
				
			</tr>
			<tr>
				<td>申购原因</td>
				<td><input id="appDes" class="easyui-validatebox textbox" style = "height:30px;" name="des" /></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" onclick="emptionAlter();"class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:100%;height:32px">确认</a>
				</td>
			</tr>
			</table>
		</form>	
	</div>
</body>
</html>