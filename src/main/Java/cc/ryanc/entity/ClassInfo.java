package cc.ryanc.entity;

/**
 * Created with IntelliJ IDEA.
 * Author: RYAN0UP
 * Date: 2017/9/13
 * 班级实体类
 */
public class ClassInfo {
    private int classId;
    private String className;
    private String master;
    private String teacher;
    private int number;
    private String classBegin;
    private GradeInfo gradeInfo;

    public ClassInfo() {
    }

    public ClassInfo(int classId, String className, String master, String teacher, int number, String classBegin, GradeInfo gradeInfo) {
        this.classId = classId;
        this.className = className;
        this.master = master;
        this.teacher = teacher;
        this.number = number;
        this.classBegin = classBegin;
        this.gradeInfo = gradeInfo;
    }

    public ClassInfo(String className, String master, String teacher, int number, String classBegin, GradeInfo gradeInfo) {
        this.className = className;
        this.master = master;
        this.teacher = teacher;
        this.number = number;
        this.classBegin = classBegin;
        this.gradeInfo = gradeInfo;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMaster() {
        return master;
    }

    public void setMaster(String master) {
        this.master = master;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getClassBegin() {
        return classBegin;
    }

    public void setClassBegin(String classBegin) {
        this.classBegin = classBegin;
    }

    public GradeInfo getGradeInfo() {
        return gradeInfo;
    }

    public void setGradeInfo(GradeInfo gradeInfo) {
        this.gradeInfo = gradeInfo;
    }
}
