package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ViewDao extends DaoManager {
	private List<View> views;
	
	public ViewDao() {
		super();
	}
	
	public void fullRecordOrder(String conditon) {
		String query1;
		query1 = "select article_id, articles.user_id, username, ";
		query1 += "article_title, article_text, article_postTime, article_postDate, ";
		query1 += "articles.fulltime, articles.update_time, iconPath";
		query1 += " from users, articles";
		query1 += " where users.user_id = articles.user_id";
		// query1 += " AND " + condition; // This can achieve a further subsets
		query1 += " order by article_postDate desc";
		List<View> views = new ArrayList<View>();
		System.out.println(query1);
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query1);
			while (rs.next()) {
				int article_id = rs.getInt("article_id");
				int user_id = rs.getInt("user_id");
				String article_title = rs.getString("article_title");
				String article_text = rs.getString("article_text");
				String article_postTime = rs.getString("article_postTime");
				String article_postDate = rs.getString("article_postDate");
				String fullTime = rs.getString("fullTime");
				String updateTime = rs.getString("update_time");
				String icon = rs.getString("iconPath");
				String username = rs.getString("username");
				View view = new View(article_id, user_id, article_title, article_text, article_postTime,
						article_postDate, fullTime, updateTime, icon, username);
				views.add(view);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.views = views;
	}
	
	public int getLen() {
		return views.size();
	}

	public List<View> subsetRecord(int size, int page) {
		if (page == -1) {  // set -1 return all records
			return views;
		}
		
		// get total length of the records
		int count = getLen();
		
		return views.subList(0 + page * size, Math.min(size + page*size, count)); //[0,5)
		
	}
}
