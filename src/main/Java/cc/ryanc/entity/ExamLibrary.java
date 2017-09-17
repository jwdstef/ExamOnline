package cc.ryanc.entity;

public class ExamLibrary {
    private int libId;
    private String libTitle;
    private String libA;
    private String libB;
    private String libC;
    private String libD;
    private String libRight;
    private Subject subject;
    private int libtype;
    private GradeInfo gradeInfo;

    public ExamLibrary() {
    }

    public ExamLibrary(int libId, String libTitle, String libA, String libB, String libC, String libD, String libRight, Subject subject, int libtype, GradeInfo gradeInfo) {
        this.libId = libId;
        this.libTitle = libTitle;
        this.libA = libA;
        this.libB = libB;
        this.libC = libC;
        this.libD = libD;
        this.libRight = libRight;
        this.subject = subject;
        this.libtype = libtype;
        this.gradeInfo = gradeInfo;
    }

    public ExamLibrary(String libTitle, String libA, String libB, String libC, String libD, String libRight, Subject subject, int libtype, GradeInfo gradeInfo) {
        this.libTitle = libTitle;
        this.libA = libA;
        this.libB = libB;
        this.libC = libC;
        this.libD = libD;
        this.libRight = libRight;
        this.subject = subject;
        this.libtype = libtype;
        this.gradeInfo = gradeInfo;
    }

    public int getLibId() {
        return libId;
    }

    public void setLibId(int libId) {
        this.libId = libId;
    }

    public String getLibTitle() {
        return libTitle;
    }

    public void setLibTitle(String libTitle) {
        this.libTitle = libTitle;
    }

    public String getLibA() {
        return libA;
    }

    public void setLibA(String libA) {
        this.libA = libA;
    }

    public String getLibB() {
        return libB;
    }

    public void setLibB(String libB) {
        this.libB = libB;
    }

    public String getLibC() {
        return libC;
    }

    public void setLibC(String libC) {
        this.libC = libC;
    }

    public String getLibD() {
        return libD;
    }

    public void setLibD(String libD) {
        this.libD = libD;
    }

    public String getLibRight() {
        return libRight;
    }

    public void setLibRight(String libRight) {
        this.libRight = libRight;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public int getLibtype() {
        return libtype;
    }

    public void setLibtype(int libtype) {
        this.libtype = libtype;
    }

    public GradeInfo getGradeInfo() {
        return gradeInfo;
    }

    public void setGradeInfo(GradeInfo gradeInfo) {
        this.gradeInfo = gradeInfo;
    }
}
