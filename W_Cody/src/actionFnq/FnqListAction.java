package actionFnq;

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

import common.Common;
import dao.FnqDAO;
import dao.QueDAO;
import util.Paging;
import vo.FnqVO;
import vo.QueVO;

/**
 * Servlet implementation class FnqListAction
 */
@WebServlet("/wcody/fnq_list.do")
public class FnqListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int nowPage = 1;	//기본으로 보여질 페이지
		//일단 값이 제대로 들어오는지부터 판단
		String page = request.getParameter("page");
		if(page!=null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		//한 페이지에 표시되는 게시물의 시작과 끝번호를 계산
		int start = (nowPage -1) * Common.QnA.BLOCKLIST + 1;	//nowpage(쪽)가 1이면 0 * 10 + 1 = 1
		int end = start + Common.QnA.BLOCKLIST -1;	//1 + 10 -1 = 10 
		//>>>1~10번 게시물이 표시
		//start와 end를 map으로 묶어서 이제 DB에 요청
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		//전체게시물 목록받아오기
		FnqDAO dao = FnqDAO.getInstance();
		List<FnqVO> list = dao.selectList();
		
		//전체게시물 수 구하기
		int row_total = dao.getRowTotal();	//dao에서 count값이 반환.
		
		//현재 페이지 메뉴 생성					표시할페이지,현재페이지, 전체게시물수, 한페이지에보여줄게시물수,페이지 메뉴 수
		String pageMenu = Paging.getPaging("fnq_list.do", nowPage, row_total, Common.FnQ.BLOCKLIST, Common.FnQ.BLOCKPAGE);
		//paging클래스가 페이징처리 알아서 해줌.
		
		request.setAttribute("pageMenu", pageMenu);
		request.getSession().removeAttribute("show");
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("w05_menu_fnq.jsp");
		disp.forward(request, response);
		
	
	}

}
