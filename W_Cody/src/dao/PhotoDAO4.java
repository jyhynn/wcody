package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.PhotoVO;
import vo.PhotoVO4;

public class PhotoDAO4 {

	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static PhotoDAO4 single = null;

	public static PhotoDAO4 getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new PhotoDAO4();
		// 생성된 객체정보를 반환
		return single;
	}

	public List<PhotoVO4> selectList() {

		List<PhotoVO4> list = new ArrayList<PhotoVO4>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from wphoto4 order by idx desc";

		try {
			// 1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			// 2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			// 3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PhotoVO4 vo = new PhotoVO4();

				// 현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setId(rs.getString("id"));
				vo.setTitle(rs.getString("title"));
				vo.setFilename(rs.getString("filename"));
				vo.setColor(rs.getString("color"));
				vo.setProperty1(rs.getString("property1"));
				vo.setProperty2(rs.getString("property2"));
				vo.setRegidate(rs.getString("regidate"));

				// ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	public int insert(PhotoVO4 vo) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into wphoto4 values( cody_photo_idx.nextVal, ?, ?, ?, ?, ?, ?, sysdate )";

		try {
			// 1.Connection획득
			conn = DBService.getInstance().getConnection();
			// 2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			// 3.pstmt parameter 채우기
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getFilename());
			pstmt.setString(4, vo.getColor());
			pstmt.setString(5, vo.getProperty1());
			pstmt.setString(6, vo.getProperty2());

			// 4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;
	}

	// idx에 해당하는 게시글 한 건 조회
	public PhotoVO4 selectOne(int idx) {

		PhotoVO4 vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from wphoto4 where idx=?";

		try {
			// 1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			// 2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			// 3.pstmt parameter 설정
			pstmt.setInt(1, idx);

			// 4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new PhotoVO4();
				// 현재레코드값=>Vo저장
				vo.setFilename(rs.getString("filename"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return vo;
	}

	// 게시글 삭제
	public int delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from wphoto4 where idx=?";

		try {
			// 1.Connection획득
			conn = DBService.getInstance().getConnection();
			// 2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			// 3.pstmt parameter 채우기
			pstmt.setInt(1, idx);

			// 4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}
}
