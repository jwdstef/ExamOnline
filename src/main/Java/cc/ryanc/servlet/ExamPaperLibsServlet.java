package cc.ryanc.servlet;

import cc.ryanc.dao.ExamLibraryDao;
import cc.ryanc.dao.ExamPaperLibsDao;
import cc.ryanc.entity.ExamLibrary;
import cc.ryanc.entity.ExamPaperLibs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/19
 */
@WebServlet(name = "ExamPaperLibsServlet")
public class ExamPaperLibsServlet extends HttpServlet {
    ExamPaperLibsDao examPaperLibsDao = new ExamPaperLibsDao();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作选项
        String op = request.getParameter("op");
        if ("detail".equals(op)) {
            this.query(request, response);
        } else if ("add".equals(op)) {
            this.add(request, response);
        } else if ("test".equals(op)) {
            this.test(request, response);
        }
    }

    /**
     * 处理根据试卷编号查询所有题目
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取试卷编号
        int paperId = Integer.parseInt(request.getParameter("paperId"));
        ArrayList<ExamPaperLibs> examPaperLibss = examPaperLibsDao.getQuery(paperId);
        ExamLibraryDao examLibraryDao = new ExamLibraryDao();
        ArrayList<ExamLibrary> examLibraries = examLibraryDao.queryAll();
        if (examPaperLibss != null) {
            request.setAttribute("examPaperLibss", examPaperLibss);
            request.setAttribute("examLibraries", examLibraries);
            request.setAttribute("paperId", paperId);
            request.getRequestDispatcher("/admin/page/paper-detail.jsp").forward(request, response);
        }
    }

    /**
     * 处理添加试题的操作
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paperId = Integer.parseInt(request.getParameter("paperId"));
        int libId = Integer.parseInt(request.getParameter("libId"));
        if (examPaperLibsDao.getAddLib(paperId, libId)) {
            this.query(request, response);
        }
    }

    /**
     * 考试
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取试卷编号
        if(request.getSession().getAttribute("stuInfo")==null){
            response.sendRedirect("/index.jsp");
            request.getSession().setAttribute("msg","您还没登录呢！");
            return;
        }
        int paperId = Integer.parseInt(request.getParameter("paperId"));
        ArrayList<ExamPaperLibs> examPaperLibss = examPaperLibsDao.getQuery(paperId);
        if (examPaperLibss != null) {
            request.setAttribute("examPaperLibss", examPaperLibss);
            request.setAttribute("paperId", paperId);
            request.getRequestDispatcher("/now.jsp").forward(request, response);
        }
    }
}
