package Servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Dao.*;

/**
 * Servlet implementation class PostArticle
 */
@WebServlet("/PostArticle")
public class PostArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String ifedit;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostArticle() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user clicked post button on the homepage, or clicked the edit button
	 * on an opened article page, go into this method
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("PostArticle doget");

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

		User currentUser = (User) session.getAttribute("currentUser");

		/**
		 * If user is editing the article, show the exist contents on the edit
		 * page
		 */
		ifedit = request.getParameter("editarticle") + "";
		if (ifedit.equals("edit")) {
			int article_id = Integer.parseInt(request.getParameter("article_id") + "");
			System.out.println("edit article " + article_id);

			ArticleDao articledao = new ArticleDao();
			Article article = articledao.doQuery("select * from articles,users where articles.article_id=" + article_id)
					.get(0);
			request.setAttribute("article", article);
		}

		request.setAttribute("currentUser", currentUser);
		request.getRequestDispatcher("PostArticle1.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user submit a new article or an edited article, go in to this method
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("PostArticle dopost");
		int maxFileSize = 10 * 1024 * 1024;
		String realFilePath;
		String relativePath;
		File dir;
		HttpSession session = request.getSession();

		User checksession = (User) session.getAttribute("currentUser");
		if (checksession == null) {
			System.out.println("getSession unlogin");
			request.getRequestDispatcher("Logout.jsp").forward(request, response);
			return;
		}
		User currentUser = (User) session.getAttribute("currentUser");
		String message = null;
		int user_id = currentUser.getUser_id();
		int article_id;
		String article_id_string = "";

		/**
		 * receive all content input or upload by the user, article title,
		 * article content, post date and uploaded images, videos, audios
		 */

		ServletContext servletContext = getServletContext();
		realFilePath = servletContext.getRealPath("/Multimedia") + "\\";
		relativePath = "Multimedia\\";

		DiskFileItemFactory factory = new DiskFileItemFactory();

		MultimediaDao multimediaDao = new MultimediaDao();
		ServletFileUpload upload = new ServletFileUpload(factory);
		File fullFile = null;
		Article article = null;
		String article_title = null;
		String article_text = null;
		String ifedit2 = null;
		String date_option = null;
		try {
			List<FileItem> fileItems = upload.parseRequest(request);

			for (FileItem fi : fileItems) {
				if (fi.getFieldName().equals("article_title")) {
					article_title = fi.getString();
				} else if (fi.getFieldName().equals("article_text")) {
					article_text = fi.getString();
				} else if (fi.getFieldName().equals("post")) {
					System.out.println(fi.getFieldName());
					ifedit2 = fi.getString();
				} else if (fi.getFieldName().equals("article_id")) {
					article_id_string = fi.getString();
				} else if (fi.getFieldName().equals("date_option")) {
					date_option = fi.getString();
					System.out.println(date_option);
				}
			}
			article_text = article_text.replaceAll("'", "''");
			article_title = article_title.replaceAll("'", "''");
			System.out.println(article_title);
			article_text = article_text.replaceAll("\n", "<br>");

			System.out.println(article_text);
			/**
			 * if user is posting a new article, insert an new row in the
			 * database. if user is editing an article, update the database
			 */
			ArticleDao articledao = new ArticleDao();
			if (ifedit2.equals("edit")) {
				article_id = Integer.parseInt(article_id_string);
				articledao.update("UPDATE articles SET article_title='" + article_title + "', article_text='"
						+ article_text + "',article_postDate='" + date_option + "' WHERE article_id=" + article_id);
			} else {
				articledao
						.update("insert into articles (user_id,article_title,article_text,article_postDate,author) values ( "
								+ currentUser.getUser_id() + ",'" + article_title + "','" + article_text + "','"
								+ date_option + "','" + currentUser.getUsername() + "')");
				List<Article> articles = articledao.doQuery("select * from articles");
				article_id = articles.get(articles.size() - 1).getArticle_id();
			}
			
			if (ifedit.equals("edit")) {
				int article_id1 = Integer.parseInt(article_id_string);
				ArticleDao articledao1 = new ArticleDao();
				article = articledao1.doQuery("select * from articles,users where articles.article_id=" + article_id1)
						.get(0);
			}
			realFilePath = realFilePath + article_id + "\\";
			relativePath = relativePath + article_id + "\\";
			File idDir = new File(realFilePath);
			idDir.mkdir();

			/**
			 * When finish posting or editing the article text content, get the
			 * article id, and then process the uploaded file items. Store the
			 * photos, videos and audio in a folder named by the article id
			 */
			Iterator<FileItem> i = fileItems.iterator();

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					if (fi.getName().isEmpty()) {
						continue;
					}
					String fileName = fi.getName();
					System.out.println(fileName);
					String imgExt = fileName.substring(fileName.lastIndexOf('.'));

					// Error checking
					if (fi.getSize() > maxFileSize) {
						System.out.println("123");
						message = "The file exceeds the maximum upload file size of " + maxFileSize;
						request.setAttribute("message", message);
						request.setAttribute("currentUser",currentUser);
						request.setAttribute("article",article);
						request.setAttribute("editarticle",ifedit);
						request.getRequestDispatcher("PostArticle1.jsp").forward(request, response);
						return;
					} else if (!(imgExt.endsWith("jpg") || imgExt.endsWith("png") || imgExt.endsWith("gif")
							|| imgExt.endsWith("mp3") || imgExt.endsWith("ogg") || imgExt.endsWith("mp4"))) {
						message = "The file type is not valid.";
						request.setAttribute("message", message);
						request.setAttribute("currentUser",currentUser);
						request.setAttribute("article",article);
						request.setAttribute("editarticle",ifedit);
						request.getRequestDispatcher("PostArticle1.jsp").forward(request, response);
						return;
					} else {
						dir = new File(realFilePath);
						fullFile = new File(realFilePath, fileName);
						fi.write(fullFile);
						String filePathWithName = relativePath + fileName;
						multimediaDao.update("insert into multimedia (user_id,link,article_id) values (" + user_id
								+ ",'" + filePathWithName + "'," + article_id + ")");

						System.out.println("Uploaded directory: " + realFilePath);
						System.out.println("Output file: " + fullFile.getAbsolutePath());
					}
				}
			}

		} catch (Exception ex) {
			System.out.println(ex);
		}

		// when finish posting or editing an article, redirect to the homepage
		response.sendRedirect("Homepage");
	}

}
