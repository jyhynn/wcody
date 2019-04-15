package actionReview;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FeedbackDAO;
import dao.PhotoDAO;
import dao.ReviewDAO;
import vo.FeedbackVO;
import vo.PhotoVO;
import vo.ReviewVO;

/**
 * Servlet implementation class ReviewWriteAction
 */
@WebServlet("/wcody/review_write.do")
public class ReviewWriteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String web_path = "/upload_review/";	//eclipse 안의 폴더
		
		ServletContext application = request.getServletContext();	//웹상의 경로를 절대경로로 변환
		String path = application.getRealPath(web_path);	
		System.out.println(path);
		
		int max_size = 1024 * 1024 * 100;
		
		MultipartRequest mr = new MultipartRequest(request, path, max_size, "utf-8", new DefaultFileRenamePolicy());
		
		String fname="no_file";
		
		//---------실제경로상에 이미지저장됨---
		
		//실제업로드된 파일정보 가져오기
		File f = mr.getFile("filename");
		
		if(f!=null) {
			fname = f.getName();	//mr이 업로드해놓은 이름
			System.out.println(fname);
		}
		
		//파일 이외의 파라미터
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String id = mr.getParameter("id");
		String nickname = mr.getParameter("nickname");
		int sati = Integer.parseInt(mr.getParameter("sati"));
		String fcontent = mr.getParameter("fcontent");
		String ip = request.getRemoteAddr();	//ip
		
		ReviewVO rvo = new ReviewVO();
		rvo.setTitle(title);
		rvo.setContent(content);
		rvo.setId(id);
		rvo.setNickname(nickname);
		rvo.setFilename(fname);
		rvo.setIp(ip);
		
		FeedbackVO fvo = new FeedbackVO();
		fvo.setId(id);
		fvo.setNickname(nickname);
		fvo.setFcontent(fcontent);
		fvo.setSati(sati);
		fvo.setIp(ip);
		
		String rst = "no";
		int resR = ReviewDAO.getInstance().review_insert(rvo);
		if(resR!=0) {
			rst = "yes";
		}
		
		int resF = FeedbackDAO.getInstance().fb_insert(fvo);
		if(resF!=0) {
			rst = "yes";
		}
		
		response.sendRedirect("review_list.do");
		
/*		String resultStr = String.format("[{'result' : '%s'}]", rst);
		response.getWriter().println(resultStr);*/	
	
	}

}
