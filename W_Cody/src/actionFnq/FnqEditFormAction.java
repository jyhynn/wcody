package actionFnq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FnqDAO;
import dao.QueDAO;
import vo.FnqVO;
import vo.QueVO;

/**
 * Servlet implementation class AskViewAction
 */
@WebServlet("/wcody/fnq_edit_form.do")
public class FnqEditFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = Integer.parseInt(request.getParameter("idx"));
		
		FnqVO vo = FnqDAO.getInstance().selectOne(idx);
		
		if(vo==null) {
			System.out.println("오류");
		}
		
		request.setAttribute("list", vo);
		RequestDispatcher disp = request.getRequestDispatcher("w05_menu_fnq_edit.jsp");
		disp.forward(request, response);
	}

}
