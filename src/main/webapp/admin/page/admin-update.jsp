<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/17
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>ExamOnline-修改信息</title>
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
            <!-- 动态包含风格切换按钮 -->
            <%--<jsp:include page="theme.jsp" flush="true"/>--%>
            <!-- 动态包含左侧菜单 -->
            <jsp:include page="module/menu.jsp" flush="true"/>
            <!-- 内容区域 -->
            <div class="tpl-content-wrapper" id="content">
                <div class="container-fluid am-cf">
                    <div class="row">
                        <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                            <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 管理员账号 <small>Administrator</small></div>
                        </div>
                    </div>
                </div>
                <div class="row-content am-cf">
                    <div class="row">
                        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                            <div class="widget am-cf">
                                <div class="widget-head am-cf">
                                    <div class="widget-title  am-cf">修改信息</div>
                                </div>
                                <div class="widget-body  am-fr">
                                    <form action="/AdminServlet" method="post" class="am-form tpl-form-border-form" id="adminupdate">
                                        <input type="hidden" value="update" name="op">
                                        <div class="am-form-group">
                                            <label for="adminId" class="am-u-sm-12 am-form-label am-text-left">编号</label>
                                            <div class="am-u-sm-12">
                                                <input type="text" class="tpl-form-input am-margin-top-xs" name="adminId" id="adminId" value="${requestScope.adminInfo.adminId}">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="adminName" class="am-u-sm-12 am-form-label  am-text-left">用户名</label>
                                            <div class="am-u-sm-12 am-margin-top-xs">
                                                <input type="text" class="tpl-form-input am-margin-top-xs" name="adminName" id="adminName" value="${requestScope.adminInfo.adminName}">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="adminEmail" class="am-u-sm-12 am-form-label am-text-left">邮箱</label>
                                            <div class="am-u-sm-12">
                                                <input type="text" class="tpl-form-input am-margin-top-xs" name="adminEmail" id="adminEmail" value="${requestScope.adminInfo.adminEmail}">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="adminPwd" class="am-u-sm-12 am-form-label am-text-left">新密码</label>
                                            <div class="am-u-sm-12">
                                                <input type="password" class="tpl-form-input am-margin-top-xs" name="adminPwd" id="adminPwd">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="adminRePwd" class="am-u-sm-12 am-form-label am-text-left">确认密码</label>
                                            <div class="am-u-sm-12">
                                                <input type="password" class="tpl-form-input am-margin-top-xs" name="adminRePwd" id="adminRePwd">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <div class="am-u-sm-12 am-u-sm-push-12">
                                                <button type="submit" id="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">更新</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 提示模态框 -->
            <div class="am-modal am-modal-alert" tabindex="-1" id="msg">
                <div class="am-modal-dialog">
                    <div class="am-modal-hd">提示</div>
                    <div class="am-modal-bd">
                        两次密码不一致！
                    </div>
                    <div class="am-modal-footer">
                        <span class="am-modal-btn">确定</span>
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

            $('#adminupdate').submit(function(){
                var adminPwd = $('#adminPwd').val();
                var adminRePwd = $('#adminRePwd').val();
                if(adminPwd!==adminRePwd){
                    $('#msg').modal();
                    return false;
                }
            })
        </script>
    </body>
</html>
