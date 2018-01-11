package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CommentDao extends DaoManager {
	// inherit from DaoManager
	public CommentDao() {
		super();
	}
	// select from database, return a list of comment object
	public List<Comment> doQuery(String query) {
		List<Comment> comments = new ArrayList<Comment>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int comment_id = rs.getInt("comment_id");
				int user_id = rs.getInt("user_id");
				int article_id = rs.getInt("article_id");
				String comment_text = rs.getString("comment_text");
				String comment_postDate = rs.getString("comment_postDate");
				String comment_postTime = rs.getString("comment_postTime");
				String fullTime = rs.getString("fullTime");
				String author = rs.getString("author");
				Comment comment = new Comment(comment_id, user_id, article_id, comment_text, comment_postDate,
						comment_postTime, fullTime, author);
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comments;
	}
}
