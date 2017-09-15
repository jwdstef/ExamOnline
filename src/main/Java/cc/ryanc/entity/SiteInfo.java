package cc.ryanc.entity;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/15
 */
public class SiteInfo {
    private String title;
    private String url;
    private String words;
    private String descr;
    private String sitemap;
    private String favicon;
    private String copyright;
    private String icp;
    private String count;

    public SiteInfo() {
    }

    public SiteInfo(String title, String url, String words, String descr, String sitemap, String favicon, String copyright, String icp, String count) {
        this.title = title;
        this.url = url;
        this.words = words;
        this.descr = descr;
        this.sitemap = sitemap;
        this.favicon = favicon;
        this.copyright = copyright;
        this.icp = icp;
        this.count = count;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getSitemap() {
        return sitemap;
    }

    public void setSitemap(String sitemap) {
        this.sitemap = sitemap;
    }

    public String getFavicon() {
        return favicon;
    }

    public void setFavicon(String favicon) {
        this.favicon = favicon;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public String getIcp() {
        return icp;
    }

    public void setIcp(String icp) {
        this.icp = icp;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }
}
