package actionJoin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LocationDAO;
import dao.MemberDAO;
import vo.LocationVO;
import vo.MemberVO;

/**
 * Servlet implementation class JoinAction
 */
@WebServlet("/wcody/join_insert.do")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");	
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		int sido = Integer.parseInt(request.getParameter("sido"));
		String gugun = request.getParameter("gugun");
		String gender = request.getParameter("gender");
		int coldhot = Integer.parseInt(request.getParameter("coldhot"));
		String ip = request.getRemoteAddr();
		String nx = request.getParameter("nx");
		String ny = request.getParameter("ny");
		
		System.out.println(id);
		System.out.println(sido);
		System.out.println(coldhot);  
		System.out.println(gender);
		System.out.println(gugun);
		System.out.println(nx);
		System.out.println(ny);
		
		LocationDAO dao = LocationDAO.getInstance();
		List<LocationVO> sido99 = dao.selectSido();
		String temp = "";
		for(int i = 0 ; i < sido99.size(); i++) {
			if(sido99.get(i).getRef() == sido) {
				temp = sido99.get(i).getSido();
			}
		}
		System.out.println(temp);
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setNickname(nickname);
		vo.setBirth_year(year);
		vo.setBirth_month(month);
		vo.setBirth_day(day);
		vo.setSido(temp);
		vo.setGugun(gugun);
		vo.setGender(gender);
		vo.setColdhot(coldhot);
		vo.setIp(ip);
		vo.setNx(nx);
		vo.setNy(ny);
		
		int res = MemberDAO.getInstance().joinInsert(vo);
		String r = "no";
		if(res!=0) {//���옣 �꽦怨듯빐�꽌 �룎�젮諛쏆� 媛믪씠 1 �씠�긽�씠硫�
			r = "yes";
		}
		
		String resultStr = String.format("[{'result':'%s'}]", r);
		response.getWriter().println(resultStr);		
		
		
	}

}
