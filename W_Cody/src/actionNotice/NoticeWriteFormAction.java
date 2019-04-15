package actionNotice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.QueDAO;
import vo.MemberVO;
import vo.QueVO;

/**
 * Servlet implementation class AskWriteAction
 */
@WebServlet("/wcody/notice_write_form.do")
public class NoticeWriteFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		
		MemberVO vo = MemberDAO.getInstance().checkId(id);
		
		if(vo==null) {
			System.out.println("오류");
		}
		
		request.setAttribute("list", vo);
		RequestDispatcher disp = request.getRequestDispatcher("w06_menu_notice_write.jsp");
		disp.forward(request, response);
	
	}

}
