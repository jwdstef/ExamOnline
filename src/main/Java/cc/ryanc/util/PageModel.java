package cc.ryanc.util;

import java.util.ArrayList;

public class PageModel<T> {

    //定义属性表示当前页
    private int pageNo = 1;
    //定义属性表示每页显示的条数
    private int pageSize = 10;
    //定义数学表示总记录数
    private int count;
    //定义集合存放每页显示的数据
    private ArrayList<T> all;

    /**
     * 表示首页
     *
     * @return
     */
    public int getIndex() {
        return 1;
    }

    /**
     * 上一页
     *
     * @return
     */
    public int getPagePre() {
        int pagePre = pageNo - 1;
        if (pagePre < 1) {
            pagePre = pageNo;
        }
        return pagePre;
    }

    /**
     * 最后一页
     *
     * @return
     */
    public int getPageTotal() {
        int pageTotal = 0;
        if (count % pageSize == 0) {
            pageTotal = count / pageSize;
        } else {
            pageTotal = count / pageSize + 1;
        }
        return pageTotal;
    }

    /**
     * 下一页
     *
     * @return
     */
    public int getPageNext() {
        int pageNext = pageNo + 1;
        if (pageNext > this.getPageTotal()) {
            pageNext = this.getPageTotal();
        }
        return pageNext;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public ArrayList<T> getAll() {
        return all;
    }

    public void setAll(ArrayList<T> all) {
        this.all = all;
    }
}
