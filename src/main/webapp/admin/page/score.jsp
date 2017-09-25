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
    <title>ExamOnline-分数查看</title>
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
                    <div class="page-header-heading"><span class="am-icon-circle page-header-heading-icon"></span> 分数查看 <small>Index Of Score</small></div>
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
                            <div class="am-u-sm-12">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>试卷名</th>
                                        <th>考生</th>
                                        <th>年级</th>
                                        <th>班级</th>
                                        <th>科目</th>
                                        <th>教员</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>用时</th>
                                        <th>得分</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.scores}" var="s">
                                            <tr>
                                                <td><c:out value="${s.scoreId}" /></td>
                                                <td><c:out value="${s.examPaper.paperName}" /></td>
                                                <td><c:out value="${s.stuInfo.stuName}" /></td>
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
