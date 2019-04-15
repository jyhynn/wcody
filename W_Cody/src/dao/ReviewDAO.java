package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.ReviewVO;

public class ReviewDAO {

	static ReviewDAO single = null;
	SqlSessionFactory factory;
	public static ReviewDAO getInstance() {
		if (single == null)
			single = new ReviewDAO();
		return single;
	}
	
	public ReviewDAO() {
		factory = MybatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public List<ReviewVO> selectList() {
		SqlSession sqlSession = factory.openSession();
		List<ReviewVO> list = sqlSession.selectList("rev.rev_list");
		sqlSession.close();
		return list;
	}
	
	public int review_insert(ReviewVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("rev.rev_insert",vo);		
		sqlSession.close();
		return res;
	}
	
	public ReviewVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		ReviewVO vo = sqlSession.selectOne("rev.rev_one",idx);		
		sqlSession.close();
		return vo;
	}
	
	public int insert_comment(ReviewVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("rev.insert_comment",vo);		
		sqlSession.close();
		return res;
	}
	
	public int update_like(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.update("rev.update_like",idx);		
		sqlSession.close();
		return res;
	}
	
	//코디자랑 수정
	public int updateReivew(int idx, String title, String content) {
		SqlSession sqlSession = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("title", title);
		map.put("content", content);
		int res = sqlSession.update("rev.update_rev", map);
		sqlSession.close();
		return res;
	}
	
	//코디자랑 삭제
	public int delReview(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("rev.del_rev", idx);
		sqlSession.close();
		return res;
	}
	
	//조회수 증가
	public int update_click(int idx) {
		SqlSession sqlSession = factory.openSession(true);	//autoCommit	db에서 commit필요한 작업은 다 그냥 true 넣으세용
		int res = sqlSession.update("rev.rev_update_click", idx);
		sqlSession.close();
		return res;
	}		
	
	//좋아요 가장 높은 게시물 가져오기
	public ReviewVO selectLike() {
		SqlSession sqlSession = factory.openSession();
		ReviewVO vo = sqlSession.selectOne("rev.rev_like");		
		sqlSession.close();
		return vo;
	}
	
}
