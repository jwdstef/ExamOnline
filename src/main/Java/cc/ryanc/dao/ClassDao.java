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
            while (rs.next()) {
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

    /**
     * 查询所有班级数量
     *
     * @return
     */
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
        } finally {
            dbUtil.closeSource(rs);
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

    /**
     * 添加班级
     *
     * @param classInfo 传入Classinfo对象
     * @return 返回true或者false
     */
    public boolean getInsert(ClassInfo classInfo) {
        boolean result = false;
        try {
            String sql = "insert into classInfo values(classId,?,?,?,?,?,?)";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    classInfo.getClassName(),
                    classInfo.getMaster(),
                    classInfo.getTeacher(),
                    classInfo.getNumber(),
                    classInfo.getClassBegin(),
                    classInfo.getGradeInfo().getGradeId()
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
     * 根据班级编号修改班级信息
     *
     * @param classInfo
     * @return
     */
    public boolean getUpdate(ClassInfo classInfo) {
        boolean result = false;
        try {
            String sql = "update classInfo set className=?,master=?,teacher=?,number=?,classBegin=?,gradeId=? where classId=?";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    classInfo.getClassName(),
                    classInfo.getMaster(),
                    classInfo.getTeacher(),
                    classInfo.getNumber(),
                    classInfo.getClassBegin(),
                    classInfo.getGradeInfo().getGradeId(),
                    classInfo.getClassId()
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
     * 根据编号查询班级信息
     *
     * @param classId 传入班级编号
     * @return 返回Classnfo对象
     */
    public ClassInfo getById(int classId) {
        //初始化CLassInfo对象
        ClassInfo classInfo = null;
        try {
            String sql = "select * from classInfo a inner join gradeInfo b on a.gradeId=b.gradeId where classId = ?";
            rs = dbUtil.execQuery(sql, new Object[]{classId});
            GradeInfo gradeInfo = null;
            while (rs.next()) {
                //创建GradeInfo对象储存查询到的年级信息
                gradeInfo = new GradeInfo(
                        rs.getInt("gradeId"),
                        rs.getString("gradeName")
                );
                //创建Classinfo对象存储查询到的班级信息
                classInfo = new ClassInfo(
                        rs.getInt("classId"),
                        rs.getString("className"),
                        rs.getString("master"),
                        rs.getString("teacher"),
                        rs.getInt("number"),
                        rs.getString("classBegin"),
                        gradeInfo
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return classInfo;
    }
}
