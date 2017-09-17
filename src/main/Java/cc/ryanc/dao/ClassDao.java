package cc.ryanc.dao;

import cc.ryanc.entity.ClassInfo;
import cc.ryanc.entity.GradeInfo;
import cc.ryanc.util.DBUtil;
import cc.ryanc.util.PageModel;

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

    /**
     * 查询所有班级信息
     *
     * @param pageNo
     * @return
     */
    public PageModel<ClassInfo> getQuery(int pageNo) {
        PageModel<ClassInfo> pageModel = new PageModel<ClassInfo>();
        //创建集合对象存储ClassInfo对象
        ArrayList<ClassInfo> classInfos = new ArrayList<ClassInfo>();
        try {
            int pageIndex = (pageNo - 1) * 10;
            String sql = "select * from classInfo a inner join gradeInfo b on a.gradeId=b.gradeId order by classId DESC limit ?,10";
            rs = dbUtil.execQuery(sql, new Object[]{pageIndex});
            while (rs.next()){
                //创建GradeInfo对象储存查询到的年级信息
                GradeInfo gradeInfo = new GradeInfo(
                        rs.getInt("gradeId"),
                        rs.getString("gradeName")
                );
                //创建Classinfo对象存储查询到的班级信息
                ClassInfo classInfo = new ClassInfo(
                        rs.getInt("classId"),
                        rs.getString("className"),
                        rs.getString("master"),
                        rs.getString("teacher"),
                        rs.getInt("number"),
                        rs.getString("classBegin"),
                        gradeInfo
                );
                classInfos.add(classInfo);
            }
            pageModel.setPageNo(pageNo);
            pageModel.setAll(classInfos);
            pageModel.setCount(getCount());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return pageModel;
    }

    public int getCount() {
        int row = 0;
        try {
            String sql = "select count(*) from classInfo";
            rs = dbUtil.execQuery(sql, null);
            if (rs.next()) {
                row = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }

    /**
     * 删除选中的班级
     *
     * @param classId
     * @return
     */
    public boolean getRemove(int classId) {
        //初始化返回值为false
        boolean result = false;
        try {
            String sql = "delete from classInfo where classId = ?";
            int row = dbUtil.execUpdate(sql, new Object[]{classId});
            if (row > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
