package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MultimediaDao extends DaoManager {
	// inherit from DaoManager
	public MultimediaDao() {
		super();
	}
	// select from database, return a list of multimedia object
	public List<Multimedia> doQuery(String query) {
		List<Multimedia> multimedias = new ArrayList<Multimedia>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int multimedia_id = rs.getInt("multimedia_id");
				int user_id = rs.getInt("user_id");
				int article_id = rs.getInt("article_id");
				String multimedia_title = rs.getString("multimedia_title");
				String description = rs.getString("description");
				String link = rs.getString("link");
				String multimedia_postDate = rs.getString("multimedia_postDate");
				String multimedia_postTime = rs.getString("multimedia_postTime");
				String fullTime = rs.getString("fullTime");
				Multimedia multimedia = new Multimedia(multimedia_id, user_id, article_id, multimedia_title,
						description, link, multimedia_postDate, multimedia_postTime, fullTime);
				multimedias.add(multimedia);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return multimedias;
	}
}
