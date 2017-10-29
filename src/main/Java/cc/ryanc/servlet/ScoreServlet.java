package cc.ryanc.servlet;

import cc.ryanc.dao.ScoreDao;
import cc.ryanc.entity.Score;

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
 * Date: 2017/9/26
 */
@WebServlet(name = "ScoreServlet")
public class ScoreServlet extends HttpServlet {
    ScoreDao scoreDao = new ScoreDao();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作选项
        String op = request.getParameter("op");
        if ("".equals(op) || null == op) {
            this.query(request, response);
        } else {
            if ("insert".equals(op)) {
                this.testOver(request, response);
            } else if ("adminscore".equals(op)) {
                this.adminquery(request, response);
            }
        }
    }

    /**
     * 处理添加成绩的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void testOver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (scoreDao.getInsert()) {
            this.query(request, response);
        }
    }

    /**
     * 处理查询的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("stuInfo") == null) {
            response.sendRedirect("/index.jsp");
            request.getSession().setAttribute("msg", "你还没登录呢！");
            return;
        }
        //调用dao类方法查询数据
        ArrayList<Score> scores = scoreDao.queryAll();
        if (scores != null) {
            request.setAttribute("scores", scores);
            request.getRequestDispatcher("/history.jsp").forward(request, response);
        }
    }

    /**
     * 处理后台查询成绩的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void adminquery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用dao类方法查询数据
        ArrayList<Score> scores = scoreDao.queryAll();
        if (scores != null) {
            request.setAttribute("scores", scores);
            request.getRequestDispatcher("/admin/page/score.jsp").forward(request, response);
        }
    }
}
