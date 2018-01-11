package Dao;

public class View {
	private int article_id;
	private int user_id;
	private String article_title;
	private String article_text;
	private String postTime;
	private String postDate;
	private String fullTime;
	private String update_time;
	private String icon;
	private String username;
	
	public View(int article_id, int user_id, String article_title, 
			String article_text, String postTime ,String postDate, 
			String fullTime, String update_time, String icon, String username) {
		this.article_id = article_id;
		this.user_id = user_id;
		this.article_title = article_title;
		this.article_text = article_text;
		this.postTime = postTime;
		this.postDate = postDate;
		this.fullTime = fullTime;
		this.update_time = update_time;
		this.icon = icon;
		this.username = username;
	}
	
	
	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public String getFullTime() {
		return fullTime;
	}

	public void setFullTime(String fullTime) {
		this.fullTime = fullTime;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_text() {
		return article_text;
	}

	public void setArticle_text(String article_text) {
		this.article_text = article_text;
	}

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

}

