package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.View;
import Dao.ViewDao;

/**
 * Servlet implementation class Recommend
 */
@WebServlet("/Recommend")
public class Recommend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recommend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Recommend doget");
		int size = 5;
		ViewDao viewdao = new ViewDao();
		viewdao.fullRecordOrder("PLACEHOLDER"); // currently, condition is a placeholder, we can apply further rule for filtering then.
		String ParaPage = request.getParameter("page");
		int currentPage;
		if (ParaPage == null) {
			currentPage = 0;
		} else {
			currentPage = Integer.parseInt(ParaPage);
		}
		int totalNum  = viewdao.getLen(); // receive total number;
		int totalPage = (totalNum-1)/size; //index
		List<View> results= viewdao.subsetRecord(size, currentPage);  // (size, page)
		request.setAttribute("results", results);
		request.setAttribute("totalNum", totalNum);
		request.setAttribute("currentPage", currentPage);
		if (currentPage != 0) {
			request.setAttribute("prepPage", currentPage - 1);
		}
		if (currentPage != totalPage) {
			request.setAttribute("nextPage", currentPage + 1);
		}
		request.getRequestDispatcher("Recommend.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Recommend dopost");
		doGet(request, response);
	}

}
