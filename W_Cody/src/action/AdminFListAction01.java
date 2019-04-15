package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FeedbackDAO;
import dao.MemberDAO;
import vo.FeedbackVO;
import vo.MemberVO;

/**
 * Servlet implementation class AdminAction
 */
@WebServlet("/wcody/admin_feed.do")
public class AdminFListAction01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filter = request.getParameter("filter");
		
		FeedbackDAO dao = FeedbackDAO.getInstance();
		List<FeedbackVO> list = null;
		
		if(filter==null || filter.equals("idx")) {
			list = dao.selectList();
		}else if(filter!=null && filter.equals("low")) {
			list = dao.selectList_low();
		}else if(filter!=null && filter.equals("high")) {
			list = dao.selectList_high();
		}else if(filter!=null && filter.equals("sugg")) {
			list = dao.selectList_sugg();
		}
		
		float avg = dao.avgStar();//별점평균
		
		request.setAttribute("avg", avg);
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("w99_admin_tab2.jsp");
		disp.forward(request, response);
	
	}

}
