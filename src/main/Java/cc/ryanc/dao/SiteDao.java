package cc.ryanc.dao;

import cc.ryanc.entity.SiteInfo;
import cc.ryanc.util.DBUtil;

import java.sql.ResultSet;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/15
 */
public class SiteDao {
    DBUtil dbUtil = new DBUtil();
    ResultSet rs = null;

    /**
     * 查询站点信息表
     *
     * @return 返回SiteInfo实体类
     */
    public SiteInfo getQuery() {
        SiteInfo siteInfo = null;
        try {
            String sql = "select * from siteInfo";
            rs = dbUtil.execQuery(sql, null);
            while (rs.next()) {
                siteInfo = new SiteInfo(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtil.closeSource(rs);
        }
        return siteInfo;
    }

    /**
     * 修改站点信息表
     *
     * @param siteInfo 传入封装后的实体类对象
     * @return 返回true或者false
     */
    public boolean getUpdate(SiteInfo siteInfo) {
        //初始化返回值
        boolean result = false;
        try {
            String sql = "update siteInfo set " +
                    "title=?,url=?,words=?,descr=?,sitemap=?,favicon=?,copyright=?,icp=?,count=?";
            int row = dbUtil.execUpdate(sql, new Object[]{
                    siteInfo.getTitle(),
                    siteInfo.getUrl(),
                    siteInfo.getWords(),
                    siteInfo.getDescr(),
                    siteInfo.getSitemap(),
                    siteInfo.getFavicon(),
                    siteInfo.getCopyright(),
                    siteInfo.getIcp(),
                    siteInfo.getCount()
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
