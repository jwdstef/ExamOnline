package cc.ryanc.servlet;

import cc.ryanc.dao.ExamPaperDao;
import cc.ryanc.entity.ExamPaper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ExamPaperServlet")
public class ExamPaperServlet extends HttpServlet {
    ExamPaperDao examPaperDao = new ExamPaperDao();
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作选项值
        String op = request.getParameter("op");
        if("".equals(op)||null==op){
            this.query(request, response);
        }
    }

    /**
     * 处理查询所有试卷
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用dao类方法查询数据
        ArrayList<ExamPaper> examPapers = examPaperDao.getQuery();
        if(examPapers!=null){
            request.setAttribute("examPapers",examPapers);
            request.getRequestDispatcher("/admin/page/paper.jsp").forward(request,response);
        }
    }
}
