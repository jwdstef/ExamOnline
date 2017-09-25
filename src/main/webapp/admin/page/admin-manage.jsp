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
        <title>ExamOnline-管理员</title>
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
                                    <div class="widget-title  am-cf">管理员列表</div>
                                </div>
                                <div class="widget-body  am-fr">

                                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                        <div class="am-form-group">
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group">
                                                    <button type="button" class="am-btn am-btn-default am-btn-primary am-radius" data-am-modal="{target: '#adminAdd', closeViaDimmer: 0, width: 400, height: 300}"><span class="am-icon-plus"></span> 新增</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="am-u-sm-12">
                                        <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black " id="example-r">
                                            <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>用户名</th>
                                                <th>邮箱</th>
                                                <th>密码</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.adminInfos}" var="ai">
                                                    <tr>
                                                        <td><c:out value="${ai.adminId}" /> </td>
                                                        <td><c:out value="${ai.adminName}" /> </td>
                                                        <td><c:out value="${ai.adminEmail}" /> </td>
                                                        <td><c:out value="${ai.adminPwd}" /> </td>
                                                        <td>
                                                            <div class="tpl-table-black-operation">
                                                                <a href="/AdminServlet?op=toEdit&adminId=<c:out value='${ai.adminId}' />">
                                                                    <i class="am-icon-pencil"></i> 编辑
                                                                </a>
                                                                <a href="/AdminServlet?op=remove&adminId=<c:out value='${ai.adminId}' />" class="tpl-table-black-operation-del">
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
                                                <li><a href="/AdminServlet?pageNo=${requestScope.pm.getIndex()}">首页</a></li>
                                                <li><a href="/AdminServlet?pageNo=${requestScope.pm.getPagePre()}">上页</a></li>
                                                <li><a href="/AdminServlet?pageNo=${requestScope.pm.getPageNext()}">下页</a></li>
                                                <li><a href="/AdminServlet?pageNo=${requestScope.pm.getPageTotal()}">尾页</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 新增 -->
            <div class="am-modal am-modal-no-btn" tabindex="-1" id="adminAdd">
                <div class="am-modal-dialog">
                    <div class="am-modal-hd">添加管理员
                        <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
                    </div>
                    <div class="am-modal-bd">
                        <form action="/AdminServlet" method="post" class="am-form">
                            <input type="hidden" value="insert" name="op">
                            <div class="am-form-group">
                                <input type="text" placeholder="用户名" name="adminName" id="adminName">
                            </div>
                            <div class="am-form-group">
                                <input type="email" placeholder="邮箱" name="adminEmail" id="adminEmail">
                            </div>
                            <div class="am-form-group">
                                <input type="password" placeholder="密码" name="adminPwd" id="adminPwd">
                            </div>
                            <div class="am-form-group">
                                <input type="submit" id="submit" class="am-btn am-btn-primary am-btn-block" value="添加">
                                <a href="javascript:$('#adminAdd').modal('close');" class="am-btn am-btn-default am-btn-block">取消</a>
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
        <script>
            $('#adminAdd').submit(function(){
                var adminName = $('#adminName').val();
                var adminEmail = $('#adminEmail').val();
                var adminPwd = $('#adminPwd').val();
                if(adminName==""||adminEmail==""||adminPwd=="") {
                    $('#msg').modal();
                    return false;
                }
            })
        </script>
    </body>
</html>
