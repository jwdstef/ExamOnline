package cc.ryanc.dao;

import cc.ryanc.entity.ClassInfo;
import cc.ryanc.entity.GradeInfo;
import cc.ryanc.entity.StuInfo;
import cc.ryanc.util.DBUtil;
import cc.ryanc.util.PageModel;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 */
public class StuDao {
    ResultSet rs = null;
    DBUtil dbUtil = new DBUtil();

    /**
     * 学生登录
     *
     * @param stuNo
     * @return
     */
    public StuInfo getLogin(String stuNo, String stuPwd) {
        StuInfo stuInfo = null;
        String sql = "select * from stuInfo a INNER JOIN classInfo b on a.classId = b.classId where stuNo=? and stuPwd=md5(?)";
        rs = dbUtil.execQuery(sql, new Object[]{stuNo, stuPwd});
        try {
            ClassInfo classInfo = null;
            if (rs.next()) {
                classInfo = new ClassInfo();
                classInfo.setClassName(rs.getString("className"));
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return stuInfo;
    }

    /**
     * 查询所有学生数据
     *
     * @param pageNo
     * @return
     */
    public PageModel<StuInfo> getQuery(int pageNo) {
        //创建分页存储对象
        PageModel<StuInfo> pageModel = new PageModel<StuInfo>();
        ArrayList<StuInfo> list = new ArrayList<StuInfo>();
        try {
            int pageIndex = (pageNo - 1) * 10;
            String sql = "select * from stuInfo a " +
                    "inner join classInfo b on a.classId = b.classId " +
                    "inner join gradeInfo c on b.gradeId = c.gradeId " +
                    " order by stuId DESC limit ?,10";
            rs = dbUtil.execQuery(sql, new Object[]{pageIndex});
            StuInfo stuInfo = null;
            ClassInfo classInfo = null;
            GradeInfo gradeInfo = null;
            while (rs.next()) {
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
                list.add(stuInfo);
            }
            pageModel.setPageNo(pageNo);
            pageModel.setAll(list);
            pageModel.setCount(getCount());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return pageModel;
    }

    /**
     * 查询学生表中数据的总数
     *
     * @return
     */
    public int getCount() {
        int row = 0;
        try {
            String sql = "select count(*) from stuInfo";
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
     * 添加新学生
     *
     * @return 返回true或false
     */
    public boolean getInsert(String stuNo, String stuName, String stuPwd, String stuSex, int stuAge, int classId) {
        boolean result = false;
        try {
            String sql = "insert into stuInfo(stuNo, stuName, stuPwd, stuSex, stuAge, stuPhoto, classId) values(?,?,md5(?),?,?,default,?)";
            int row = dbUtil.execUpdate(sql, new Object[]{stuNo, stuName, stuPwd, stuSex, stuAge, classId});
            if (row > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 移除学生
     *
     * @param stuId 学生编号
     * @return 返回true或者false
     */
    public boolean getRemove(int stuId) {
        boolean result = false;
        try {
            String sql = "delete from stuInfo where stuId = ?";
            int row = dbUtil.execUpdate(sql, new Object[]{stuId});
            if (row > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据关键字查询学生
     *
     * @param keyword 关键字
     * @return 返回集合
     */
    public PageModel<StuInfo> getSearch(String keyword, int pageNo) {
        PageModel<StuInfo> pageModel = new PageModel<StuInfo>();
        //创建集合对象存储查询到的学生对象
        ArrayList<StuInfo> stuInfos = new ArrayList<StuInfo>();
        try {
            String sql = "select * from stuInfo a " +
                    "inner join classInfo b on a.classId = b.classId " +
                    "inner join gradeInfo c on b.gradeId = c.gradeId " +
                    " where stuName like '%?%'";
            rs = dbUtil.execQuery(sql, new Object[]{keyword});
            while (rs.next()) {
                GradeInfo gradeInfo = new GradeInfo(
                        rs.getInt("gradeId"),
                        rs.getString("gradeName")
                );
                ClassInfo classInfo = new ClassInfo(
                        rs.getInt("classId"),
                        rs.getString("className"),
                        rs.getString("master"),
                        rs.getString("teacher"),
                        rs.getInt("number"),
                        rs.getString("classBegin"),
                        gradeInfo
                );
                StuInfo stuInfo = new StuInfo(
                        rs.getInt("stuId"),
                        rs.getString("stuNo"),
                        rs.getString("stuName"),
                        rs.getString("stuPwd"),
                        rs.getString("stuSex"),
                        rs.getInt("stuAge"),
                        rs.getString("stuPhoto"),
                        classInfo
                );
                stuInfos.add(stuInfo);
            }
            pageModel.setPageNo(pageNo);
            pageModel.setAll(stuInfos);
            pageModel.setCount(getCount());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return pageModel;
    }

    /**
     * 更新学生信息
     *
     * @param stuInfo StuInfo对象
     * @return 返回true或者false
     */
    public boolean getUpdate(StuInfo stuInfo) {
        boolean result = false;
        try {
            String sql = "update stuInfo set stuNo=?,stuName=?,stuPwd=md5(?),stuSex=?,stuAge=?,classId=? where stuId=?";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    stuInfo.getStuNo(),
                    stuInfo.getStuName(),
                    stuInfo.getStuPwd(),
                    stuInfo.getStuSex(),
                    stuInfo.getStuAge(),
                    stuInfo.getClassInfo().getClassId(),
                    stuInfo.getStuId()
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
     * 根据编号查询学生信息
     *
     * @param stuId
     * @return
     */
    public StuInfo getById(int stuId) {
        StuInfo stuInfo = null;
        try {
            String sql = "select * from stuInfo where stuId = ?";
            rs = dbUtil.execQuery(sql, new Object[]{stuId});
            while (rs.next()) {
                stuInfo = new StuInfo(
                        rs.getInt("stuId"),
                        rs.getString("stuNo"),
                        rs.getString("stuName"),
                        rs.getString("stuPwd"),
                        rs.getString("stuSex"),
                        rs.getInt("stuAge")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return stuInfo;
    }

    /**
     * 用户的修改
     *
     * @param stuInfo 传入StuInfo对象
     * @return 返回true或false
     */
    public boolean getStuUpdate(StuInfo stuInfo) {
        boolean result = false;
        try {
            String sql = "update stuInfo set stuName=?,stuSex=?,stuAge=?,stuPwd=md5(?) where stuNo=?";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    stuInfo.getStuName(),
                    stuInfo.getStuSex(),
                    stuInfo.getStuAge(),
                    stuInfo.getStuPwd(),
                    stuInfo.getStuNo()
            });
            if (row > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
