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
	   	<title>ExamOnline-题目详情</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
	   	<meta name="keywords" content="后台管理,ExamOnline后台">
	   	<meta name="viewport" content="width=device-width, initial-scale=1">
	   	<meta name="renderer" content="webkit">
	    <meta http-equiv="Cache-Control" content="no-siteapp" />
	    <link rel="stylesheet" href="/admin/static/css/amazeui.min.css" />
	    <link rel="stylesheet" href="/admin/static/css/app.css">
	</head>
	<body class="theme-black">
	    <div class="am-g tpl-g">
			<!-- 动态包含header头部 -->
			<jsp:include page="module/header.jsp" flush="true"/>
			<!-- 动态包含左侧菜单 -->
			<jsp:include page="module/menu.jsp" flush="true"/>
	        <!-- 内容区域 -->
	        <div class="tpl-content-wrapper" id="content">
	            <div class="container-fluid am-cf">
	                <div class="row">
	                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
	                        <div class="page-header-heading"><span class="am-icon-book page-header-heading-icon"></span> 题库管理 <small>Subject Manager</small></div>
	                    </div>
	                </div>
	            </div>

				<div class="row-content am-cf">
					<div class="row">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title  am-cf">题目详情</div>
								</div>
								<div class="widget-body  am-fr">
									<form action="/ExamLibraryServlet" method="post" class="am-form tpl-form-border-form">
										<input type="hidden" value="update" name="op">
										<div class="am-form-group">
											<label for="id" class="am-u-sm-12 am-form-label am-text-left">编号</label>
											<div class="am-u-sm-12">
												<input type="text" class="tpl-form-input am-margin-top-xs" name="id" id="id" value="${requestScope.examLibrary.libId}" disabled>
											</div>
										</div>
										<div class="am-form-group">
											<label for="title" class="am-u-sm-12 am-form-label  am-text-left">题目</label>
											<div class="am-u-sm-12 am-margin-top-xs">
												<textarea class="" rows="10" id="title" name="title">${requestScope.examLibrary.libTitle}</textarea>
											</div>
										</div>
										<div class="am-form-group">
											<label for="libA" class="am-u-sm-12 am-form-label am-text-left">选项A</label>
											<div class="am-u-sm-12">
												<input type="text" class="tpl-form-input am-margin-top-xs" name="libA" id="libA" value="${requestScope.examLibrary.libA}">
											</div>
										</div>
										<div class="am-form-group">
											<label for="libB" class="am-u-sm-12 am-form-label am-text-left">选项B</label>
											<div class="am-u-sm-12">
												<input type="text" class="tpl-form-input am-margin-top-xs" name="libB" id="libB" value="${requestScope.examLibrary.libB}">
											</div>
										</div>
										<div class="am-form-group">
											<label for="libC" class="am-u-sm-12 am-form-label am-text-left">选项C</label>
											<div class="am-u-sm-12">
												<input type="text" class="tpl-form-input am-margin-top-xs" name="libC" id="libC" value="${requestScope.examLibrary.libC}">
											</div>
										</div>
										<div class="am-form-group">
											<label for="libD" class="am-u-sm-12 am-form-label am-text-left">选项D</label>
											<div class="am-u-sm-12">
												<input type="text" class="tpl-form-input am-margin-top-xs" name="libD" id="libD" value="${requestScope.examLibrary.libD}">
											</div>
										</div>
										<div class="am-form-group">
											<label for="libRight" class="am-u-sm-12 am-form-label am-text-left">正确选项(多选用,隔开)</label>
											<div class="am-u-sm-12">
												<input type="text" class="tpl-form-input am-margin-top-xs" name="libRight" id="libRight" value="${requestScope.examLibrary.libRight}">
											</div>
										</div>
										<div class="am-form-group tpl-table-list-select" style="text-align: left">
											<label class="am-u-sm-12 am-form-label am-text-left">所属科目</label>
											<div class="am-u-sm-12">
												<select data-am-selected="{btnSize: 'sm'}" name="subId">
													<option value="1">JavaWeb高级</option>
													<option value="2">.NET高级</option>
													<option value="3">PHP网页设计</option>
												</select>
											</div>
										</div>

										<div class="am-form-group tpl-table-list-select" style="text-align: left">
											<label class="am-u-sm-12 am-form-label am-text-left">所属年级</label>
											<div class="am-u-sm-12">
												<select data-am-selected="{btnSize: 'sm'}" name = "gradeId">
													<option value="1">S1</option>
													<option value="2">S2</option>
													<option value="3">S3</option>
												</select>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-12 am-u-sm-push-12">
												<button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">更新</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="/admin/static/js/jquery.min.js"></script>
		<script src="/admin/static/js/amazeui.min.js"></script>
		<script src="/admin/static/js/pjax.min.js"></script>
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
