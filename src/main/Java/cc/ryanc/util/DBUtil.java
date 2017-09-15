package cc.ryanc.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 08/09/2017
 */
public class DBUtil {
    public Connection conn = null;
    public PreparedStatement ptmt = null;
    public ResultSet rs = null;
    DataSource dataSource = null;

    public DBUtil() {
        try {
            //加载配置文件
            Properties pr = new Properties();
            pr.put("driverClassName","com.mysql.jdbc.Driver");
            pr.put("url","jdbc:mysql://localhost:3306/examDB");
            pr.put("username","root");
            pr.put("password","123456");
            pr.put("initialSize","1");
            pr.put("minIdle","1");
            pr.put("maxActive","2000");
            pr.put("maxWait","60000");
            pr.put("timeBetweenEvictionRunsMillis","60000");
            pr.put("minEvictableIdleTimeMillis","300000");
            pr.put("validationQuery","SELECT 'x'");
            pr.put("testWhileIdle","true");
            pr.put("testOnBorrow","false");
            pr.put("testOnReturn","true");
            pr.put("poolPreparedStatements","false");
            pr.put("maxPoolPreparedStatementPerConnectionSize","20");
            pr.put("filters","stat");
            dataSource = DruidDataSourceFactory.createDataSource(pr);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 打开连接
     */
    public void getConnection() {
        try {
            conn = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /**
     * 关闭资源
     */
    public void closeSource(ResultSet rs) {
        try {
            if (rs != null)
                rs.close();
            if (ptmt != null)
                ptmt.close();
            if (conn != null)
                conn.close();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }

    /**
     * 执行数据库的查询
     *
     * @param sql    需要执行的sql语句
     * @param params sql语句中的参数列表
     * @return
     */
    public ResultSet execQuery(String sql, Object[] params) {
        getConnection();
        try {
            ptmt = conn.prepareStatement(sql);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    ptmt.setObject(i + 1, params[i]);
                }
            }
            rs = ptmt.executeQuery();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;
    }

    /**
     * 执行数据库的增删改
     *
     * @param sql    需要执行的sql语句
     * @param params sql语句中的参数列表
     * @return
     */
    public int execUpdate(String sql, Object[] params) {
        getConnection();
        int result = -1;
        try {
            ptmt = conn.prepareStatement(sql);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    ptmt.setObject(i + 1, params[i]);
                }
            }
            result = ptmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            closeSource(null);
        }
        return result;
    }
}
