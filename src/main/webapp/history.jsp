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
	   	<title>历史试卷</title>
	   	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="icon shortcut" type="image/ico" href="static/img/favicon.png">
		<link rel="stylesheet" type="text/css" href="static/css/mdui.min.css">
		<!-- 进度条 -->
		<link rel="stylesheet" type="text/css" href="static/css/nprogress.css">
		<script src='static/js/nprogress.js'></script>
	</head>
	<body>
		<div class="mdui-appbar">
			<div class="mdui-toolbar mdui-color-theme">
				<a href="/ScoreServlet" class="mdui-typo-headline">历史试卷</a>
				<div class="mdui-toolbar-spacer"></div>
				<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
				<a href="/ScoreServlet" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
				<a href="index.jsp" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">home</i></a>
			</div>
		</div>
		<div class="mdui-table-fluid">
			<table class="mdui-table mdui-table-hoverable" style="cursor: pointer">
				<thead>
				<tr>
					<th>#</th>
					<th>试卷名</th>
					<th>年级</th>
					<th>班级</th>
					<th>科目</th>
					<th>教员</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>考试时间</th>
					<th>得分</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.scores}" var="s">
						<tr>
							<td><c:out value="${s.scoreId}" /></td>
							<td><c:out value="${s.examPaper.paperName}" /></td>
							<td><c:out value="${s.stuInfo.classInfo.gradeInfo.gradeName}" /></td>
							<td><c:out value="${s.stuInfo.classInfo.className}" /></td>
							<td><c:out value="JAVA" /></td>
							<td><c:out value="${s.stuInfo.classInfo.teacher}" /></td>
							<td><c:out value="${s.examPaper.beginTime}" /></td>
							<td><c:out value="${s.examPaper.endTime}" /></td>
							<td><c:out value="60" /></td>
							<td><c:out value="${s.score}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
	<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="static/js/mdui.min.js"></script>
	<script>
		NProgress.start();
		setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
	</script>
</html>
