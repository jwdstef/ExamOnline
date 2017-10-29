package cc.ryanc.servlet;

import cc.ryanc.dao.AdminDao;
import cc.ryanc.entity.AdminInfo;
import cc.ryanc.util.PageModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

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
        if ("".equals(op) || null == op) {
            this.query(request, response);
        } else {
            if ("login".equals(op)) {
                this.login(request, response);
            } else if ("getOut".equals(op)) {
                this.getOut(request, response);
            } else if ("remove".equals(op)) {
                this.remove(request, response);
            } else if ("toEdit".equals(op)) {
                this.toEdit(request, response);
            } else if ("update".equals(op)) {
                this.update(request, response);
            } else if ("insert".equals(op)) {
                this.insert(request, response);
            }
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
        //防止创建Session
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("/admin/index.jsp");
            return;
        }
        session.removeAttribute("adminInfo");
        request.getSession().setAttribute("msg", "退出成功");
        response.sendRedirect("/admin/index.jsp");
    }

    /**
     * 处理查询管理员的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 定义变量表示当前页码
        int pageNo = 1;
        // 得到当前页码
        String pageNos = request.getParameter("pageNo");
        if (pageNos != null) {
            pageNo = Integer.parseInt(pageNos);
        }
        // 调用方法查询所有管理员信息
        PageModel<AdminInfo> pageModel = adminDao.getQuery(pageNo);
        ArrayList<AdminInfo> adminInfos = pageModel.getAll();
        request.setAttribute("pm", pageModel);
        request.setAttribute("adminInfos", adminInfos);
        request.getRequestDispatcher("/admin/page/admin-manage.jsp").forward(request, response);
    }

    /**
     * 删除管理员账户
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取要删除的管理员编号
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        if (adminDao.getRemove(adminId)) {
            this.query(request, response);
        }
    }

    /**
     * 处理跳转到修改页面的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void toEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取要删除的管理员编号
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        AdminInfo adminInfo = adminDao.getById(adminId);
        if (adminInfo != null) {
            request.setAttribute("adminInfo", adminInfo);
            request.getRequestDispatcher("/admin/page/admin-update.jsp").forward(request, response);
        }
    }

    /**
     * 处理修改的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        int adminId = Integer.parseInt(request.getParameter("adminId"));
        String adminName = request.getParameter("adminName");
        String adminEmail = request.getParameter("adminEmail");
        String adminPwd = request.getParameter("adminPwd");
        //封装数据到实体类
        AdminInfo adminInfo = new AdminInfo(adminId, adminName, adminEmail, adminPwd);
        if (adminDao.getUpdate(adminInfo)) {
            this.query(request, response);
        }
    }

    /**
     * 处理添加管理员的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String adminName = request.getParameter("adminName");
        String adminEmail = request.getParameter("adminEmail");
        String adminPwd = request.getParameter("adminPwd");
        //封装数据到实体类
        AdminInfo adminInfo = new AdminInfo();
        adminInfo.setAdminName(adminName);
        adminInfo.setAdminEmail(adminEmail);
        adminInfo.setAdminPwd(adminPwd);
        if (adminDao.getInsert(adminInfo)) {
            this.query(request, response);
        }
    }
}
