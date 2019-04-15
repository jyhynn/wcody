package actionPhoto;

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

import dao.PhotoDAO;
import dao.PhotoDAO4;
import vo.PhotoVO;
import vo.PhotoVO4;

/**
 * Servlet implementation class PhotoInsertAction
 */
@WebServlet("/photo/insert4.do")
public class PhotoInsertAction4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String web_path = "/upload4/";
		ServletContext application = request.getServletContext();
		//web경로 -> 절대경로로 변환
		String path = application.getRealPath( web_path );
		System.out.println( path );
		
		int max_size = 1024 * 1024 * 100;//최대업로드 용량 100mb
		
		MultipartRequest mr = new MultipartRequest( 
												request, 
												path, 
												max_size, 
												"utf-8", 
												new DefaultFileRenamePolicy());
		
		String filename = "no_file";
		
		//실제 업로드된 파일의 정보를 가져온다.
		File f = mr.getFile("wphoto4");
		if( f != null ) {
			filename = f.getName();//업로드된 파일명
		}
		
		//파일 이외의 파라미터 수신
		String title = mr.getParameter("title");
		String color = mr.getParameter("color");
		String property1 = mr.getParameter("property1");
		String property2 = mr.getParameter("property2");
		String id = mr.getParameter("id");
		
		PhotoVO4 vo = new PhotoVO4();
		vo.setId(id);
		vo.setTitle(title);
		vo.setColor(color);
		vo.setProperty1(property1);
		vo.setProperty2(property2);
		vo.setFilename(filename);
		
		int res = PhotoDAO4.getInstance().insert( vo );
		
		response.sendRedirect("list4.do");
	}

}