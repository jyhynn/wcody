package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;
//아이디찾기
/**
 * Servlet implementation class FindIdAction
 */
@WebServlet("/wcody/find_id.do")
public class FindIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		MemberVO vo = MemberDAO.getInstance().checkEmail(email);
		
		String result = "no";
		String id = "";
		if(vo!=null) {
			id = vo.getId();
			result = "yes";
		}
		
		String resultStr = String.format("[{'result' : '%s'},{'id':'%s'}]", result, id);
		response.getWriter().println(resultStr);	
	
	}

}
