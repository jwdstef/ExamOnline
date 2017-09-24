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
		<link rel="icon shortcut" type="image/ico" href="static/img/favicon.png">
		<link rel="stylesheet" type="text/css" href="static/css/style.css">
		<link rel="stylesheet" type="text/css" href="static/css/animate.min.css">
		<!-- 进度条 -->
		<link rel="stylesheet" type="text/css" href="static/css/nprogress.css">
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
			#user-top{
				width:800px;
				height:150px;
				float: left;
				border-radius: 5px;
				background-color: #ff1745;
			}
			#user-content{
				width:800px;
				height:250px;
				float: left;
				border-radius: 5px;
				background-color: #be95ff;
			}
			#user-pic{
				text-align: center;
			}
			#user-pic img{
				width:128px;
				height:128px;
				position: relative;
				top:-64px;
			}
			#user-pic h2{
				position: relative;
				top:-64px;
				color: whitesmoke;
			}
			#user-info{
				margin:0 auto;
				width:400px;
				width:250px;
				font-size:20px;
				text-align: center;
			}
		</style>
	</head>

	<body>
		<div id="user-main">
			<div id="user-top">
				<div id="user-pic">
					<img src="static/img/ryan0up.png">
					<h2>RYAN0UP</h2>
				</div>
			</div>
			<div id="user-content">
				<div id="user-info">
					<span id="user-name">姓名：RYAN0UP</span><br>
					<span id="user-no">学号：S00001</span><br>
					<span id="user-sex">性别：男</span><br>
					<span id="user-age">年龄：19</span><br>
					<span id="user-grade">年级：S3</span><br>
					<span id="user-class">班级：JAVA41</span>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script>
		NProgress.start();
		setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
        $('#user-name').addClass(' animated fadeInDown');
        setTimeout(function(){
            $('#user-no').addClass(' animated fadeInDown');
		},500);
	</script>
</html>
