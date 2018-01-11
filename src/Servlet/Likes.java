package Servlet;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Article;
import Dao.ArticleDao;
import Dao.User;

/**
 * Servlet implementation class Likes
 */
@WebServlet("/Likes")
public class Likes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Likes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("likes dopost");
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		if(currentUser == null){
			request.getRequestDispatcher("Logout.jsp").forward(request, response);
			return;
		}
		
		
		int article_id = Integer.parseInt(request.getParameter("article_id")+"");
		//String action = request.getParameter("action")+"";
		String username = currentUser.getUsername();
		
		ArticleDao articledao = new ArticleDao();
		Article article = articledao.doQuery("select * from articles,users where articles.article_id="+ article_id).get(0);
		int likes = article.getLikes();
		String likenames = article.getLikeNames();
		if(likenames!=null&&likenames.contains(username)){
			System.out.println("do unlike");
			int position = likenames.indexOf(username);
			//likenames = likenames.substring(0, position)+likenames.substring(position+username.length()+1);
			likenames = likenames.substring(position+username.length()) +","+likenames.substring(0, position);
			likes--;
			
		}else{
			System.out.println("do like");
			likenames = likenames+ "," +username;
			likes++;
		}
		
		articledao.update("UPDATE articles SET likes="+likes+", likenames='"+likenames+"' WHERE article_id="+article_id);
		
		response.setContentType("text/plain"); // Set content type of the response so that jQuery knows what it can expect.
		response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		response.getWriter().write(likes+""); // Write response body.
		
		
		
	}

}
