package actionWeather;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LocationDAO;
import vo.LocationVO;

/**
 * Servlet implementation class TakeXYAction
 */
@WebServlet("/wcody/nxny.do")
public class TakeXYAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gugun = request.getParameter("gugun");
		
		System.out.println("여기는 TakeXYAction입니다." + "gugun:"+ gugun);
		
		LocationVO gugun_p = LocationDAO.getInstance().selectOne(gugun);
		
		System.out.println("값을 받아옴 !! == gugun-" + gugun + "nx-" + gugun_p.getNx() + "ny-" + gugun_p.getNy());
			
		String resultStr = String.format("[{'nx':'%s'},{'ny':'%s'}]", gugun_p.getNx(),gugun_p.getNy());
		response.getWriter().println(resultStr);
	}

}
