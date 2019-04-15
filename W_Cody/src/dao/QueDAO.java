package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.QueVO;

public class QueDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static QueDAO single = null;

	SqlSessionFactory factory;
	
	public static QueDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new QueDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public QueDAO() {
		factory = MybatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//Q&A 게시판 리스트
	public List<QueVO> selectList() {
		
		SqlSession sqlSession = factory.openSession();
		List<QueVO> vo = sqlSession.selectList("que.que_list");
		sqlSession.close();
		return vo;
	}
	
	//Q&A 글 보기
	public QueVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		QueVO vo = sqlSession.selectOne("que.que_one", idx);
		sqlSession.close();
		return vo;
	}
	
	//Q&A 문의하기
	public int insertAsk(QueVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("que.insert_que", vo);
		sqlSession.close();
		return res;
		
	}

	//Q&A 수정
	public int updateAsk(int idx, String title, String content) {
		SqlSession sqlSession = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("title", title);
		map.put("content", content);
		int res = sqlSession.update("que.update_que", map);
		sqlSession.close();
		return res;
	}
	
	//Q&A 삭제
	public int delAsk(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("que.del_que", idx);
		sqlSession.close();
		return res;
	}
	
	//Q&A 답변하기
	public int insertAskAnswer(QueVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("que.insert_que_answer", vo);
		sqlSession.close();
		return res;
	}
	
	//Q&A 페이지별 게시물 조회
	public List<QueVO> selectList(Map<String, Integer> map){
		
		SqlSession sqlSession = factory.openSession();
		List<QueVO> list = sqlSession.selectList("que.que_list_condition", map);
		sqlSession.close();
		return list;
		
	}
	
	//Q&A 게시판의 전체 게시물 수
	public int getRowTotal() {
		SqlSession sqlSession = factory.openSession();
		int count = sqlSession.selectOne("que.que_count");
		sqlSession.close();
		return count;
	}
	
	//조회수 증가
	public int update_click(int idx) {
		SqlSession sqlSession = factory.openSession(true);	//autoCommit	db에서 commit필요한 작업은 다 그냥 true 넣으세용
		int res = sqlSession.update("que.que_update_click", idx);
		sqlSession.close();
		return res;
	}	
	
}
