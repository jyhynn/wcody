package actionPhoto;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class ChuchunCodyAction
 */
@WebServlet("/wcody/chuchun.do")
public class ChuchunCodyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<PhotoVO> list = PhotoDAO.getInstance().selectList();

		request.setAttribute("list", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("main.do");
		disp.forward(request, response);
		
	}

}