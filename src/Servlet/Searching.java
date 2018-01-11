package Servlet;



import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Dao.*;

/**
 * Servlet implementation class Searching
 */
@WebServlet("/Searching")
public class Searching extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Searching() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Searching doget");
		String word = request.getParameter("word") + "";
		String sort = request.getParameter("sort") + "";
		String order = request.getParameter("order") + "";
		String titleicon = null;
		String usericon = null;
		String dateicon = null;
		String printorder = null;
		if(order.equals("ASC")){
			printorder = "DESC";
		}else{
			printorder = "ASC";
		}
		System.out.println(word+"@"+sort+"@"+order);
		
		List<Article> searchingArticles = null;
		
		ArticleDao articledao = new ArticleDao();
		if(sort.equals("title")){
			searchingArticles = articledao.doQuery("SELECT * from articles WHERE LOWER(article_title) LIKE '%"+word+"%' ORDER BY article_title "+order);
			if(order.equals("ASC")){
				titleicon = "glyphicon glyphicon-arrow-up";
			}else{
				titleicon = "glyphicon glyphicon-arrow-down";
			}
		}else if(sort.equals("author")){
			searchingArticles = articledao.doQuery("SELECT * from articles WHERE LOWER(article_title) LIKE '%"+word+"%' ORDER BY author "+order);
			if(order.equals("ASC")){
				usericon = "glyphicon glyphicon-arrow-up";
			}else{
				usericon = "glyphicon glyphicon-arrow-down";
			}
		}else if(sort.equals("date")){
			searchingArticles = articledao.doQuery("SELECT * from articles WHERE LOWER(article_title) LIKE '%"+word+"%' ORDER BY article_postdate "+order+", article_posttime "+order);
			if(order.equals("ASC")){
				dateicon = "glyphicon glyphicon-arrow-up";
			}else{
				dateicon = "glyphicon glyphicon-arrow-down";
			}
		}
		int size = searchingArticles.size();
		
		request.setAttribute("size", size);
		request.setAttribute("printorder", printorder);
		request.setAttribute("titleicon", titleicon);
		request.setAttribute("usericon", usericon);
		request.setAttribute("dateicon", dateicon);
		request.setAttribute("searchingArticles", searchingArticles);
		request.setAttribute("word", word);
		request.getRequestDispatcher("Searching.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Searching dopost");
		String word = request.getParameter("word")+"";
		//word = "x";
		System.out.println("word: "+word);
		
		
		ArticleDao articledao = new ArticleDao();
		CommentDao commentdao = new CommentDao();
		UserDao userdao = new UserDao();
		
		String articletitle = " in Article title";
		String username = " in User";
		String articletext = " in Article text";
		String comment = " in Comment";
		
		List<Article> articletitles = articledao.doQuery("SELECT * from articles WHERE LOWER(article_title) LIKE '%"+word+"%'");
		List<User> usernames = userdao.doQuery("SELECT * from users WHERE LOWER(username) LIKE '%"+word+"%'");
		List<Article> articletexts = articledao.doQuery("SELECT * from articles WHERE LOWER(article_text) LIKE '%"+word+"%'");
		List<Comment> Comments = commentdao.doQuery("SELECT * from comments WHERE LOWER(comment_text) LIKE '%"+word+"%'");
		System.out.println(articletitles.size());
		System.out.println(usernames.size());
		System.out.println(articletexts.size());
		System.out.println(Comments.size());
		List<String> list = new ArrayList<String>();
		
		
		//articletitle 3
		if(articletitles.size()>=1){
			String a1 = "<a href='OpenArticle?article_id="+articletitles.get(0).getArticle_id()+"'>"+articletitles.get(0).getArticle_title()+articletitle+"</a>";
			list.add(a1);
		}
		if(articletitles.size()>=2){
			String a2 = "<a href='OpenArticle?article_id="+articletitles.get(1).getArticle_id()+"'>"+articletitles.get(1).getArticle_title()+articletitle+"</a>";
			list.add(a2);
		}
		if(articletitles.size()>2){
			String a5 = "<a href='OpenArticle?article_id="+articletitles.get(1).getArticle_id()+"'>"+articletitles.get(1).getArticle_title()+articletitle+"</a>";
			list.add(a5);
		}
		//username 1
		if(usernames.size()>=1){
			String u1 = "<a href='Homepage?username="+usernames.get(0).getUsername()+"'>"+usernames.get(0).getUsername()+username+"</a>";
			list.add(u1);
		}
		//articletext 2
		if(articletexts.size()>=1){
			String a3 = "<a href='OpenArticle?article_id="+articletexts.get(0).getArticle_id()+"'>"+articletexts.get(0).getArticle_title()+articletext+"</a>";
			list.add(a3);
		} 
		if(articletexts.size()>1){
			String a4 = "<a href='OpenArticle?article_id="+articletexts.get(1).getArticle_id()+"'>"+articletexts.get(1).getArticle_title()+articletext+"</a>";
			list.add(a4);
		}
		//comments 2
		if(Comments.size()>=1){
			String c1 = "<a href='OpenArticle?article_id="+Comments.get(0).getArticle_id()+"'>"+Comments.get(0).getAuthor()+comment+"</a>";
			list.add(c1);
		}
		if(Comments.size()>1){
			String c2 = "<a href='OpenArticle?article_id="+Comments.get(1).getArticle_id()+"'>"+Comments.get(1).getAuthor()+comment+"</a>";
			list.add(c2);
		}
		
		 String json = new Gson().toJson(list);
		 
		 System.out.println(list.size()+ " back to front");
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		
	}

}
