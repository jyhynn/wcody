package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;
//濡쒓렇�씤
/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/wcody/check_login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO vo = MemberDAO.getInstance().selectOne(id, pwd);
		
		String res = "no";
		if(vo!=null) {
			res = "yes";
		}
		
		//濡쒓렇�씤 �쑀吏��릺寃� session�쑝濡� 諛붿씤�뵫
		HttpSession session = request.getSession();
		session.setAttribute("vo", vo);
		session.setMaxInactiveInterval(3600);//�븳�떆媛꾨룞�븞 濡쒓렇�씤�젙蹂� �쑀吏�

		String resultStr = String.format("[{'res' : '%s'},{'nx':'%s'},{'ny':'%s'}]", res,vo.getNx(),vo.getNy());
		response.getWriter().println(resultStr);	
	
	}

}
