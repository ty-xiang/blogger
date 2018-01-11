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
 * Servlet implementation class OpenArticle
 */
@WebServlet("/OpenArticle")
public class OpenArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OpenArticle() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user click one article's title on the homepage to open an article,
	 * goes into this doGet method
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("OpenArticle doget");

		HttpSession session = request.getSession();

		/**
		 * Check the whether the user is log in. if user is log out, the page
		 * will redirect to an error handling page.
		 */
		User checksession = (User) session.getAttribute("currentUser");
		if (checksession == null) {
			System.out.println("getSession unlogin");
			request.getRequestDispatcher("Logout.jsp").forward(request, response);
			return;
		}

		/**
		 * Get articles written by current user, all comments and multimedia
		 * attached to this articles, sent to openArticle.jsp
		 */
		User currentUser = (User) session.getAttribute("currentUser");
		String article_id = request.getParameter("article_id") + "";
		ArticleDao articledao = new ArticleDao();
		Article article = articledao.doQuery("select * from articles,users where articles.article_id=" + article_id)
				.get(0);

		CommentDao commentdao = new CommentDao();
		UserDao userdao = new UserDao();
		MultimediaDao multimediaDao = new MultimediaDao();

		List<String> photoLinks = new ArrayList<String>();
		List<String> audioLinks = new ArrayList<String>();
		List<String> videoLinks = new ArrayList<String>();

		List<Multimedia> multimedias = multimediaDao
				.doQuery("select * from multimedia where article_id = " + article_id);
		for (Multimedia m : multimedias) {
			if (m.getLink().endsWith("jpg") || m.getLink().endsWith("png") || m.getLink().endsWith("gif")) {
				photoLinks.add(m.getLink());
			} else if (m.getLink().endsWith("ogg") || m.getLink().endsWith("mp3")) {
				audioLinks.add(m.getLink());
			} else if (m.getLink().endsWith("mp4")) {
				videoLinks.add(m.getLink());
			}
		}

		/**
		 * Get parameter from front-end, to determine which button user clicked,
		 * and delete article or comment in the database, then refresh the
		 * contents showed on the page
		 */
		String ifdelete = request.getParameter("delete") + "";
		if (ifdelete.equals("Delete Article")) {
			multimediaDao.update("DELETE FROM multimedia WHERE multimedia.article_id=" + article_id);
			commentdao.update("DELETE FROM comments WHERE comments.article_id=" + article_id);
			System.out.println(article_id + "'s comments is deleted");
			articledao.update("DELETE FROM articles WHERE articles.article_id=" + article_id);
			System.out.println(article_id + " is deleted");
			response.sendRedirect("Homepage");
			return;
		} else if (ifdelete.equals("Delete")) {
			int comment_id = Integer.parseInt(request.getParameter("comment_id") + "");
			commentdao.update("DELETE FROM comments WHERE comments.article_id=" + article_id
					+ " and comments.comment_id=" + comment_id);
			System.out.println(article_id + "'s only comment is deleted");
		}

		List<Comment> currentArticleComments = commentdao
				.doQuery("select * from comments where comments.article_id=" + article_id);

		for (Comment c : currentArticleComments) {
			String iconPath = userdao.doQuery("select * from users where user_id=" + c.getUser_id()).get(0)
					.getIconPath();
			c.setIconPath(iconPath);
		}

		String latestVideoLink = null;
		String latestAudioLink = null;
		if (videoLinks.size() != 0) {
			latestVideoLink = videoLinks.get(0);
		}
		if (audioLinks.size() != 0) {
			latestAudioLink = audioLinks.get(0);
		}
		request.setAttribute("photoLinks", photoLinks);
		request.setAttribute("latestAudioLink", latestAudioLink);
		request.setAttribute("latestVideoLink", latestVideoLink);
		request.setAttribute("currentUser", currentUser);
		request.setAttribute("article", article);
		request.setAttribute("currentArticleComments", currentArticleComments);
		request.getRequestDispatcher("OpenArticle1.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/** When user post or edit a comment, goes into this doPost method */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		User checksession = (User) session.getAttribute("currentUser");
		if (checksession == null) {
			System.out.println("getSession unlogin");
			request.getRequestDispatcher("Logout.jsp").forward(request, response);
			return;
		}

		User currentUser = (User) session.getAttribute("currentUser");
		CommentDao commentdao = new CommentDao();
		int article_id = Integer.parseInt(request.getParameter("article_id") + "");
		String comment_text = request.getParameter("comment_text") + "";
		int user_id = currentUser.getUser_id();
		String author = currentUser.getUsername();
		System.out.println("OpenArticle doPost");
		System.out.println("article_id: " + article_id + " author: " + author);
		String ifedit = request.getParameter("editcomment") + "";
		if (ifedit.equals("edit")) {
			int comment_id = Integer.parseInt(request.getParameter("comment_id") + "");
			comment_text = request.getParameter("editedComment") + "";
			System.out.println("edit a comment id:" + comment_id);
			commentdao.update(
					"UPDATE comments SET comment_text='" + comment_text + "' WHERE comments.comment_id=" + comment_id);
			this.doGet(request, response);
			return;
		}
		commentdao.update("insert into comments (user_id,article_id,comment_text,author) values (" + user_id + ","
				+ article_id + ",'" + comment_text + "','" + author + "')");
		this.doGet(request, response);
	}

}
