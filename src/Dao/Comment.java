package Dao;

public class Comment {
	private int comment_id;
	private int user_id;
	private int article_id;
	private String comment_text;
	private String comment_postDate;
	private String comment_postTime;
	private String fullTime;
	private String author;
	private String iconPath;

	public String getIconPath() {
		return iconPath;
	}


	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}


	public Comment(int comment_id, int user_id, int article_id, String comment_text, String comment_postDate,
			String comment_postTime, String fullTime, String author) {
		super();
		this.comment_id = comment_id;
		this.user_id = user_id;
		this.article_id = article_id;
		this.comment_text = comment_text;
		this.comment_postDate = comment_postDate;
		this.comment_postTime = comment_postTime;
		this.fullTime = fullTime;
		this.author = author;
	}
	
	
	public String getFullTime() {
		return fullTime;
	}

	public void setFullTime(String fullTime) {
		this.fullTime = fullTime;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public String getComment_postDate() {
		return comment_postDate;
	}

	public void setComment_postDate(String comment_postDate) {
		this.comment_postDate = comment_postDate;
	}

	public String getComment_postTime() {
		return comment_postTime;
	}

	public void setComment_postTime(String comment_postTime) {
		this.comment_postTime = comment_postTime;
	}

}
