package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class AdminAction
 */
@WebServlet("/wcody/admin_list.do")
public class AdminMListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = MemberDAO.getInstance();
		List<MemberVO> list = dao.selectList();
		int count = list.size();
		
		int female = 0;
		int male = 0;
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getGender().equals("남")) {
				male += 1;
			}else {
				female += 1;
			}
		}
		
		int cold = 0;
		int hot = 0;
		int both = 0;
		int no = 0;
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getColdhot() == 1) {
				cold += 1;
			}else if(list.get(i).getColdhot() == 2){
				hot += 1;
			}else if(list.get(i).getColdhot() == 3){
				both += 1;
			}else if(list.get(i).getColdhot() == 4){
				no += 1;
			}
		}
		
		request.setAttribute("cold", cold*100/count);
		request.setAttribute("hot", hot*100/count);
		request.setAttribute("both", both*100/count);
		request.setAttribute("no", no*100/count);
		request.setAttribute("male", male*100/count);
		request.setAttribute("female", female*100/count); 
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("w99_admin_tab1.jsp");
		disp.forward(request, response);
	
	}

}
