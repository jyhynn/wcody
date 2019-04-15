package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.FeedbackVO;
import vo.ReviewVO;

public class FeedbackDAO {
	static FeedbackDAO single = null;
	SqlSessionFactory factory;
	public static FeedbackDAO getInstance() {
		if (single == null)
			single = new FeedbackDAO();
		return single;
	}
	
	public FeedbackDAO() {
		factory = MybatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//전체 리스트. idx순
	public List<FeedbackVO> selectList() {
		SqlSession sqlSession = factory.openSession();
		List<FeedbackVO> list = sqlSession.selectList("fb.fb_list");
		sqlSession.close();
		return list;
	}
	
	//전체 리스트. idx순
	public List<FeedbackVO> selectList_low() {
		SqlSession sqlSession = factory.openSession();
		List<FeedbackVO> list = sqlSession.selectList("fb.fb_list_low");
		sqlSession.close();
		return list;
	}
	
	//전체 리스트. idx순
	public List<FeedbackVO> selectList_high() {
		SqlSession sqlSession = factory.openSession();
		List<FeedbackVO> list = sqlSession.selectList("fb.fb_list_high");
		sqlSession.close();
		return list;
	}	
	
	//전체 리스트. idx순
	public List<FeedbackVO> selectList_sugg() {
		SqlSession sqlSession = factory.openSession();
		List<FeedbackVO> list = sqlSession.selectList("fb.fb_list_sugg");
		sqlSession.close();
		return list;
	}
	
	public int fb_insert(FeedbackVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("fb.fb_insert",vo);		
		sqlSession.close();
		return res;
	}
	
	public float avgStar() {//별점평균
		SqlSession sqlSession = factory.openSession();
		float avg = sqlSession.selectOne("fb.fb_avg_star");
		sqlSession.close();
		return avg;
	}
}
