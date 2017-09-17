package cc.ryanc.test;

import cc.ryanc.dao.SiteDao;
import cc.ryanc.entity.SiteInfo;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;


/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/12
 */
public class TestDemo {
    public static void main(String []args){
        DBUtil dbUtil = new DBUtil();
        ResultSet rs = null;
        String name = "admin";
        String pwd = "123456";
        String sql = "select * from adminInfo where adminName=? and adminPwd=md5(?)";
        rs = dbUtil.execQuery(sql,new Object[]{name,pwd});
        try{
            if(rs.next()){
                System.out.println("登录成功");
            }else{
                System.out.println("登录失败");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
