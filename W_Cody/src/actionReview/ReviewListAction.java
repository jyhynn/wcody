package actionReview;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import vo.ReviewVO;

/**
 * Servlet implementation class ReviewListAction
 */
@WebServlet("/wcody/review_list.do")
public class ReviewListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReviewDAO dao = ReviewDAO.getInstance();
		List<ReviewVO> list = dao.selectList();
		
		request.getSession().removeAttribute("show");		
		
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("w07_menu_cody_list.jsp");
		disp.forward(request, response);
	
	}

}
