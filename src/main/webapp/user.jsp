<%@ page import="cc.ryanc.entity.StuInfo" %><%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>个人中心</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="/static/css/style.css">
		<!-- 进度条 -->
		<link rel="stylesheet" type="text/css" href="/static/css/nprogress.css">
		<script src='static/js/nprogress.js'></script>
		<style>
			#user-main{
				width: 800px;
				height: 400px;
				position: absolute;
				left: 50%;
				top: 50%;
				margin-left:-400px;
				margin-top:-200px;
				background-color: #3C7780;
				border-radius: 5px;
			}
		</style>
	</head>

	<body>
		<div id="user-main">
			1
		</div>
	</body>
	<script type="text/javascript" src="/static/js/jquery.min.js"></script>
	<script>
		NProgress.start();
		setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
	</script>
</html>
