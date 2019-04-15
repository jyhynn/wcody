package actionReview;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;

/**
 * Servlet implementation class ReviewLikeAction
 */
@WebServlet("/wcody/update_like.do")
public class ReviewLikeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = Integer.parseInt(request.getParameter("idx"));
		
		ReviewDAO dao = ReviewDAO.getInstance();
		int res = dao.update_like(idx);
		
		String rst = "no";
		if(res != 0) {
			rst = "yes";
		}
		
		String resultStr = String.format("[{'result' : '%s'}]", rst);
		response.getWriter().println(resultStr);
	}

}
