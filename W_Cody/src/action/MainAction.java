package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.ReviewDAO;
import vo.NoticeVO;
import vo.ReviewVO;

/**
 * Servlet implementation class MainAction
 */
@WebServlet("/wcody/main.do")
public class MainAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//공지사항 목록 가져오기
		NoticeDAO nDao = NoticeDAO.getInstance();
		List<NoticeVO> Noticelist = nDao.selectList();
		
		//코디자랑 좋아요 제일 높은 게시물 하나 띄우기
		ReviewDAO rDao = ReviewDAO.getInstance();
		ReviewVO rVo = rDao.selectLike();
		
		request.setAttribute("rVo", rVo);
		request.setAttribute("nList", Noticelist);
		RequestDispatcher disp = request.getRequestDispatcher("w03_main.jsp");
		disp.forward(request, response);
	}

}
