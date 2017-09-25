package cc.ryanc.servlet;

import cc.ryanc.dao.StuDao;
import cc.ryanc.entity.ClassInfo;
import cc.ryanc.entity.StuInfo;
import cc.ryanc.util.PageModel;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.io.PrintWriter;
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
        if ("".equals(op) || null == op) {
            this.query(request, response);
        } else {
            if ("login".equals(op)) {
                this.login(request, response);
            } else if ("insert".equals(op)) {
                this.insert(request, response);
            } else if ("remove".equals(op)) {
                this.remove(request, response);
            } else if ("search".equals(op)) {
                this.search(request, response);
            } else if ("upload".equals(op)) {
                this.upload(request, response);
            } else if("toEdit".equals(op)){
                this.toEdit(request, response);
            } else if("update".equals(op)){
                this.update(request, response);
            } else if("userupdate".equals(op)){
                this.userupdate(request, response);
            } else if("user".equals(op)){
                this.user(request, response);
            }
        }
    }

    /**
     * 登陆
     *
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
        StuInfo stuInfo = stuDao.getLogin(stuNo,stuPwd);
        if (stuInfo != null) {
            request.getSession().setAttribute("stuInfo",stuInfo);
            response.sendRedirect("index.jsp");
        }
    }

    /**
     * 跳转到查询
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
        if (pageNos != null)
            pageNo = Integer.parseInt(pageNos);
        // 调用方法查询所有学生信息
        PageModel<StuInfo> pageModel = stuDao.getQuery(pageNo);
        ArrayList<StuInfo> stuInfos = pageModel.getAll();
        // 将pm存入request范围内
        request.setAttribute("pm", pageModel);
        request.setAttribute("stuInfos", stuInfos);
        request.getRequestDispatcher("/admin/page/student.jsp").forward(request, response);
    }

    /**
     * 添加新学生
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String stuNo = request.getParameter("stuno");
        String stuName = request.getParameter("stuname");
        String stuPwd = request.getParameter("stupwd");
        String stuSex = request.getParameter("stusex");
        int stuAge = Integer.parseInt(request.getParameter("stuage"));
        int classId = Integer.parseInt(request.getParameter("classid"));
        if (stuDao.getInsert(stuNo, stuName,stuPwd, stuSex, stuAge, classId))
            this.query(request, response);
    }

    /**
     * 处理移除学生
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取要删除的学生id
        int stuId = Integer.parseInt(request.getParameter("stuId"));
        if (stuDao.getRemove(stuId)) {
            this.query(request, response);
        }
    }

    /**
     * 根据关键字查询学生数据
     *
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
        PageModel<StuInfo> pageModel = stuDao.getSearch(keyWord, pageNo);
        ArrayList<StuInfo> stuInfos = pageModel.getAll();
        // 将pm存入request范围内
        request.setAttribute("pm", pageModel);
        request.setAttribute("stuInfos", stuInfos);
        request.getRequestDispatcher("/admin/page/student.jsp").forward(request, response);
    }

    /**
     * 上传Excel文件，将Excel的数据添加到数据库
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=GB2312");
        PrintWriter out = response.getWriter();
        // 创建SmartLoad对象
        SmartUpload su = new SmartUpload();
        // 得到PageContext对象
        PageContext pageContext = JspFactory
                .getDefaultFactory()
                .getPageContext(this, request, response, null, true, 8192, true);
        // 上传初始化
        su.initialize(pageContext);
        // 上传文件
        try {
            su.upload();
            // 将上传文件全部保存到指定目录
            int num = su.save("/Users/ryan0up/Desktop");
            if (num > 0) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        for (int i = 0; i < su.getFiles().getCount(); i++) {
            File file = su.getFiles().getFile(i);
            if (file.isMissing())
                continue;
        }
    }

    /**
     * 处理根据学生编号查询学生信息的请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void toEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取要删除的学生id
        int stuId = Integer.parseInt(request.getParameter("stuId"));
        StuInfo stuInfo = stuDao.getById(stuId);
        if(stuInfo!=null){
            request.setAttribute("stuInfo",stuInfo);
            request.getRequestDispatcher("/admin/page/student-update.jsp").forward(request,response);
        }
    }

    /**
     * 处理修改学生信息的请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        int stuId = Integer.parseInt(request.getParameter("stuId"));
        String stuNo = request.getParameter("stuNo");
        String stuName = request.getParameter("stuName");
        String stuPwd = request.getParameter("stuPwd");
        String stuSex = request.getParameter("stuSex");
        int stuAge = Integer.parseInt(request.getParameter("stuAge"));
        int classId = Integer.parseInt(request.getParameter("classId"));
        ClassInfo classInfo = new ClassInfo();
        classInfo.setClassId(classId);
        StuInfo stuInfo = new StuInfo();
        stuInfo.setStuId(stuId);
        stuInfo.setStuNo(stuNo);
        stuInfo.setStuName(stuName);
        stuInfo.setStuPwd(stuPwd);
        stuInfo.setStuSex(stuSex);
        stuInfo.setStuAge(stuAge);
        stuInfo.setClassInfo(classInfo);
        if(stuDao.getUpdate(stuInfo))
            this.query(request, response);
    }

    /**
     * 处理用户修改的请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void userupdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单数据
        String stuNo = request.getParameter("stuno");
        String stuName = request.getParameter("stuname");
        String stuPwd = request.getParameter("stupwd");
        String stuSex = request.getParameter("stusex");
        int stuAge = Integer.parseInt(request.getParameter("stuage"));
        //创建对象封装数据
        StuInfo stuInfo = new StuInfo();
        stuInfo.setStuNo(stuNo);
        stuInfo.setStuName(stuName);
        stuInfo.setStuPwd(stuPwd);
        stuInfo.setStuSex(stuSex);
        stuInfo.setStuAge(stuAge);
        if(stuDao.getStuUpdate(stuInfo))
            response.sendRedirect("/user.jsp");
    }

    /**
     * 处理跳转到个人中心的请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("stuInfo")==null){
            response.sendRedirect("/index.jsp");
            request.getSession().setAttribute("msg","你还没登录呢！");
            return;
        }
        response.sendRedirect("/user.jsp");
    }
}
