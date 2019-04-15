package actionReview;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDAO;
import vo.ReviewVO;

/**
 * Servlet implementation class ReviewViewAction
 */
@WebServlet("/wcody/review_view.do")
public class ReviewViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		ReviewDAO dao = ReviewDAO.getInstance();
		List<ReviewVO> list = dao.selectList();
		ReviewVO vo = dao.selectOne(idx);
		
		//조회수 관리를 위한 세션
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");	//show라는 이름의 데이터가 있으면 가져올래
		
		if(show == null) {
			int res = dao.update_click(idx);
			session.setAttribute("show", "");
		} 
		
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		RequestDispatcher disp = request.getRequestDispatcher("w07_menu_cody_view.jsp");
		disp.forward(request, response);
	
	}

}
