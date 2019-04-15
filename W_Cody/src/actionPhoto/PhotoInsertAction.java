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
import vo.PhotoVO;

/**
 * Servlet implementation class PhotoInsertAction
 */
@WebServlet("/photo/insert.do")
public class PhotoInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String web_path = "/upload/";
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
		File f = mr.getFile("wphoto");
		if( f != null ) {
			filename = f.getName();//업로드된 파일명
		}
		
		//파일 이외의 파라미터 수신
		String title = mr.getParameter("title");
		String color = mr.getParameter("color");
		String property1 = mr.getParameter("property1");
		String property2 = mr.getParameter("property2");
		String id = mr.getParameter("id");
		
		
		PhotoVO vo1 = new PhotoVO();
		vo1.setId(id);
		vo1.setTitle(title);
		vo1.setColor(color);
		vo1.setProperty1(property1);
		vo1.setProperty2(property2);
		vo1.setFilename(filename);
		
		int res = PhotoDAO.getInstance().insert( vo1 );
		
		response.sendRedirect("list.do");
	}

}