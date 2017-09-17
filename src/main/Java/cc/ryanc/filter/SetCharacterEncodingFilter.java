package cc.ryanc.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 * 设置编码格式的过滤器
 */
@WebFilter(filterName = "SetCharacterEncodingFilter")
public class SetCharacterEncodingFilter implements Filter {
    private String encoding = "UTF-8";
    protected FilterConfig filterConfig;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        if(filterConfig.getInitParameter("encoding") != null)
            encoding = filterConfig.getInitParameter("encoding");
    }

    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        request.setCharacterEncoding(encoding);
        filterChain.doFilter(req, resp);
    }

    public void destroy() {
        this.encoding = null;
    }
}
