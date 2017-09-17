package cc.ryanc.filter;

import cc.ryanc.entity.AdminInfo;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/14
 * 防止登录成功之后，访问登录页面成功
 */
@WebFilter(filterName = "AdminLoginedFilter")
public class AdminLoginedFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //转换为Servlet
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();

        //获取Session中的管理员对象
        AdminInfo adminInfo = (AdminInfo) session.getAttribute("adminInfo");
        //判断是否有adminInfo的Session信息,如果有，则不在进入login.jsp页面
        if (adminInfo != null) {
            response.sendRedirect("/admin/page/index.jsp");
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {
    }

}
