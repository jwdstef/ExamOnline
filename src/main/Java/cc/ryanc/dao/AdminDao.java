package cc.ryanc.dao;

import cc.ryanc.entity.AdminInfo;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 */
public class AdminDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;

    public AdminInfo getLogin(String adminName,String adminPwd) {
        //创建实体类对象储存信息
        AdminInfo adminInfo = null;
        String sql = "select * from adminInfo where adminName=? and adminPwd=md5(?)";
        try {
            rs = dbUtil.execQuery(sql, new Object[]{adminName,adminPwd});
            if (rs.next()) {
                adminInfo = new AdminInfo(rs.getString("adminName"), rs.getString("adminPwd"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return adminInfo;
    }
}
