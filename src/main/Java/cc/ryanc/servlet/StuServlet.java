package cc.ryanc.servlet;

import cc.ryanc.dao.StuDao;
import cc.ryanc.entity.StuInfo;
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
@WebServlet(name = "StuServlet")
public class StuServlet extends HttpServlet {
    private StuDao stuDao = new StuDao();
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取操作选项
        String op = request.getParameter("op");
        if("".equals(op) || null==op){
            this.query(request, response);
        }else{
            if("login".equals(op)){
                this.login(request,response);
            }else if("insert".equals(op)){
                this.insert(request, response);
            }else if("remove".equals(op)){
                this.remove(request, response);
            }else if("search".equals(op)){
                this.search(request, response);
            }
        }
    }

    /**
     * 登陆
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取学生登录表单的数据
        String stuNo = request.getParameter("stuNo");
        String stuPwd = request.getParameter("stuPwd");
        //调用dao层方法查询判断是否有该学生
        StuInfo stuInfo = stuDao.getLogin(stuNo);
        if(stuInfo != null){
            if(stuInfo.getStuPwd().equals(stuPwd)){
                request.getSession().setAttribute("stuInfo",stuInfo);
                System.out.println("登陆成功");
            }else{
                System.out.println("密码错误！");
            }
        }else{
            System.out.println("没有该学生");
        }
        response.sendRedirect("index.jsp");
    }

    /**
     * 跳转到查询
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
        // 调用方法查询所有学生信息
        PageModel<StuInfo> pageModel = stuDao.getQuery(pageNo);
        ArrayList<StuInfo> stuInfos = pageModel.getAll();
        // 将pm存入request范围内
        request.setAttribute("pm", pageModel);
        request.setAttribute("stuInfos",stuInfos);
        request.getRequestDispatcher("/admin/page/student.jsp").forward(request,response);
    }

    /**
     * 添加新学生
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String stuNo = request.getParameter("stuno");
        String stuName = request.getParameter("stuname");
        String stuSex = request.getParameter("stusex");
        int stuAge = Integer.parseInt(request.getParameter("stuage"));
        int classId = Integer.parseInt(request.getParameter("classid"));
        if(stuDao.getInsert(stuNo,stuName,stuSex,stuAge,classId)){
            this.query(request, response);
        }
    }

    /**
     * 处理移除学生
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取要删除的学生id
        int stuId = Integer.parseInt(request.getParameter("stuId"));
        if(stuDao.getRemove(stuId)){
            this.query(request,response);
        }
    }

    /**
     * 根据关键字查询学生数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 定义变量表示当前页码
        int pageNo = 1;
        // 得到当前页码
        String pageNos = request.getParameter("pageNo");
        //获取查询的关键字
        String keyWord = request.getParameter("keyword");
        if (pageNos != null) {
            pageNo = Integer.parseInt(pageNos);
        }
        // 调用方法查询所有学生信息
        PageModel<StuInfo> pageModel = stuDao.getSearch(keyWord,pageNo);
        ArrayList<StuInfo> stuInfos = pageModel.getAll();
        // 将pm存入request范围内
        request.setAttribute("pm", pageModel);
        request.setAttribute("stuInfos", stuInfos);
        request.getRequestDispatcher("/admin/page/student.jsp").forward(request,response);
    }
}
