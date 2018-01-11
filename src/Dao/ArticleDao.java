package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ArticleDao extends DaoManager {
	// inherit from DaoManager
	public ArticleDao() {
		super();
	}
	// select from database, return a list of article object
	public List<Article> doQuery(String query) {
		List<Article> articles = new ArrayList<Article>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int article_id = rs.getInt("article_id");
				int user_id = rs.getInt("user_id");
				String article_title = rs.getString("article_title");
				String article_text = rs.getString("article_text");
				String article_postTime = rs.getString("article_postTime");
				String article_postDate = rs.getString("article_postDate");
				String fullTime = rs.getString("fullTime");
				String update_time = rs.getString("update_time");
				int likes = rs.getInt("likes");
				String likeNames = rs.getString("likeNames");
				String author = rs.getString("author");
				Article article = new Article(article_id, user_id, article_title, article_text, article_postTime,
						article_postDate, fullTime, update_time, likes, likeNames, author);
				articles.add(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articles;
	}

}
