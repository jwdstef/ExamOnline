<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 侧边导航栏 -->
<div class="left-sidebar">
    <!-- 用户信息 -->
    <div class="tpl-sidebar-user-panel">
        <div class="tpl-user-panel-slide-toggleable" style="text-align:center;">
            <div class="tpl-user-panel-profile-picture" style="margin:0 auto;">
                <img src="/admin/static/img/ryan0up.png" alt="">
            </div>
            <span class="user-panel-logged-in-text">RYAN0UP</span>
            <a href="javascript:;" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a>
        </div>
    </div>

    <!-- 菜单 -->
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="sidebar-nav-heading">ExamManager <span class="sidebar-nav-heading-info"> 事务管理</span></li>
        <li class="sidebar-nav-link">
            <a href="/admin/page/index.jsp">
                <i class="am-icon-home sidebar-nav-link-logo"></i> 首页
            </a>
        </li>
        <li class="sidebar-nav-link">
            <a href="javascript:;" class="sidebar-nav-sub-title">
                <i class="am-icon-gitlab sidebar-nav-link-logo"></i> 学生管理
                <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
            </a>
            <ul class="sidebar-nav sidebar-nav-sub">
                <li class="sidebar-nav-link">
                    <a href="/admin/page/class.jsp">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 班级管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/StuServlet">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 学生管理
                    </a>
                </li>
            </ul>
        </li>
        <li class="sidebar-nav-link">
            <a href="javascript:;" class="sidebar-nav-sub-title">
                <i class="am-icon-wpforms sidebar-nav-link-logo"></i> 试卷管理
                <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
            </a>
            <ul class="sidebar-nav sidebar-nav-sub">
                <li class="sidebar-nav-link">
                    <a href="/admin/page/subject.jsp">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 出题管理
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/admin/page/buildsubject.jsp">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 组卷
                    </a>
                </li>
            </ul>
        </li>
        <li class="sidebar-nav-heading">SysManager<span class="sidebar-nav-heading-info"> 系统管理</span></li>

        <li class="sidebar-nav-link">
            <a href="javascript:;" class="sidebar-nav-sub-title">
                <i class="am-icon-rocket sidebar-nav-link-logo"></i> 网站优化
                <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
            </a>
            <ul class="sidebar-nav sidebar-nav-sub">
                <li class="sidebar-nav-link">
                    <a href="/admin/page/site-setting.jsp">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 网站设置
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="/admin/page/links-setting.jsp">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 友情链接
                    </a>
                </li>
            </ul>
        </li>

        <li class="sidebar-nav-link">
            <a href="javascript:;" class="sidebar-nav-sub-title">
                <i class="am-icon-cog sidebar-nav-link-logo"></i> 管理设置
                <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
            </a>
            <ul class="sidebar-nav sidebar-nav-sub">
                <li class="sidebar-nav-link">
                    <a href="table-list.jsp">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 新增管理员
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="table-list-img.jsp">
                        <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 权限管理
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</div>