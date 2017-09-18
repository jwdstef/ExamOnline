package cc.ryanc.entity;

public class ExamPaperLibs {
    private ExamPaper examPaper ;
    private ExamLibrary examLibrary ;

    public ExamPaperLibs() { }

    public ExamPaperLibs(ExamPaper examPaper, ExamLibrary examLibrary) {
        this.examPaper = examPaper;
        this.examLibrary = examLibrary;
    }

    public ExamPaper getExamPaper() {
        return examPaper;
    }

    public void setExamPaper(ExamPaper examPaper) {
        this.examPaper = examPaper;
    }

    public ExamLibrary getExamLibrary() {
        return examLibrary;
    }

    public void setExamLibrary(ExamLibrary examLibrary) {
        this.examLibrary = examLibrary;
    }
}
