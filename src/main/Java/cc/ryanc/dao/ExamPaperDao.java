package cc.ryanc.dao;

import cc.ryanc.entity.ClassInfo;
import cc.ryanc.entity.ExamPaper;
import cc.ryanc.entity.GradeInfo;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;

public class ExamPaperDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;

    /**
     * 查询所有的试卷信息
     *
     * @return
     */
    public ArrayList<ExamPaper> getQuery() {
        //创建集合对象存储查询到的数据
        ArrayList<ExamPaper> examPapers = new ArrayList<ExamPaper>();
        try {
            String sql = "select * from examPaper a inner join classInfo b ON a.classId = b.classId inner join gradeInfo c on b.gradeId = c.gradeId";
            rs = dbUtil.execQuery(sql, null);
            GradeInfo gradeInfo = null;
            ClassInfo classInfo = null;
            ExamPaper examPaper = null;
            while (rs.next()) {
                //查询数据封装进实体类对象
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
                examPaper = new ExamPaper(
                        rs.getInt("paperId"),
                        rs.getString("paperName"),
                        classInfo,
                        rs.getString("beginTime"),
                        rs.getString("endTime")
                );
                examPapers.add(examPaper);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return examPapers;
    }
}
