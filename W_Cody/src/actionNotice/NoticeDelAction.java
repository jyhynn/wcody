package actionNotice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FnqDAO;
import dao.NoticeDAO;
import dao.QueDAO;

/**
 * Servlet implementation class AskDelAction
 */
@WebServlet("/wcody/notice_del.do")
public class NoticeDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = NoticeDAO.getInstance().delNotice(idx);
		
		String result = "no";
		
		if(res!=0) {
			result = "yes";		
		}
		
		String resultStr = String.format("[{'result' : '%s'}]", result);
		response.getWriter().println(resultStr);
	
	}

}
