<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cc.ryanc.dao.ExamPaperLibsDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cc.ryanc.entity.ExamPaperLibs" %><%--
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
		<link rel="stylesheet" type="text/css" href="/static/css/paper.css">
		<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
		<!-- 进度条 -->
		<link rel="stylesheet" type="text/css" href="/static/css/nprogress.css">
		<script src='static/js/nprogress.js'></script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="content">
				<div class="examTitle">
					<h1>Java41第三月月考</h1>
				</div>
				<div class="examInfo">
					考生：
				</div>
				<div class="examPaper">
					<div class="examSubs">
						<c:forEach items="requestScope.examPaperLibss" var="epl">
								<div class="examSub_item">
									<div class="sub_title"><c:out value="${epl.examLibrary.libTitle}" /></div>
									<div class="sub_A">
										<input type="radio" name="choose"><c:out value="${epl.examLibrary.libA}" />
									</div>
									<div class="sub_B">
										<input type="radio" name="choose"><c:out value="${epl.examLibrary.libB}" />
									</div>
									<div class="sub_C">
										<input type="radio" name="choose"><c:out value="${epl.examLibrary.libC}" />
									</div>
									<div class="sub_D">
										<input type="radio" name="choose"><c:out value="${epl.examLibrary.libD}" />
									</div>
								</div>
								<br><br>
						</c:forEach>
					</div>
					<div class="examList">2</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="/static/js/jquery.min.js"></script>
	<script>
		NProgress.start();
		setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
	</script>
</html>
