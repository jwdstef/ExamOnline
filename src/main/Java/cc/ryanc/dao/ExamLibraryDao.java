package cc.ryanc.dao;

import cc.ryanc.entity.ExamLibrary;
import cc.ryanc.entity.GradeInfo;
import cc.ryanc.entity.Subject;
import cc.ryanc.util.DBUtil;
import cc.ryanc.util.PageModel;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/16
 */
public class ExamLibraryDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;

    /**
     * 查询所有题目
     *
     * @return
     */
    public PageModel<ExamLibrary> getQuery(int pageNo) {
        PageModel<ExamLibrary> pageModel = new PageModel<ExamLibrary>();
        ArrayList<ExamLibrary> examLibraries = new ArrayList<ExamLibrary>();
        try {
            int pageIndex = (pageNo - 1) * 10;
            String sql = "select * from examLibrary a " +
                    "inner join subject b on a.subId = b.subId " +
                    "inner join gradeInfo c on a.gradeId = c.gradeId " +
                    "limit ?,10";
            rs = dbUtil.execQuery(sql, new Object[]{pageIndex});
            //创建对象在循环体里封装数据
            ExamLibrary examLibrary = null;
            Subject subject = null;
            GradeInfo gradeInfo = null;
            while (rs.next()) {
                gradeInfo = new GradeInfo(
                        rs.getInt("gradeId"),
                        rs.getString("gradeName")
                );
                subject = new Subject(
                        rs.getInt("subId"),
                        rs.getString("subName")
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
                examLibraries.add(examLibrary);
            }
            pageModel.setAll(examLibraries);
            pageModel.setPageNo(pageNo);
            pageModel.setCount(getCount());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageModel;
    }

    public int getCount() {
        int row = 0;
        try {
            String sql = "select count(*) from examLibrary";
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
     * 根据编号删除题目
     * @param libId
     * @return
     */
    public boolean getRemove(int libId){
        //初始化返回值
        boolean result = false;
        try{
            String sql = "delete from examLibrary where libId = ?";
            int row = dbUtil.execUpdate(sql,new Object[]{libId});
            if(row>0){
                result = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新题目数据
     * @param examLibrary ExamLibrary对象
     * @return 返回true或者false;
     */
    public boolean getUpdate(ExamLibrary examLibrary){
        boolean result = false;
        try{
            String sql = "update examLibrary set " +
                    "libTitle=?,libA=?,libB=?,libC=?,libD=?," +
                    "libRight=?,subId=?,libtype=?,gradeId=?" +
                    " where libId=?";
            int row = dbUtil.execUpdate(sql,new Object[]{
                    examLibrary.getLibTitle(),
                    examLibrary.getLibA(),
                    examLibrary.getLibB(),
                    examLibrary.getLibC(),
                    examLibrary.getLibD(),
                    examLibrary.getLibRight(),
                    examLibrary.getSubject().getSubId(),
                    examLibrary.getLibId(),
                    examLibrary.getGradeInfo().getGradeId(),
                    examLibrary.getLibId()
            });
            if(row>0){
                result = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
