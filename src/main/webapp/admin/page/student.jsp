<%@ page import="cc.ryanc.entity.StuInfo" %>
<%@ page import="cc.ryanc.util.PageModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cc.ryanc.dao.ClassDao" %>
<%@ page import="cc.ryanc.entity.ClassInfo" %>
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
	   	<title>ExamOnline-学生管理</title>
	   
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
	   	<meta name="keywords" content="后台管理,ExamOnline后台">
	   	<meta name="viewport" content="width=device-width, initial-scale=1">
	   	<meta name="renderer" content="webkit">
	    <meta http-equiv="Cache-Control" content="no-siteapp" />
	    <link rel="stylesheet" href="/admin/static/css/amazeui.min.css" />
	    <link rel="stylesheet" href="/admin/static/css/app.css">
	
	    <script src="/admin/static/js/jquery.min.js"></script>
	    <script src="/admin/static/js/amazeui.min.js"></script>
	    <script src="/admin/static/js/pjax.min.js"></script>
		<script type="text/javascript">
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
    	</script>
	</head>
		<%
			PageModel<StuInfo> pm = (PageModel<StuInfo>)request.getAttribute("stu");
			ArrayList<StuInfo> stuInfos = null;
			if(pm== null){
				pm = new PageModel<StuInfo>();
			}
			stuInfos = pm.getAll();
		%>
		<%
			ClassDao classDao = new ClassDao();
			ArrayList<ClassInfo> classDaos = classDao.getQuery();
		%>
	<body data-type="index">
	    <script src="/admin/static/js/theme.js"></script>
	    <div class="am-g tpl-g">
			<!-- 动态包含header头部 -->
			<jsp:include page="header.jsp" flush="true"/>
			<!-- 动态包含风格切换按钮 -->
			<jsp:include page="theme.jsp" flush="true"/>
			<!-- 动态包含左侧菜单 -->
			<jsp:include page="menu.jsp" flush="true"/>
	        <!-- 内容区域 -->
	        <div class="tpl-content-wrapper" id="content">
	            <div class="container-fluid am-cf">
	                <div class="row">
	                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
	                        <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 学生管理 <small>Student Manager</small></div>
	                    </div>
	                </div>
	            </div>
	
	            <div class="row-content am-cf">
					<div class="row">
						<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title  am-cf">学生列表</div>
								</div>
								<div class="widget-body  am-fr">

									<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
										<div class="am-form-group">
											<div class="am-btn-toolbar">
												<div class="am-btn-group">
													<button type="button" class="am-btn am-btn-default am-btn-primary am-radius" data-am-modal="{target: '#stuadd', closeViaDimmer: 0, width: 400, height: 500}"><span class="am-icon-plus"></span> 新增</button>
												</div>
											</div>
										</div>
									</div>
									<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
										<div class="am-form-group tpl-table-list-select">
											<select data-am-selected="{btnSize: 'sm'}">
											<option value="option1">所有班级</option>
												<option value="option2">T394</option>
												<option value="option3">T395</option>
												<option value="option3">T396</option>
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
													<th>学号</th>
													<th>姓名</th>
													<th>性别</th>
													<th>年龄</th>
													<th>阶段</th>
													<th>班级</th>
													<th>入学时间</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<%
													for(StuInfo stu:stuInfos){
												%>
														<tr>
															<td><%=stu.getStuNo()%></td>
															<td><%=stu.getStuName()%></td>
															<td><%=stu.getStuSex()%></td>
															<td><%=stu.getStuAge()%></td>
															<td><%=stu.getClassInfo().getGradeInfo().getGradeName()%></td>
															<td><%=stu.getClassInfo().getClassName()%></td>
															<td><%=stu.getClassInfo().getClassBegin()%></td>
															<td>
																<div class="tpl-table-black-operation">
																	<a href="javascript:;">
																		<i class="am-icon-pencil"></i> 编辑
																	</a>
																	<a href="/StuServlet?op=remove&stuId=<%=stu.getStuId()%>" class="tpl-table-black-operation-del">
																		<i class="am-icon-trash"></i> 删除
																	</a>
																</div>
															</td>
														</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
									<div class="am-u-lg-12 am-cf">
										<div class="am-fr">
											<ul class="am-pagination tpl-pagination">
												<li><a href="/StuServlet?pageNo=<%=pm.getPagePre()%>">«</a></li>
												<li class="am-active"><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">5</a></li>
												<li><a href="/StuServlet?pageNo=<%=pm.getPageNext()%>">»</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	        </div>
			<div class="am-modal am-modal-no-btn" tabindex="-1" id="stuadd">
				<div class="am-modal-dialog">
					<div class="am-modal-hd">添加学生
						<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
					</div>
					<div class="am-modal-bd">
						<form action="/StuServlet" method="post" class="am-form">
							<input type="hidden" value="insert" name="op">
							<div class="am-form-group">
								<select name="classid" id="classid">
									<option value="">选择班级</option>
									<%
										for(ClassInfo classInfo:classDaos){
									%>
											<option value="<%=classInfo.getClassId()%>">
												<%=classInfo.getClassName()%>
											</option>
									<%
										}
									%>
								</select>
							</div>
							<div class="am-form-group">
								<input type="text" class="am-disabled" placeholder="年级">
							</div>
							<div class="am-form-group">
								<input type="text" placeholder="学号" name="stuno" id="stuno">
							</div>
							<div class="am-form-group">
								<input type="text" placeholder="姓名" name="stuname" id="stuname">
							</div>
							<div class="am-form-group">
								<select name="stusex" id="stusex">
									<option value="">性别</option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="am-form-group">
								<input type="number" placeholder="年龄" name="stuage" id="stuage">
							</div>
							<div class="am-form-group">
								<input type="submit" id="submit" class="am-btn am-btn-primary am-btn-block" value="添加">
								<a href="javascript:$('#stuadd').modal('close');" class="am-btn am-btn-default am-btn-block">取消</a>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- 提示模态框 -->
			<div class="am-modal am-modal-alert" tabindex="-1" id="msg">
				<div class="am-modal-dialog">
					<div class="am-modal-hd">提示</div>
					<div class="am-modal-bd">
						请输入完整信息！
					</div>
					<div class="am-modal-footer">
						<span class="am-modal-btn">确定</span>
					</div>
				</div>
			</div>
	    </div>
		<script src="/admin/static/js/amazeui.datatables.min.js"></script>
	    <script src="/admin/static/js/dataTables.responsive.min.js"></script>
	    <script src="/admin/static/js/app.js"></script>
		<script>
			$('#stuadd').submit(function(){
			    var classid = $('#classid').val();
			    var no = $('#stuno').val();
			    var name = $('#stuname').val();
			    var sex = $('#stusex').val();
			    var age = $('#stuage').val();
                if(classid==""||no==""||name==""||sex==""||age=="") {
                    $('#msg').modal();
                    return false;
                }
			})
		</script>
	</body>
</html>