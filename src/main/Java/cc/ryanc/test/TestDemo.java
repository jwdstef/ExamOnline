package cc.ryanc.test;

import cc.ryanc.dao.ExamPaperDao;
import cc.ryanc.dao.SiteDao;
import cc.ryanc.entity.ExamPaper;
import cc.ryanc.entity.SiteInfo;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;


/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/12
 */
public class TestDemo {
    public static void main(String []args){
        DBUtil dbUtil = new DBUtil();
        ResultSet rs = null;
        ExamPaperDao examPaperDao = new ExamPaperDao();
        ArrayList<ExamPaper> examPapers = examPaperDao.getQuery();
        for(ExamPaper examPaper:examPapers){
            System.out.println(examPaper.getPaperId()+"--"+examPaper.getPaperName());
        }
    }
}
