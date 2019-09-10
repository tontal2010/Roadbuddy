package model;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.sql.Time;

public class User implements Serializable {
	private static final long serialVersionUID = -5161680823918839255L;
	private int id;
	private String name;
	private String pass;
	private String status;
	private String sex;
	private String pnum;
	private String emerpnum;
	private String email;
	private String lname;
	private String pass2;
	// Driver Create
	private String From;
	private String Too;
	private String Date;
	private String Time;
	private String Number;

	public static final String ONLINE="online";
	public static final String OFFLINE="offline";
	
	public User() {
		super();
	}
	public User(String From,String Too,String Date,String Time,String Number){
		this.From = From;
		this.Too = Too;
		this.Date = Date;
		this.Time = Time;
		this.Number = Number;

	}
	
	public User(String name, String lname, String sex, String pnum , String emerpnum, String email, String pass ,String pass2 ) {
		super();
		this.name = name;
		this.lname = lname;
		this.sex = sex;
		this.pnum = pnum;
		this.emerpnum = emerpnum;
		this.email = email;
		this.pass = pass;
		this.pass2 = pass2;



	}
	public User(HttpServletRequest request) throws UnsupportedEncodingException {
		extractFormData(request);
	}	
	private void extractFormData(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("name") != null) {
			if (!request.getParameter("name").equals(""))
				name = request.getParameter("name");
		}
		if(request.getParameter("password") != null) {
			if (!request.getParameter("password").equals(""))
				pass = request.getParameter("password");
		}
		if(request.getParameter("lastname") != null){
			if(!request.getParameter("lastname").equals(""))
				lname = request.getParameter("lastname");
		}
		if(request.getParameter("sex") != null){
			if(!request.getParameter("sex").equals(""))
				sex = request.getParameter("sex");
		}
		if(request.getParameter("contact") != null){
			if(!request.getParameter("contact").equals(""))
				pnum= request.getParameter("contact");
		}
		if(request.getParameter("emercontact") != null){
			if(!request.getParameter("emercontact").equals(""))
				emerpnum = request.getParameter("emercontact");
		}
		if(request.getParameter("email") != null){
			if(!request.getParameter("email").equals(""))
				email = request.getParameter("email");
		}
		if(request.getParameter("password2") != null){
			if(!request.getParameter("password2").equals(""))
				pass2 = request.getParameter("password2");
		}

		if(request.getParameter("from") != null){
			if(!request.getParameter("from").equals(""))
				From = request.getParameter("from");
		}
		if(request.getParameter("to") != null){
			if(!request.getParameter("to").equals(""))
				Too = request.getParameter("to");
		}
		if(request.getParameter("time") != null){
			if(!request.getParameter("time").equals(""))
				Time = request.getParameter("time");
		}
		if(request.getParameter("date") != null){
			if(!request.getParameter("date").equals(""))
				Date = request.getParameter("date");
		}
		if(request.getParameter("number") != null){
			if(!request.getParameter("number").equals(""))
				Number = request.getParameter("number");
		}



	}

	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPass() {
		return pass;
	}
	public String getLname() {
		return lname;
	}
	public String getSex() {
		return sex;
	}
	public String getPnum() {
		return pnum;
	}
	public String getEmerpnum() {
		return emerpnum;
	}
	public String getEmail() {
		return email;
	}
	public String getPass2() {
		return pass2;
	}
	public String getFrom() {
		return From;
	}
	public String getToo() {
		return Too;
	}
	public String getTime() {
		return Time;
	}
	public String getDate() {
		return Date;
	}
	public String getNumber(){ return Number;}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public void setEmerpnum(String emerpnum) {
		this.emerpnum = emerpnum;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setFrom(String From) {
		this.From = From;
	}
	public void setToo(String Too) {
		this.Too = Too;
	}
	public void setTime(String Time) {
		this.Time = Time;
	}
	public void setDate(String Date) {
		this.Date = Date;
	}
	public void setNumber(String Number) {
		this.Number = Number;
	}
	@Override
	public String toString() {
		return " {id:" + id + ", name:\"" + name + "\", pass:\"" + pass
				+ "\", status:\"" + status + "\"}";
	}
	
}
