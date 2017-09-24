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
	   	<title>ExamOnline-出题管理</title>
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
	                        <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 题库管理 <small>Subject Manager</small></div>
	                    </div>
	                </div>
	            </div>

				<div class="row-content am-cf">
					<div class="row">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title  am-cf">题库列表</div>
								</div>
								<div class="widget-body  am-fr">
									<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
										<div class="am-form-group">
											<div class="am-btn-toolbar">
												<div class="am-btn-group">
													<button type="button" class="am-btn am-btn-default am-btn-secondary am-radius" data-am-modal="{target: '#libadd', closeViaDimmer: 0, width: 400, height: 650}"><span class="am-icon-plus"></span> 新增</button>
													<button type="button" class="am-btn am-btn-default am-btn-success am-radius" data-am-modal="{target: '#exceladd', closeViaDimmer: 0, width: 400, height: 500}"><span class="am-icon-plus"></span> Excel导入</button>
												</div>
											</div>
										</div>
									</div>
									<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
										<div class="am-form-group tpl-table-list-select">
											<select data-am-selected="{btnSize: 'sm'}">
												<option value="0">所有科目</option>
												<option value="1">JavaWeb高级</option>
												<option value="2">.NET高级</option>
												<option value="3">PHP网页设计</option>
											</select>
										</div>
									</div>
									<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
										<form action="/StuServlet" method="post">
											<div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
												<input type="hidden" value="search" name="op">
												<input type="text" class="am-form-field" name="keyword">
												<span class="am-input-group-btn">
													<button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="submit"></button>
												</span>
											</div>
										</form>
									</div>
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
																<a href="/ExamLibraryServlet?op=detail&libId=<c:out value='${el.libId}'/>">
																	<i class="am-icon-pencil"></i> 查看详情
																</a>
																<a href="/ExamLibraryServlet?op=remove&libId=<c:out value='${el.libId}'/>" class="tpl-table-black-operation-del">
																	<i class="am-icon-trash"></i> 删除
																</a>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="am-u-lg-12 am-cf">
										<div class="am-fr">
											<ul class="am-pagination tpl-pagination">
												<li><a href="">«</a></li>
												<li><a href="">»</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="am-modal am-modal-no-btn" tabindex="-1" id="libadd">
				<div class="am-modal-dialog">
					<div class="am-modal-hd">题库添加
						<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
					</div>
					<div class="am-modal-bd">
						<form action="/ExamLibraryServlet" method="post" class="am-form">
							<input type="hidden" value="insert" name="op">
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="标题" name="libTitle">
							</div>
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="选项A" name="libA">
							</div>
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="选项B" name="libB">
							</div>
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="选项C" name="libC">
							</div>
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="选项D" name="libD">
							</div>
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="正确选项" name="libRight">
							</div>
							<div class="am-form-group">
								<select name="sub" id="sub">
									<option value="">科目</option>
									<option value="1">JavaWeb高级</option>
									<option value="2">.NET高级</option>
									<option value="3">PHP网页设计</option>
								</select>
							</div>
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="类型：1" name="type">
							</div>
							<div class="am-form-group">
								<select name="grade" id="grade">
									<option value="">年级</option>
									<option value="1">S1</option>
									<option value="2">S2</option>
									<option value="3">S3</option>
								</select>
							</div>
							<div class="am-form-group">
								<input type="submit" id="submit" class="am-btn am-btn-primary am-btn-block" value="添加">
								<a href="javascript:$('#stuadd').modal('close');" class="am-btn am-btn-default am-btn-block">取消</a>
							</div>
						</form>
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
