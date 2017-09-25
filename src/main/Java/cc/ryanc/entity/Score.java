package cc.ryanc.entity;

public class Score {
    private int scoreId;
    private StuInfo stuInfo;
    private ExamPaper examPaper;
    private int score;

    public Score() {
    }

    public Score(StuInfo stuInfo, ExamPaper examPaper, int score) {
        this.stuInfo = stuInfo;
        this.examPaper = examPaper;
        this.score = score;
    }

    public Score(int scoreId, StuInfo stuInfo, ExamPaper examPaper, int score) {
        this.scoreId = scoreId;
        this.stuInfo = stuInfo;
        this.examPaper = examPaper;
        this.score = score;
    }

    public int getScoreId() {
        return scoreId;
    }

    public void setScoreId(int scoreId) {
        this.scoreId = scoreId;
    }

    public StuInfo getStuInfo() {
        return stuInfo;
    }

    public void setStuInfo(StuInfo stuInfo) {
        this.stuInfo = stuInfo;
    }

    public ExamPaper getExamPaper() {
        return examPaper;
    }

    public void setExamPaper(ExamPaper examPaper) {
        this.examPaper = examPaper;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
