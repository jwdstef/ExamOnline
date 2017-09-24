<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>当前考试</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="icon shortcut" type="image/ico" href="/static/img/favicon.png">
		<link rel="stylesheet" type="text/css" href="/static/css/mdui.min.css">
		<link rel="stylesheet" type="text/css" href="/static/css/paper.css">
		<!-- 进度条 -->
		<link rel="stylesheet" type="text/css" href="/static/css/nprogress.css">
	</head>
	<body>
	<div id="examMain">
		<div id="examTitle">
			<h1>JAVA41第一次月考</h1>&emsp;
			<span id="stuName">姓名：汪瑞原</span>&emsp;
			<span id="examClass">班级：JAVA41</span>&emsp;
			<span id="examScore">总分：100</span>&emsp;
			<span id="examTime">剩余时间：45:00</span>&emsp;
		</div>
		<div id="examContent">
			<%int i=1;%>
			<c:forEach items="${requestScope.examPaperLibss}" var="epl">
				<div id="libitems">
					<div id="libTitle">
						<span><%=i%><c:out value="${epl.examLibrary.libTitle}" /></span>
					</div>
					<div id="libABCD">
						<form>
							<label class="mdui-radio">
								<input type="radio" name="group1"/>
								<i class="mdui-radio-icon"></i>
								<c:out value="${epl.examLibrary.libA}" />
							</label><br>
							<label class="mdui-radio">
								<input type="radio" name="group1"/>
								<i class="mdui-radio-icon"></i>
								<c:out value="${epl.examLibrary.libB}" />
							</label><br>
							<label class="mdui-radio">
								<input type="radio" name="group1"/>
								<i class="mdui-radio-icon"></i>
								<c:out value="${epl.examLibrary.libC}" />
							</label><br>
							<label class="mdui-radio">
								<input type="radio" name="group1"/>
								<i class="mdui-radio-icon"></i>
								<c:out value="${epl.examLibrary.libD}" />
							</label><br>
						</form>
					</div>
				</div>
				<%i++;%>
			</c:forEach>
		</div>
	</div>
	</body>
	<script type="text/javascript" src="/static/js/jquery.min.js"></script>
	<script src='/static/js/nprogress.js'></script>
	<script type="text/javascript" src="/static/js/mdui.min.js"></script>
	<script>
		NProgress.start();
		setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
	</script>
</html>
