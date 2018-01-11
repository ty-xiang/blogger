package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.*;

/**
 * Servlet implementation class Homepage
 */
@WebServlet("/Homepage")
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Homepage() {
		super();
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user click the home button on the navigation bar, goes in this doGet
	 * method
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("homepage doget");

		HttpSession session = request.getSession();

		/**
		 * Check the whether the user is log in. if user is log out, the page
		 * will redirect to an error handling page.
		 */
		User checksession = (User) session.getAttribute("currentUser");
		if (checksession == null) {
			request.getRequestDispatcher("Logout.jsp").forward(request, response);
			return;
		}

		/**
		 * Get user object from session, retrieve all articles of current user
		 * and send to Homepage.jsp. Also show other registed users on the
		 * website
		 */
		User currentUser = (User) session.getAttribute("currentUser");
		String username = currentUser.getUsername();

		String currentArticlesUsername = request.getParameter("username");
		if (currentArticlesUsername != null) {
			System.out.println(username + " visits " + currentArticlesUsername);
			username = currentArticlesUsername;
		} else {
			currentArticlesUsername = username;
		}
		UserDao userdao = new UserDao();
		List<User> allUsers = userdao.doQuery("select * from users");

		ArticleDao articledao = new ArticleDao();
		List<Article> currentPersonArticles = null;

		currentPersonArticles = articledao
				.doQuery("select * from articles,users where articles.user_id=users.user_id and username='" + username
						+ "' order by article_postdate desc, article_posttime desc");

		request.setAttribute("currentArticlesUsername", currentArticlesUsername);
		request.setAttribute("currentUser", currentUser);
		request.setAttribute("currentPersonArticles", currentPersonArticles);
		request.setAttribute("allUsers", allUsers);
		request.getRequestDispatcher("Homepage.jsp").forward(request, response);
		this.destroy();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user register a new account or login, goes into this doPost method
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String state = request.getParameter("state");
		String username;
		String password;
		String useremail;

		UserDao userdao = new UserDao();
		ArticleDao articledao = new ArticleDao();
		List<User> allUsers = userdao.doQuery("select * from users");

		/**
		 * Get username from user input, and then create the user object and
		 * save into the session
		 */
		if (state.equals("login")) {
			username = request.getParameter("username");
			User currentUser = userdao.doQuery("select * from users where username='" + username + "'").get(0);
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", currentUser);

			List<Article> currentPersonArticles = articledao
					.doQuery("select * from articles,users where articles.user_id=users.user_id and username='"
							+ username + "'");

			request.setAttribute("currentArticlesUsername", username);
			request.setAttribute("currentUser", currentUser);
			request.setAttribute("currentPersonArticles", currentPersonArticles);
			request.setAttribute("allUsers", allUsers);
			request.getRequestDispatcher("Homepage.jsp").forward(request, response);
			return;

			/**
			 * When user sign up, store the user name, user email, password, and
			 * default icon image path to the database
			 */

		} else if (state.equals("signup")) {
			username = request.getParameter("username");
			password = request.getParameter("password");
			useremail = request.getParameter("useremail");
			userdao.update("insert into users (username,passwd,useremail,iconPath) values ('" + username + "', '"
					+ password + "','" + useremail + "','Icon\\profile-icon123456789.png')");

			User currentUser = userdao.doQuery("select * from users where username='" + username + "'").get(0);

			HttpSession session = request.getSession();
			session.setAttribute("currentUser", currentUser);
			request.setAttribute("currentArticlesUsername", username);
			request.setAttribute("allUsers", allUsers);
			request.setAttribute("currentUser", currentUser);
			request.getRequestDispatcher("Homepage.jsp").forward(request, response);

			System.out.println("sign up update finish");
			return;
		}

		System.out.println("error state");

	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {

	}

}