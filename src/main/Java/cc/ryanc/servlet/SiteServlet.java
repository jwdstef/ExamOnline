package cc.ryanc.servlet;

import cc.ryanc.dao.SiteDao;
import cc.ryanc.entity.SiteInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/15
 */
@WebServlet(name = "SiteServlet")
public class SiteServlet extends HttpServlet {
    SiteDao siteDao = new SiteDao();
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String title = request.getParameter("site-title");
        String url = request.getParameter("site-url");
        String words = request.getParameter("words");
        String desc = request.getParameter("desc");
        String map = request.getParameter("site-map");
        String favicon = request.getParameter("favicon");
        String copyright = request.getParameter("copyright");
        String icp = request.getParameter("icp");
        String count = request.getParameter("count");
        //创建SiteInfo对象储存数据
        SiteInfo siteInfo = new SiteInfo(title, url, words, desc, map, favicon, copyright, icp, count);
        if(siteDao.getUpdate(siteInfo)){
            response.sendRedirect("/admin/page/site-setting.jsp");
        }
    }
}
