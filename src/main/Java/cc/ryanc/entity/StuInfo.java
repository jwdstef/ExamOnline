package cc.ryanc.entity;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 * 学生实体类
 */
public class StuInfo {
    private int stuId;
    private String stuNo;
    private String stuName;
    private String stuPwd;
    private String stuSex;
    private int stuAge;
    private String stuPhoto;
    private ClassInfo classInfo;

    public StuInfo() {
    }

    public StuInfo(int stuId, String stuNo, String stuName, String stuPwd, String stuSex, int stuAge, String stuPhoto, ClassInfo classInfo) {
        this.stuId = stuId;
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.stuPwd = stuPwd;
        this.stuSex = stuSex;
        this.stuAge = stuAge;
        this.stuPhoto = stuPhoto;
        this.classInfo = classInfo;
    }

    public StuInfo(String stuNo, String stuName, String stuPwd, String stuSex, int stuAge, String stuPhoto, ClassInfo classInfo) {
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.stuPwd = stuPwd;
        this.stuSex = stuSex;
        this.stuAge = stuAge;
        this.stuPhoto = stuPhoto;
        this.classInfo = classInfo;
    }

    public StuInfo(int stuId, String stuNo, String stuName, String stuPwd, String stuSex, int stuAge) {
        this.stuId = stuId;
        this.stuNo = stuNo;
        this.stuName = stuName;
        this.stuPwd = stuPwd;
        this.stuSex = stuSex;
        this.stuAge = stuAge;
    }

    public int getStuId() {
        return stuId;
    }

    public void setStuId(int stuId) {
        this.stuId = stuId;
    }

    public String getStuNo() {
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuPwd() {
        return stuPwd;
    }

    public void setStuPwd(String stuPwd) {
        this.stuPwd = stuPwd;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public int getStuAge() {
        return stuAge;
    }

    public void setStuAge(int stuAge) {
        this.stuAge = stuAge;
    }

    public String getStuPhoto() {
        return stuPhoto;
    }

    public void setStuPhoto(String stuPhoto) {
        this.stuPhoto = stuPhoto;
    }

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }
}
