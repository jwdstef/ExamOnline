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
 * Date: 2017/9/13
 * 管理员登陆的过滤器，用于防止未登录进入后台
 */
@WebFilter(filterName = "AdminLoginFilter")
public class AdminLoginFilter implements Filter {
    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //转换为Servlet
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        HttpSession session = request.getSession();

        //获取Session中的管理员对象
        AdminInfo adminInfo = (AdminInfo)session.getAttribute("adminInfo");
        //判断是否有adminInfo的Session信息
        if(adminInfo==null){
            response.sendRedirect("/admin/index.jsp");
        }else{
            chain.doFilter(req,resp);
        }
    }

    @Override
    public void init(FilterConfig config) throws ServletException {

    }
}
