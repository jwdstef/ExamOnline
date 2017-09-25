package cc.ryanc.test;

import cc.ryanc.dao.ExamPaperLibsDao;
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
        ExamPaperLibsDao dao = new ExamPaperLibsDao();
        ArrayList<ExamPaperLibs> list = dao.getQuery(1);
        try {
            for (ExamPaperLibs examPaperLibs : list) {
                System.out.println(examPaperLibs.getExamLibrary().getLibId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
