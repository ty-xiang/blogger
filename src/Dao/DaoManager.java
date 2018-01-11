package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoManager {

	private static final String DATEBASE = "jdbc:derby://localhost:1527/Final_Project;create=true";
	protected Connection conn = null;
	Statement stmt;

	/**
	 * This class is to handling database connection. When instantiate this
	 * class or subclass of this class, it will connect the database, and allow
	 * other program to manipulate the database
	 */
	public DaoManager() {
		try {
			Class.forName("org.apache.derby.jdbc.ClientDriver");
		} catch (Exception except) {
			except.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(DATEBASE, "APP", "APP");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * This function can update or add an item into database, according to the
	 * SQL statement
	 */
	public void update(String SQL) {
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(SQL);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
