package cc.ryanc.servlet;

import cc.ryanc.dao.ExamPaperDao;
import cc.ryanc.entity.ClassInfo;
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
        }else{
            if("remove".equals(op)){
                this.remove(request, response);
            }else if("build".equals(op)){
                this.build(request, response);
            }
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

    /**
     * 处理删除试卷
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paperId = Integer.parseInt(request.getParameter("paperId"));
        if(examPaperDao.getRemove(paperId)){
            this.query(request, response);
        }
    }

    public void build(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String title = request.getParameter("title");
        int classId = Integer.parseInt(request.getParameter("class"));
        String begintime = request.getParameter("begintime");
        String endtime = request.getParameter("endtime");

        //创建Classinfo对象封装班级编号
        ClassInfo classInfo = new ClassInfo();
        classInfo.setClassId(classId);
        ExamPaper examPaper = new ExamPaper(
                title,classInfo,begintime,endtime
        );
        if(examPaperDao.getInsert(examPaper)){
            this.query(request, response);
        }
    }
}
