package cc.ryanc.entity;

public class Subject {
    private int subId;
    private String subName;

    public Subject() {
    }

    public Subject(int subId, String subName) {
        this.subId = subId;
        this.subName = subName;
    }

    public int getSubId() {
        return subId;
    }

    public void setSubId(int subId) {
        this.subId = subId;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }
}
