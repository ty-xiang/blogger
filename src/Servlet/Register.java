package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user click logout on the navigation bar, go into this method to
	 * clear session
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Register doget");
		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		session.invalidate();
		System.out.println("session removed");

		request.getRequestDispatcher("Register1.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user input username, user email, and password on the register page,
	 * go into this method by using ajax
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String check = request.getParameter("check") + "";
		UserDao userdao = new UserDao();

		// Check username if exist in the database, and send response back
		if (check.equals("username")) {
			String message = "userNameOk";
			String username = request.getParameter("username") + "";
			System.out.println("check " + username);

			List<User> list = new ArrayList<User>();
			list = userdao.doQuery("SELECT * FROM users");

			for (User user : list) {
				if (user.getUsername().equals(username)) {
					message = "userNameExist";
				}
			}

			System.out.println(message);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(message);

		// Check user email if exist in the database, and send response back
		} else if (check.equals("useremail")) {
			String message = "userEmailOk";
			String useremail = request.getParameter("useremail") + "";
			System.out.println("check " + useremail);

			List<User> list = new ArrayList<User>();
			list = userdao.doQuery("SELECT * FROM users");

			for (User user : list) {
				if (user.getUseremail().equals(useremail)) {
					message = "userEmailExist";
				}
			}

			System.out.println(message);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(message);
			
		// Check if password and username are matched, and send response back
		} else if (check.equals("passwd")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String message = null;

			if (userdao.doQuery("select * from users where username='" + username + "'").size() == 0) {
				response.getWriter().write("123");
				return;
			}

			User currentUser = userdao.doQuery("select * from users where username='" + username + "'").get(0);
			if (currentUser.getPasswd().equals(password)) {
				message = "ok";
			} else {
				message = "wrong";
			}

			System.out.println(message);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(message);
		}
		return;

	}

}
