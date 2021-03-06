package actionAskQue;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QueDAO;
import vo.QueVO;

/**
 * Servlet implementation class AskAnswerAction
 */
@WebServlet("/wcody/ask_answer.do")
public class AskAnswerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content").replaceAll("\n", "<br>");
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");		
		int ref = Integer.parseInt(request.getParameter("ref"));
		String ip = request.getRemoteAddr();
		
		QueVO vo = new QueVO();
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setRef(ref);
		vo.setIp(ip);
		
		int res = QueDAO.getInstance().insertAskAnswer(vo);
		
		System.out.println(res);
		String result = "no";
		if(res!=0) {
			result = "yes";		
		}

		String resultStr = String.format("[{'result' : '%s'}]", result);
		response.getWriter().println(resultStr);	
	
	}

}
