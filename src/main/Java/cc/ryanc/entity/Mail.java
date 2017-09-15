package cc.ryanc.entity;

/**
 * Created by Administrator on 2017/9/14.
 * 邮件实体类
 */
public class Mail {
    private String from; //发件人
    private StringBuilder toAddress = new StringBuilder(); //收件人
    private StringBuilder ccAddress = new StringBuilder(); //抄送
    private StringBuilder bccAddress = new StringBuilder(); //暗送
    private String subject; //主题
    private String content; //内容

    public Mail() {
    }

    public Mail(String from, String to) {
        this(from, to, null, null);
    }


    public Mail(String from, String to, String subject, String content) {
        this.from = from;
        this.toAddress.append(to);
        this.subject = subject;
        this.content = content;
    }
}
