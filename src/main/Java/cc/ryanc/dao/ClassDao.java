package cc.ryanc.dao;

import cc.ryanc.entity.ClassInfo;
import cc.ryanc.entity.GradeInfo;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 */
public class ClassDao {
    ResultSet rs = null;
    DBUtil dbUtil = new DBUtil();

    public ArrayList<ClassInfo> getQuery() {
        //创建集合对象存储ClassInfo对象
        ArrayList<ClassInfo> classInfos = new ArrayList<ClassInfo>();
        try {
            String sql = "select * from classInfo a inner join gradeInfo b on a.gradeId=b.gradeId";
            rs = dbUtil.execQuery(sql, null);
            while (rs.next()){
                //创建GradeInfo对象储存查询到的年级信息
                GradeInfo gradeInfo = new GradeInfo(rs.getInt("gradeId"),
                        rs.getString("gradeName"));
                //创建Classinfo对象存储查询到的班级信息
                ClassInfo classInfo = new ClassInfo(rs.getInt("classId"),
                        rs.getString("className"),
                        rs.getString("classBegin"),
                        gradeInfo);
                classInfos.add(classInfo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return classInfos;
    }
}
