package actionReview;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FeedbackDAO;
import dao.ReviewDAO;
import vo.ReviewVO;

/**
 * Servlet implementation class ReviewCommentAction
 */
@WebServlet("/wcody/insert_comment.do")
public class ReviewCommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("reviewCommentAction");
		request.setCharacterEncoding("utf-8");
	
		int idx = Integer.parseInt(request.getParameter("idx"));
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("comment");
		String ip = request.getRemoteAddr();
		
		ReviewVO vo = new ReviewVO();
		vo.setRef(idx);
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setIp(ip);
		vo.setContent(content);
		vo.setTitle("comment");
		
		int res = ReviewDAO.getInstance().insert_comment(vo);
		
		String rst = "no";
		if(res!=0) {
			rst = "yes";
		}
		
		String resultStr = String.format("[{'result' : '%s'}]", rst);
		response.getWriter().println(resultStr);
		
	}

}
