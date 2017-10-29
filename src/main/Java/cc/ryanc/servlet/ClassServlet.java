package cc.ryanc.servlet;

import cc.ryanc.dao.ClassDao;
import cc.ryanc.entity.ClassInfo;
import cc.ryanc.entity.GradeInfo;
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
 * Author: RYAN0UP
 * Date: 2017/9/13
 */
@WebServlet(name = "ClassServlet")
public class ClassServlet extends HttpServlet {
    ClassDao classDao = new ClassDao();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作选项
        String op = request.getParameter("op");
        if ("".equals(op) || null == op) {
            this.query(request, response);
        } else {
            if ("remove".equals(op)) {
                this.remove(request, response);
            } else if ("insert".equals(op)) {
                this.insert(request, response);
            } else if ("toEdit".equals(op)) {
                this.toEdit(request, response);
            } else if ("update".equals(op)) {
                this.update(request, response);
            }
        }
    }

    /**
     * 处理查询班级
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
        // 调用方法查询所有班级信息
        PageModel<ClassInfo> pageModel = classDao.getQuery(pageNo);
        ArrayList<ClassInfo> classInfos = pageModel.getAll();
        request.setAttribute("pm", pageModel);
        request.setAttribute("classInfos", classInfos);
        request.getRequestDispatcher("/admin/page/class.jsp").forward(request, response);
    }

    /**
     * 删除班级信息
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到班级编号
        int classId = Integer.parseInt(request.getParameter("classId"));
        if (classDao.getRemove(classId)) {
            this.query(request, response);
        }
    }

    /**
     * 处理添加班级信息的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String className = request.getParameter("className");
        String master = request.getParameter("master");
        String teacher = request.getParameter("teacher");
        int gradeId = Integer.parseInt(request.getParameter("gradeId"));
        int number = Integer.parseInt(request.getParameter("number"));
        String begin = request.getParameter("begin");
        //创建GradeInfo对象封装年级属性
        GradeInfo gradeInfo = new GradeInfo();
        gradeInfo.setGradeId(gradeId);
        //创建ClassInfo对象封装班级属性
        ClassInfo classInfo = new ClassInfo(className, master, teacher, number, begin, gradeInfo);
        if (classDao.getInsert(classInfo)) {
            this.query(request, response);
        }
    }

    /**
     * 处理修改跳转请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void toEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到班级编号
        int classId = Integer.parseInt(request.getParameter("classId"));
        ClassInfo classInfo = classDao.getById(classId);
        if (classInfo != null) {
            request.setAttribute("classInfo", classInfo);
            request.getRequestDispatcher("/admin/page/class-update.jsp").forward(request, response);
        }
    }

    /**
     * 处理修改班级信息的请求
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到表单信息
        int classId = Integer.parseInt(request.getParameter("classId"));
        String className = request.getParameter("className");
        String master = request.getParameter("master");
        String teacher = request.getParameter("teacher");
        int gradeId = Integer.parseInt(request.getParameter("gradeId"));
        int number = Integer.parseInt(request.getParameter("number"));
        String begin = request.getParameter("begin");
        //封装信息到GradeInfo
        GradeInfo gradeInfo = new GradeInfo();
        gradeInfo.setGradeId(gradeId);
        //封装信息到ClassInfo
        ClassInfo classInfo = new ClassInfo(classId, className, master, teacher, number, begin, gradeInfo);
        if (classDao.getUpdate(classInfo)) {
            this.query(request, response);
        }
    }
}
