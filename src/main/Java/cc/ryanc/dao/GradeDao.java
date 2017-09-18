package cc.ryanc.dao;

import cc.ryanc.entity.GradeInfo;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/15
 */
public class GradeDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;

    /**
     * 查询所有的年级
     *
     * @return
     */
    public ArrayList<GradeInfo> getQuery() {
        //创建集合对象存储GradeInfo对象
        ArrayList<GradeInfo> list = new ArrayList<GradeInfo>();
        try {
            String sql = "select * from gradeInfo";
            rs = dbUtil.execQuery(sql, null);
            while (rs.next()) {
                GradeInfo gradeInfo = new GradeInfo(
                        rs.getInt(1),
                        rs.getString(2)
                );
                list.add(gradeInfo);
            }
        } catch (Exception e) {
            e.fillInStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return list;
    }
}
