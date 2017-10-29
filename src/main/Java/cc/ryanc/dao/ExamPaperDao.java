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

    /**
     * 根据id删除试卷
     *
     * @param paperId
     * @return
     */
    public boolean getRemove(int paperId) {
        boolean result = false;
        try {
            String sql = "delete from examPaper where paperId = ?";
            int row = dbUtil.execUpdate(sql, new Object[]{paperId});
            if (row > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 添加试卷
     *
     * @param examPaper
     * @return
     */
    public boolean getInsert(ExamPaper examPaper) {
        boolean result = false;
        try {
            String sql = "insert into examPaper values(paperId,?,?,?,?)";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    examPaper.getPaperName(),
                    examPaper.getClassInfo().getClassId(),
                    examPaper.getBeginTime(),
                    examPaper.getEndTime()
            });
            if (row > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 查询试卷总量
     *
     * @return
     */
    public int getCount() {
        int row = 0;
        try {
            String sql = "select count(*) from examPaper";
            rs = dbUtil.execQuery(sql, null);
            if (rs.next()) {
                row = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return row;
    }
}
