package cc.ryanc.entity;

/**
 * Created by Administrator on 2017/9/14.
 */
public class GradeInfo {
    private int gradeId;
    private String gradeName;

    public GradeInfo() {
    }

    public GradeInfo(int gradeId, String gradeName) {
        this.gradeId = gradeId;
        this.gradeName = gradeName;
    }

    public int getGradeId() {
        return gradeId;
    }

    public void setGradeId(int gradeId) {
        this.gradeId = gradeId;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }
}
