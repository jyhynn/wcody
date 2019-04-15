package actionNotice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FnqDAO;
import dao.NoticeDAO;
import dao.QueDAO;
import vo.FnqVO;
import vo.NoticeVO;
import vo.QueVO;

/**
 * Servlet implementation class AskViewAction
 */
@WebServlet("/wcody/notice_edit_form.do")
public class NoticeEditFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = Integer.parseInt(request.getParameter("idx"));
		
		NoticeVO vo = NoticeDAO.getInstance().selectOne(idx);
		
		if(vo==null) {
			System.out.println("오류");
		}
		
		request.setAttribute("list", vo);
		RequestDispatcher disp = request.getRequestDispatcher("w06_menu_notice_edit.jsp");
		disp.forward(request, response);
	}

}
