<%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
	   	<title>ExamOnline-班级管理</title>
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
	                        <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 班级管理 <small>Class Manager</small></div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="row-content am-cf">
					<div class="row">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title  am-cf">班级列表</div>
								</div>
								<div class="widget-body  am-fr">

									<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
										<div class="am-form-group">
											<div class="am-btn-toolbar">
												<div class="am-btn-group">
													<button type="button" class="am-btn am-btn-default am-btn-primary am-radius" data-am-modal="{target: '#classadd', closeViaDimmer: 0, width: 400, height: 500}"><span class="am-icon-plus"></span> 新增</button>
												</div>
											</div>
										</div>
									</div>
									<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
										<div class="am-form-group tpl-table-list-select">
											<select data-am-selected="{btnSize: 'sm'}">
											<option value="option1">所有年级</option>
												<option value="option2">S1</option>
												<option value="option3">S2</option>
												<option value="option3">S3</option>
											</select>
										</div>
									</div>
									<div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
										<div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
											<input type="text" class="am-form-field ">
											<span class="am-input-group-btn">
												<button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button"></button>
											</span>
										</div>
									</div>

									<div class="am-u-sm-12">
										<table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
											<thead>
												<tr>
													<th>班级名称</th>
													<th>阶段</th>
													<th>班主任</th>
													<th>教员</th>
													<th>人数</th>
													<th>入学时间</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.classInfos}" var="ci">
													<tr>
														<td><c:out value="${ci.className}" /></td>
														<td><c:out value="${ci.gradeInfo.gradeName}" /></td>
														<td><c:out value="${ci.master}" /></td>
														<td><c:out value="${ci.teacher}" /></td>
														<td><c:out value="${ci.number}" /></td>
														<td><c:out value="${ci.classBegin}" /></td>
														<td>
															<div class="tpl-table-black-operation">
																<a href="javascript:;">
																	<i class="am-icon-pencil"></i> 编辑
																</a>
																<a href="/ClassServlet?op=remove&classId=<c:out value='${ci.classId}' />" class="tpl-table-black-operation-del">
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
												<li><a href="/ClassServlet?pageNo=${requestScope.pm.getIndex()}">首页</a></li>
												<li><a href="/ClassServlet?pageNo=${requestScope.pm.getPagePre()}">上页</a></li>
												<li><a href="/ClassServlet?pageNo=${requestScope.pm.getPageNext()}">下页</a></li>
												<li><a href="/ClassServlet?pageNo=${requestScope.pm.getPageTotal()}">尾页</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	        </div>
	        <div class="am-modal am-modal-no-btn" tabindex="-1" id="classadd">
	          <div class="am-modal-dialog">
	            <div class="am-modal-hd">添加班级
	              <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
	            </div>
	            <div class="am-modal-bd">
	              <form action="#" method="get" class="am-form">
	                <div class="am-form-group">
	                    <input type="text" id="class-name" placeholder="班级名称">
	                </div>
	                <div class="am-form-group">
	                    <input type="text" id="class-master" placeholder="班主任">
	                </div>
	                <div class="am-form-group">
	                    <input type="text" id="class-teacher" placeholder="教员">
	                </div>
	                <div class="am-form-group">
	                    <input type="text" id="class-level" placeholder="阶段">
	                </div>
	                <div class="am-form-group">
	                    <input type="text" id="class-nums" placeholder="人数">
	                </div>
	                <div class="am-form-group">
	                    <input type="text" id="class-nums" placeholder="入学时间">
	                </div>
	                <div class="am-form-group">
	                    <button type="button" class="am-btn am-btn-primary am-btn-block">添加</button>
	                    <button type="button" class="am-btn am-btn-default am-btn-block">取消</button>
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
