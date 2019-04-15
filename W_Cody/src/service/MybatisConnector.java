package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConnector {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MybatisConnector single = null;
	SqlSessionFactory factory = null;	//데이터베이스를 요청하고 결과를돌려받는객체 : sqlSes~~

	
	public static MybatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MybatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	//생성자
	public MybatisConnector() {
		// TODO Auto-generated constructor stub
		try {
			Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");	//경로로 들어가서 INPUT스트림이 읽어옴. 
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//
	public SqlSessionFactory getSqlSessionFactory() {
		return factory;
	}
	
	
	
}





















