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
    //储存编码格式信息
    private String encode = null;
    public void destroy() {}

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //转换
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        if(this.encode!=null&&!this.encode.equals("")){
            request.setCharacterEncoding(this.encode);
        }else {
            request.setCharacterEncoding("utf-8");
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
        //获取在web.xml中的编码格式信息
        this.encode = config.getInitParameter("encode");
    }
}
