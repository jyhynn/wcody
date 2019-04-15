package actionFnq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FnqDAO;
import dao.QueDAO;
import vo.FnqVO;
import vo.QueVO;

/**
 * Servlet implementation class fnqViewAction
 */
@WebServlet("/wcody/fnq_view.do")
public class FnqViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		FnqDAO dao = FnqDAO.getInstance();
		
		FnqVO vo = dao.selectOne(idx);
		
		if(vo==null) {
			System.out.println("오류");
		}
		//조회수 관리를 위한 세션
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");	//show라는 이름의 데이터가 있으면 가져올래
		
		if(show == null) {
			int res = dao.update_click(idx);
			session.setAttribute("show", "");
		} 
		request.setAttribute("list", vo);
		RequestDispatcher disp = request.getRequestDispatcher("w05_menu_fnq_view.jsp");
		disp.forward(request, response);
	
	
	}

}
