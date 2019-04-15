package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.FnqVO;
import vo.NoticeVO;
import vo.QueVO;

public class NoticeDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static NoticeDAO single = null;
	SqlSessionFactory factory;
	
	public static NoticeDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new NoticeDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public NoticeDAO() {
		factory = MybatisConnector.getInstance().getSqlSessionFactory();
	}

	//notice 전체목록 조회
	public List<NoticeVO> selectList(){
		SqlSession sqlSession = factory.openSession();
		List<NoticeVO> list = sqlSession.selectList("notice.notice_list");
		sqlSession.close();
		return list;
	}

	//notice 글 하나 조회	
	public NoticeVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		NoticeVO vo = sqlSession.selectOne("notice.notice_one", idx);
		sqlSession.close();
		return vo;
	}
	
	//notice 쓰고
	public int insertNotice(NoticeVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("notice.insert_notice", vo);
		sqlSession.close();
		return res;
		
	}	
	//notice 삭제
	public int delNotice(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("notice.del_notice", idx);
		sqlSession.close();
		return res;
	}	
	//notice 수정
	public int updateNotice(int idx, String title, String content) {
		SqlSession sqlSession = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("title", title);
		map.put("content", content);
		int res = sqlSession.update("notice.update_notice", map);
		sqlSession.close();
		return res;
	}
	
	//F&Q 페이지별 게시물 조회
	public List<NoticeVO> selectList(Map<String, Integer> map){
		
		SqlSession sqlSession = factory.openSession();
		List<NoticeVO> list = sqlSession.selectList("notice.notice_list_condition", map);
		sqlSession.close();
		return list;
		
	}
	
	//F&Q 게시판의 전체 게시물 수
	public int getRowTotal() {
		SqlSession sqlSession = factory.openSession();
		int count = sqlSession.selectOne("notice.notice_count");
		sqlSession.close();
		return count;
	}	
	
	//조회수 증가
	public int update_click(int idx) {
		SqlSession sqlSession = factory.openSession(true);	//autoCommit	db에서 commit필요한 작업은 다 그냥 true 넣으세용
		int res = sqlSession.update("notice.notice_update_click", idx);
		sqlSession.close();
		return res;
	}

}
