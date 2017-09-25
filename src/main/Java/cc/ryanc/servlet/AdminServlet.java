package cc.ryanc.servlet;

import cc.ryanc.dao.AdminDao;
import cc.ryanc.entity.AdminInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 */
@WebServlet(name = "AdminServlet")
public class AdminServlet extends HttpServlet {
    private AdminDao adminDao = new AdminDao();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作选项
        String op = request.getParameter("op");
        if ("login".equals(op)) {
            this.login(request, response);
        } else if ("getOut".equals(op)) {
            this.getOut(request, response);
        }
    }


    /**
     * 登录
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单信息
        String adminName = request.getParameter("adminname");
        String adminPwd = request.getParameter("adminpwd");
        System.out.println(adminName);
        System.out.println(adminPwd);
        AdminInfo adminInfo = adminDao.getLogin(adminName, adminPwd);
        if (adminInfo != null) {
            System.out.println("登陆成功！");
            request.getSession().setAttribute("adminInfo", adminInfo);
            response.sendRedirect("admin/page/index.jsp");
        } else {
            System.out.println("密码错误！");
            response.sendRedirect("admin/index.jsp");
        }
    }

    /**
     * 退出登录，销毁Session对象
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void getOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);//防止创建Session
        if (session == null) {
            response.sendRedirect("/admin/index.jsp");
            return;
        }
        session.removeAttribute("adminInfo");
        request.getSession().setAttribute("msg", "退出成功");
        response.sendRedirect("/admin/index.jsp");
    }
}
