package model;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.sql.Time;
 //implements Serializable
public class User implements Serializable{
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
	 private String bio;
	// Driver Create
	private String From;
	private String Too;
	private String Day;
	 private String Month;
	private String Time;
	private String Number;
	private String Minute;
	 private String Year;
	 private String img;
	 private String imgfull;
	 private String check;
	 private String bday;
	 private String bmonth;
	 private String byear;
	 private String birthday;
	public static final String ONLINE="online";
	public static final String OFFLINE="offline";

	public User() {
		super();
	}/*
	public void setPlace(String From,String Too){
		this.From = From;
		this.Too = Too;


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



	}*/
	public User(HttpServletRequest request) throws UnsupportedEncodingException {
		extractFormData(request);
	}	
	private void extractFormData(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("name") != null) {
			if (!request.getParameter("name").equals(""))
				name = request.getParameter("name");
		}
		if(request.getParameter("bday") != null) {
			if (!request.getParameter("bday").equals(""))
				bday = request.getParameter("bday");
		}
		if(request.getParameter("bmonth") != null) {
			if (!request.getParameter("bmonth").equals(""))
				bmonth = request.getParameter("bmonth");
		}
		if(request.getParameter("byear") != null) {
			if (!request.getParameter("byear").equals(""))
				byear = request.getParameter("byear");
		}
		if(request.getParameter("check") != null) {
			if (!request.getParameter("check").equals(""))
				check = request.getParameter("check");
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

		if(request.getParameter("number") != null){
			if(!request.getParameter("number").equals(""))
				Number = request.getParameter("number");
		}
		if(request.getParameter("minute") != null){
			if(!request.getParameter("minute").equals(""))
				Minute = request.getParameter("minute");
		}
		if(request.getParameter("day") != null){
			if(!request.getParameter("day").equals(""))
				Day = request.getParameter("day");
		}
		if(request.getParameter("month") != null){
			if(!request.getParameter("month").equals(""))
				Month = request.getParameter("month");
		}
		if(request.getParameter("year") != null){
			if(!request.getParameter("year").equals(""))
				Year = request.getParameter("year");
		}
		if(request.getParameter("img") != null){
			if(!request.getParameter("img").equals(""))
				img = request.getParameter("img");
		}
		if(request.getParameter("imgfull") != null){
			if(!request.getParameter("imgfull").equals(""))
				imgfull = request.getParameter("imgfull");
		}
		if(request.getParameter("id") != null){
			if(!request.getParameter("id").equals(""))
				id = Integer.parseInt(request.getParameter("id"));
		}
		if(request.getParameter("bio") != null){
			if(!request.getParameter("bio").equals(""))
				bio = request.getParameter("bio");
		}




	}

	public int getId() {
		return id;
	}
	 public String getImg() {
		 return img;
	 }
	 public String getBio() {
		 return bio;
	 }
	 public String getBday() {
		 return bday;
	 }
	 public String getBmonth() {
		 return bmonth;
	 }
	 public String getByear() {
		 return byear;
	 }
	 public String getBirthday() {
		String bd = getByear() + "-"+ getBmonth() + "-"+getBday();
		return bd;
	 }
	 public String getImgfull() {
		 return imgfull;
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
	 public String getCheck() {
		 return check;
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
	public String getDay() {
		return Day;
	}
	public String getNumber(){ return Number;}
	 public String getMinute(){ return Minute;}
	 public String getMonth(){ return Month;}
	 public String getYear(){ return Year;}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}
	 public void setImg(String img) {
		 this.img = img;
	 }
	 public void setImgfull(String imgfull) {
		 this.imgfull = imgfull;
	 }
	 public void setMinute(String Minute) {
		 this.Minute = Minute;
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
	 public void setBio(String Bio) {
		 this.bio = Bio;
	 }
	public void setDay(String Day) {
		this.Day = Day;
	}
	 public void setBday(String bday) {
		 this.bday = bday;
	 }
	 public void setBmonth(String bmonth) {
		 this.bmonth = bmonth;
	 }
	 public void setByear(String byear) {
		 this.byear = byear;
	 }
	 public void setBirthday(String birthday) {
		 this.birthday = birthday;
	 }
	public void setNumber(String Number) {
		this.Number = Number;
	}
	 public void setMonth(String Month) {
		 this.Month = Month;
	 }
	 public void setYear(String Year) {
		 this.Year = Year;
	 }

	/*public String toString() {
		return " {id:" + id + ", name:\"" + name + "\", pass:\"" + pass
				+ "\", status:\"" + status + "\"}";
	}*/

	public String toString() {
		return  name + "#" + lname +"#"+ email + "#" + pnum + "#" + img + "#" + imgfull + "#" + sex + "#" + byear + "#" + bmonth + "#" + bday +"#"+ id+"#"+ bio+"#"+ emerpnum+"#";
	}
	
}
