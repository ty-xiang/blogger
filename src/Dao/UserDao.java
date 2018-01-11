package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends DaoManager {
	// inherit from DaoManager
	public UserDao() {
		super();
	}
	// select from database, return a list of user object
	public List<User> doQuery(String query) {
		List<User> users = new ArrayList<User>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int user_id = rs.getInt("user_id");
				String username = rs.getString("username");
				String fname = rs.getString("fname");
				String lname = rs.getString("lname");
				String passwd = rs.getString("passwd");
				String birthday = rs.getString("birthday");
				String useremail = rs.getString("useremail");
				String education = rs.getString("education");
				String iconPath = rs.getString("iconPath");
				String registerDate = rs.getString("registerDate");
				String registerTime = rs.getString("registerTime");
				String fullTime = rs.getString("fullTime");
				User user = new User(user_id, username, fname, lname, passwd, birthday, useremail, education, iconPath,
						registerDate, registerTime, fullTime);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
}
