package actionPhoto;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
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
 * Servlet implementation class PhotoDelAction
 */
@WebServlet("/photo/photo_del3.do")
public class PhotoDelAction3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt( request.getParameter("idx") );
		
		PhotoVO3 vo = PhotoDAO3.getInstance().selectOne( idx );
		String web_path = "/upload3/";
		ServletContext application = request.getServletContext();
		
		String path = application.getRealPath( web_path );
		
		int res = PhotoDAO3.getInstance().delete( idx );
		
		if( res > 0 ) {
			File f = new File( path, vo.getFilename() );
			
			if( f.exists() ) {
				f.delete();//path경로의 이미지 파일을 삭제
			}
			
		}
		
		String param = "no";
		if( res > 0 ) {
			param = "yes";
		}
		
		//json으로 결과값 전송
		String resultStr = String.format( "[{'param':'%s'}]", param);
		response.getWriter().println( resultStr );
	}

}