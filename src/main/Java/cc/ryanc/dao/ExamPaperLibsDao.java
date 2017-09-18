package cc.ryanc.dao;

import cc.ryanc.entity.*;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;

public class ExamPaperLibsDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;
    public ArrayList<ExamPaperLibs> getQuery(){
        ArrayList<ExamPaperLibs> examPaperLibss = new ArrayList<ExamPaperLibs>();
        try{
            String sql = "select * from examPaperLibs a " +
                    "inner join examPaper b on a.paperId = b.paperId " +
                    "inner join classInfo c on b.classId = c.classId " +
                    "inner join gradeInfo d on c.gradeId = d.gradeId " +
                    "inner join examLibrary e on a.libId = e.libId " +
                    "inner join subject f on e.subId = f.subId";
            rs = dbUtil.execQuery(sql,null);
            Subject subject = null;
            GradeInfo gradeInfo = null;
            ClassInfo classInfo = null;
            ExamLibrary examLibrary = null;
            ExamPaper examPaper = null;
            ExamPaperLibs examPaperLibs = null;
            while(rs.next()){
                subject = new Subject(
                        rs.getInt("subId"),
                        rs.getString("subName")
                );
                gradeInfo = new GradeInfo(
                        rs.getInt("gradeId"),
                        rs.getString("gradeName")
                );
                classInfo = new ClassInfo(
                        rs.getInt("classId"),
                        rs.getString("className"),
                        rs.getString("master"),
                        rs.getString("teacher"),
                        rs.getInt("number"),
                        rs.getString("classBegin"),
                        gradeInfo
                );
                examLibrary = new ExamLibrary(
                        rs.getInt("libId"),
                        rs.getString("libTitle"),
                        rs.getString("libA"),
                        rs.getString("libB"),
                        rs.getString("libC"),
                        rs.getString("libD"),
                        rs.getString("libRight"),
                        subject,
                        rs.getInt("libtype"),
                        gradeInfo
                );
                examPaper = new ExamPaper(
                        rs.getInt("paperId"),
                        rs.getString("paperName"),
                        classInfo,
                        rs.getString("beginTime"),
                        rs.getString("endTime")
                );
                examPaperLibs = new ExamPaperLibs(
                        examPaper,examLibrary
                );
                examPaperLibss.add(examPaperLibs);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return examPaperLibss;
    }
}
