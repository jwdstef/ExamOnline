package cc.ryanc.entity;

public class ExamPaper {
    private int paperId ;
    private String paperName ;
    private ClassInfo classInfo;
    private String beginTime ;
    private String endTime;

    public ExamPaper() { }

    public ExamPaper(String paperName, ClassInfo classInfo, String beginTime, String endTime) {
        this.paperName = paperName;
        this.classInfo = classInfo;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }

    public ExamPaper(int paperId, String paperName, ClassInfo classInfo, String beginTime, String endTime) {
        this.paperId = paperId;
        this.paperName = paperName;
        this.classInfo = classInfo;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }

    public int getPaperId() {
        return paperId;
    }

    public void setPaperId(int paperId) {
        this.paperId = paperId;
    }

    public String getPaperName() {
        return paperName;
    }

    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
