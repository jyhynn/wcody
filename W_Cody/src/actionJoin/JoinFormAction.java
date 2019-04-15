package actionJoin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LocationDAO;
import vo.LocationVO;

/**
 * Servlet implementation class JoinFormAction
 */
@WebServlet("/wcody/join_location.do")
public class JoinFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		LocationDAO dao = LocationDAO.getInstance();
		//시도 정보 받아와서 w02_joinForm.jsp로 바인딩 및 포워딩
		List<LocationVO> sido = dao.selectSido();
		List<LocationVO> gugun = dao.selectGugun();

		request.setAttribute("sidoList", sido);
		request.setAttribute("gugunList", gugun);	
		RequestDispatcher disp = request.getRequestDispatcher("w02_joinForm.jsp");
		disp.forward(request, response);
		
	}

}
