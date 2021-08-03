package kr.co.summary.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.summary.domain.MemberVO;

@Repository
public class MemberDAOimpl implements MemberDAO {
	
	@Inject //디비를 넘나들 sqlsession 가져오기
	private SqlSession sqlSession;
	
	@Override
	public void signUp(MemberVO membervo) throws Exception{
		System.out.println("3");
		sqlSession.insert("memberMapper.memberInsert", membervo);
	}
}
