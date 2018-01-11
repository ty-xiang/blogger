package Servlet;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
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
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Profile() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user click profile button on the navigation bar, go into this method
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		 * Get current user object from session, and show the exist information
		 * of the user
		 */
		User currentUser = (User) session.getAttribute("currentUser");

		String largeIcon = currentUser.getIconPath().substring(0, currentUser.getIconPath().lastIndexOf('.'))
				+ "-large.png";

		System.out.println("profile doget");
		request.setAttribute("largeIcon", largeIcon);
		request.setAttribute("currentUser", currentUser);
		request.getRequestDispatcher("Profile1.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * When user update the information, and save the form, go into this method
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String realFilePath;
		String relativePath;
		int maxFileSize = 5 * 1024 * 1024;

		File dir;
		System.out.println("profile doPost");
		String action = "";
		String message = "";
		HttpSession session = request.getSession();
		User checksession = (User) session.getAttribute("currentUser");
		if (checksession == null) {
			System.out.println("getSession unlogin");
			request.getRequestDispatcher("Logout.jsp").forward(request, response);
			return;
		}

		User currentUser = (User) session.getAttribute("currentUser");
		int user_id = currentUser.getUser_id();

		ServletContext servletContext = getServletContext();
		realFilePath = servletContext.getRealPath("/Icon") + "\\";
		realFilePath = realFilePath + user_id + "\\";
		relativePath = "Icon\\" + user_id + "\\";
		File idDir = new File(realFilePath);
		idDir.mkdir();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		//upload.setSizeMax(maxFileSize);
		File fullFile = null;

		String username = currentUser.getUsername();
		String password = currentUser.getPasswd();
		String useremail = currentUser.getUseremail();
		String fname = currentUser.getFname();
		String lname = currentUser.getLname();
		String birthday = currentUser.getBirthday();
		String education = currentUser.getEducation();
		System.out.println(education);
		String relativePathWithName = currentUser.getIconPath();
		String defaultPath = null;

		try {
			List<FileItem> fileItems = upload.parseRequest(request);

			/**
			 * get user information, and uploaded icon image. Generate two size
			 * of thumbnail, a large one used in this profile page, another
			 * small one used in comments
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
						message = "The file exceeds the maximum upload file size of " + maxFileSize;
					} else if (!(imgExt.endsWith("jpg") || imgExt.endsWith("png") || imgExt.endsWith("gif"))) {
						message = "The file type is not valid.";
					} else {
						dir = new File(realFilePath);
						fullFile = File.createTempFile("fullsize-", imgExt, dir);
						fi.write(fullFile);
						generateThumbnail(fullFile, realFilePath, 40, fileName.substring(0, fileName.lastIndexOf('.')));
						generateThumbnail(fullFile, realFilePath, 168,
								fileName.substring(0, fileName.lastIndexOf('.')) + "-large");
						relativePathWithName = relativePath + fileName.substring(0, fileName.lastIndexOf('.')) + ".png";
						System.out.println("Uploaded directory: " + realFilePath);
						System.out.println("Output file: " + fullFile.getAbsolutePath());
					}
				} else if (fi.getFieldName().equals("username")) {
					username = fi.getString();
				} else if (fi.getFieldName().equals("password")) {
					password = fi.getString();
				} else if (fi.getFieldName().equals("useremail")) {
					useremail = fi.getString();
				} else if (fi.getFieldName().equals("fname")) {
					fname = fi.getString();
					fname = fname.replaceAll("'", "''");
				} else if (fi.getFieldName().equals("lname")) {
					lname = fi.getString();
					lname = lname.replaceAll("'", "''");
				} else if (fi.getFieldName().equals("birthday")) {
					birthday = fi.getString();
				} else if (fi.getFieldName().equals("education")) {
					education = fi.getString();
					System.out.println(education);
				} else if (fi.getFieldName().equals("action")) {
					action = fi.getString();
				} else if (fi.getFieldName().equals("iconLocSrc")) {
					defaultPath = fi.getString();
					System.out.println(defaultPath);
				}
			}

		} catch (Exception ex) {
			System.out.println(ex);
		}

		System.out.println(action);

		// update user profile or delete this user account
		if (action.equals("DELETE ACCOUNT")) {
			DaoManager daomanager = new DaoManager();
			daomanager.update("DELETE FROM multimedia WHERE user_id=" + user_id);
			daomanager.update("DELETE FROM comments WHERE user_id=" + user_id);
			daomanager.update("DELETE FROM articles WHERE user_id=" + user_id);
			daomanager.update("DELETE FROM users WHERE user_id=" + user_id);

			System.out.println("delete 4 table with user");
			response.sendRedirect("Register");

		} else if (action.equals("Save Changes")) {
			System.out.println(defaultPath);
			if (!defaultPath.equals("true") && !defaultPath.equals("false")) {
				relativePathWithName = defaultPath.substring(0, defaultPath.lastIndexOf('-')) + ".png";
			}

			UserDao userDao = new UserDao();
			userDao.update(
					"update users set username='" + username + "',passwd='" + password + "',useremail='" + useremail
							+ "',fname='" + fname + "',lname='" + lname + "',birthday='" + birthday + "',education='"
							+ education + "',iconPath='" + relativePathWithName + "' where user_id=" + user_id);

			currentUser = userDao.doQuery("select * from users where username='" + username + "'").get(0); 
			String largeIcon = relativePathWithName.substring(0, relativePathWithName.lastIndexOf('.')) + "-large.png";
			session.setAttribute("currentUser", currentUser);

			request.setAttribute("currentUser", currentUser);
			request.setAttribute("largeIcon", largeIcon);
			request.setAttribute("message", message);
			request.getRequestDispatcher("Profile1.jsp").forward(request, response);

		}
	}

	/**This method is to process uploaded image, and generate thumbnail*/
	private void generateThumbnail(File fullFile, String filePath, int size, String thumbnailName) {
		BufferedImage fullImage = null;
		File thumbnail = null;
		try {
			fullImage = ImageIO.read(fullFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		int imgW = fullImage.getWidth();
		int imgH = fullImage.getHeight();

		if (imgW > size || imgH > size) {
			double scale = size / 10.0 * 10.0 / Math.min(imgW, imgH);
			imgW = (int) (imgW * scale);
			imgH = (int) (imgH * scale);
		}

		BufferedImage thumbImg = new BufferedImage(imgW, imgH, fullImage.getType());
		Image rescaledImg = fullImage.getScaledInstance(imgW, imgH, Image.SCALE_SMOOTH);
		thumbImg.createGraphics().drawImage(rescaledImg, 0, 0, null);
		BufferedImage rectangleThumbImg = null;
		if (imgW > imgH) {
			rectangleThumbImg = thumbImg.getSubimage((imgW - size) / 2, 0, size, size);
		} else {
			rectangleThumbImg = thumbImg.getSubimage(0, (imgH - size) / 2, size, size);
		}
		try {
			thumbnail = new File(filePath, thumbnailName + ".png");
			ImageIO.write(rectangleThumbImg, "png", thumbnail);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
