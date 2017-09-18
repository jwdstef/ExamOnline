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
	<%
		ExamPaperLibsDao examPaperLibsDao = new ExamPaperLibsDao();
		ArrayList<ExamPaperLibs> examPaperLibss = examPaperLibsDao.getQuery();
	%>
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
						<%
							for(ExamPaperLibs examPaperLibs:examPaperLibss){
						%>
								<div>
									<div>
										<%=examPaperLibs.getExamLibrary().getLibTitle()%>
									</div>
									<div>
										<input type="radio"><%=examPaperLibs.getExamLibrary().getLibA()%>
										<input type="radio"><%=examPaperLibs.getExamLibrary().getLibB()%>
										<input type="radio"><%=examPaperLibs.getExamLibrary().getLibB()%>
										<input type="radio"><%=examPaperLibs.getExamLibrary().getLibC()%>
									</div>
								</div>
						<%
							}
						%>
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
