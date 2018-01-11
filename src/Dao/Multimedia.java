package Dao;

public class Multimedia {
	private int multimedia_id;
	private int user_id;
	private int article_id;
	private String mutimedia_title;
	private String description;
	private String link;
	private String multimedia_postDate;
	private String multimedia_postTime;
	private String fullTime;

	public Multimedia(int multimedia_id, int user_id, int article_id, String mutimedia_title, String description,
			String link, String multimedia_postDate, String multimedia_postTime, String fullTime) {
		this.multimedia_id = multimedia_id;
		this.user_id = user_id;
		this.article_id = article_id;
		this.mutimedia_title = mutimedia_title;
		this.description = description;
		this.link = link;
		this.multimedia_postDate = multimedia_postDate;
		this.multimedia_postTime = multimedia_postTime;
		this.fullTime = fullTime;
	}

	public String getFullTime() {
		return fullTime;
	}

	public void setFullTime(String fullTime) {
		this.fullTime = fullTime;
	}

	public int getMultimedia_id() {
		return multimedia_id;
	}

	public void setMultimedia_id(int multimedia_id) {
		this.multimedia_id = multimedia_id;
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

	public String getMutimedia_title() {
		return mutimedia_title;
	}

	public void setMutimedia_title(String mutimedia_title) {
		this.mutimedia_title = mutimedia_title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getMultimedia_postDate() {
		return multimedia_postDate;
	}

	public void setMultimedia_postDate(String multimedia_postDate) {
		this.multimedia_postDate = multimedia_postDate;
	}

	public String getMultimedia_postTime() {
		return multimedia_postTime;
	}

	public void setMultimedia_postTime(String multimedia_postTime) {
		this.multimedia_postTime = multimedia_postTime;
	}

}
