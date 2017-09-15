package cc.ryanc.test;

import cc.ryanc.dao.SiteDao;
import cc.ryanc.entity.SiteInfo;
import cc.ryanc.util.DBUtil;


/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/12
 */
public class TestDemo {
    public static void main(String []args){
        DBUtil dbUtil = new DBUtil();
        SiteDao siteDao = new SiteDao();
        SiteInfo siteInfo = siteDao.getQuery();
        System.out.println(siteInfo.getTitle()+"--"+siteInfo.getUrl());
    }
}
