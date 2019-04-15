package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.MemberVO;

public class MemberDAO {

	static MemberDAO single = null;
	SqlSessionFactory factory;
	public static MemberDAO getInstance() {
		if (single == null)
			single = new MemberDAO();
		return single;
	}
	public MemberDAO() {
		factory = MybatisConnector.getInstance().getSqlSessionFactory();
	}
	//�쉶�썝紐⑸줉
	public List<MemberVO> selectList(){
		SqlSession sqlSession = factory.openSession();
		List<MemberVO> list = sqlSession.selectList("member.list");
		sqlSession.close();
		return list;
	}
	//로그인
	public MemberVO selectOne(String id, String pwd) {
		SqlSession sqlSession = factory.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberVO vo = sqlSession.selectOne("member.login",map);
		sqlSession.close();
		return vo;
	}
	
	//회원가입 아이디 중복 체크&글쓰기&글수정&글삭제
	public MemberVO checkId(String id) {
		SqlSession sqlSession = factory.openSession();
		MemberVO vo = sqlSession.selectOne("member.id_check",id);
		sqlSession.close();
		return vo;
	}
	//회원가입 별명 중복 체크
	public MemberVO checkNick(String nickname) {
		SqlSession sqlSession = factory.openSession();
		MemberVO vo = sqlSession.selectOne("member.nickname_check",nickname);
		sqlSession.close();
		return vo;
	}
	//회원가입 이메일 중복 체크&아이디찾기
	public MemberVO checkEmail(String email) {
		SqlSession sqlSession = factory.openSession();
		MemberVO vo = sqlSession.selectOne("member.email_check",email);
		sqlSession.close();
		return vo;
	}
	
	//회원가입
	public int joinInsert(MemberVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("member.join_insert", vo);
		sqlSession.close();
		return res;
	}
	
	//비번찾기
	public MemberVO findPwd(String id, String email) {
		SqlSession sqlSession = factory.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		MemberVO vo = sqlSession.selectOne("member.find_pwd",map);
		sqlSession.close();
		return vo;
	}
	
}
