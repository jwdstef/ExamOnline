package cc.ryanc.dao;

import cc.ryanc.entity.*;
import cc.ryanc.util.DBUtil;
import cc.ryanc.util.PageModel;

import java.sql.ResultSet;
import java.util.ArrayList;

public class ScoreDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;

    public PageModel<Score> queryAll(int pageNo) {
        PageModel<Score> pageModel = new PageModel<Score>();
        ArrayList<Score> scores = new ArrayList<Score>();
        try {
            String sql = "select * from score a inner join stuInfo b on a.stuId = b.stuId inner join classInfo c on b.classId = c.classId inner join examPaper d on a.paperId = d.paperId";
            rs = dbUtil.execQuery(sql, null);
            Score score = null;
            StuInfo stuInfo = null;
            ClassInfo classInfo = null;
            GradeInfo gradeInfo = null;
            ExamPaper examPaper = null;
            while (rs.next()) {
                gradeInfo = new GradeInfo(
                        rs.getInt(1),
                        rs.getString(2)
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
                stuInfo = new StuInfo(
                        rs.getInt("stuId"),
                        rs.getString("stuNo"),
                        rs.getString("stuName"),
                        rs.getString("stuPwd"),
                        rs.getString("stuSex"),
                        rs.getInt("stuAge"),
                        rs.getString("stuPhoto"),
                        classInfo
                );
                examPaper = new ExamPaper(
                        rs.getInt("paperId"),
                        rs.getString("paperName"),
                        classInfo,
                        rs.getString("beginTime"),
                        rs.getString("endTime")
                );
                score = new Score(
                        rs.getInt("scoreId"),
                        stuInfo,
                        examPaper,
                        rs.getInt("score")
                );
                scores.add(score);
            }
            pageModel.setAll(scores);
            pageModel.setPageNo(pageNo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return pageModel;
    }
}
