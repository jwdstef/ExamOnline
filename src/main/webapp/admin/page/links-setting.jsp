<%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 下午11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>ExamOnline-友情链接</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="keywords" content="后台管理,ExamOnline后台">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="icon shortcut" type="image/ico" href="../static/img/favicon.png">
        <link rel="stylesheet" href="../static/css/amazeui.min.css" />
        <link rel="stylesheet" href="../static/css/app.css">
        <script src="../static/js/jquery.min.js"></script>
        <script src="../static/js/amazeui.min.js"></script>
        <script src="../static/js/pjax.min.js"></script>
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
                            <div class="page-header-heading"><span class="am-icon-link page-header-heading-icon"></span> 友情链接 <small>Links Manager</small></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/admin/static/js/amazeui.datatables.min.js"></script>
        <script src="../static/js/dataTables.responsive.min.js"></script>
        <script src="../static/js/app.js"></script>
        <script>
            $.AMUI.progress.start();
            setTimeout(function() { $.AMUI.progress.done(); $('.fade').removeClass('out'); }, 1000);
        </script>
    </body>
</html>
