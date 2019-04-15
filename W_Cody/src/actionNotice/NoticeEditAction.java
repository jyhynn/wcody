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
import vo.QueVO;

/**
 * Servlet implementation class AskViewAction
 */
@WebServlet("/wcody/notice_edit.do")
public class NoticeEditAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content").replaceAll("\n", "<br>");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = NoticeDAO.getInstance().updateNotice(idx, title, content);
		
		String result = "no";
		
		if(res!=0) {
			result = "yes";		
		}
		
		String resultStr = String.format("[{'result' : '%s'}]", result);
		response.getWriter().println(resultStr);
	}

}
