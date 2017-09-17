<%--
  Created by IntelliJ IDEA.
  User: RYAN0UP
  Date: 2017/9/13
  Time: 9:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>管理员登陆</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="keywords" content="后台管理,ExamOnline后台">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="static/css/amazeui.min.css" />
        <link rel="stylesheet" href="static/css/style.css" />
    </head>
    <body>
        <div class="am-g container">
            <div class="main">
                <div class="main-content">
                    <div class="main-login-logo"></div>
                    <form action="/AdminServlet" method="post" class="am-form">
                        <input type="hidden" value="login" name="op">
                        <div class="am-form-group">
                            <input type="text" class="login-input" name="adminname" placeholder="请输入账号">
                        </div>
                        <div class="am-form-group">
                            <input type="password" class="login-input" name="adminpwd" placeholder="请输入密码">
                        </div>
                        <div class="am-form-group">
                            <input id="remember-me" type="checkbox">
                            <label for="remember-me" class="remember-me">
                                记住密码
                            </label>
                            <a href="#">
                                <span id="forget-pwd">忘记密码</span>
                            </a>
                        </div>
                        <div class="am-form-group">
                            <button type="submit" class="am-btn am-btn-lg am-btn-primary am-btn-block btn-submit">
                                登录
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="static/js/jquery.min.js"></script>
        <script src="static/js/amazeui.min.js"></script>
    </body>
    <script>
        $.AMUI.progress.start();
        setTimeout(function() { $.AMUI.progress.done(); $('.fade').removeClass('out'); }, 1000);
    </script>
</html>
