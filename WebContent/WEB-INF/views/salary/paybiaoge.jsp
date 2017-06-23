<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>支出报表</title>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
</head>
<body>
<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
<script language="javascript">
	   var chart = {
	       plotBackgroundColor: null,
	       plotBorderWidth: null,
	       plotShadow: false
	   };
	   var title = {
	      text: '支出管理'   
	   };      
	   var tooltip = {
	      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	   };
	   var plotOptions = {
	      pie: {
	         allowPointSelect: true,
	         cursor: 'pointer',
	         dataLabels: {
	            enabled: true,
	            format: '<b>{point.name}%</b>: {point.percentage:.1f} %',
	            style: {
	               color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	            }
	         }
	      }
	   };
	   var series= [{
	      //图表类型为饼状图
		  type: 'pie',
		  //当鼠标移到图表上时的提示信息
	      name: '各个支出类别所占用的资金比例'
	   }]; 

$(document).ready(function() {  
	$.ajax({
		type:'GET',
		url:"<%=path%>/pay/getChartsPie",
		dataType:"json",
		success:function(data){
			   alert(data.pays);
			   var json ={};   
			   json.chart = chart; 
			   json.title = title;     
			   json.tooltip = tooltip;
			   json.series = series;
			   json.series[0].data = data.pays;
			   json.plotOptions = plotOptions;
			   $('#container').highcharts(json);
		},
		error:function(e){
			alert("显示失败");
		}
	})
});
	
</script>
</body>
</html>
