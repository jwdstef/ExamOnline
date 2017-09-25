package cc.ryanc.servlet;

import cc.ryanc.dao.ExamLibraryDao;
import cc.ryanc.entity.ExamLibrary;
import cc.ryanc.util.PageModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Author: Administrator
 * Date: 2017/9/17
 */
@WebServlet(name = "ExamLibraryServlet")
public class ExamLibraryServlet extends HttpServlet {
    ExamLibraryDao examLibraryDao = new ExamLibraryDao();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取option操作选项
        String op = request.getParameter("op");
        if ("".equals(op) || null == op) {
            this.query(request, response);
        } else {
            if ("remove".equals(op)) {
                this.remove(request, response);
            } else if ("detail".equals(op)) {
                this.queryById(request, response);
            }
        }
    }

    /**
     * 处理查询操作
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
        // 调用方法查询所有考题信息
        PageModel<ExamLibrary> pageModel = examLibraryDao.getQuery(pageNo);
        ArrayList<ExamLibrary> examLibraries = pageModel.getAll();
        request.setAttribute("pm", pageModel);
        request.setAttribute("examLibraries", examLibraries);
        request.getRequestDispatcher("/admin/page/subject.jsp").forward(request, response);
    }

    /**
     * 处理删除
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取要删除的id
        int libId = Integer.parseInt(request.getParameter("libId"));
        if (examLibraryDao.getRemove(libId)) {
            this.query(request, response);
        }
    }

    /**
     * 处理根据id查询详情页面
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void queryById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取要删除的id
        int libId = Integer.parseInt(request.getParameter("libId"));
        ExamLibrary examLibrary = examLibraryDao.getById(libId);
        if (examLibrary != null) {
            request.setAttribute("examLibrary", examLibrary);
            request.getRequestDispatcher("/admin/page/subject-detail.jsp").forward(request, response);
        }
    }
}
