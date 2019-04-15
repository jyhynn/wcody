package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.LocationVO;

public class LocationDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static LocationDAO single = null;
	
	SqlSessionFactory factory;
	
	public static LocationDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new LocationDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public LocationDAO() {
		factory = MybatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public List<LocationVO> selectSido(){
		SqlSession sqlSession = factory.openSession();
		List<LocationVO> list = sqlSession.selectList("lo.Sido_list");
		sqlSession.close();
		return list;
	}
	
	public List<LocationVO> selectGugun(){
		SqlSession sqlSession = factory.openSession();
		List<LocationVO> list = sqlSession.selectList("lo.Gugun_list");
		sqlSession.close();
		return list;
	}	
	public LocationVO selectOne(String gugun) {
		SqlSession sqlSession = factory.openSession(true);
		LocationVO vo = new LocationVO();
		System.out.println("여기는 LocationVO selectOne 입니다. 파라미터 : " + gugun);
		
		String nx = sqlSession.selectOne("lo.gugun_nx", gugun);
		System.out.println("nx가져옴 :" + nx);
		String ny = sqlSession.selectOne("lo.gugun_ny", gugun);
		System.out.println("ny가져옴 :" + ny);
		
		vo.setNx(nx);
		vo.setNy(ny);
		
		System.out.println(vo.getNx()+"and"+vo.getNy());
		
		sqlSession.close();
		return vo;
	}
}
