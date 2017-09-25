package cc.ryanc.test;

import cc.ryanc.dao.AdminDao;
import cc.ryanc.dao.ExamPaperLibsDao;
import cc.ryanc.entity.AdminInfo;
import cc.ryanc.entity.ExamPaperLibs;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;


/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/12
 */
public class TestDemo {
    public static void main(String[] args) {
        DBUtil dbUtil = new DBUtil();
        ResultSet rs = null;
        AdminDao adminDao = new AdminDao();
        AdminInfo adminInfo = new AdminInfo();
        adminInfo.setAdminName("CHAOGE1111");
        adminInfo.setAdminEmail("3412789@qq.com");
        adminInfo.setAdminPwd("123456789");
        if(adminDao.getUpdate(adminInfo)){
            System.out.println("添加成功");
        }else{
            System.out.println("添加失败");
        }
    }
}
