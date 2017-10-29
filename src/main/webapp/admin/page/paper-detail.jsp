<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<!DOCTYPE HTML>
<html>
	<head>
	   	<title>ExamOnline-试卷详情</title>
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
	                        <div class="page-header-heading"><span class="am-icon-table page-header-heading-icon"></span> 组卷 <small>Build Subject</small></div>
	                    </div>
	                </div>
	            </div>

				<div class="row-content am-cf">
					<div class="row">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title  am-cf">题目编辑</div>
								</div>
								<div class="widget-body  am-fr">
									<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
										<form action="/ExamPaperLibsServlet" method="post">
											<div class="am-form-group tpl-table-list-select" style="text-align: left">
												<select data-am-selected="{btnSize: 'lx'}">
													<option value="0">所有科目</option>
													<option value="1">JavaWeb高级</option>
													<option value="2">.NET高级</option>
													<option value="3">PHP网页设计</option>
												</select>
												<button type="submit" class="am-btn am-btn-default am-btn-secondary am-radius" disabled><span class="am-icon-plus"></span>随机10题</button>
											</div>
										</form>
									</div>
									<div class="am-u-sm-12">
										<table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
											<thead>
											<tr>
												<th>编号</th>
												<th>试卷名称</th>
												<th>题目</th>
												<th>选项A</th>
												<th>选项B</th>
												<th>选项C</th>
												<th>选项D</th>
												<th>正确选项</th>
												<th>操作</th>
											</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.examPaperLibss}" var="epl">
													<tr>
														<td><c:out value="${epl.examLibrary.libId}" /></td>
														<td><c:out value="${epl.examPaper.paperName}" /></td>
														<td><c:out value="${epl.examLibrary.libTitle}" /></td>
														<td><c:out value="${epl.examLibrary.libA}" /></td>
														<td><c:out value="${epl.examLibrary.libB}" /></td>
														<td><c:out value="${epl.examLibrary.libC}" /></td>
														<td><c:out value="${epl.examLibrary.libD}" /></td>
														<td><c:out value="${epl.examLibrary.libRight}" /></td>
														<td>
															<div class="tpl-table-black-operation">
																<a href="/ExamLibraryServlet?op=detail&libId=<c:out value='${epl.examPaper.paperId}'/>">
																	<i class="am-icon-pencil"></i> 查看详情
																</a>
																<a href="/ExamPaperServlet?op=remove&paperId=<c:out value='${ep.paperId}' />" class="tpl-table-black-operation-del">
																	<i class="am-icon-trash"></i> 删除
																</a>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<!-- 题库列表 -->
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title  am-cf">题库列表</div>
								</div>
								<div class="widget-body  am-fr">
									<div class="am-u-sm-12">
										<table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
											<thead>
											<tr>
												<th>编号</th>
												<th>科目</th>
												<th>类型</th>
												<th>题目</th>
												<th>阶段</th>
												<th>操作</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach items="${requestScope.examLibraries}" var="el">
												<tr>
													<td><c:out value="${el.libId}" /></td>
													<td><c:out value="${el.subject.subName}" /></td>
													<td><c:out value="${el.libtype}" /></td>
													<td><c:out value="${el.libTitle}" /></td>
													<td><c:out value="${el.gradeInfo.gradeName}" /></td>
													<td>
														<div class="tpl-table-black-operation">
															<a href="/ExamPaperLibsServlet?op=add&libId=<c:out value="${el.libId}" />&paperId=1" class="tpl-table-black-operation-del">
																<i class="am-icon-trash"></i> 添加到当前试卷
															</a>
														</div>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
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
