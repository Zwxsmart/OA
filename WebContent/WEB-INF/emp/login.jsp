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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/material/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
<link rel="stylesheet" href="<%=path%>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=path%>/css/owl.carousel.css" />
<link rel="stylesheet" href="<%=path%>/css/popuo-box.css" />
<link rel="stylesheet" href="<%=path%>/css/style.css" />
<link rel="stylesheet" href="<%=path%>/swipebox.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon-hamburg.css" />
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/themes/jeasyui.icons.hamburg.js"></script>

<script>

function dologin() {
	$.post("<%=path %>/emp/login",
			$("#editForm").serialize(),
			function(data){
		
		},"json");
}



</script>

</head>
<body>
<div class="header" id="home">
    <div class="container">
        <div class="header-bottom">
            <div class="logo">
                <img src="../images/logo.png" height="51px" width="199px"/>
            </div>
            <div class="top-menu">
                <ul>
                    <nav class="cl-effect-5">
                        <li><a href="javascript:;" class="active"><span data-hover="学生登陆">学生登陆</span></a></li>
                        <li><a href="javascript:;"><span data-hover="公告">公告</span></a></li>
                        <li><a href="<%=path%>/emp/loginPage"><span data-hover="员工登陆">员工登陆</span></a></li>
                    </nav>
                </ul>
                <div class="clearfix"></div>
            </div>
            <!--script-nav-->
            <script>
                $("span.menu").click(function () {
                    $(".top-menu ul").slideToggle("slow", function () {
                    });
                });
            </script>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
    <div id="w" class="easyui-window" title="请先登录" style="width:400px;padding:20px 70px 20px 70px;">  
       <form action="<%=path %>/emp/login" method="post">
        <div style="margin-bottom:10px">  
            <input class="easyui-textbox" name="emp.email" id="logname" style="width:100%;height:30px;padding:12px" data-options="prompt:'登录邮箱',iconCls:'icon-man',iconWidth:38">  
        </div>  
        <div style="margin-bottom:20px">  
            <input class="easyui-textbox" name="emp.pwd" id="logpass" type="password" style="width:100%;height:30px;padding:12px" data-options="prompt:'登录密码',iconCls:'icon-lock',iconWidth:38">  
        </div>  
        <div style="margin-bottom:20px">  
            <input type="checkbox" checked="checked" id="logrem">  
            <span>Remember me</span>  
        </div>  
        <div>  
        <input type="submit" value="登陆" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:5px 0px;width:100%;">
        </div> 
        </form>            
    </div>  
</body>
</html>