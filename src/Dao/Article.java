package Dao;

public class Article {
	private int article_id;
	private int user_id;
	private String article_title;
	private String article_text;
	private String postTime;
	private String postDate;
	private String fullTime;
	private String update_time;
	private int likes;
	private String likeNames;
	private String author;

	public Article(int article_id, int user_id, String article_title, String article_text, String postTime ,String postDate, String fullTime, String update_time, int likes, String likeNames, String author) {
		this.article_id = article_id;
		this.user_id = user_id;
		this.article_title = article_title;
		this.article_text = article_text;
		this.postTime = postTime;
		this.postDate = postDate;
		this.fullTime = fullTime;
		this.update_time = update_time;
		this.likes = likes;
		this.likeNames = likeNames;
		this.author = author;
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

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getLikeNames() {
		return likeNames;
	}

	public void setLikeNames(String likeNames) {
		this.likeNames = likeNames;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
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
