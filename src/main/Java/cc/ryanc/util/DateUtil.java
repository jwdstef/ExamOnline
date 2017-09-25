package cc.ryanc.util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/15
 */
public class DateUtil {

    public static String pattern = "yyyy-MM-dd";
    public static SimpleDateFormat formatter = new SimpleDateFormat(pattern);

    /**
     * 获取当前日期对象
     *
     * @return 返回值为Date类型
     */
    public static Date getNowDateShort() {
        String dateString = formatter.format(new Date());
        ParsePosition pos = new ParsePosition(8);
        Date currentTime = formatter.parse(dateString, pos);
        return currentTime;
    }

    /**
     * 获取当前日期和时间
     *
     * @return 返回值为String类型
     */
    public static String getStringDate() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(new Date());
        return dateString;
    }

    /**
     * 只获取日期
     *
     * @return 返回值为String类型
     */
    public static String getStringDateShort() {
        String dateString = formatter.format(new Date());
        return dateString;
    }
}
