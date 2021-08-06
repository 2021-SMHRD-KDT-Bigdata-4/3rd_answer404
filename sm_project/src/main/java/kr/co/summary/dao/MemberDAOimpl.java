package kr.co.summary.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.summary.domain.MemberVO;

@Repository
public class MemberDAOimpl implements MemberDAO {
	
	@Inject //디비를 넘나들 sqlsession 가져오기
	private SqlSession sqlSession;
	
	//memberDAO 인터페이스를 구현해놓은 memberDAOimpl
	@Override
	public void signUp(MemberVO memberVO) throws Exception{
		//insert 문을 사용하여 데이터베이스에 새로운 회원 등록
		sqlSession.insert("memberMapper.memberInsert", memberVO);
	}
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		//한명의 회원을 로그인 세션으로 올리기 위한 selectOne
		return sqlSession.selectOne("memberMapper.memberLogin", memberVO);
	}
}
