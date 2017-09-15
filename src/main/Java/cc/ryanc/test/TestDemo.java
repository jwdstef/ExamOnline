package cc.ryanc.test;

import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/12
 */
public class TestDemo {
    public static void main(String []args){
        DBUtil dbUtil = new DBUtil();
        String sql = "select * from stuInfo where stuNo=?";
        ResultSet rs = dbUtil.execQuery(sql,new Object[]{"S0001"});
        try {
            while(rs.next()){
                System.out.println(rs.getInt(1)+"--"+rs.getString(2)+"--"+rs.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
