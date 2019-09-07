package net.roadbuddy.bean;

import java.io.Serializable;

/**
 * JavaBean class used in jsp action tags.
 * @author Ramesh Fadatare
 */
public class place implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String from;
    private String to;
    private String date;
    private String partnernum;
    private String time;
    private String sex;

    public String getFrom() {
        return from;
    }
    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }
    public void setTo(String to) {
        this.to = to;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    public String getPartnernum() {
        return partnernum;
    }
    public void setPartnernum(String partnernum) {
        this.partnernum = partnernum;
    }

    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time = time;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    }

}