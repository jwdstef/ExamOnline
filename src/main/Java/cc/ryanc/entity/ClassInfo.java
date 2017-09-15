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
    private String classBegin;
    private GradeInfo gradeInfo;

    public ClassInfo() {
    }

    public ClassInfo(int classId, String className, String classBegin, GradeInfo gradeInfo) {
        this.classId = classId;
        this.className = className;
        this.classBegin = classBegin;
        this.gradeInfo = gradeInfo;
    }

    public ClassInfo(String className, String classBegin, GradeInfo gradeInfo) {
        this.className = className;
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
