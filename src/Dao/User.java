package Dao;

public class User {
	private int user_id;
	private String username;
	private String fname;
	private String lname;
	private String passwd;
	private String birthday;
	private String useremail;
	private String education;
	private String iconPath;
	private String registerDate;
	private String resgsterTime;
	private String fullTime;

	public User(int user_id, String username, String fname, String lname, String passwd, String birthday,
			String useremail, String education, String iconPath, String registerDate, String resgsterTime, String fullTime) {
		this.user_id = user_id;
		this.username = username;
		this.fname = fname;
		this.lname = lname;
		this.passwd = passwd;
		this.birthday = birthday;
		this.useremail = useremail;
		this.education = education;
		this.iconPath = iconPath;
		this.registerDate = registerDate;
		this.resgsterTime = resgsterTime;
		this.fullTime = fullTime;
	}
	
	public String getFullTime() {
		return fullTime;
	}

	public void setFullTime(String fullTime) {
		this.fullTime = fullTime;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getIconPath() {
		return iconPath;
	}

	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getResgsterTime() {
		return resgsterTime;
	}

	public void setResgsterTime(String resgsterTime) {
		this.resgsterTime = resgsterTime;
	}

}
