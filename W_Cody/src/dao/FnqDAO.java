package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.FnqVO;
import vo.QueVO;

public class FnqDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static FnqDAO single = null;
	SqlSessionFactory factory;
	
	public static FnqDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new FnqDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public FnqDAO() {
		factory = MybatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//F&Q 전체목록 조회
	public List<FnqVO> selectList(){
		SqlSession sqlSession = factory.openSession();
		List<FnqVO> list = sqlSession.selectList("fnq.fnq_list");
		sqlSession.close();
		return list;
	}

	//F&Q 글 하나 조회	
	public FnqVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		FnqVO vo = sqlSession.selectOne("fnq.fnq_one", idx);
		sqlSession.close();
		return vo;
	}
	
	//F&Q 쓰고
	public int insertFnq(FnqVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("fnq.insert_fnq", vo);
		sqlSession.close();
		return res;
		
	}	
	//F&Q 삭제
	public int delFnq(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("fnq.del_fnq", idx);
		sqlSession.close();
		return res;
	}	
	//F&Q 수정
	public int updateFnq(int idx, String title, String content) {
		SqlSession sqlSession = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("title", title);
		map.put("content", content);
		int res = sqlSession.update("fnq.update_fnq", map);
		sqlSession.close();
		return res;
	}
	
	//F&Q 페이지별 게시물 조회
	public List<FnqVO> selectList(Map<String, Integer> map){
		
		SqlSession sqlSession = factory.openSession();
		List<FnqVO> list = sqlSession.selectList("fnq.fnq_list_condition", map);
		sqlSession.close();
		return list;
		
	}
	
	//F&Q 게시판의 전체 게시물 수
	public int getRowTotal() {
		SqlSession sqlSession = factory.openSession();
		int count = sqlSession.selectOne("fnq.fnq_count");
		sqlSession.close();
		return count;
	}	
	
	//조회수 증가
	public int update_click(int idx) {
		SqlSession sqlSession = factory.openSession(true);	//autoCommit	db에서 commit필요한 작업은 다 그냥 true 넣으세용
		int res = sqlSession.update("fnq.fnq_update_click", idx);
		sqlSession.close();
		return res;
	}	
}
