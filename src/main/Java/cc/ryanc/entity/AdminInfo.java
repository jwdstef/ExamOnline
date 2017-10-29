package cc.ryanc.entity;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 * 管理员信息实体类
 */
public class AdminInfo {
    private int adminId;
    private String adminName;
    private String adminEmail;
    private String adminPwd;

    public AdminInfo() {
    }

    public AdminInfo(int adminId, String adminName, String adminEmail, String adminPwd) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminEmail = adminEmail;
        this.adminPwd = adminPwd;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }
}
