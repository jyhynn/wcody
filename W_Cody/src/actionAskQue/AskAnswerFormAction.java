package actionAskQue;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QueDAO;
import vo.QueVO;

/**
 * Servlet implementation class AskAnswerFormAction
 */
@WebServlet("/wcody/ask_answer_form.do")
public class AskAnswerFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = Integer.parseInt(request.getParameter("idx"));
		
		QueVO vo = QueDAO.getInstance().selectOne(idx);
		
		if(vo==null) {
			System.out.println("오류");
		}
		request.setAttribute("list", vo);
		RequestDispatcher disp = request.getRequestDispatcher("w04_menu_qna_answerForm.jsp");
		disp.forward(request, response);
	
	}

}
