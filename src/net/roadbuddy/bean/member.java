package net.roadbuddy.bean;

import java.io.Serializable;

/**
 * JavaBean class used in jsp action tags.
 * @author Ramesh Fadatare
 */
public class member implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private String contact;
    private String sex;
    private String borndate;
    private String emercontact;
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getBorndate() {
        return borndate;
    }
    public void setBorndate(String borndate) { this.borndate = borndate; }
    public String getEmercontact() {
        return emercontact;
    }
    public void setEmercontact(String emercontact) {
        this.emercontact = emercontact;
    }
}