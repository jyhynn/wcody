package actionJoin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;
//가입시 아이디중복확인
/**
 * Servlet implementation class JoinCheckAction
 */
@WebServlet("/wcody/join_id_check.do")
public class JoinCheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		
		MemberVO voId = MemberDAO.getInstance().checkId(id);
		
		String result = "no";	
		
		if(voId == null) {
			//가입가능
			result = "yes";
		}
		
		String resultStr = String.format("[{'result' : '%s'}]", result);
		response.getWriter().println(resultStr);	
		
		
	}

}
