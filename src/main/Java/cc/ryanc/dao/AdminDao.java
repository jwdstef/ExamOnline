package cc.ryanc.dao;

import cc.ryanc.entity.AdminInfo;
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
public class AdminDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;

    /**
     * 后台登陆验证
     *
     * @param adminName 传入的用户名
     * @param adminPwd  传入的密码
     * @return 返回AdminInfo实体类对象
     */
    public AdminInfo getLogin(String adminName, String adminPwd) {
        //创建实体类对象储存信息
        AdminInfo adminInfo = null;
        String sql = "select * from adminInfo where adminName=? and adminPwd=md5(?)";
        try {
            rs = dbUtil.execQuery(sql, new Object[]{adminName, adminPwd});
            if (rs.next()) {
                adminInfo = new AdminInfo(
                        rs.getInt("adminId"),
                        rs.getString("adminName"),
                        rs.getString("adminEmail"),
                        rs.getString("adminPwd")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return adminInfo;
    }

    /**
     * 查询所有管理员信息
     *
     * @param pageNo 传入当前的页码
     * @return
     */
    public PageModel<AdminInfo> getQuery(int pageNo) {
        //创建分页存储对象
        PageModel<AdminInfo> pageModel = new PageModel<AdminInfo>();
        ArrayList<AdminInfo> adminInfos = new ArrayList<AdminInfo>();
        try {
            String sql = "select * from adminInfo";
            rs = dbUtil.execQuery(sql, null);
            while (rs.next()) {
                AdminInfo adminInfo = new AdminInfo(
                        rs.getInt("adminId"),
                        rs.getString("adminName"),
                        rs.getString("adminEmail"),
                        rs.getString("adminPwd")
                );
                adminInfos.add(adminInfo);
            }
            pageModel.setAll(adminInfos);
            pageModel.setPageNo(pageNo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return pageModel;
    }

    /**
     * 新增管理员
     *
     * @param adminInfo 传入AdminInfo对象
     * @return 返回true或false
     */
    public boolean getInsert(AdminInfo adminInfo) {
        //初始化返回值
        boolean result = false;
        try {
            String sql = "insert into adminInfo values(adminId,?,?,md5(?))";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    adminInfo.getAdminName(),
                    adminInfo.getAdminEmail(),
                    adminInfo.getAdminPwd()
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
     * 根据编号查询信息
     * @param adminId 传入管理员编号
     * @return 返回AdminInfo实体类对象
     */
    public AdminInfo getById(int adminId){
        //初始化AdminInfo
        AdminInfo adminInfo = null;
        try{
            String sql = "select * from adminInfo where adminId = ?";
            rs = dbUtil.execQuery(sql,new Object[]{adminId});
            if (rs.next()){
                adminInfo = new AdminInfo(
                        adminId,
                        rs.getString("adminName"),
                        rs.getString("adminEmail"),
                        rs.getString("adminPwd")
                );
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return adminInfo;
    }

    /**
     * 修改管理员信息
     *
     * @param adminInfo 传入AdminInfo对性
     * @return 返回true或者false;
     */
    public boolean getUpdate(AdminInfo adminInfo) {
        //初始化返回值
        boolean result = false;
        try {
            String sql = "update adminInfo set adminName=?,adminEmail=?,adminPwd=md5(?) where adminId=?";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    adminInfo.getAdminName(),
                    adminInfo.getAdminEmail(),
                    adminInfo.getAdminPwd(),
                    adminInfo.getAdminId()
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
     * 根据管理员编号删除管理员
     * @param adminId　传入要删除的管理员编号
     * @return  返回true or false;
     */
    public boolean getRemove(int adminId){
        boolean result = false;
        try{
            String sql = "delete from adminInfo where adminId=?";
            int row = dbUtil.execUpdate(sql,new Object[]{adminId});
            if(row>0){
                result = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
