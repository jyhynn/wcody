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
import vo.FnqVO;
import vo.NoticeVO;
import vo.QueVO;

/**
 * Servlet implementation class AskWriteAction
 */
@WebServlet("/wcody/notice_write.do")
public class NoticeWriteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content").replaceAll("\n", "<br>");
		String id = request.getParameter("id");
		String ip = request.getRemoteAddr();
		
		NoticeVO vo = new NoticeVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setIp(ip);
		
		int res = NoticeDAO.getInstance().insertNotice(vo); 
		
		System.out.println(res);
		String result = "no";
		if(res!=0) {
			result = "yes";		
		}

		String resultStr = String.format("[{'result' : '%s'}]", result);
		response.getWriter().println(resultStr);	
	
	}

}
