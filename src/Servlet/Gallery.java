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
 * Servlet implementation class Gallery
 */
@WebServlet("/Gallery")
public class Gallery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gallery() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		/**
		 * check the whether the user is log in. if user is log out, the page
		 * will redirect to an error handling page.
		 */
		User checksession = (User) session.getAttribute("currentUser");
		if (checksession == null) {
			System.out.println("getSession unlogin");
			request.getRequestDispatcher("Logout.jsp").forward(request, response);
			return;
		}

		/**
		 * get user object from session, retrieve multimedia uploaded by this
		 * user, and send to Gallery.jsp
		 */
		User currentUser = (User) session.getAttribute("currentUser");
		int user_id = currentUser.getUser_id();
		MultimediaDao multimediaDao = new MultimediaDao();
		List<Multimedia> multimedias = multimediaDao.doQuery("select * from multimedia where user_id=" + user_id);
		List<String> photoLinks = new ArrayList<String>();
		List<String> audioLinks = new ArrayList<String>();
		List<String> videoLinks = new ArrayList<String>();
		for (Multimedia m : multimedias) {
			if (m.getLink().endsWith("jpg") || m.getLink().endsWith("png") || m.getLink().endsWith("gif")) {
				photoLinks.add(m.getLink());
			} else if (m.getLink().endsWith("ogg") || m.getLink().endsWith("mp3")) {
				audioLinks.add(m.getLink());
			} else if (m.getLink().endsWith("mp4")) {
				videoLinks.add(m.getLink());
			}
		}

		request.setAttribute("photoLinks", photoLinks);
		request.setAttribute("audioLinks", audioLinks);
		request.setAttribute("videoLinks", videoLinks);
		request.setAttribute("currentUser", currentUser);
		request.getRequestDispatcher("Gallery.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
