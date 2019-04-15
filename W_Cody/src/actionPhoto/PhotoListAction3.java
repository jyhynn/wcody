package actionPhoto;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import dao.PhotoDAO3;
import vo.PhotoVO;
import vo.PhotoVO3;

/**
 * Servlet implementation class PhotoListAction
 */
@WebServlet("/photo/list3.do")
public class PhotoListAction3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<PhotoVO3> list = PhotoDAO3.getInstance().selectList();
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("photo_list3.jsp");
		disp.forward(request, response);
		
		
	}

}