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
        <title>ExamOnline-网站设置</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="keywords" content="后台管理,ExamOnline后台">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="icon shortcut" type="image/ico" href="/admin/static/img/favicon.png">
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
                            <div class="page-header-heading">
                                <span class="am-icon-home page-header-heading-icon"></span>
                                网站设置 <small>Site Setting</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row-content am-cf">
                    <div class="row">
                        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                            <div class="widget am-cf">
                                <div class="widget-head am-cf">
                                    <div class="widget-title am-fl">基本设置</div>
                                    <div class="widget-function am-fr">
                                        <a href="javascript:;" class="am-icon-cog"></a>
                                    </div>
                                </div>
                                <div class="widget-body am-fr">
                                    <form class="am-form tpl-form-border-form">
                                        <div class="am-form-group">
                                            <label for="site-title" class="am-u-sm-12 am-form-label am-text-left">首页标题</label>
                                            <div class="am-u-sm-12">
                                                <input type="text" class="tpl-form-input am-margin-top-xs" id="site-title" placeholder="请输入标题文字">
                                                <small>尽量简短</small>
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <label for="site-url" class="am-u-sm-12 am-form-label am-text-left">首页URL</label>
                                            <div class="am-u-sm-12">
                                                <input type="text" class="tpl-form-input am-margin-top-xs" id="site-url" placeholder="http://">
                                                <small>必须加上http://或者https://</small>
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label class="am-u-sm-12 am-form-label  am-text-left">SEO关键字 <span class="tpl-form-line-small-title">SEO</span></label>
                                            <div class="am-u-sm-12">
                                                <input type="text" class="am-margin-top-xs" id="words" placeholder="输入SEO关键字">
                                                <small>多个以,隔开</small>
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label class="am-u-sm-12 am-form-label  am-text-left">站点描述 <span class="tpl-form-line-small-title">SEO</span></label>
                                            <div class="am-u-sm-12">
                                                <input type="text" class="am-margin-top-xs" id="desc" placeholder="请输入站点描述">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label class="am-u-sm-12 am-form-label am-text-left">站点地图 <span class="tpl-form-line-small-title">SEO</span></label>
                                            <div class="am-u-sm-12">
                                                <input type="text" class="am-margin-top-xs" id="desc" placeholder="请输入站点地图路径" value="/sitemap.xml">
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">favicon图标</label>
                                            <div class="am-u-sm-12">
                                                <input type="text" id="user-weibo" class="am-margin-top-xs" placeholder="点击下面的上传按钮上传">
                                                <small>浏览器标签栏的小图标</small>
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">版权信息</label>
                                            <div class="am-u-sm-12">
                                                <input type="text" id="user-weibo" class="am-margin-top-xs" placeholder="如：Copyright © 2016 - 2017">
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="user-weibo" class="am-u-sm-12 am-form-label  am-text-left">ICP备案号</label>
                                            <div class="am-u-sm-12">
                                                <input type="text" id="user-weibo" class="am-margin-top-xs" placeholder="如：渝ICP备17011152号-1">
                                                <small>备案信息</small>
                                            </div>
                                        </div>
                                        <div class="am-form-group">
                                            <label for="user-intro" class="am-u-sm-12 am-form-label  am-text-left">统计代码</label>
                                            <div class="am-u-sm-12 am-margin-top-xs">
                                                <textarea class="" rows="10" id="user-intro" placeholder="很长一串儿"></textarea>
                                                <small>可使用cnzz，百度统计，Google Analytics</small>
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <div class="am-u-sm-12 am-u-sm-push-12">
                                                <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
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
        <script src="/admin/static/js/amazeui.datatables.min.js"></script>
        <script src="/admin/static/js/dataTables.responsive.min.js"></script>
        <script src="/admin/static/js/app.js"></script>
        <script>
            $.AMUI.progress.start();
            setTimeout(function() { $.AMUI.progress.done(); $('.fade').removeClass('out'); }, 1000);
        </script>
    </body>
</html>
