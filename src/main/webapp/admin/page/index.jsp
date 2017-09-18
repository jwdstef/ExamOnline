<%@ page import="cc.ryanc.entity.ExamLibrary" %>
<%@ page import="cc.ryanc.dao.ExamLibraryDao" %>
<%@ page import="cc.ryanc.entity.ExamPaper" %>
<%@ page import="cc.ryanc.dao.ExamPaperDao" %><%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
	<head>
	   	<title>ExamOnline后台</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	   	<meta name="keywords" content="后台管理,ExamOnline后台">
	   	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon shortcut" type="image/ico" href="/admin/static/img/favicon.png">
	   	<meta name="renderer" content="webkit">
	    <meta http-equiv="Cache-Control" content="no-siteapp" />
	    <link rel="stylesheet" href="/admin/static/css/amazeui.min.css" />
	    <link rel="stylesheet" href="/admin/static/css/app.css">
	</head>
	<%
		ExamLibraryDao examLibraryDao = new ExamLibraryDao();
		int libCount = examLibraryDao.getCount();
	%>
	<body data-type="index" class="theme-black">
	    <div class="am-g tpl-g">
			<!-- 动态包含header头部 -->
			<jsp:include page="module/header.jsp" flush="true"/>
			<!-- 动态包含风格切换按钮 -->
			<%--<jsp:include page="theme.jsp" flush="true"/>--%>
			<!-- 动态包含左侧菜单 -->
			<jsp:include page="module/menu.jsp" flush="true"/>
	        <!-- 内容区域 -->
			<!-- 内容区域 -->
			<div class="tpl-content-wrapper">
				<div class="container-fluid am-cf">
					<div class="row">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
							<div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 首页概览 <small>Home Watching</small></div>
						</div>
					</div>
				</div>
				<div class="row-content am-cf">
					<div class="row  am-cf">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title am-fl">总题库量</div>
									<div class="widget-function am-fr">
										<a href="javascript:;" class="am-icon-cog"></a>
									</div>
								</div>
								<div class="widget-body am-fr">
									<div class="am-fl">
										<div class="widget-fluctuation-period-text">
											<%=libCount%>
											<a href="/ExamLibraryServlet" class="widget-fluctuation-tpl-btn">
												<i class="am-icon-calendar"></i>
												查看题库
											</a>
										</div>
									</div>
									<div class="am-fr am-cf">
										<div class="widget-fluctuation-description-amount text-success" am-cf>
											+2
										</div>
										<div class="widget-fluctuation-description-text am-text-right">
											本周新增
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
							<div class="widget widget-primary am-cf">
								<div class="widget-statistic-header">
									总试卷量
								</div>
								<div class="widget-statistic-body">
									<div class="widget-statistic-value">
										1
									</div>
									<div class="widget-statistic-description">
										本周新增 <strong>1</strong> 套
									</div>
								</div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
							<div class="widget widget-purple am-cf">
								<div class="widget-statistic-header">
									总用户量
								</div>
								<div class="widget-statistic-body">
									<div class="widget-statistic-value">
										16
									</div>
									<div class="widget-statistic-description">
										本周新增 <strong>2</strong> 人
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	    </div>
		<script src="/admin/static/js/jquery.min.js"></script>
		<script src="/admin/static/js/amazeui.min.js"></script>
		<!--<script src="/admin/static/js/pjax.min.js"></script>-->
        <script src="/admin/static/js/amazeui.datatables.min.js"></script>
		<script src="/admin/static/js/dataTables.responsive.min.js"></script>
		<script src="/admin/static/js/app.js"></script>
		<script>
			$.AMUI.progress.start();
			setTimeout(function() { $.AMUI.progress.done(); $('.fade').removeClass('out'); }, 1000);
		</script>
		<script type="text/javascript">
			/*
            <!-- 获取进度条对象 -->
            var progress = $.AMUI.progress.configure({ ease: 'ease', speed: 1000 });
            <!-- 设置pjax，刷新替换content里面的内容 -->
            $(document).pjax('a[target!=_blank]', '#content', {fragment: '#content',timeout: 8000});

            <!--发送请求的时候开始进度条-->
            $(document).on('pjax:send', function() {
                progress.start();
            });

            <!-- 响应完成的时候停止进度条 -->
            $(document).on('pjax:complete', function() {
                progress.done();
            });
            */
		</script>
	</body>
</html>
