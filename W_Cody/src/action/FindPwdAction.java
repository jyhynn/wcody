package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;
//비밀번호찾기
/**
 * Servlet implementation class FindPwdAction
 */
@WebServlet("/wcody/find_pwd.do")
public class FindPwdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		MemberVO vo = MemberDAO.getInstance().findPwd(id,email);
		
		String result = "no";
		String pwd = "";
		if(vo!=null) {
			pwd = vo.getPwd();
			result = "yes";
		}
		
		String resultStr = String.format("[{'result' : '%s'},{'pwd':'%s'}]", result, pwd);
		response.getWriter().println(resultStr);	
	}

}
