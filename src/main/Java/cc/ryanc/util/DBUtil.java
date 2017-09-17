package cc.ryanc.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
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
            //获取resources资源路径下的连接池配置文件
            pr.load(this.getClass().getResourceAsStream("/druid.properties"));
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
