<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link rel="stylesheet" type="text/css" href="static/css/mdui.min.css">
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
				background-color: skyblue;
				border-radius: 5px;
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
		</style>
	</head>

	<body>
		<div id="user-main" class="mdui-shadow-5 mdui-hoverable">
			<div class="mdui-card" style="opacity: 0.8">
				<!-- 卡片头部，包含头像、标题、副标题 -->
				<div class="mdui-card-media">
					<img src="static/img/back.jpg" style="width: 800px; height: 400px"/>
					<div class="mdui-card-media-covered mdui-card-media-covered-top">
						<div class="stuform" style="width: 500px; margin:0 auto">
							<form action="/StuServlet" method="post" style="color: white" id="myform">
								<input type="hidden" value="userupdate" name="op" >
								<div class="mdui-textfield mdui-textfield-floating-label">
									<label class="mdui-textfield-label">学号</label>
									<input name = "stuno" class="mdui-textfield-input" type="text" value="<c:out value="${sessionScope.stuInfo.stuNo}" />" disabled/>
								</div>
								<div class="mdui-textfield mdui-textfield-floating-label">
									<label class="mdui-textfield-label">姓名</label>
									<input name="stuname" class="mdui-textfield-input" type="text" value="<c:out value="${sessionScope.stuInfo.stuName}" />"/>
								</div>
								<div class="mdui-textfield mdui-textfield-floating-label">
									<label class="mdui-textfield-label">性别</label>
									<input name="stusex" class="mdui-textfield-input" type="text" value="<c:out value="${sessionScope.stuInfo.stuSex}" />"/>
								</div>
								<div class="mdui-textfield mdui-textfield-floating-label">
									<label class="mdui-textfield-label">年龄</label>
									<input name="stuage" class="mdui-textfield-input" type="text" value="<c:out value="${sessionScope.stuInfo.stuAge}" />"/>
								</div>
								<div class="mdui-textfield mdui-textfield-floating-label">
									<label class="mdui-textfield-label">新密码</label>
									<input name="stupwd" class="mdui-textfield-input" type="password"/>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="mdui-card-actions">
					<button class="mdui-btn mdui-ripple" onclick="checkUser();">提交</button>
					<a href="user.jsp" class="mdui-btn mdui-ripple">返回</a>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/mdui.min.js"></script>
	<script>
		NProgress.start();
		setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
	</script>
	<script>
        function checkUser(){
            document.getElementById("myform").submit();
        }
	</script>
</html>
